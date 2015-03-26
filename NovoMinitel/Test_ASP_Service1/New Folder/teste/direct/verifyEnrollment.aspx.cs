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
    public string actionUrl;
    public string actionMethod;
    public string pareqFieldName;
    public string pareqFieldValue;
    public string termUrlName;
    public string termUrlValue;
    public string mdFieldName;
    public string mdFieldValue;
    public result resultat;
    public string errorMessage = "";
    public string errorDetails = "";
    public bool debug;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            DirectPaymentAPI ws = new DirectPaymentAPI();
            
            // PAYMENT
            payment.amount = ((TextBox)(Page.PreviousPage.FindControl("verifyEnrollment").FindControl("paymentAmount"))).Text;
            payment.mode = ((DropDownList)(Page.PreviousPage.FindControl("verifyEnrollment").FindControl("paymentMode"))).Text;
            payment.action = ((DropDownList)(Page.PreviousPage.FindControl("verifyEnrollment").FindControl("paymentFonction"))).Text;
            payment.currency = ((TextBox)(Page.PreviousPage.FindControl("verifyEnrollment").FindControl("paymentCurrency"))).Text;
            payment.contractNumber = ((TextBox)(Page.PreviousPage.FindControl("verifyEnrollment").FindControl("paymentContractNumber"))).Text;
            payment.differedActionDate = ((TextBox)(Page.PreviousPage.FindControl("verifyEnrollment").FindControl("paymentDifferedActionDate"))).Text; // Format : "dd/mm/yy"

            // ORDER
            order.@ref = ((TextBox)(Page.PreviousPage.FindControl("verifyEnrollment").FindControl("orderRef"))).Text;
            
            // CARD INFO
            card.number = ((TextBox)(Page.PreviousPage.FindControl("verifyEnrollment").FindControl("cardNumber"))).Text;
            card.type = ((DropDownList)(Page.PreviousPage.FindControl("verifyEnrollment").FindControl("cardType"))).Text;
            card.expirationDate = ((TextBox)(Page.PreviousPage.FindControl("verifyEnrollment").FindControl("cardExpirationDate"))).Text;
            card.cvx = ((TextBox)(Page.PreviousPage.FindControl("verifyEnrollment").FindControl("cardCrypto"))).Text;
            card.ownerBirthdayDate = ((TextBox)(Page.PreviousPage.FindControl("verifyEnrollment").FindControl("cardOwnerBirthdayDate"))).Text;
            card.password = ((TextBox)(Page.PreviousPage.FindControl("verifyEnrollment").FindControl("cardPassword"))).Text;

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

            resultat = ws.verifyEnrollment(card, payment, order.@ref, out actionUrl, out actionMethod, out pareqFieldName, out pareqFieldValue, 
                            out termUrlName, out termUrlValue, out mdFieldName, out mdFieldValue);

            debug = ((CheckBox)(Page.PreviousPage.FindControl("verifyEnrollment").FindControl("debug"))).Checked;
        }
        catch (Exception exc)
        {
            errorMessage = exc.Message;
            errorDetails = exc.ToString();
        }
    }
}
