<%@ Control Language="C#" AutoEventWireup="true" CodeFile="verifyEnrollmentForm.ascx.cs" Inherits="web_WebUserControl" %>

					
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
            <span style="color: #6666ff;">DirectPaymentAPI</span> ws =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> DirectPaymentAPI</span>();
            <span style="color: #6666ff;">payment</span> payment =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> payment</span>();
            <span style="color: #6666ff;">card</span> card =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> card</span>();
            <span style="color: #6666ff;">order</span> order =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> order</span>();
                   
            <span style="color: #808080;">// PAYMENT</span>
            payment.amount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"paymentAmount"</span>))).Text;
            payment.mode = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"paymentMode"</span>))).Text;
            payment.action = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"paymentFonction"</span>))).Text;
            payment.currency = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"paymentCurrency"</span>))).Text;
            payment.contractNumber = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"paymentContractNumber"</span>))).Text;
            payment.differedActionDate = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"paymentDifferedActionDate"</span>))).Text;
            
            <span style="color: #808080;">// ORDER</span>
            order.@ref = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"orderRef"</span>))).Text;
            
            <span style="color: #808080;">// CARD INFO</span>
            card.number = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"cardNumber"</span>))).Text;
            card.type = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"cardType"</span>))).Text;
            card.expirationDate = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"cardExpirationDate"</span>))).Text;
            card.cvx = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"cardCrypto"</span>))).Text;
            card.ownerBirthdayDate = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"cardOwnerBirthdayDate"</span>))).Text;
            card.password = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doAuthorization"</span>.FindControl(<span style="color: #ff0000;">"cardPassword"</span>))).Text;
            
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
            
            <span style="color: #6666ff;">result</span> resultat = ws.doAuthorization(card, payment, order.@ref,
                                             <span style="color: #0000ff;">out</span> actionUrl, <span style="color: #0000ff;">out</span> actionMethod
                                             <span style="color: #0000ff;">out</span> pareqFieldName, <span style="color: #0000ff;">out</span> pareqFieldValue
                                             <span style="color: #0000ff;">out</span> termUrlName, <span style="color: #0000ff;">out</span> termUrlValue
                                             <span style="color: #0000ff;">out</span> mdFieldName, <span style="color: #0000ff;">out</span> mdFieldValue);

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
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Informations about card<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;cardNumber&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Card number<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;cardNumber&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;4970100011222417&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;cardType&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Card type<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;cardType&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;CB&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>CB<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;AMEX&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>AMEX<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;COFINOGA&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>COFINOGA<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;JCB&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>JCB<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;DINERS&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>DINERS<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;AURORE&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>AURORE<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;SOFINCO&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>SOFINCO<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;CETELEM&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>CETELEM<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;FNAC&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>FNAC<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;PRINTEMPS&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>PRINTEMPS<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;KANGOUROU&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>KANGOUROU<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;SURCOUF&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>SURCOUF<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;CYRILLUS&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>CYRILLUS<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:DropDownList&gt;</span></span> 
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;cardExpirationDate&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Card expiration date<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;cardExpirationDate&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;0808&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;cardCrypto&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Card cryptogram<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;cardCrypto&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;123&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;cardOwnerBirthdayDate&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Owner birthday date<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;cardOwnerBirthdayDate&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required format : &quot;ddmmyy&quot;)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;cardPassword&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Card password<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;cardPassword&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Informations about payment<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentAmount&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment amount<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentAmount&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;33300&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

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
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentFonction&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;100&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Autor<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;101&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Autor+Capture<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                 <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;422&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Recredit<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:DropDownList&gt;</span></span> 
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentCurrency&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payement currency<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentCurrency&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;978&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentContractNumber&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Contract number<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentContractNumber&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;001&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

             <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(separator if severals numbers : &quot;;&quot;)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentDifferedActionDate&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Differed action date<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentDifferedActionDate&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required if payment mode is &quot;DIF&quot;. Format : &quot;dd/mm/yy&quot;)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>     
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>

	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Informations about order<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderRef&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Order reference<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderRef&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;1234&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>
	
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:Button</span> <span style="color: #000066;">PostBackUrl</span>=<span style="color: #ff0000;">&quot;~/direct/verifyEnrollment.aspx&quot;</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">CssClass</span>=<span style="color: #ff0000;">&quot;submit&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;Verify Enrollment&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/form&gt;</span></span>
&nbsp;</pre>						</div>
						
						
<form id="Form1" runat="server" method="post" class="payline-form">
    <fieldset>
        <h4>Informations about card</h4>
        <div class="row">
            <label for="cardNumber">Card number</label>
            <asp:TextBox runat="server" Id="cardNumber" Text="4970100011222417" />
        </div>
        <div class="row">
            <label for="cardType">Card type</label>
            <asp:DropDownList ID="cardType" runat="server">
                <asp:ListItem value="CB">CB</asp:ListItem>
                <asp:ListItem value="AMEX">AMEX</asp:ListItem>                
                <asp:ListItem value="COFINOGA">COFINOGA</asp:ListItem>
                <asp:ListItem value="JCB">JCB</asp:ListItem>
                <asp:ListItem value="DINERS">DINERS</asp:ListItem>
                <asp:ListItem value="AURORE">AURORE</asp:ListItem>
                <asp:ListItem value="SOFINCO">SOFINCO</asp:ListItem>
                <asp:ListItem value="CETELEM">CETELEM</asp:ListItem>
                <asp:ListItem value="FNAC">FNAC</asp:ListItem>
                <asp:ListItem value="PRINTEMPS">PRINTEMPS</asp:ListItem>
                <asp:ListItem value="KANGOUROU">KANGOUROU</asp:ListItem>
                <asp:ListItem value="SURCOUF">SURCOUF</asp:ListItem>
                <asp:ListItem value="CYRILLUS">CYRILLUS</asp:ListItem>                
            </asp:DropDownList>                
        </div>
        <div class="row">
            <label for="cardExpirationDate">Card expiration date</label>
            <asp:TextBox runat="server" Id="cardExpirationDate" Text="0810" />
        </div>
        <div class="row">
            <label for="cardCrypto">Card cryptogram</label>
            <asp:TextBox runat="server" Id="cardCrypto" Text="123" />
        </div>
        <div class="row">
            <label for="cardOwnerBirthdayDate">Owner birthday date</label>
            <asp:TextBox runat="server" Id="cardOwnerBirthdayDate" Text="" />
            <span class="help">(required format : "ddmmyy")</span>
        </div>
        <div class="row">
            <label for="cardPassword">Card password</label>
            <asp:TextBox runat="server" Id="cardPassword" Text="" />
        </div>
    </fieldset>
	<fieldset>
        <h4>Informations about payment</h4>
        <div class="row">
            <label for="paymentAmount">Payment amount</label>
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
                <asp:ListItem value="100">Autor</asp:ListItem>
                <asp:ListItem value="101">Autor+Capture</asp:ListItem>
                <asp:ListItem value="422">Recredit</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="row">
            <label for="paymentCurrency">Payement currency</label>
            <asp:TextBox runat="server" Id="paymentCurrency" Text="978" />
        </div>
        <div class="row">
            <label for="paymentContractNumber">Contract number</label>
            <asp:TextBox runat="server" Id="paymentContractNumber" Text="0013DS" />
        </div>
        <div class="row">
            <label for="paymentDifferedActionDate">Differed action date</label>
            <asp:TextBox runat="server" Id="paymentDifferedActionDate" Text="" />
            <span class="help">(required if payment mode is "DIF". Format : "dd/mm/yy")</span>
        </div>     
	</fieldset>
	<fieldset>
        <h4>Informations about order</h4>
        <div class="row">
            <label for="orderRef">Order reference</label>
            <asp:TextBox runat="server" Id="orderRef" Text="1234" />
        </div>        
	</fieldset>
	<fieldset>
		<div class="row">
            <label for="debug">MODE DEBUG</label>
            <asp:CheckBox CssClass="debug" runat="server" id="debug" />
		</div>  
    </fieldset> 	
    <asp:Button ID="Button1" PostBackUrl="~/direct/verifyEnrollment.aspx" CssClass="submit" runat="server" Text="Verify Enrollment" />
</form>