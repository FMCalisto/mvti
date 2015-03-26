<%@ Control Language="C#" AutoEventWireup="true" CodeFile="fullWebPaymentForm.ascx.cs" Inherits="web_WebUserControl" %>

<div class="code" id="aspx">
							<pre class="aspx"><span style="color: #0000ff;">using</span> System;
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
        
            <span style="color: #808080;">// PAYMENT</span>
            payment.amount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"paymentAmount"</span>))).Text;
            payment.mode = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"paymentMode"</span>))).Text;
            payment.action = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"paymentFonction"</span>))).Text;
            payment.currency = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"paymentCurrency"</span>))).Text;
            <span style="color: #0000ff;">if</span> (payment.currency == <span style="color: #ff0000;">""</span>)
                payment.currency = Resources.<span style="color: #6666ff;">Resource</span>.PAYMENT_CURRENCY;
                        
            <span style="color: #0000ff;">string</span> contractNumber = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"paymentContractNumber"</span>))).Text;
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

            payment.differedActionDate = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"paymentDifferedActionDate"</span>))).Text;
            
            <span style="color: #808080;">// ORDER</span>
            order.@ref = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"orderRef"</span>))).Text;
            order.origin = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"orderOrigin"</span>))).Text;
            order.country = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"orderCountry"</span>))).Text;
            order.taxes = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"orderTaxes"</span>))).Text;
            
            order.currency = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"orderCurrency"</span>))).Text;
            <span style="color: #0000ff;">if</span> (payment.currency == <span style="color: #ff0000;">""</span>)
                order.currency = Resources.<span style="color: #6666ff;">Resource</span>.ORDER_CURRENCY;
            
            order.amount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"orderAmount"</span>))).Text;
            order.date = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"orderDate"</span>))).Text;
            
            
            <span style="color: #808080;">// ORDER DETAILS</span>
            orderDetail1.@ref = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"orderDetailRef1"</span>))).Text;
            orderDetail1.price = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"orderDetailPrice1"</span>))).Text;
            orderDetail1.quantity = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"orderDetailQuantity1"</span>))).Text;
            orderDetail1.comment = ((<span style="color: #6666ff;">HtmlTextArea</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"orderDetailComment1"</span>))).Value;
            
            orderDetail2.@ref = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"orderDetailRef2"</span>))).Text;
            orderDetail2.price = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"orderDetailPrice2"</span>))).Text;
            orderDetail2.quantity = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"orderDetailQuantity2"</span>))).Text;
            orderDetail2.comment = ((<span style="color: #6666ff;">HtmlTextArea</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"orderDetailComment2"</span>))).Value;
                      
            order.details = <span style="color: #0000ff;"> new</span><span style="color: #6666ff;"> orderDetail</span>[2];
            order.details.SetValue(orderDetail1,0);
            order.details.SetValue(orderDetail2,1);
            
            <span style="color: #808080;">// ADDRESS (optional) </span>
            address.name = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"addressName"</span>))).Text;
            address.street1 = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"addressStreet1"</span>))).Text;
            address.street2 = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"addressStreet2"</span>))).Text;
            address.cityName = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"addressCity"</span>))).Text;
            address.zipCode = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"addressZipCode"</span>))).Text;
            address.country = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"addressCountry"</span>))).Text;
            address.phone = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"addressPhone"</span>))).Text;
                                                       
            <span style="color: #808080;">// BUYER (optional) </span>
            buyer.shippingAdress = address;
            buyer.walletId = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"buyerWalletId"</span>))).Text;
            buyer.lastName = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"buyerLastName"</span>))).Text;
            buyer.firstName = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"buyerFirstName"</span>))).Text;
            buyer.email = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"buyerEmail"</span>))).Text;
            buyer.accountCreateDate = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"buyerAccountCreateDate"</span>))).Text;
            buyer.accountAverageAmount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"buyerAverageAmount"</span>))).Text;
            buyer.accountOrderCount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"buyerOrderCount"</span>))).Text;
                                                        
            <span style="color: #808080;">// PRIVATE DATA (optional) </span>
            privateData1.key = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"privateDataKey1"</span>))).Text;
            privateData1.value = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"privateDataValue1"</span>))).Text;
            privateData2.key = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"privateDataKey2"</span>))).Text;
            privateData2.value = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"privateDataValue2"</span>))).Text;
            privateData3.key = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"privateDataKey3"</span>))).Text;
            privateData3.value = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"privateDataValue3"</span>))).Text;
                                                                           
            privateDataList.SetValue(privateData1,0);
            privateDataList.SetValue(privateData2,1);
            privateDataList.SetValue(privateData3,2);
            
            <span style="color: #808080;">// TRANSACTION OPTIONS </span>
            <span style="color: #0000ff;">string</span> notificationURL = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"notificationURL"</span>))).Text;
            <span style="color: #0000ff;">if</span> (notificationURL == <span style="color: #ff0000;">""</span>)
                notificationURL = Resources.<span style="color: #6666ff;">Resource</span>.NOTIFICATION_URL;
                        
            <span style="color: #0000ff;">string</span> returnURL = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"returnURL"</span>))).Text;
            <span style="color: #0000ff;">if</span> (returnURL == <span style="color: #ff0000;">""</span>)
                returnURL = Resources.<span style="color: #6666ff;">Resource</span>.RETURN_URL;
            
            <span style="color: #0000ff;">string</span> cancelURL = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"cancelURL"</span>))).Text;
            <span style="color: #0000ff;">if</span> (cancelURL == <span style="color: #ff0000;">""</span>)
                cancelURL = Resources.<span style="color: #6666ff;">Resource</span>.CANCEL_URL;
            
            <span style="color: #0000ff;">string</span> customPaymentPageCode = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"customPaymentPageCode"</span>))).Text;
            <span style="color: #0000ff;">if</span> (customPaymentPageCode == <span style="color: #ff0000;">""</span>)
                customPaymentPageCode = Resources.<span style="color: #6666ff;">Resource</span>.CUSTOM_PAYMENT_PAGE_CODE;
                
            <span style="color: #0000ff;">string</span> customPaymentTemplateURL = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"customPaymentTemplateURL"</span>))).Text;
            <span style="color: #0000ff;">if</span> (customPaymentTemplateURL == <span style="color: #ff0000;">""</span>)
                customPaymentTemplateURL = Resources.<span style="color: #6666ff;">Resource</span>.CUSTOM_PAYMENT_TEMPLATE_URL;
                
            <span style="color: #0000ff;">string</span> languageCode = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"languageCode"</span>))).Text;
            <span style="color: #0000ff;">if</span> (languageCode == <span style="color: #ff0000;">""</span>)
                languageCode = Resources.<span style="color: #6666ff;">Resource</span>.LANGUAGE_CODE;
            
            <span style="color: #808080;">// RECCURENT </span>
            <span style="color: #0000ff;">bool</span> recurringCheck = ((<span style="color: #6666ff;">CheckBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"recurring"</span>))).Text;
            <span style="color: #0000ff;">if</span> (recurringCheck)
            {
                recurring.firstAmount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"recurringFirstAmount"</span>))).Text;
            recurring.billingLeft = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"recurringBillingLeft"</span>))).Text;
            recurring.amount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"recurringAmount"</span>))).Text;
            recurring.billingCycle = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"recurringBillingCycle"</span>))).Text;
            recurring.startDate = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"recurringStartDate"</span>))).Text;
            recurring.billingDay = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"fullWebPayment"</span>.FindControl(<span style="color: #ff0000;">"recurringBillingDay"</span>))).Text;
            
            }
            <span style="color: #0000ff;">else</span>
                <span style="color: #0000ff;">null</span>;
            
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
            
            <span style="color: #6666ff;">result</span> resultat = ws.doWebPayment((payment, returnURL, cancelURL, order, notificationURL, selectedCrontractList, privateDataList, languageCode,
                                                                customPaymentPageCode, buyer, Resources.<span style="color: #6666ff;">Resource</span>.SECURITY_MODE,, recurring, customPaymentTemplateURL, out token, out redirectURL);
            
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
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Do Web Payment, full example<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentAmount&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment amount<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentAmount&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;33300&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentMode&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment mode<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentMode&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;CPT&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>CPT<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;DIF&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>DIF<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;NX&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Nx<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;REC&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>REC<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:DropDownList&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span> 
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentFonction&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment fonction<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentFonction&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;201&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Capture<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:DropDownList&gt;</span></span> 
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentCurrency&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payement currency<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentCurrency&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;978&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentContractNumber&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Contract numbers<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentContractNumber&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;001&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

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

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderOrigin&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Order origin<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderOrigin&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;1&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderCountry&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Order country<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderCountry&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;FR&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderTaxes&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Order taxes<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderTaxes&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;33300&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
         <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderCurrency&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Order currency<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderCurrency&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;978&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderAmount&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Order amount<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderAmount&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;33300&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>        
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderDate&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Order date<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderDate&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;12/05/2007 12:36&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required format : &quot;dd/mm/yyyy HH24:MM&quot;)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>         
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Order details<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderDetailRef1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Item reference 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderDetailRef1&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;reference1&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderDetailPrice1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Item price 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderDetailPrice1&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;1&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderDetailQuantity1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Item quantity 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderDetailQuantity1&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;1&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderDetailComment1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Item comment 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;textarea</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderDetailComment1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Comment for item 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/textarea&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;hr</span>/<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderDetailRef2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Item reference 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderDetailRef2&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;reference2&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderDetailPrice2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Item price 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderDetailPrice2&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;1&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderDetailQuantity2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Item quantity 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderDetailQuantity2&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;1&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderDetailComment2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Item comment 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;textarea</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderDetailComment2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Comment for item 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/textarea&gt;</span></span>
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
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Informations about buyer<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;buyerWalletId&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Buyer wallet ID<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;buyerWalletId&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>        
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;buyerLastName&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Buyer Last name<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;buyerLastName&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required unique wallet ID if is set)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;buyerFirstName&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Buyer First name<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;buyerFirstName&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required unique wallet ID if is set)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
         <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;buyerEmail&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Buyer email<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;buyerEmail&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;buyerAccountCreateDate&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Buyer account create date<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;buyerAccountCreateDate&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;22/05/07&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required format : &quot;dd/mm/yy&quot;)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;buyerAverageAmount&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Buyer average amount<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;buyerAverageAmount&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;1&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;buyerOrderCount&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Buyer order count<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;buyerOrderCount&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;1&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Invoice address<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>     
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;addressName&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Name<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;addressName&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;addressStreet1&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Street 1<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;addressStreet1&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;1&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;addressStreet2&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Street 2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;addressStreet2&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;addressCity&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>City<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;addressCity&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;addressZipCode&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Zip code<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;addressZipCode&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;addressCountry&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Country<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;addressCountry&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;addressPhone&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Phone<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;addressPhone&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>
    	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Transaction options<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>
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

    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>
    	
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Recurring informations<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>      
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;recurring&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Make a recurrent payment<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:CheckBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;recurring&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(Payment mode must be "Nx" or "REC")<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;recurringFirstAmount&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>First amount<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;recurringFirstAmount&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;recurringBillingLeft&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Billing left<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;recurringBillingLeft&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required) <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;input</span> <span style="color: #000066;">type</span>=<span style="color: #ff0000;">&quot;button&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;Calculate bill book&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;billbook&quot;</span> <span style="color: #000066;">CssClass</span>=<span style="color: #ff0000;">&quot;submit&quot;</span>/<span style="color: #000000; font-weight: bold;">&gt;</span></span><span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;recurringAmount&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Recurring Amount<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;recurringAmount&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;recurringBillingCycle&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Billing cycle<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;recurringBillingCycle&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;10&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Quotidien<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;20&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Hebdomadaire<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;30&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Bimensuel<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;40&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Mensuel<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;50&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Bimestriel<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;60&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Trimestriel<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;70&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Semi-annuel<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;80&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Annuel<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;90&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Bisannuel<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:DropDownList&gt;</span></span> 
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;recurringStartDate&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Start date<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;recurringStartDate&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;span</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;help&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>(required format : &quot;dd/mm/yyyy&quot;)<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/span&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;recurringBillingDay&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Billing day<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;recurringBillingDay&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>  
&nbsp;
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;debug&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>MODE DEBUG<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:Checkbox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;debug&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>  
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>       
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:Button</span> <span style="color: #000066;">PostBackUrl</span>=<span style="color: #ff0000;">&quot;~/web/fullWebPayment.aspx&quot;</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">CssClass</span>=<span style="color: #ff0000;">&quot;submit&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;Start payment process&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/form&gt;</span></span>
&nbsp;</pre>						</div>						
						
					
<form id="Form1" runat="server" method="post" class="payline-form">
    	<fieldset>
        <h4>Do Web Payment, full example</h4>
        <div class="row">
            <label for="paymentAmount">Payment amount</label>
            <asp:TextBox runat="server" Id="paymentAmount" Text="33300" />
            <span class="help">(required)</span>
        </div>
        <div class="row">
            <label for="paymentMode">Payment mode</label>
            <asp:DropDownList ID="paymentMode" runat="server">
                <asp:ListItem value="CPT">CPT</asp:ListItem>
                <asp:ListItem value="DIF">DIF</asp:ListItem>
                <asp:ListItem value="NX">Nx</asp:ListItem>
                <asp:ListItem value="REC">REC</asp:ListItem>
            </asp:DropDownList>            
            <span class="help">(required)</span> 
        </div>
        <div class="row">
            <label for="paymentFonction">Payment fonction</label>
            <asp:DropDownList ID="paymentFonction" runat="server">
                <asp:ListItem value="100">Autor</asp:ListItem>
                <asp:ListItem value="101">Autor+Capture</asp:ListItem>                
            </asp:DropDownList>              
            <span class="help">(required)</span>
        </div>
        <div class="row">
            <label for="paymentCurrency">Payement currency</label>
            <asp:TextBox runat="server" Id="paymentCurrency" Text="978" />
            <span class="help">(required)</span>
        </div>
       <div class="row">
            <label for="paymentContractNumber">Contract number</label>
            <asp:TextBox runat="server" Id="paymentContractNumber" Text="001" />
        </div>
    	<div class="row">
            <label for="paymentContractNumberList">Contract numbers list</label>
            <asp:TextBox runat="server" Id="paymentContractNumberList" Text="001" />
       		<span class="help">(separator if severals numbers : ";")</span>
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
            <span class="help">(required)</span>
        </div>
        <div class="row">
            <label for="orderOrigin">Order origin</label>
            <asp:TextBox runat="server" Id="orderOrigin" Text="1" />
        </div>
        <div class="row">
            <label for="orderCountry">Order country</label>
            <asp:TextBox runat="server" Id="orderCountry" Text="FR" />
        </div>
        <div class="row">
            <label for="orderTaxes">Order taxes</label>
            <asp:TextBox runat="server" Id="orderTaxes" Text="33300" />
        </div>
         <div class="row">
            <label for="orderCurrency">Order currency</label>            
            <asp:TextBox runat="server" Id="orderCurrency" Text="978" />
            <span class="help">(required)</span>
        </div>
        <div class="row">
            <label for="orderAmount">Order amount</label>
            <asp:TextBox runat="server" Id="orderAmount" Text="33300" />
            <span class="help">(required)</span>
        </div>        
        <div class="row">
            <label for="orderDate">Order date</label>
            <asp:TextBox runat="server" Id="orderDate" Text="12/05/2007 12:36" />
            <span class="help">(required format : "dd/mm/yyyy HH24:MM")</span>
        </div>         
	</fieldset>
	<fieldset>
        <h4>Order details</h4>
        <div class="row">
            <label for="orderDetailRef1">Item reference 1</label>
            <asp:TextBox runat="server" Id="orderDetailRef1" Text="reference1" />
        </div>
        <div class="row">
            <label for="orderDetailPrice1">Item price 1</label>
            <asp:TextBox runat="server" Id="orderDetailPrice1" Text="1" />
        </div>
        <div class="row">
            <label for="orderDetailQuantity1">Item quantity 1</label>
            <asp:TextBox runat="server" Id="orderDetailQuantity1" Text="1" />
        </div>
        <div class="row">
            <label for="orderDetailComment1">Item comment 1</label>
            <textarea rows="2" cols="20" id="orderDetailComment1" runat="server">Comment for item 1</textarea>
        </div>
        <hr/>
        <div class="row">
            <label for="orderDetailRef2">Item reference 2</label>
            <asp:TextBox runat="server" Id="orderDetailRef2" Text="reference2" />
        </div>
        <div class="row">
            <label for="orderDetailPrice2">Item price 2</label>
            <asp:TextBox runat="server" Id="orderDetailPrice2" Text="1" />
        </div>
        <div class="row">
            <label for="orderDetailQuantity2">Item quantity 2</label>
            <asp:TextBox runat="server" Id="orderDetailQuantity2" Text="1" />
        </div>
        <div class="row">
            <label for="orderDetailComment2">Item comment 2</label>
            <textarea rows="2" cols="20" name="orderDetailComment2" id="orderDetailComment2" runat="server">Comment for item 2</textarea>
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
        <h4>Informations about buyer</h4>
        <div class="row">
            <label for="buyerWalletId">Buyer wallet ID</label>
            <asp:TextBox runat="server" Id="buyerWalletId" Text="" />
        </div>        
        <div class="row">
            <label for="buyerLastName">Buyer Last name</label>
            <asp:TextBox runat="server" Id="buyerLastName" Text="" />
            <span class="help">(required unique wallet ID if is set)</span>
        </div>
		<div class="row">
            <label for="buyerFirstName">Buyer First name</label>
            <asp:TextBox runat="server" Id="buyerFirstName" Text="" />
            <span class="help">(required unique wallet ID if is set)</span>
        </div>
         <div class="row">
            <label for="buyerEmail">Buyer email</label>
            <asp:TextBox runat="server" Id="buyerEmail" Text="" />
        </div>
        <div class="row">
            <label for="buyerAccountCreateDate">Buyer account create date</label>
            <asp:TextBox runat="server" Id="buyerAccountCreateDate" Text="" />
            <span class="help">(required format : "dd/mm/yy")</span>
        </div>
        <div class="row">
            <label for="buyerAverageAmount">Buyer average amount</label>
            <asp:TextBox runat="server" Id="buyerAverageAmount" Text="" />
        </div>
        <div class="row">
            <label for="buyerOrderCount">Buyer order count</label>
            <asp:TextBox runat="server" Id="buyerOrderCount" Text="" />
        </div>
	</fieldset>
	<fieldset>
        <h4>Invoice address</h4>     
        <div class="row">
            <label for="addressName">Name</label>
            <asp:TextBox runat="server" Id="addressName" Text="" />
        </div>
        <div class="row">
            <label for="addressStreet1">Street 1</label>
            <asp:TextBox runat="server" Id="addressStreet1" Text="" />
        </div>
        <div class="row">
            <label for="addressStreet2">Street 2</label>
            <asp:TextBox runat="server" Id="addressStreet2" Text="" />
        </div>
        <div class="row">
            <label for="addressCity">City</label>
            <asp:TextBox runat="server" Id="addressCity" Text="" />
        </div>
        <div class="row">
            <label for="addressZipCode">Zip code</label>
            <asp:TextBox runat="server" Id="addressZipCode" Text="" />
        </div>
        <div class="row">
            <label for="addressCountry">Country</label>
            <asp:TextBox runat="server" Id="addressCountry" Text="" />
        </div>
        <div class="row">
            <label for="addressPhone">Phone</label>
            <asp:TextBox runat="server" Id="addressPhone" Text="" />
        </div>
    </fieldset>
    <fieldset>
    	<h4>Transaction options</h4>
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
        <h4>Recurring informations</h4>
		<div class="row">
            <label for="recurring">Make a recurrent payment</label>
            <asp:CheckBox ID="recurring" CssClass="recurring" runat="server" />            
            <span class="help">(Payment mode must be "Nx" or "REC")</span>
		</div>        
        <div class="row">
            <label for="recurringFirstAmount">First amount</label>
            <asp:TextBox runat="server" Id="recurringFirstAmount" Text="" />
            <span class="help">(required)</span>
        </div>
        <div class="row">
            <label for="recurringBillingLeft">Billing left</label>
            <asp:TextBox runat="server" Id="recurringBillingLeft" Text="" />
            <span class="help">(required) <input type="button" value="Calculate bill book" id="billbook" class="submit"/></span>
        </div>
		<div class="row">
            <label for="recurringAmount">Recurring Amount</label>
            <asp:TextBox runat="server" Id="recurringAmount" Text="" />
            <span class="help">(required)</span>
        </div>
		<div class="row">
            <label for="recurringBillingCycle">Billing cycle</label>
            <asp:DropDownList ID="recurringBillingCycle" runat="server">
                <asp:ListItem value="10">Quotidien</asp:ListItem>
                <asp:ListItem value="20">Hebdomadaire</asp:ListItem>
                <asp:ListItem value="30">Bimensuel</asp:ListItem>
                <asp:ListItem value="40">Mensuel</asp:ListItem>
                <asp:ListItem value="50">Bimestriel</asp:ListItem>
                <asp:ListItem value="60">Trimestriel</asp:ListItem>
                <asp:ListItem value="70">Semi-annuel</asp:ListItem>
                <asp:ListItem value="80">Annuel</asp:ListItem>
                <asp:ListItem value="90">Bisannuel</asp:ListItem>
            </asp:DropDownList>              
            <span class="help">(required)</span>
        </div>
		<div class="row">
            <label for="recurringStartDate">Start date</label>
            <asp:TextBox runat="server" Id="recurringStartDate" Text="" />
            <span class="help">(required format : "dd/mm/yyyy")</span>
        </div>
		<div class="row">
            <label for="recurringBillingDay">Billing day</label>
            <asp:TextBox runat="server" Id="recurringBillingDay" Text="" />
            <span class="help">(required if billing cycle is not Quotidien, Hebdomadaire, Bimensuel. Format : "dd")</span>
        </div>
    </fieldset>  
    <fieldset>
		<div class="row">

            <label for="debug">MODE DEBUG</label>
            <asp:CheckBox CssClass="debug" runat="server" id="debug" />

		</div>  
    </fieldset>       
    <asp:Button ID="Button1" PostBackUrl="~/web/fullWebPayment.aspx" CssClass="submit" runat="server" Text="Start payment process" />
</form>