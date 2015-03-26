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
    public string errorMessage = "";
    public string errorDetails = "";
    public transaction[] transactionList;
    public string transactionId ;
    public string orderRef ;
    public string startDate ;
    public string endDate ;
    public string contractNumber ;
    public string authorizationNumber ;
    public string returnCode ;
    public string paymentMean ;
    public string transactionType ;
    public string name ;
    public string firstName ;
    public string email;
    public string cardNumber;
    public string currency ;
    public string minAmount ;
    public string maxAmount ;
    public string walletId ;
    public string sequenceNumber ;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ExtendedAPI ws = new ExtendedAPI();
                        
            /************************************/
            /*    Transaction Search   			*/
            /************************************/

            transactionId = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("transactionId"))).Text;
            orderRef = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("orderRef"))).Text;
            startDate = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("startDate"))).Text;
            endDate = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("endDate"))).Text;
            contractNumber = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("contractNumber"))).Text;
            authorizationNumber = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("authorizationNumber"))).Text;
            returnCode = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("returnCode"))).Text;
            paymentMean = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("paymentMean"))).Text;
            transactionType = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("transactionType"))).Text;
            name = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("name"))).Text;
            firstName = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("firstName"))).Text;
            email = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("email"))).Text;
            cardNumber = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("cardNumber"))).Text;
            currency = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("currency"))).Text;
            minAmount = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("minAmount"))).Text;
            maxAmount = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("maxAmount"))).Text;
            walletId = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("walletId"))).Text;
            sequenceNumber = ((TextBox)(Page.PreviousPage.FindControl("transactionsSearch").FindControl("sequenceNumber"))).Text;

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
                ws.Url = Resources.Resource.ENDPOINT_MASS;

            ws.Credentials = new System.Net.NetworkCredential(Resources.Resource.MERCHANT_ID, Resources.Resource.ACCESS_KEY);

            resultat = ws.transactionsSearch(transactionId, orderRef, startDate, endDate, contractNumber,
                authorizationNumber, returnCode, paymentMean, transactionType, name, firstName,
                email, cardNumber, currency, minAmount, maxAmount, walletId, sequenceNumber, out transactionList);
            
        }
        catch (Exception exc)
        {
            errorMessage = exc.Message;
            errorDetails = exc.ToString();
        }           
    }
}
