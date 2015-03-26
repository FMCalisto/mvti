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
    public string contractNumber ;
    public string contractNumberList;
    public string updatePersonalDetails = "";
    public buyer buyer = new buyer();
    public address address = new address();
    public privateData privateData1 = new privateData();
    public privateData privateData2 = new privateData();
    public privateData privateData3 = new privateData();
    public privateData[] privateDataList = new privateData[3];
    public string[] selectedCrontractList = new string[2];
    public string errorMessage = "";
    public string errorDetails = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            WebPaymentAPI ws = new WebPaymentAPI();
            
            contractNumber = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("paymentContractNumber"))).Text;
            contractNumberList = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("paymentContractNumberList"))).Text;

            if (contractNumberList.Contains(";"))
            {
                string[] split = contractNumberList.Split(new Char[] { ';' });
                selectedCrontractList = split;             
            }
            else
            {
                selectedCrontractList.SetValue(contractNumberList, 0);
            }

            updatePersonalDetails = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("updatePersonalDetails"))).Text;

            // ADDRESS (optional)            
            address.name = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("addressName"))).Text;
            address.street1 = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("addressStreet1"))).Text;
            address.street2 = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("addressStreet2"))).Text;
            address.cityName = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("addressCity"))).Text;
            address.zipCode = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("addressZipCode"))).Text;
            address.country = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("addressCountry"))).Text;
            address.phone = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("addressPhone"))).Text;
            
            // BUYER (optional)      
            buyer.shippingAdress = address;
            buyer.walletId = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("buyerWalletId"))).Text;
            buyer.lastName = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("buyerLastName"))).Text;
            buyer.firstName = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("buyerFirstName"))).Text;
            buyer.email = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("buyerEmail"))).Text;
            buyer.accountCreateDate = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("buyerAccountCreateDate"))).Text; // format : "dd/mm/yy"
            buyer.accountAverageAmount = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("buyerAverageAmount"))).Text;
            buyer.accountOrderCount = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("buyerOrderCount"))).Text;

            // PRIVATE DATA (optional)            
            privateData1.key = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("privateDataKey1"))).Text;
            privateData1.value = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("privateDataValue1"))).Text;
            privateData2.key = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("privateDataKey2"))).Text;
            privateData2.value = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("privateDataValue2"))).Text;
            privateData3.key = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("privateDataKey3"))).Text;
            privateData3.value = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("privateDataValue3"))).Text;

            privateDataList.SetValue(privateData1, 0);
            privateDataList.SetValue(privateData2, 1);
            privateDataList.SetValue(privateData3, 2);

            // TRANSACTION OPTIONS            
            string securityMode = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("securityMode"))).Text;
            if (securityMode == "")
                securityMode = Resources.Resource.SECURITY_MODE;

            string notificationURL = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("notificationURL"))).Text;
            if (notificationURL == "")
                notificationURL = Resources.Resource.NOTIFICATION_URL;

            string returnURL = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("returnURL"))).Text;
            if (returnURL == "")
                returnURL = Resources.Resource.RETURN_URL;

            string cancelURL = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("cancelURL"))).Text;
            if (cancelURL == "")
                cancelURL = Resources.Resource.CANCEL_URL;

            string customPaymentPageCode = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("customPaymentPageCode"))).Text;
            if (customPaymentPageCode == "")
                customPaymentPageCode = Resources.Resource.CUSTOM_PAYMENT_PAGE_CODE;

            string customPaymentTemplateURL = ((TextBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("customPaymentTemplateURL"))).Text;
            if (customPaymentTemplateURL == "")
                customPaymentTemplateURL = Resources.Resource.CUSTOM_PAYMENT_TEMPLATE_URL;

            string languageCode = ((DropDownList)(Page.PreviousPage.FindControl("createWebWallet").FindControl("languageCode"))).Text;
            if (languageCode == "")
                languageCode = Resources.Resource.LANGUAGE_CODE;


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

            resultat = ws.createWebWallet(contractNumber, selectedCrontractList, updatePersonalDetails, buyer, languageCode, customPaymentPageCode,
                                securityMode, returnURL, cancelURL, notificationURL, privateDataList, customPaymentTemplateURL, 
                                out token, out redirectURL);

            debug = ((CheckBox)(Page.PreviousPage.FindControl("createWebWallet").FindControl("debug"))).Checked;
        }
        catch (Exception exc)
        {
            errorMessage = exc.Message;
            errorDetails = exc.ToString();
        }            
    }
}