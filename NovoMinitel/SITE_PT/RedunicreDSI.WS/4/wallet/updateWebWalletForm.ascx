<%@ Control Language="C#" AutoEventWireup="true" CodeFile="updateWebWalletForm.ascx.cs" Inherits="web_WebUserControl" %>

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
            <span style="color: #6666ff;">WebPaymentAPI</span> ws =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> WebPaymentAPI</span>();
            <span style="color: #6666ff;">payment</span> payment =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> payment</span>();
            <span style="color: #6666ff;">order</span> order =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> order</span>();
            <span style="color: #6666ff;">buyer</span> buyer =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> buyer</span>();
            <span style="color: #6666ff;">address</span> address =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> address</span>();
            <span style="color: #6666ff;">recurring</span> recurring =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> recurring</span>();
            <span style="color: #6666ff;">orderDetail</span> orderDetail1 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> orderDetail1</span>();
            <span style="color: #6666ff;">orderDetail</span> orderDetail2 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> orderDetail1</span>();
            <span style="color: #6666ff;">privateData</span> privateData1 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> privateData</span>();
            <span style="color: #6666ff;">privateData</span> privateData2 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> privateData</span>();
            <span style="color: #6666ff;">privateData</span> privateData3 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> privateData</span>();
            <span style="color: #6666ff;">privateData</span>[] privateDataList =<span style="color: #0000ff;">null</span>;
            
            <span style="color: #0000ff;">string</span>[] selectedCrontractList =<span style="color: #0000ff;"> new string</span>[100];
            <span style="color: #0000ff;">string</span> token;
            <span style="color: #0000ff;">string</span> redirectURL;
            <span style="color: #0000ff;">string</span> contractNumber;
            <span style="color: #0000ff;">string</span> walletId;
            <span style="color: #0000ff;">string</span> updatePersonalDetails;
            <span style="color: #0000ff;">string</span> updatePaymentDetails;
                        
            contractNumber = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"paymentContractNumber"</span>))).Text;
            <span style="color: #0000ff;">if</span> (contractNumber.Contains(<span style="color: #ff0000;">";"</span>))
            {
                <span style="color: #0000ff;">string</span>[] split = contractNumber.Split(<span style="color: #0000ff;"> new</span><span style="color: #6666ff;"> char</span> {<span style="color: #ff0000;">';'</span>});
                selectedCrontractList = split;
                payment.contractNumber = Resources.<span style="color: #6666ff;">Resource</span>.CONTRACT_NUMBER;
            }
            <span style="color: #0000ff;">else</span>
            {
                payment.contractNumber = contractNumber;
                selectedCrontractList.SetValue(contractNumber, 0);
            }

            walletId = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"walletId"</span>))).Text;
            updatePersonalDetails = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"updatePersonalDetails"</span>))).Text;
            updatePaymentDetails = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"updatePaymentDetails"</span>))).Text;
                                                                   
            <span style="color: #808080;">// PRIVATE DATA (optional) </span>
            privateData1.key = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"privateDataKey1"</span>))).Text;
            privateData1.value = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"privateDataValue1"</span>))).Text;
            privateData2.key = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"privateDataKey2"</span>))).Text;
            privateData2.value = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"privateDataValue2"</span>))).Text;
            privateData3.key = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"privateDataKey3"</span>))).Text;
            privateData3.value = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"privateDataValue3"</span>))).Text;
                                                                           
            privateDataList.SetValue(privateData1,0);
            privateDataList.SetValue(privateData2,1);
            privateDataList.SetValue(privateData3,2);
            
            <span style="color: #808080;">// TRANSACTION OPTIONS </span>
            <span style="color: #0000ff;">string</span> securityMode = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"securityMode"</span>))).Text;
            <span style="color: #0000ff;">if</span> (securityMode == <span style="color: #ff0000;">""</span>)
                securityMode = Resources.<span style="color: #6666ff;">Resource</span>.SECURITY_MODE;
                
            <span style="color: #0000ff;">string</span> notificationURL = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"notificationURL"</span>))).Text;
            <span style="color: #0000ff;">if</span> (notificationURL == <span style="color: #ff0000;">""</span>)
                notificationURL = Resources.<span style="color: #6666ff;">Resource</span>.NOTIFICATION_URL;
                        
            <span style="color: #0000ff;">string</span> returnURL = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"returnURL"</span>))).Text;
            <span style="color: #0000ff;">if</span> (returnURL == <span style="color: #ff0000;">""</span>)
                returnURL = Resources.<span style="color: #6666ff;">Resource</span>.RETURN_URL;
            
            <span style="color: #0000ff;">string</span> cancelURL = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"cancelURL"</span>))).Text;
            <span style="color: #0000ff;">if</span> (cancelURL == <span style="color: #ff0000;">""</span>)
                cancelURL = Resources.<span style="color: #6666ff;">Resource</span>.CANCEL_URL;
            
            <span style="color: #0000ff;">string</span> customPaymentPageCode = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"customPaymentPageCode"</span>))).Text;
            <span style="color: #0000ff;">if</span> (customPaymentPageCode == <span style="color: #ff0000;">""</span>)
                customPaymentPageCode = Resources.<span style="color: #6666ff;">Resource</span>.CUSTOM_PAYMENT_PAGE_CODE;
                
            <span style="color: #0000ff;">string</span> customPaymentTemplateURL = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"customPaymentTemplateURL"</span>))).Text;
            <span style="color: #0000ff;">if</span> (customPaymentTemplateURL == <span style="color: #ff0000;">""</span>)
                customPaymentTemplateURL = Resources.<span style="color: #6666ff;">Resource</span>.CUSTOM_PAYMENT_TEMPLATE_URL;
                
            <span style="color: #0000ff;">string</span> languageCode = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"updateWebWallet"</span>.FindControl(<span style="color: #ff0000;">"languageCode"</span>))).Text;
            <span style="color: #0000ff;">if</span> (languageCode == <span style="color: #ff0000;">""</span>)
                languageCode = Resources.<span style="color: #6666ff;">Resource</span>.LANGUAGE_CODE;
                        
            
            if (Resources.<span style="color: #6666ff;">Resource</span>.PROXY_HOST != <span style="color: #ff0000;">""</span> && Resources.<span style="color: #6666ff;">Resource</span>.PROXY_PORT != <span style="color: #ff0000;">""</span>)
                ws.Proxy = new System.Net.<span style="color: #6666ff;">WebProxy</span>(Resources.<span style="color: #6666ff;">Resource</span>.PROXY_HOST, <span style="color: #6666ff;">Convert</span>.ToInt32(Resources.<span style="color: #6666ff;">Resource</span>.PROXY_PORT));
            
            if (Resources.<span style="color: #6666ff;">Resource</span>.PROD == <span style="color: #ff0000;">"true"</span>)
                ws.Url = Resources.<span style="color: #6666ff;">Resource</span>.ENDPOINT_WEB;

            ws.Credentials = <span style="color: #0000ff;">new</span> System.Net.NetworkCredential(Resources.<span style="color: #6666ff;">Resource</span>.MERCHANT_ID, Resources.<span style="color: #6666ff;">Resource</span>.ACCESS_KEY);
            
            <span style="color: #6666ff;">result</span> resultat = ws.updateWebWallet(contractNumber, walletId, updatePersonalDetails, updatePaymentDetails, languageCode, customPaymentPageCode, 
                                                                Resources.<span style="color: #6666ff;">Resource</span>.SECURITY_MODE, returnURL, cancelURL, notificationURL, privateDataList, customPaymentTemplateURL, 
                                                                out token, out redirectURL);
                           
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
							<pre class="html4strict"><span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;form</span> <span style="color: #000066;">method</span>=<span style="color: #ff0000;">&quot;post&quot;</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;payline-form&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>
        
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentContractNumber&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Contract numbers<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentContractNumber&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;001&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

       		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(separator if severals numbers : &quot;;&quot;)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;walletId&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Wallet Id<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;walletId&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
      		
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>      
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;updatePersonalDetails&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Update personal details<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;updatePersonalDetails&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
      		
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>                  
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;updatePaymentDetails&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Update payment details<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;updatePaymentDetails&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
      		
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>        
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>

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
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>
    	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Transaction options<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;securityMode&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Security Mode<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;securityMode&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span> 
 
		
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;notificationURL&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Notification url<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;notificationURL&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(valid url like http:// or https://)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span> 
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;returnURL&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Return url<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;returnURL&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(valid url like http:// or https://)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>  
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;cancelURL&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Cancel url<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;cancelURL&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(valid url like http:// or https://)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span> 
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;customPaymentPageCode&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Custom payment page code<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;customPaymentPageCode&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;customPaymentTemplateURL&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Custom payment template URL<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;customPaymentTemplateURL&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;languageCode&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Language Code<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>   
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;languageCode&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;fre/fra&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>FR<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;ger/deu&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>DE<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;eng&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>UK<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;ita&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>IT<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;spa&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>SP<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:DropDownList&gt;</span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>   
&nbsp;
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;debug&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>MODE DEBUG<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:Checkbox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;debug&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>  
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>       
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:Button</span> <span style="color: #000066;">PostBackUrl</span>=<span style="color: #ff0000;">&quot;~/wallet/updateWebWallet.aspx&quot;</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">CssClass</span>=<span style="color: #ff0000;">&quot;submit&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;Start payment process&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/form&gt;</span></span>
&nbsp;</pre>						</div>						
						
					
<form id="Form1" runat="server" method="post" class="payline-form">
    <fieldset>
    	<div class="row">
            <label for="paymentContractNumber">Contract numbers</label>
            <asp:TextBox runat="server" Id="paymentContractNumber" Text="001" />
       		<span class="help">(separator if severals numbers : ";")</span>
        </div>
        <div class="row">
            <label for="walletId">Wallet Id</label>
            <asp:TextBox runat="server" Id="walletId" Text="" />
        </div>
        <div class="row">
            <label for="updatePersonalDetails">Update personal details</label>
            <asp:TextBox runat="server" Id="updatePersonalDetails" Text="1" />       		
        </div>
        <div class="row">
            <label for="updatePaymentDetails">Update payment details</label>
            <asp:TextBox runat="server" Id="updatePaymentDetails" Text="1" />       		
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
            <asp:TextBox runat="server" Id="privateDataValue1" Text="value 1" />
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
            <label for="privateDataValue3">Private data value 2</label>            
            <asp:TextBox runat="server" Id="privateDataValue3" Text="value 3" />
        </div>     
	</fieldset>
    <fieldset>
    	<h4>Transaction options</h4>
    	 <div class="row">
            <label for="securityMode">Security mode</label>
            <asp:TextBox runat="server" Id="securityMode" Text="" />
		</div> 
		<div class="row">
            <label for="notificationURL">Notification url</label>
            <asp:TextBox runat="server" Id="notificationURL" Text="" />
            <span class="help">(valid url like http:// or https://)</span>
		</div> 
        <div class="row">
            <label for="returnURL">Return url</label>
            <asp:TextBox runat="server" Id="returnURL" Text="" />
            <span class="help">(valid url like http:// or https://)</span>
		</div>  
        <div class="row">
            <label for="cancelURL">Cancel url</label>
            <asp:TextBox runat="server" Id="cancelURL" Text="" />
            <span class="help">(valid url like http:// or https://)</span>
		</div> 
        <div class="row">
            <label for="customPaymentPageCode">Custom payment page code</label>
            <asp:TextBox runat="server" Id="customPaymentPageCode" Text="" />
		</div>
		<div class="row">
            <label for="customPaymentTemplateURL">Custom payment template URL</label>
            <asp:TextBox runat="server" Id="customPaymentTemplateURL" Text="" />
		</div>
        <div class="row">
            <label for="languageCode">Language Code</label>
            <asp:DropDownList ID="languageCode" runat="server">
                <asp:ListItem value="fre/fra">FR</asp:ListItem>
                <asp:ListItem value="ger/deu">DE</asp:ListItem>
                <asp:ListItem value="eng">UK</asp:ListItem>
                <asp:ListItem value="ita">IT</asp:ListItem>
                <asp:ListItem value="spa">SP</asp:ListItem>
            </asp:DropDownList>                  
		</div>
    </fieldset>    
    <fieldset>
		<div class="row">

            <label for="debug">MODE DEBUG</label>
            <asp:CheckBox CssClass="debug" runat="server" id="debug" />

		</div>  
    </fieldset>       
    <asp:Button ID="Button1" PostBackUrl="~/wallet/updateWebWallet.aspx" CssClass="submit" runat="server" Text="Start payment process" />
</form>