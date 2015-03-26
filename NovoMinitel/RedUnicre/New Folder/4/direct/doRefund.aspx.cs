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
    public transaction transaction = new transaction();
    public privateData privateData1 = new privateData();
    public privateData privateData2 = new privateData();
    public privateData privateData3 = new privateData();
    public privateData[] privateDataList = new privateData[3];
    public string transactionID;
    public string comment;
    public string sequenceNumber = "";
    public result resultat;
    public string errorMessage = "";
    public string errorDetails = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            DirectPaymentAPI ws = new DirectPaymentAPI();

            //TRANSACTION
            transactionID = ((TextBox)(Page.PreviousPage.FindControl("doRefund").FindControl("transactionID"))).Text;

            //PAYMENT            
            payment.amount = ((TextBox)(Page.PreviousPage.FindControl("doRefund").FindControl("paymentAmount"))).Text;
            payment.mode = ((DropDownList)(Page.PreviousPage.FindControl("doRefund").FindControl("paymentMode"))).Text;
            payment.action = ((DropDownList)(Page.PreviousPage.FindControl("doRefund").FindControl("paymentFonction"))).Text;
            payment.currency = ((TextBox)(Page.PreviousPage.FindControl("doRefund").FindControl("paymentCurrency"))).Text;
            payment.contractNumber = ((TextBox)(Page.PreviousPage.FindControl("doRefund").FindControl("paymentContractNumber"))).Text;
            payment.differedActionDate = ((TextBox)(Page.PreviousPage.FindControl("doRefund").FindControl("paymentDifferedActionDate"))).Text; // Format : "dd/mm/yy"

            //SEQUENCE NUMBER
            sequenceNumber = ((TextBox)(Page.PreviousPage.FindControl("doRefund").FindControl("sequenceNumber"))).Text;
            
            //COMMENT
            comment = ((HtmlTextArea)(Page.PreviousPage.FindControl("doRefund").FindControl("comment"))).Value;

            // PRIVATE DATA (optional)            
            privateData1.key = ((TextBox)(Page.PreviousPage.FindControl("doRefund").FindControl("privateDataKey1"))).Text;
            privateData1.value = ((TextBox)(Page.PreviousPage.FindControl("doRefund").FindControl("privateDataValue1"))).Text;
            privateData2.key = ((TextBox)(Page.PreviousPage.FindControl("doRefund").FindControl("privateDataKey2"))).Text;
            privateData2.value = ((TextBox)(Page.PreviousPage.FindControl("doRefund").FindControl("privateDataValue2"))).Text;
            privateData3.key = ((TextBox)(Page.PreviousPage.FindControl("doRefund").FindControl("privateDataKey3"))).Text;
            privateData3.value = ((TextBox)(Page.PreviousPage.FindControl("doRefund").FindControl("privateDataValue3"))).Text;

            privateDataList.SetValue(privateData1, 0);
            privateDataList.SetValue(privateData2, 1);
            privateDataList.SetValue(privateData3, 2);

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

            resultat = ws.doRefund(transactionID, payment, comment, privateDataList, sequenceNumber, out transaction);
        }
        catch (Exception exc)
        {
            errorMessage = exc.Message;
            errorDetails = exc.ToString();
        }
    }
}
