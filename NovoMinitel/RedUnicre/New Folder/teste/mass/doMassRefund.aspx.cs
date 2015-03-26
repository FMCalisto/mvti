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
    public payment payment1 = new payment();
    public payment payment2 = new payment();
    public refund refund1 = new refund();
    public refund refund2 = new refund();
    public refund[] refundAuthorizationList = new refund[2];
    public string massTraitmentID;
    public string date;
    public result resultat;
    public string errorMessage = "";
    public string errorDetails = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            MassPaymentAPI ws = new MassPaymentAPI();
                        
            /************************************/
            /*      	Refund 1    			*/
            /************************************/

            //TRANSACTION1
            refund1.transactionID = ((TextBox)(Page.PreviousPage.FindControl("doMassRefund").FindControl("transactionID1"))).Text;

            //PAYMENT1            
            payment1.amount = ((TextBox)(Page.PreviousPage.FindControl("doMassRefund").FindControl("paymentAmount1"))).Text;
            payment1.mode = ((DropDownList)(Page.PreviousPage.FindControl("doMassRefund").FindControl("paymentMode1"))).Text;
            payment1.action = ((DropDownList)(Page.PreviousPage.FindControl("doMassRefund").FindControl("paymentFonction1"))).Text;
            payment1.currency = ((TextBox)(Page.PreviousPage.FindControl("doMassRefund").FindControl("paymentCurrency1"))).Text;
            payment1.contractNumber = ((TextBox)(Page.PreviousPage.FindControl("doMassRefund").FindControl("paymentContractNumber1"))).Text;
            payment1.differedActionDate = ((TextBox)(Page.PreviousPage.FindControl("doMassRefund").FindControl("paymentDifferedActionDate1"))).Text; // Format : "dd/mm/yy"

            refund1.payment = payment1;            

            refundAuthorizationList.SetValue(refund1, 0);
                        
            /************************************/
            /*      	Refund 2    			*/
            /************************************/

            //TRANSACTION2
            refund2.transactionID = ((TextBox)(Page.PreviousPage.FindControl("doMassRefund").FindControl("transactionID2"))).Text;

            //PAYMENT2
            payment2.amount = ((TextBox)(Page.PreviousPage.FindControl("doMassRefund").FindControl("paymentAmount2"))).Text;
            payment2.mode = ((DropDownList)(Page.PreviousPage.FindControl("doMassRefund").FindControl("paymentMode2"))).Text;
            payment2.action = ((DropDownList)(Page.PreviousPage.FindControl("doMassRefund").FindControl("paymentFonction2"))).Text;
            payment2.currency = ((TextBox)(Page.PreviousPage.FindControl("doMassRefund").FindControl("paymentCurrency2"))).Text;
            payment2.contractNumber = ((TextBox)(Page.PreviousPage.FindControl("doMassRefund").FindControl("paymentContractNumber2"))).Text;            
            payment2.differedActionDate = ((TextBox)(Page.PreviousPage.FindControl("doMassRefund").FindControl("paymentDifferedActionDate2"))).Text; // Format : "dd/mm/yy"

            refund2.payment = payment2;

            refundAuthorizationList.SetValue(refund2, 1);
            
            //COMMENT
            string comment = ((HtmlTextArea)(Page.PreviousPage.FindControl("doMassRefund").FindControl("comment"))).Value;

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

            resultat = ws.doMassRefund(refundAuthorizationList, comment, out massTraitmentID, out date);
        }
        catch (Exception exc)
        {
            errorMessage = exc.Message;
            errorDetails = exc.ToString();
        }           
    }
}
