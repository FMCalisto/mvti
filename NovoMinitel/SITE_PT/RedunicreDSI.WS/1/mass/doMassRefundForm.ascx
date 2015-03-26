<%@ Control Language="C#" AutoEventWireup="true" CodeFile="doMassRefundForm.ascx.cs" Inherits="web_WebUserControl" %>
																
						<div class="code" id="aspx">
<%  
    /*string filename = Request.PhysicalApplicationPath + "web\\doWebPayment.aspx.cs";
    System.IO.FileInfo fi = new System.IO.FileInfo(filename);    
    if (fi.Exists) // on verifie ke le fichier existe
    {
        Response.WriteFile(filename);
    } */                          

 %>
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
            <span style="color: #6666ff;">refund</span> refund1 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> refund</span>();
            <span style="color: #6666ff;">refund</span> refund2 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> refund</span>();
            <span style="color: #6666ff;">refund</span>[] refundAuthorizationList =<span style="color: #0000ff;">new</span> refund[2];
            <span style="color: #0000ff;">string</span> massTraitmentID;
            <span style="color: #0000ff;">string</span> date;
            
            <span style="color: #808080;">// TRANSACTION1</span>
            refund1.transactionID = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassRefund"</span>.FindControl(<span style="color: #ff0000;">"transactionID1"</span>))).Text;
            
            <span style="color: #808080;">// PAYMENT1</span>
            payment1.amount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassRefund"</span>.FindControl(<span style="color: #ff0000;">"paymentAmount1"</span>))).Text;
            payment1.mode = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassRefund"</span>.FindControl(<span style="color: #ff0000;">"paymentMode1"</span>))).Text;
            payment1.action = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassRefund"</span>.FindControl(<span style="color: #ff0000;">"paymentFonction1"</span>))).Text;
            payment1.currency = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassRefund"</span>.FindControl(<span style="color: #ff0000;">"paymentCurrency1"</span>))).Text;
            payment1.contractNumber = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassRefund"</span>.FindControl(<span style="color: #ff0000;">"paymentContractNumber1"</span>))).Text;
            payment1.differedActionDate = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassRefund"</span>.FindControl(<span style="color: #ff0000;">"paymentDifferedActionDate1"</span>))).Text;
            
            refund1.payment = payment1;

            refundAuthorizationList.SetValue(refund1, 0);   
            
            <span style="color: #808080;">// TRANSACTION2</span>
            refund2.transactionID = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassRefund"</span>.FindControl(<span style="color: #ff0000;">"transactionID2"</span>))).Text;
            
            <span style="color: #808080;">// PAYMENT2</span>
            payment2.amount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassRefund"</span>.FindControl(<span style="color: #ff0000;">"paymentAmount2"</span>))).Text;
            payment2.mode = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassRefund"</span>.FindControl(<span style="color: #ff0000;">"paymentMode2"</span>))).Text;
            payment2.action = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassRefund"</span>.FindControl(<span style="color: #ff0000;">"paymentFonction2"</span>))).Text;
            payment2.currency = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassRefund"</span>.FindControl(<span style="color: #ff0000;">"paymentCurrency2"</span>))).Text;
            payment2.contractNumber = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassRefund"</span>.FindControl(<span style="color: #ff0000;">"paymentContractNumber2"</span>))).Text;
            payment2.differedActionDate = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassRefund"</span>.FindControl(<span style="color: #ff0000;">"paymentDifferedActionDate2"</span>))).Text;
            
            refund2.payment = payment2;

            refundAuthorizationList.SetValue(refund2, 0);   
            
            <span style="color: #808080;">// COMMENT</span>
            <span style="color: #0000ff;">string</span> comment = ((<span style="color: #6666ff;">HtmlTextArea</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doMassRefund"</span>.FindControl(<span style="color: #ff0000;">"comment"</span>))).Value;
                                                       
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
            
            <span style="color: #6666ff;">result</span> resultat = ws.doMassRefund(refundAuthorizationList, comment, <span style="color: #0000ff;">out</span> massTraitmentID, <span style="color: #0000ff;">out</span> date);

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

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Informations about payment and transaction 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
          <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;transactionID1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>ID transaction 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;transactionID1&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentAmount1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment amount 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentAmount1&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;33300&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentMode1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment mode 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentMode1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;CPT&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>CPT<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;DIF&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>DIF<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:DropDownList&gt;</span></span> 
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentFonction1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment fonction 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;201&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Compl<span style="color: #ddbb00;">&amp;egrave;</span>te<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;202&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Partielle<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;203&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Finale<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:DropDownList&gt;</span></span> 
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentCurrency1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment currency 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentCurrency1&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;978&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentContractNumber1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment contract number 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentContractNumber1&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;001&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentDifferedActionDate1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment differed action date 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentDifferedActionDate1&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required if payment mode 1 is &quot;DIF&quot;. Format : &quot;dd/mm/yy&quot;)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
       <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>    
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Informations about payment and transaction 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
         <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;transactionID2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>ID transaction 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;transactionID2&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentAmount2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment amount 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentAmount2&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;33300&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentMode2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment mode 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentMode2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;CPT&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>CPT<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;DIF&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>DIF<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:DropDownList&gt;</span></span> 
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentFonction2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment fonction 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;202&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Compl<span style="color: #ddbb00;">&amp;egrave;</span>te<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;202&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Partielle<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;203&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Finale<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:DropDownList&gt;</span></span> 
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentCurrency2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment currency 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentCurrency2&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;978&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentContractNumber2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment contract number 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentContractNumber2&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;002&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentDifferedActionDate2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment differed action date 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentDifferedActionDate2&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required if payment mode 2 is &quot;DIF&quot;. Format : &quot;dd/mm/yy&quot;)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
       <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>  
			 <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Comment for Mass refund<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
       		 <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;comment&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Comment<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;textarea</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;comment&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Comment<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/textarea&gt;</span></span>
        	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
    	 <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>         
       <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:Button</span> <span style="color: #000066;">PostBackUrl</span>=<span style="color: #ff0000;">&quot;~/mass/doMassRefund.aspx&quot;</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">CssClass</span>=<span style="color: #ff0000;">&quot;submit&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;Start mass refund&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>           

<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/form&gt;</span></span></pre>						</div>
						

<form id="Form1" runat="server" method="post" class="payline-form">
    <fieldset>
        <h4>Informations about payment and transaction 1</h4>
          <div class="row">
            <label for="transactionID1">ID transaction 1</label>
            <asp:TextBox runat="server" Id="transactionID1" Text="" />            
        </div>
        <div class="row">
            <label for="paymentAmount1">Payment amount 1</label>
            <asp:TextBox runat="server" Id="paymentAmount1" Text="33300" />
        </div>
        <div class="row">
            <label for="paymentMode1">Payment mode 1</label>
            <asp:DropDownList ID="paymentMode1" runat="server">
                <asp:ListItem value="CPT">CPT</asp:ListItem>
                <asp:ListItem value="DIF">DIF</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="row">
            <label for="paymentFonction1">Payment fonction 1</label>
            <asp:DropDownList ID="paymentFonction1" runat="server">
                <asp:ListItem value="201">Compl&egrave;te</asp:ListItem>
                <asp:ListItem value="202">Partielle</asp:ListItem>
                <asp:ListItem value="203">Finale</asp:ListItem>
            </asp:DropDownList>            
        </div>
        <div class="row">
            <label for="paymentCurrency1">Payment currency 1</label>
            <asp:TextBox runat="server" Id="paymentCurrency1" Text="978" />
        </div>
        <div class="row">
            <label for="paymentContractNumber1">Payment contract number 1</label>
            <asp:TextBox runat="server" Id="paymentContractNumber1" Text="001" />
        </div>
        <div class="row">
            <label for="paymentDifferedActionDate1">Payment differed action date 1</label>
            <asp:TextBox runat="server" Id="paymentDifferedActionDate1" Text="" />
            <span class="help">(required if payment mode 1 is "DIF". Format : "dd/mm/yy")</span>
        </div>
       </fieldset>    
    <fieldset>
        <h4>Informations about payment and transaction 2</h4>
          <div class="row">
            <label for="transactionID2">ID transaction 2</label>
            <asp:TextBox runat="server" Id="transactionID2" Text="" />            
        </div>
        <div class="row">
            <label for="paymentAmount2">Payment amount 2</label>
            <asp:TextBox runat="server" Id="paymentAmount2" Text="33300" />
        </div>
        <div class="row">
            <label for="paymentMode2">Payment mode 2</label>
            <asp:DropDownList ID="paymentMode2" runat="server">
                <asp:ListItem value="CPT">CPT</asp:ListItem>
                <asp:ListItem value="DIF">DIF</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="row">
            <label for="paymentFonction2">Payment fonction 2</label>
            <asp:DropDownList ID="paymentFonction2" runat="server">
                <asp:ListItem value="201">Compl&egrave;te</asp:ListItem>
                <asp:ListItem value="202">Partielle</asp:ListItem>
                <asp:ListItem value="203">Finale</asp:ListItem>
            </asp:DropDownList>            
        </div>
        <div class="row">
            <label for="paymentCurrency2">Payment currency 2</label>
            <asp:TextBox runat="server" Id="paymentCurrency2" Text="978" />
        </div>
        <div class="row">
            <label for="paymentContractNumber2">Payment contract number 2</label>
            <asp:TextBox runat="server" Id="paymentContractNumber2" Text="002" />
        </div>
        <div class="row">
            <label for="paymentDifferedActionDate2">Payment differed action date 2</label>
            <asp:TextBox runat="server" Id="paymentDifferedActionDate2" Text="" />
            <span class="help">(required if payment mode 1 is "DIF". Format : "dd/mm/yy")</span>
        </div>       
       </fieldset>  
			 <fieldset>
        <h4>Comment for Mass refund</h4>
       		 <div class="row">
            <label for="comment">Comment</label>
            <textarea runat="server" name="comment" id="comment">Comment</textarea>
        	</div>
    	 </fieldset>         
    	 <asp:Button ID="Button1" PostBackUrl="~/mass/doMassRefund.aspx" CssClass="submit" runat="server" Text="Start mass refund" />
</form>