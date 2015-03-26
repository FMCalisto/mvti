<%@ Control Language="C#" AutoEventWireup="true" CodeFile="doCaptureForm.ascx.cs" Inherits="web_WebUserControl" %>

																
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
            <span style="color: #6666ff;">DirectPaymentAPI</span> ws =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> DirectPaymentAPI</span>();
            <span style="color: #6666ff;">payment</span> payment =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> payment</span>();
            <span style="color: #6666ff;">transaction</span> transaction =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> transaction</span>();
            <span style="color: #6666ff;">privateData</span> privateData1 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> privateData</span>();
            <span style="color: #6666ff;">privateData</span> privateData2 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> privateData</span>();
            <span style="color: #6666ff;">privateData</span> privateData3 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> privateData</span>();
            <span style="color: #6666ff;">privateData</span>[] privateDataList =<span style="color: #0000ff;">null</span>;
            <span style="color: #0000ff;">string</span> transactionID;
            
            <span style="color: #808080;">// TRANSACTION</span>
            transactionID = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doCapture"</span>.FindControl(<span style="color: #ff0000;">"transactionID"</span>))).Text;
            
            <span style="color: #808080;">// PAYMENT</span>
            payment.amount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentAmount"</span>))).Text;
            payment.mode = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentMode"</span>))).Text;
            payment.action = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentFonction"</span>))).Text;
            payment.currency = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentCurrency"</span>))).Text;
            payment.contractNumber = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentContractNumber"</span>))).Text;
            payment.differedActionDate = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doCapture"</span>.FindControl(<span style="color: #ff0000;">"paymentDifferedActionDate"</span>))).Text;

            <span style="color: #808080;">// SEQUENCE NUMBER</span>
            sequenceNumber = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doCapture"</span>.FindControl(<span style="color: #ff0000;">"sequenceNumber"</span>))).Text;
              
            <span style="color: #808080;">// PRIVATE DATA (optional) </span>
            privateData1.key = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"privateDataKey1"</span>))).Text;
            privateData1.value = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"privateDataValue1"</span>))).Text;
            privateData2.key = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"privateDataKey2"</span>))).Text;
            privateData2.value = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"privateDataValue2"</span>))).Text;
            privateData3.key = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"privateDataKey3"</span>))).Text;
            privateData3.value = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"privateDataValue3"</span>))).Text;
                                                                           
            privateDataList.SetValue(privateData1,0);
            privateDataList.SetValue(privateData2,1);
            privateDataList.SetValue(privateData3,2);
                                                                     
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
                ws.Url = Resources.<span style="color: #6666ff;">Resource</span>.ENDPOINT_DIRECT;

            ws.Credentials = <span style="color: #0000ff;">new</span> System.Net.NetworkCredential(Resources.<span style="color: #6666ff;">Resource</span>.MERCHANT_ID, Resources.<span style="color: #6666ff;">Resource</span>.ACCESS_KEY);
            
            <span style="color: #6666ff;">result</span> resultat = ws.doCapture(transactionID, payment, privateDataList, sequenceNumber, <span style="color: #0000ff;">out</span> transaction);

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
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Transaction ID<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;transactionID&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Transaction ID<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> <span style="color: #000066;">size</span>=<span style="color: #ff0000;">&quot;19&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;sequenceNumber&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Sequence Number<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;sequenceNumber&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Payment<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentAmount&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Amount<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

           <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;33300&quot;</span> <span style="color: #000066;">size</span>=<span style="color: #ff0000;">&quot;10&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentMode&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment mode<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentMode&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;CPT&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>CPT<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;DIF&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>DIF<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:DropDownList&gt;</span></span> 
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span> 
  		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentFonction&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment fonction<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>        
			<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">size</span>=<span style="color: #ff0000;">&quot;1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span></span>

				<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;201&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Full<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
				<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;202&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Partial<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

				<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;203&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Finale<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
			<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:DropDownList&gt;</span></span>  
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span> 
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentCurrency&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payement currency<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentCurrency&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;978&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentContractNumber&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Contract number<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentContractNumber&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;001&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentDifferedActionDate&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Differed action date<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentDifferedActionDate&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required if payment mode is &quot;DIF&quot;. Format : &quot;dd/mm/yy&quot;)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>        
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>

    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Private datas<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;privateDataKey1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Private data key 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;privateDataKey1&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;key 1&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;privateDataValue1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Private data value 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;privateDataValue1&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;value 1&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>  
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;hr</span>/<span style="color: #000000; font-weight: bold;">&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;privateDataKey2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Private data key 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;privateDataKey2&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;key 2&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>   
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;privateDataValue2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Private data value 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;privateDataValue2&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;value 2&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;hr</span>/<span style="color: #000000; font-weight: bold;">&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;privateDataKey3&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Private data key 3<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;privateDataKey3&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;key 3&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>   
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;privateDataValue3&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Private data value 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;privateDataValue3&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;value 3&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>     
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>


    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:Button</span> <span style="color: #000066;">PostBackUrl</span>=<span style="color: #ff0000;">&quot;~/direct/doCapture.aspx&quot;</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">CssClass</span>=<span style="color: #ff0000;">&quot;submit&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;Capture&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>  

<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/form&gt;</span></span>
&nbsp;</pre>						</div>
						
											
<form id="Form1" runat="server" method="post" class="payline-form">
    <fieldset>
        <h4>Transaction ID</h4>
        <div class="row">
            <label for="transactionID">Transaction ID</label>
            <asp:TextBox runat="server" Id="transactionID" Text="" />
            <span class="help">(required)</span>
        </div>
    </fieldset>
    <fieldset
        <h4>Sequence Number</h4>
        <div class="row">
            <label for="sequenceNumber">Sequence Number</label>
            <asp:TextBox runat="server" Id="sequenceNumber" Text="" />
        </div>
   </fieldset>
	<fieldset>
        <h4>Payment</h4>
        <div class="row">
            <label for="paymentAmount">Amount</label>
            <asp:TextBox runat="server" Id="paymentAmount" Text="33300" />
        </div>
        <div class="row">
            <label for="paymentMode">Payment mode</label>
            <asp:DropDownList ID="paymentMode" runat="server">
                <asp:ListItem value="CPT">CPT</asp:ListItem>
                <asp:ListItem value="DIF">DIF</asp:ListItem>
            </asp:DropDownList>
        </div> 
  		<div class="row">
            <label for="paymentFonction">Payment fonction</label>
            <asp:DropDownList ID="paymentFonction" runat="server">
                <asp:ListItem value="201">Full</asp:ListItem>
                <asp:ListItem value="202">Partial</asp:ListItem>
                <asp:ListItem value="203">Finale</asp:ListItem>                  
            </asp:DropDownList>
		</div> 
		<div class="row">
            <label for="paymentCurrency">Payement currency</label>
            <asp:TextBox runat="server" Id="paymentCurrency" Text="978" />
        </div>
        <div class="row">
            <label for="paymentContractNumber">Contract number</label>
            <asp:TextBox runat="server" Id="paymentContractNumber" Text="001" />
        </div>
        <div class="row">
            <label for="paymentDifferedActionDate">Differed action date</label>
            <asp:TextBox runat="server" Id="paymentDifferedActionDate" Text="" />
            <span class="help">(required if payment mode is "DIF". Format : "dd/mm/yy")</span>
        </div>        
    </fieldset>
    <fieldset>
        <h4>Private datas</h4>
        <div class="row">
            <label for="privateDataKey1">Private data key 1</label>
            <asp:TextBox runat="server" Id="privateDataKey1" Text="key 1" />
        </div>
        <div class="row">
            <label for="privateDataValue1">Private data value 1</label>
            <asp:TextBox runat="server" Id="privateDataValue1" Text="1" />
        </div>  
        <hr/>
        <div class="row">
            <label for="privateDataKey2">Private data key 2</label>
            <asp:TextBox runat="server" Id="privateDataKey2" Text="key 2" />
        </div>   
        <div class="row">
            <label for="privateDataValue2">Private data value 2</label>
            <asp:TextBox runat="server" Id="privateDataValue2" Text="value 2" />
        </div>
        <hr/>
        <div class="row">
            <label for="privateDataKey3">Private data key 3</label>
            <asp:TextBox runat="server" Id="privateDataKey3" Text="key 3" />
        </div>   
        <div class="row">
            <label for="privateDataValue3">Private data value 3</label>
            <asp:TextBox runat="server" Id="privateDataValue3" Text="value 3" />
        </div>     
	</fieldset>
    <asp:Button ID="Button1" PostBackUrl="~/direct/doCapture.aspx" CssClass="submit" runat="server" Text="Capture" />
</form>