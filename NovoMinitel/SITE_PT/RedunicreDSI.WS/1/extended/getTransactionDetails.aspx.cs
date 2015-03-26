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
    public string transactionId;
    public string orderRef;
    public transaction transaction;
    public payment payment;
    public authorization authorization;
    public order order; 
    public buyer buyer;
    public privateData[] privateDataList;
    public result resultat;
    public string errorMessage = "";
    public string errorDetails = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ExtendedAPI ws = new ExtendedAPI();
            
            /************************************/
            /*      	TRANSACTION DETAIL 		*/
            /************************************/

            //TRANSACTION1
            transactionId = ((TextBox)(Page.PreviousPage.FindControl("getTransactionDetails").FindControl("transactionId"))).Text;

            //ORDER REF            
            orderRef = ((TextBox)(Page.PreviousPage.FindControl("getTransactionDetails").FindControl("orderRef"))).Text;
            
           
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

            resultat = ws.getTransactionDetails(transactionId, orderRef, out transaction,
                                                out payment, out authorization,
                                                out order, out buyer, out privateDataList);
        }
        catch (Exception exc)
        {
            errorMessage = exc.Message;
            errorDetails = exc.ToString();
        }            
    }
}
