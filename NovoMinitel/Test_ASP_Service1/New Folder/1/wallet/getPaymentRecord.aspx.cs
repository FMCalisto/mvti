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
    public wallet wallet;
    public recurring recurring;
    public order order;
    public billingRecord[] billingRecordList;
    public privateData[] privateDataList;
    public string isDisabled;
    public string disableDate;
    public string walletId;
    public string contractNumber;
    public string paymentRecordId;
    public result resultat;
    public string errorMessage = "";
    public string errorDetails = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            DirectPaymentAPI ws = new DirectPaymentAPI();
                                    
            contractNumber = ((TextBox)(Page.PreviousPage.FindControl("getPaymentRecord").FindControl("contractNumber"))).Text;
            paymentRecordId = ((TextBox)(Page.PreviousPage.FindControl("getPaymentRecord").FindControl("paymentRecordId"))).Text;

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

            resultat = ws.getPaymentRecord(contractNumber, paymentRecordId, out recurring, out isDisabled, out disableDate, out billingRecordList, out privateDataList, out order, out walletId);

        }
        catch (Exception exc)
        {
            errorMessage = exc.Message;
            errorDetails = exc.ToString();
        }   
    }
}
