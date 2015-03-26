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
    public string contractNumber = "";
    public string walletId = "";    
    public string updatePersonalDetails = "";
    public string updatePaymentDetails = "";
    public order order = new order();    
    public recurring recurring = new recurring();
    public orderDetail orderDetail1 = new orderDetail();
    public orderDetail orderDetail2 = new orderDetail();
    public privateData privateData1 = new privateData();
    public privateData privateData2 = new privateData();
    public privateData privateData3 = new privateData();
    public privateData[] privateDataList = new privateData[3];
    public string[] selectedCrontractList = new string[100];
    public string errorMessage = "";
    public string errorDetails = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            WebPaymentAPI ws = new WebPaymentAPI();
            
            contractNumber = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("paymentContractNumber"))).Text;

            if (contractNumber.Contains(";"))
            {
                string[] split = contractNumber.Split(new Char[] { ';'});
                selectedCrontractList = split;
                contractNumber = Resources.Resource.CONTRACT_NUMBER;                
            }
            else
            {
                selectedCrontractList.SetValue(contractNumber, 0);
            }

            walletId = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("walletId"))).Text;

            updatePersonalDetails = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("updatePersonalDetails"))).Text;

            updatePaymentDetails = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("updatePaymentDetails"))).Text;
            
            // PRIVATE DATA (optional)            
            privateData1.key = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("privateDataKey1"))).Text;
            privateData1.value = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("privateDataValue1"))).Text;
            privateData2.key = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("privateDataKey2"))).Text;
            privateData2.value = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("privateDataValue2"))).Text;
            privateData3.key = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("privateDataKey3"))).Text;
            privateData3.value = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("privateDataValue3"))).Text;
            
            privateDataList.SetValue(privateData1,0);
            privateDataList.SetValue(privateData2,1);
            privateDataList.SetValue(privateData3,2);
            
            // TRANSACTION OPTIONS 
            string securityMode = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("securityMode"))).Text;
            if (securityMode == "")
                securityMode = Resources.Resource.SECURITY_MODE;

            string notificationURL = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("notificationURL"))).Text;
            if (notificationURL == "")
                notificationURL = Resources.Resource.NOTIFICATION_URL;

            string returnURL = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("returnURL"))).Text;
            if (returnURL == "")
                returnURL = Resources.Resource.RETURN_URL;

            string cancelURL = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("cancelURL"))).Text;
            if (cancelURL == "")
                cancelURL = Resources.Resource.CANCEL_URL;

            string customPaymentPageCode = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("customPaymentPageCode"))).Text;
            if (customPaymentPageCode == "")
                customPaymentPageCode = Resources.Resource.CUSTOM_PAYMENT_PAGE_CODE;

            string customPaymentTemplateURL = ((TextBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("customPaymentTemplateURL"))).Text;
            if (customPaymentTemplateURL == "")
                customPaymentTemplateURL = Resources.Resource.CUSTOM_PAYMENT_TEMPLATE_URL;

            string languageCode = ((DropDownList)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("languageCode"))).Text;
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

            resultat = ws.updateWebWallet(contractNumber, walletId, updatePersonalDetails, updatePaymentDetails, languageCode, customPaymentPageCode,
                                securityMode, returnURL, cancelURL, notificationURL, privateDataList, customPaymentTemplateURL, 
                                out token, out redirectURL);

            debug = ((CheckBox)(Page.PreviousPage.FindControl("updateWebWallet").FindControl("debug"))).Checked;
        }
        catch (Exception exc)
        {
            errorMessage = exc.Message;
            errorDetails = exc.ToString();
        }            
    }
}