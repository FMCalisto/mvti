using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    public payment payment = new payment();
    public card card = new card();
    public order order = new order();
    public buyer buyer = new buyer();
    public address address = new address();
    public orderDetail orderDetail1 = new orderDetail();
    public orderDetail orderDetail2 = new orderDetail();
    public privateData privateData1 = new privateData();
    public privateData privateData2 = new privateData();
    public privateData privateData3 = new privateData();
    public privateData[] privateDataList = new privateData[3];
    public authorization authorization = new authorization();
    public transaction transaction = new transaction();
    public string comment;
    public result resultat;
    public string errorMessage = "";
    public string errorDetails = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            DirectPaymentAPI ws = new DirectPaymentAPI();
            
            // PAYMENT
            payment.amount = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("paymentAmount"))).Text;
            payment.mode = ((DropDownList)(Page.PreviousPage.FindControl("doCredit").FindControl("paymentMode"))).Text;
            payment.action = ((DropDownList)(Page.PreviousPage.FindControl("doCredit").FindControl("paymentFonction"))).Text;
            payment.currency = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("paymentCurrency"))).Text;
            payment.contractNumber = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("paymentContractNumber"))).Text;
            
            // ORDER
            order.@ref = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("orderRef"))).Text;
            order.origin = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("orderOrigin"))).Text;
            order.country = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("orderCountry"))).Text;
            order.taxes = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("orderTaxes"))).Text;

            order.currency = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("orderCurrency"))).Text;
            if (order.currency == "")
                order.currency = Resources.Resource.ORDER_CURRENCY;

            order.amount = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("orderAmount"))).Text;
            order.date = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("orderDate"))).Text; // format : "dd/mm/yyyy HH24:MM"

            // ORDER DETAILS
            orderDetail1.@ref = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("orderDetailRef1"))).Text;
            orderDetail1.price = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("orderDetailPrice1"))).Text;
            orderDetail1.quantity = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("orderDetailQuantity1"))).Text;
            orderDetail1.comment = ((HtmlTextArea)(Page.PreviousPage.FindControl("doCredit").FindControl("orderDetailComment1"))).Value;

            orderDetail2.@ref = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("orderDetailRef2"))).Text;
            orderDetail2.price = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("orderDetailPrice2"))).Text;
            orderDetail2.quantity = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("orderDetailQuantity2"))).Text;
            orderDetail2.comment = ((HtmlTextArea)(Page.PreviousPage.FindControl("doCredit").FindControl("orderDetailComment2"))).Value;

            order.details = new orderDetail[2];
            order.details.SetValue(orderDetail1, 0);
            order.details.SetValue(orderDetail2, 1);

            // ADDRESS (optional)            
            address.name = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("addressName"))).Text;
            address.street1 = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("addressStreet1"))).Text;
            address.street2 = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("addressStreet2"))).Text;
            address.cityName = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("addressCity"))).Text;
            address.zipCode = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("addressZipCode"))).Text;
            address.country = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("addressCountry"))).Text;
            address.phone = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("addressPhone"))).Text;

            // BUYER (optional) 
            buyer.shippingAdress = address;
            buyer.walletId = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("buyerWalletId"))).Text;
            buyer.lastName = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("buyerLastName"))).Text;
            buyer.firstName = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("buyerFirstName"))).Text;
            buyer.email = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("buyerEmail"))).Text;
            buyer.accountCreateDate = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("buyerAccountCreateDate"))).Text; // format : "dd/mm/yy"
            buyer.accountAverageAmount = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("buyerAverageAmount"))).Text;
            buyer.accountOrderCount = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("buyerOrderCount"))).Text;

            // PRIVATE DATA (optional)            
            privateData1.key = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("privateDataKey1"))).Text;
            privateData1.value = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("privateDataValue1"))).Text;
            privateData2.key = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("privateDataKey2"))).Text;
            privateData2.value = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("privateDataValue2"))).Text;
            privateData3.key = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("privateDataKey3"))).Text;
            privateData3.value = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("privateDataValue3"))).Text;

            privateDataList.SetValue(privateData1, 0);
            privateDataList.SetValue(privateData2, 1);
            privateDataList.SetValue(privateData3, 2);

            // CARD INFO
            card.number = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("cardNumber"))).Text;
            card.type = ((DropDownList)(Page.PreviousPage.FindControl("doCredit").FindControl("cardType"))).Text;
            card.expirationDate = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("cardExpirationDate"))).Text;
            card.cvx = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("cardCrypto"))).Text;
            card.ownerBirthdayDate = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("cardOwnerBirthdayDate"))).Text;
            card.password = ((TextBox)(Page.PreviousPage.FindControl("doCredit").FindControl("cardPassword"))).Text;

            //COMMENT
            comment = ((HtmlTextArea)(Page.PreviousPage.FindControl("doCredit").FindControl("comment"))).Value;

            //PROXY
            if (Resources.Resource.PROXY_HOST != "" && Resources.Resource.PROXY_PORT != "")
            {
                ws.Proxy = new System.Net.WebProxy(Resources.Resource.PROXY_HOST, Convert.ToInt32(Resources.Resource.PROXY_PORT));
                if (Resources.Resource.PROXY_USER != "" && Resources.Resource.PROXY_PASSWORD != "")
                {
                    ws.Proxy.Credentials = new System.Net.NetworkCredential(Resources.Resource.PROXY_USER, Resources.Resource.PROXY_PASSWORD);
                }
            }

            if (Resources.Resource.PROD == "true")
                ws.Url = Resources.Resource.ENDPOINT_DIRECT;

            ws.Credentials = new System.Net.NetworkCredential(Resources.Resource.MERCHANT_ID, Resources.Resource.ACCESS_KEY);

            resultat = ws.doCredit(payment, card, comment, order, buyer, privateDataList, out transaction);
        }
        catch (Exception exc)
        {
            errorMessage = exc.Message;
            errorDetails = exc.ToString();
        }
    }
}
