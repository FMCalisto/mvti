using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net;

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
    public authentication3DSecure authentication3DSecure = new authentication3DSecure();
    public authorization authorization = new authorization();
    public transaction transaction = new transaction();
    public result resultat;
    public string errorMessage = "";
    public string errorDetails = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            DirectPaymentAPI ws = new DirectPaymentAPI();
            
            // PAYMENT
            payment.amount = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("paymentAmount"))).Text;
            payment.mode = ((DropDownList)(Page.PreviousPage.FindControl("doAuthorization").FindControl("paymentMode"))).Text;
            payment.action = ((DropDownList)(Page.PreviousPage.FindControl("doAuthorization").FindControl("paymentFonction"))).Text;
            payment.currency = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("paymentCurrency"))).Text;
            payment.contractNumber = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("paymentContractNumber"))).Text;
            payment.differedActionDate = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("paymentDifferedActionDate"))).Text; // Format : "dd/mm/yy"

            // ORDER
            order.@ref = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("orderRef"))).Text;
            order.origin = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("orderOrigin"))).Text;
            order.country = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("orderCountry"))).Text;
            order.taxes = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("orderTaxes"))).Text;

            order.currency = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("orderCurrency"))).Text;
            if (order.currency == "")
                order.currency = Resources.Resource.ORDER_CURRENCY;

            order.amount = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("orderAmount"))).Text;
            order.date = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("orderDate"))).Text; // format : "dd/mm/yyyy HH24:MM"

            // ORDER DETAILS
            orderDetail1.@ref = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("orderDetailRef1"))).Text;
            orderDetail1.price = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("orderDetailPrice1"))).Text;
            orderDetail1.quantity = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("orderDetailQuantity1"))).Text;
            orderDetail1.comment = ((HtmlTextArea)(Page.PreviousPage.FindControl("doAuthorization").FindControl("orderDetailComment1"))).Value;

            orderDetail2.@ref = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("orderDetailRef2"))).Text;
            orderDetail2.price = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("orderDetailPrice2"))).Text;
            orderDetail2.quantity = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("orderDetailQuantity2"))).Text;
            orderDetail2.comment = ((HtmlTextArea)(Page.PreviousPage.FindControl("doAuthorization").FindControl("orderDetailComment2"))).Value;

            order.details = new orderDetail[2];
            order.details.SetValue(orderDetail1, 0);
            order.details.SetValue(orderDetail2, 1);
                        
            // ADDRESS (optional)            
            address.name = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("addressName"))).Text;
            address.street1 = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("addressStreet1"))).Text;
            address.street2 = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("addressStreet2"))).Text;
            address.cityName = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("addressCity"))).Text;
            address.zipCode = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("addressZipCode"))).Text;
            address.country = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("addressCountry"))).Text;
            address.phone = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("addressPhone"))).Text;

            // BUYER (optional) 
            buyer.shippingAdress = address;
            buyer.walletId = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("buyerWalletId"))).Text;
            buyer.lastName = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("buyerLastName"))).Text;
            buyer.firstName = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("buyerFirstName"))).Text;
            buyer.email = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("buyerEmail"))).Text;
            buyer.accountCreateDate = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("buyerAccountCreateDate"))).Text; // format : "dd/mm/yy"
            buyer.accountAverageAmount = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("buyerAverageAmount"))).Text;
            buyer.accountOrderCount = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("buyerOrderCount"))).Text;

            // PRIVATE DATA (optional)            
            privateData1.key = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("privateDataKey1"))).Text;
            privateData1.value = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("privateDataValue1"))).Text;
            privateData2.key = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("privateDataKey2"))).Text;
            privateData2.value = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("privateDataValue2"))).Text;
            privateData3.key = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("privateDataKey3"))).Text;
            privateData3.value = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("privateDataValue3"))).Text;

            privateDataList.SetValue(privateData1, 0);
            privateDataList.SetValue(privateData2, 1);
            privateDataList.SetValue(privateData3, 2);

            // CARD INFO
            card.number = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("cardNumber"))).Text;
            card.type = ((DropDownList)(Page.PreviousPage.FindControl("doAuthorization").FindControl("cardType"))).Text;
            card.expirationDate = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("cardExpirationDate"))).Text;
            card.cvx = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("cardCrypto"))).Text;
            card.ownerBirthdayDate = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("cardOwnerBirthdayDate"))).Text;
            card.password = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("cardPassword"))).Text;

            //CARD PRESENT
            if (((DropDownList)(Page.PreviousPage.FindControl("doAuthorization").FindControl("cardPresent"))).Text != "")
            {
                card.cardPresent = ((DropDownList)(Page.PreviousPage.FindControl("doAuthorization").FindControl("cardPresent"))).Text;
            }
            
            // AUTHENTICATION 3D SECURE (optional)           
             authentication3DSecure.md = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("md"))).Text;
             authentication3DSecure.pares = ((TextBox)(Page.PreviousPage.FindControl("doAuthorization").FindControl("pares"))).Text;

            //PROXY
            if (Resources.Resource.PROXY_HOST != "" && Resources.Resource.PROXY_PORT != "")
            {
                ws.Proxy = new System.Net.WebProxy(Resources.Resource.PROXY_HOST, Convert.ToInt32(Resources.Resource.PROXY_PORT));
                if (Resources.Resource.PROXY_USER != "" && Resources.Resource.PROXY_PASSWORD != "")
                {
                    ws.Proxy.Credentials = new NetworkCredential(Resources.Resource.PROXY_USER, Resources.Resource.PROXY_PASSWORD);
                }
            }
            
            //ws.Proxy = System.Net.WebRequest.DefaultWebProxy;

            if (Resources.Resource.PROD == "true")
                ws.Url = Resources.Resource.ENDPOINT_DIRECT;

            ws.Credentials = new System.Net.NetworkCredential(Resources.Resource.MERCHANT_ID, Resources.Resource.ACCESS_KEY);

            resultat = ws.doAuthorization(payment, card, order, buyer, privateDataList, authentication3DSecure, out transaction, out authorization);
        }
        catch (Exception exc)
        {
            errorMessage = exc.Message;
            errorDetails = exc.ToString();
        }
    }
}
