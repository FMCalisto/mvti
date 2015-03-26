using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Globalization;

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
    public privateData[] privateDataList = null;
    public string errorMessage = "";
    public string errorDetails = "";
    CultureInfo ci = CultureInfo.InvariantCulture;

    string[] selectedCrontractList = new string[100];

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            WebPaymentAPI ws = new WebPaymentAPI();
                        
            string amount = ((TextBox)(Page.PreviousPage.FindControl("doWebPayment").FindControl("amount"))).Text;
            string currency = ((DropDownList)(Page.PreviousPage.FindControl("doWebPayment").FindControl("currency"))).Text;
            string reference = ((TextBox)(Page.PreviousPage.FindControl("doWebPayment").FindControl("ref"))).Text;

            payment.amount = amount;
            payment.currency = currency;
            payment.action = Resources.Resource.PAYMENT_ACTION;
            payment.mode = Resources.Resource.PAYMENT_MODE;
            payment.contractNumber = Resources.Resource.CONTRACT_NUMBER;


            order.@ref = reference;
            order.amount = amount;
            order.currency = currency;
            
            order.date = (DateTime.Now).ToString("dd/MM/yyyy HH:mm", ci);

            selectedCrontractList.SetValue(Resources.Resource.CONTRACT_NUMBER_LIST, 0);
            recurring = null;
            buyer = null;

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

            resultat = ws.doWebPayment(payment, Resources.Resource.RETURN_URL, Resources.Resource.CANCEL_URL, order,
                                                Resources.Resource.NOTIFICATION_URL, selectedCrontractList, privateDataList,
                                                Resources.Resource.LANGUAGE_CODE, Resources.Resource.CUSTOM_PAYMENT_PAGE_CODE, buyer,
                                                Resources.Resource.SECURITY_MODE, recurring, Resources.Resource.CUSTOM_PAYMENT_TEMPLATE_URL, out token, out redirectURL);

            debug = ((CheckBox)(Page.PreviousPage.FindControl("doWebPayment").FindControl("debug"))).Checked;
        }
        catch (Exception exc)
        {
            errorMessage = exc.Message;
            errorDetails = exc.ToString();
        }
    }
}

