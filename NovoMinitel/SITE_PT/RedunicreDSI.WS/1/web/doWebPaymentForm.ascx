<%@ Control Language="C#" AutoEventWireup="true" CodeFile="doWebPaymentForm.ascx.cs" Inherits="web_WebUserControl" %>

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
            <span style="color: #6666ff;">payment</span> payment =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> payment</span>();
            <span style="color: #6666ff;">order</span> order =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> order</span>();
            <span style="color: #6666ff;">buyer</span> buyer =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> buyer</span>();
            <span style="color: #6666ff;">recurring</span> recurring =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> recurring</span>();
            <span style="color: #6666ff;">privateData</span>[] privateDataList =<span style="color: #0000ff;">null</span>;
            
            <span style="color: #0000ff;">string</span>[] selectedCrontractList =<span style="color: #0000ff;"> new string</span>[100];
            <span style="color: #0000ff;">string</span> token;
            <span style="color: #0000ff;">string</span> redirectURL;
            
            <span style="color: #0000ff;">string</span> amount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doWebPayment"</span>.FindControl(<span style="color: #ff0000;">"amount"</span>))).Text;
            <span style="color: #0000ff;">string</span> currency = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doWebPayment"</span>.FindControl(<span style="color: #ff0000;">"currency"</span>))).Text;
            <span style="color: #0000ff;">string</span> reference = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doWebPayment"</span>.FindControl(<span style="color: #ff0000;">"ref"</span>))).Text;
            <span style="color: #0000ff;">CultureInfo</span> ci = CultureInfo.InvariantCulture;              
            
            payment.amount = amount;
            payment.currency = currency;
            payment.action = Resources.<span style="color: #6666ff;">Resource</span>.PAYMENT_ACTION;
            payment.mode = Resources.<span style="color: #6666ff;">Resource</span>.PAYMENT_MODE;
            payment.contractNumber = <span style="color: #6666ff;">Resource</span>.Resource.CONTRACT_NUMBER;


            order.@ref = reference;
            order.amount = amount;
            order.currency = currency;
            order.date = (<span style="color: #6666ff;">DateTime</span>.Now).ToString(<span style="color: #ff0000;">"dd/MM/yyyy HH:mm"</span>, ci);

            selectedCrontractList.SetValue(Resources.<span style="color: #6666ff;">Resource</span>.CONTRACT_NUMBER_LIST, 0);
            recurring = <span style="color: #0000ff;">null</span>;
            buyer = <span style="color: #0000ff;">null</span>;

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
            
            <span style="color: #6666ff;">result</span> resultat = ws.doWebPayment(payment, Resources.<span style="color: #6666ff;">Resource</span>.RETURN_URL, Resources.<span style="color: #6666ff;">Resource</span>.CANCEL_URL, order, 
                                                Resources.<span style="color: #6666ff;">Resource</span>.NOTIFICATION_URL, selectedCrontractList, privateDataList, 
                                                Resources.<span style="color: #6666ff;">Resource</span>.LANGUAGE_CODE, Resources.<span style="color: #6666ff;">Resource</span>.CUSTOM_PAYMENT_PAGE_CODE, buyer, 
                                                Resources.<span style="color: #6666ff;">Resource</span>.SECURITY_MODE, recurring, <span style="color: #0000ff;">out</span> token, <span style="color: #0000ff;">out</span> redirectURL);
            
            <span style="color: #0000ff;">if</span> (resultat.code == <span style="color: #ff0000;">"00000"</span>)
            {
                Response.Redirect(redirectURL);
            }
            <span style="color: #0000ff;">else</span>
                Response.Write(<span style="color: #ff0000;">"resultat message error : "</span> + resultat.longMessage);
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
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Do Web Payment minimal informations<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;ref&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Order reference<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;ref&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;123&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;amount&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Amount<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;amount&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;33300&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
&nbsp;
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
         <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;currency&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Currency<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList </span><span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;currency&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;978&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>EURO (EUR)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;840&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>US DOLLAR (USD)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;756&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>FRANC SUISSE (CHF)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;826&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>STERLING (GBP)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;124&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>CANADIAN DOLLAR (CAD)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:DropDownList&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;debug&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>MODE DEBUG<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:CheckBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;debug&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>      	
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:Button</span> <span style="color: #000066;">PostBackUrl</span>=<span style="color: #ff0000;">&quot;~/web/doWebPayment.aspx&quot;</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">CssClass</span>=<span style="color: #ff0000;">&quot;submit&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;Start payment process&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/form&gt;</span></span></pre>						</div>
						
<form runat="server" method="post" class="payline-form">
    <fieldset>
        <h4>Do Web Payment minimal informations</h4>
        <div class="row">
            <label for="ref">Order reference</label>
            <asp:TextBox runat="server" Id="ref" Text="123" />
            <span class="help">(required)</span>
        </div>
        <div class="row">
            <label for="amount">Amount</label>
            <asp:TextBox runat="server" Id="amount" Text="33300" />
            <span class="help">(required)</span>
           
        </div>
         <div class="row">
            <label for="currency">Currency</label>
            <asp:DropDownList ID="currency" runat="server">
                <asp:ListItem value="978">EURO (EUR)</asp:ListItem>
                <asp:ListItem value="840">US DOLLAR (USD)</asp:ListItem>
                <asp:ListItem value="756">FRANC SUISSE (CHF)</asp:ListItem>
                <asp:ListItem value="826">STERLING (GBP)</asp:ListItem>
                <asp:ListItem value="124">CANADIAN DOLLAR (CAD)</asp:ListItem>
            </asp:DropDownList>
         </div>    
         <div class="row">
            <label for="debug">MODE DEBUG</label>
            <asp:CheckBox CssClass="debug" runat="server" id="debug" />
        </div>     
    </fieldset>
    <asp:Button ID="Button1" PostBackUrl="~/web/doWebPayment.aspx" CssClass="submit" runat="server" Text="Start payment process" />
</form>