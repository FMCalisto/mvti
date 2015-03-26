<%@ Control Language="C#" AutoEventWireup="true" CodeFile="getWebWalletForm.ascx.cs" Inherits="web_WebUserControl" %>

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
            <span style="color: #6666ff;">WebPaymentAPI</span> ws =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> WebPaymentAPI</span>();
            <span style="color: #6666ff;">wallet</span> wallet;
            <span style="color: #6666ff;">privateData</span>[] privateDataList;
            
            <span style="color: #0000ff;">string</span> token = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"getWebWallet"</span>.FindControl(<span style="color: #ff0000;">"token"</span>))).Text;
            
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
                ws.Url = Resources.<span style="color: #6666ff;">Resource</span>.ENDPOINT_WEB;

            ws.Credentials = <span style="color: #0000ff;">new</span> System.Net.NetworkCredential(Resources.<span style="color: #6666ff;">Resource</span>.MERCHANT_ID, Resources.<span style="color: #6666ff;">Resource</span>.ACCESS_KEY);
            
            <span style="color: #6666ff;">result</span> resultat = ws.getWebWallet(token, <span style="color: #0000ff;">out</span> wallet, <span style="color: #0000ff;">out</span> privateDataList);                                                     
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
							<pre class="html4strict"><span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;form</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">method</span>=<span style="color: #ff0000;">&quot;post&quot;</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;payline-form&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Get Web Payment Details, full example<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;token&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment token<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;token&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
   <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>
   <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:Button</span> <span style="color: #000066;">PostBackUrl</span>=<span style="color: #ff0000;">&quot;~/web/getWebWallet.aspx&quot;</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">CssClass</span>=<span style="color: #ff0000;">&quot;submit&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;Get Web Wallet details&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/form&gt;</span></span>
&nbsp;</pre>						</div>
															

<form id="Form1" runat="server" method="post" class="payline-form">
    <fieldset>
            <h4>Get Web Payment Details, full example</h4>
            <div class="row">
                <label for="token">Payment token</label>
                <asp:TextBox runat="server" ID="token" Text="122" />
                <span class="help">(required)</span>
            </div>
   </fieldset>
    <asp:Button ID="Button1" PostBackUrl="~/wallet/getWebWallet.aspx" CssClass="submit" runat="server" Text="Get Web wallet payment details" />
</form>