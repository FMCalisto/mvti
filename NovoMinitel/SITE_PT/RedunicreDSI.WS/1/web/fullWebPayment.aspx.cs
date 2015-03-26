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
    public result resultat;
    public string token;
    public string redirectURL;
    public bool debug;
    public payment payment = new payment();
    public order order = new order();
    public buyer buyer = new buyer();
    public recurring recurring = new recurring();
    public address address = new address();
    public orderDetail orderDetail1 = new orderDetail();
    public orderDetail orderDetail2 = new orderDetail();
    public privateData privateData1 = new privateData();
    public privateData privateData2 = new privateData();
    public privateData privateData3 = new privateData();
    public privateData[] privateDataList = new privateData[3];
    public string[] selectedCrontractList = new string[100];
     public string contractNumberList;
    public string errorMessage = "";
    public string errorDetails = "";

    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            WebPaymentAPI ws = new WebPaymentAPI();
                           
            // PAYMENT
            payment.amount = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("paymentAmount"))).Text;
            payment.mode = ((DropDownList)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("paymentMode"))).Text;
            payment.action = ((DropDownList)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("paymentFonction"))).Text;
                        
            payment.currency = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("paymentCurrency"))).Text;
            if (payment.currency == "")
                payment.currency = Resources.Resource.PAYMENT_CURRENCY;

            payment.contractNumber = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("paymentContractNumber"))).Text;
            contractNumberList = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("paymentContractNumberList"))).Text;
           
            if (contractNumberList.Contains(";"))
            {
                string[] split = contractNumberList.Split(new Char[] { ';' });
                selectedCrontractList = split;
            }
            else
            {
                selectedCrontractList.SetValue(contractNumberList, 0);
            }

            payment.differedActionDate = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("paymentDifferedActionDate"))).Text; // Format : "dd/mm/yy"
            

            // ORDER
            order.@ref = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("orderRef"))).Text;
            order.origin = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("orderOrigin"))).Text;
            order.country = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("orderCountry"))).Text;
            order.taxes = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("orderTaxes"))).Text;
            
            order.currency = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("orderCurrency"))).Text;
            if (order.currency == "")
                order.currency = Resources.Resource.ORDER_CURRENCY;
            
            order.amount = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("orderAmount"))).Text;
            order.date = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("orderDate"))).Text; // format : "dd/mm/yyyy HH24:MM"
            
            // ORDER DETAILS
            orderDetail1.@ref = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("orderDetailRef1"))).Text;
            orderDetail1.price = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("orderDetailPrice1"))).Text;
            orderDetail1.quantity = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("orderDetailQuantity1"))).Text;
            orderDetail1.comment = ((HtmlTextArea)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("orderDetailComment1"))).Value;
            
            orderDetail2.@ref = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("orderDetailRef2"))).Text;
            orderDetail2.price = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("orderDetailPrice2"))).Text;
            orderDetail2.quantity = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("orderDetailQuantity2"))).Text;
            orderDetail2.comment = ((HtmlTextArea)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("orderDetailComment2"))).Value;
                        
            order.details = new orderDetail[2];
            order.details.SetValue(orderDetail1,0);
            order.details.SetValue(orderDetail2,1);

            // ADDRESS (optional)            
            address.name = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("addressName"))).Text;
            address.street1 = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("addressStreet1"))).Text;
            address.street2 = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("addressStreet2"))).Text;
            address.cityName = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("addressCity"))).Text;
            address.zipCode = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("addressZipCode"))).Text;
            address.country = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("addressCountry"))).Text;
            address.phone = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("addressPhone"))).Text;
            
            // BUYER (optional)      
            buyer.shippingAdress = address;
            buyer.walletId = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("buyerWalletId"))).Text;
            buyer.lastName = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("buyerLastName"))).Text;
            buyer.firstName = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("buyerFirstName"))).Text;
            buyer.email = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("buyerEmail"))).Text;
            buyer.accountCreateDate = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("buyerAccountCreateDate"))).Text; // format : "dd/mm/yy"
            buyer.accountAverageAmount = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("buyerAverageAmount"))).Text;
            buyer.accountOrderCount = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("buyerOrderCount"))).Text;
            
            // PRIVATE DATA (optional)            
            privateData1.key = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("privateDataKey1"))).Text;
            privateData1.value = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("privateDataValue1"))).Text;
            privateData2.key = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("privateDataKey2"))).Text;
            privateData2.value = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("privateDataValue2"))).Text;
            privateData3.key = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("privateDataKey3"))).Text;
            privateData3.value = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("privateDataValue3"))).Text;
            
            privateDataList.SetValue(privateData1,0);
            privateDataList.SetValue(privateData2,1);
            privateDataList.SetValue(privateData3,2);

            // TRANSACTION OPTIONS            
            string notificationURL = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("notificationURL"))).Text;
            if (notificationURL == "")
                notificationURL = Resources.Resource.NOTIFICATION_URL;

            string returnURL = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("returnURL"))).Text;
            if (returnURL == "")
                returnURL = Resources.Resource.RETURN_URL;
            
            string cancelURL = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("cancelURL"))).Text;
            if (cancelURL == "")
                cancelURL = Resources.Resource.CANCEL_URL;
            
            string customPaymentPageCode = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("customPaymentPageCode"))).Text;
            if (customPaymentPageCode == "")
                customPaymentPageCode = Resources.Resource.CUSTOM_PAYMENT_PAGE_CODE;

            string customPaymentTemplateURL = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("customPaymentTemplateURL"))).Text;
            if (customPaymentTemplateURL == "")
                customPaymentTemplateURL = Resources.Resource.CUSTOM_PAYMENT_TEMPLATE_URL;
            
            string languageCode = ((DropDownList)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("languageCode"))).Text;
            if (languageCode == "")
                languageCode = Resources.Resource.LANGUAGE_CODE;

            // RECCURENT
            bool recurringCheck = ((CheckBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("recurring"))).Checked;
            if ((recurringCheck) || (payment.mode == "NX") || (payment.mode == "REC"))
            {
                recurring.firstAmount = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("recurringFirstAmount"))).Text;
                recurring.billingLeft = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("recurringBillingLeft"))).Text;
                recurring.amount = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("recurringAmount"))).Text;
                recurring.billingCycle = ((DropDownList)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("recurringBillingCycle"))).Text;
                recurring.startDate = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("recurringStartDate"))).Text; // format : "dd/mm/yyyy"
                recurring.billingDay = ((TextBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("recurringBillingDay"))).Text; // Format : "dd"
            }
            else
                recurring = null;

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
                ws.Url = Resources.Resource.ENDPOINT_WEB;

            ws.Credentials = new System.Net.NetworkCredential(Resources.Resource.MERCHANT_ID, Resources.Resource.ACCESS_KEY);

            resultat = ws.doWebPayment(payment, returnURL, cancelURL, order, notificationURL, selectedCrontractList, privateDataList, languageCode,
                                                customPaymentPageCode, buyer, Resources.Resource.SECURITY_MODE, recurring, customPaymentTemplateURL, out token, out redirectURL);

            debug = ((CheckBox)(Page.PreviousPage.FindControl("fullWebPayment").FindControl("debug"))).Checked;
        }
        catch (Exception exc)
        {
            errorMessage = exc.Message;
            errorDetails = exc.ToString();
        }            
    }
}