<%@ Control Language="C#" AutoEventWireup="true" CodeFile="getTransactionDetailsForm.ascx.cs" Inherits="web_WebUserControl" %>
																
						<div class="code" id="aspx">
	<pre class="aspx">
<span style="color: #0000ff;">using</span> System;
<span style="color: #0000ff;">using</span> System.Data;
<span style="color: #0000ff;">using</span> System.Configuration;
<span style="color: #0000ff;">using</span> System.Web;
<span style="color: #0000ff;">using</span> System.Web.Security;
<span style="color: #0000ff;">using</span> System.Web.UI;
<span style="color: #0000ff;">using</span> System.Web.UI.WebControls;
<span style="color: #0000ff;">using</span> System.Web.UI.WebControls.WebParts;
<span style="color: #0000ff;">using</span> System.Web.UI.HtmlControls;
<span style="color: #0000ff;">using</span> com.payline.www;

<span style="color: #0000ff;">public partial class</span><span style="color: #6666ff;"> _Default</span> : System.Web.UI.<span style="color: #6666ff;">Page</span> 
{
    <span style="color: #0000ff;">protected void</span> Page_Load(<span style="color: #0000ff;">object</span> sender,<span style="color: #6666ff;"> EventArgs</span>)
    {
        <span style="color: #0000ff;">try</span>
        {
            <span style="color: #6666ff;">MassPaymentAPI</span> ws =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> MassPaymentAPI</span>();
            <span style="color: #6666ff;">payment</span> payment1 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> payment</span>();
            <span style="color: #6666ff;">payment</span> payment2 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> payment</span>();
            <span style="color: #6666ff;">capture</span> capture1 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> capture</span>();
            <span style="color: #6666ff;">capture</span> capture2 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> capture</span>();
            <span style="color: #6666ff;">capture</span>[] captureAuthorizationList =<span style="color: #0000ff;">new</span> capture[2];
            <span style="color: #0000ff;">string</span> massTraitmentID;
            <span style="color: #0000ff;">string</span> date;
            
            <span style="color: #808080;">// TRANSACTION1</span>
            capture1.transactionID = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassCapture"</span>.FindControl(<span style="color: #ff0000;">"transactionID1"</span>))).Text;
            
            <span style="color: #808080;">// PAYMENT1</span>
            payment1.amount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentAmount1"</span>))).Text;
            payment1.mode = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentMode1"</span>))).Text;
            payment1.action = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentFonction1"</span>))).Text;
            payment1.currency = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentCurrency1"</span>))).Text;
            payment1.contractNumber = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentContractNumber1"</span>))).Text;
            payment1.differedActionDate = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentDifferedActionDate1"</span>))).Text;
            
            capture1.payment = payment1;

            captureAuthorizationList.SetValue(capture1, 0);   
            
            <span style="color: #808080;">// TRANSACTION2</span>
            capture2.transactionID = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassCapture"</span>.FindControl(<span style="color: #ff0000;">"transactionID2"</span>))).Text;
            
            <span style="color: #808080;">// PAYMENT2</span>
            payment2.amount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentAmount2"</span>))).Text;
            payment2.mode = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentMode2"</span>))).Text;
            payment2.action = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentFonction2"</span>))).Text;
            payment2.currency = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentCurrency2"</span>))).Text;
            payment2.contractNumber = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentContractNumber2"</span>))).Text;
            payment2.differedActionDate = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentDifferedActionDate2"</span>))).Text;
            
            capture2.payment = payment2;

            captureAuthorizationList.SetValue(capture2, 0);   
            
            <span style="color: #808080;">// COMMENT</span>
            <span style="color: #0000ff;">string</span> comment = ((<span style="color: #6666ff;">HtmlTextArea</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassCapture"</span>.FindControl(<span style="color: #ff0000;">"comment"</span>))).Value;
                                                       
           <span style="color: #808080;">//PROXY</span>
           if (Resources.<span style="color: #6666ff;">Resource</span>.PROXY_HOST != <span style="color: #ff0000;">""</span> && Resources.<span style="color: #6666ff;">Resource</span>.PROXY_PORT != <span style="color: #ff0000;">""</span>)
            {
                ws.Proxy = new System.Net.<span style="color: #6666ff;">WebProxy</span>(Resources.<span style="color: #6666ff;">Resource</span>.PROXY_HOST, <span style="color: #6666ff;">Convert</span>.ToInt32(Resources.<span style="color: #6666ff;">Resource</span>.PROXY_PORT));
                if (Resources.<span style="color: #6666ff;">Resource</span>.PROXY_USER != <span style="color: #ff0000;">""</span> && Resources.<span style="color: #6666ff;">Resource</span>.PROXY_PASSWORD != <span style="color: #ff0000;">""</span>)
                {
                    ws.Proxy.Credentials = new System.Net.<span style="color: #6666ff;">NetworkCredential</span>(Resources.<span style="color: #6666ff;">Resource</span>.PROXY_USER, Resources.<span style="color: #6666ff;">Resource</span>.PROXY_PASSWORD);
                }
            }
            
            if (Resources.<span style="color: #6666ff;">Resource</span>.PROD == <span style="color: #ff0000;">"true"</span>)
                ws.Url = Resources.<span style="color: #6666ff;">Resource</span>.ENDPOINT_MASS;

            ws.Credentials = <span style="color: #0000ff;">new</span> System.Net.NetworkCredential(Resources.<span style="color: #6666ff;">Resource</span>.MERCHANT_ID, Resources.<span style="color: #6666ff;">Resource</span>.ACCESS_KEY);
            
            <span style="color: #6666ff;">result</span> resultat = ws.doMassCapture(captureAuthorizationList, comment, <span style="color: #0000ff;">out</span> massTraitmentID, <span style="color: #0000ff;">out</span> date);

            Response.Write(<span style="color: #ff0000;">"resultat message : "</span> + resultat.longMessage);
        }
        <span style="color: #0000ff;">catch</span> (<span style="color: #6666ff;">Exception</span> exc)
        {
            Response.Write(exc.ToString());
        }            
    }
}
</pre>
</div>
						
<div class="code" id="html">
	<pre class="html4strict"><span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;form</span> <span style="color: #000066;">method</span>=<span style="color: #ff0000;">&quot;post&quot;</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;payline-form&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
    
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Informations about Transaction<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;transactionId&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Transaction Id<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
   <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;transactionId&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;0808&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>     
    
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Informations about order<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderRef&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Order reference<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;transactionId&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;0808&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>     
    
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:Button</span> <span style="color: #000066;">PostBackUrl</span>=<span style="color: #ff0000;">&quot;~/extended/getTransactionDetails.aspx&quot;</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">CssClass</span>=<span style="color: #ff0000;">&quot;submit&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;Get Transaction Details&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>           
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/form&gt;</span></span></pre>						</div>
					
<form id="Form1" runat="server" method="post" class="payline-form">
	<fieldset>
        <h4>Informations about Transaction</h4>
        <div class="row">
            <label for="transactionId">Transaction Id</label>
             <asp:TextBox runat="server" Id="transactionId" Text="" />
        </div>
    </fieldset>
	<fieldset>
        <h4>Informations about order</h4>
        <div class="row">
            <label for="orderRef">Order reference</label>
            <asp:TextBox runat="server" Id="orderRef" Text="" />
        </div>
    </fieldset>
    <asp:Button ID="Button1" PostBackUrl="~/extended/getTransactionDetails.aspx" CssClass="submit" runat="server" Text="Get Transaction Details" />
</form>