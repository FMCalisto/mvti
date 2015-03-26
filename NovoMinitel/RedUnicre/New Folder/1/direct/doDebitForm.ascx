<%@ Control Language="C#" AutoEventWireup="true" CodeFile="doDebitForm.ascx.cs" Inherits="web_WebUserControl" %>

					
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
            <span style="color: #6666ff;">buyer</span> buyer =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> buyer</span>();
            <span style="color: #6666ff;">address</span> address =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> address</span>();
            <span style="color: #6666ff;">orderDetail</span> orderDetail1 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> orderDetail1</span>();
            <span style="color: #6666ff;">orderDetail</span> orderDetail2 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> orderDetail1</span>();
            <span style="color: #6666ff;">privateData</span> privateData1 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> privateData</span>();
            <span style="color: #6666ff;">privateData</span> privateData2 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> privateData</span>();
            <span style="color: #6666ff;">privateData</span> privateData3 =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> privateData</span>();
            <span style="color: #6666ff;">privateData</span>[] privateDataList =<span style="color: #0000ff;">null</span>;
            <span style="color: #6666ff;">authentication3DSecure</span> authentication3DSecure =<span style="color: #0000ff;">null</span>;
            <span style="color: #6666ff;">authorization</span> authorization =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> authorization</span>();
            <span style="color: #6666ff;">transaction</span> transaction =<span style="color: #0000ff;">new</span><span style="color: #6666ff;"> transaction</span>();
                    
            <span style="color: #808080;">// PAYMENT</span>
            payment.amount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"paymentAmount"</span>))).Text;
            payment.mode = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"paymentMode"</span>))).Text;
            payment.action = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"paymentFonction"</span>))).Text;
            payment.currency = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"paymentCurrency"</span>))).Text;
            payment.contractNumber = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"paymentContractNumber"</span>))).Text;
            payment.differedActionDate = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"paymentDifferedActionDate"</span>))).Text;
            
            <span style="color: #808080;">// ORDER</span>
            order.@ref = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"orderRef"</span>))).Text;
            order.origin = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"orderOrigin"</span>))).Text;
            order.country = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"orderCountry"</span>))).Text;
            order.taxes = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"orderTaxes"</span>))).Text;
            
            order.currency = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"orderCurrency"</span>))).Text;
            <span style="color: #0000ff;">if</span> (payment.currency == <span style="color: #ff0000;">""</span>)
                order.currency = Resources.<span style="color: #6666ff;">Resource</span>.ORDER_CURRENCY;
            
            order.amount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"orderAmount"</span>))).Text;
            order.date = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"orderDate"</span>))).Text;
            
            
            <span style="color: #808080;">// ORDER DETAILS</span>
            orderDetail1.@ref = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"orderDetailRef1"</span>))).Text;
            orderDetail1.price = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"orderDetailPrice1"</span>))).Text;
            orderDetail1.quantity = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"orderDetailQuantity1"</span>))).Text;
            orderDetail1.comment = ((<span style="color: #6666ff;">HtmlTextArea</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"orderDetailComment1"</span>))).Value;
            
            orderDetail2.@ref = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"orderDetailRef2"</span>))).Text;
            orderDetail2.price = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"orderDetailPrice2"</span>))).Text;
            orderDetail2.quantity = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"orderDetailQuantity2"</span>))).Text;
            orderDetail2.comment = ((<span style="color: #6666ff;">HtmlTextArea</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"orderDetailComment2"</span>))).Value;
                      
            order.details = <span style="color: #0000ff;"> new</span><span style="color: #6666ff;"> orderDetail</span>[2];
            order.details.SetValue(orderDetail1,0);
            order.details.SetValue(orderDetail2,1);
            
            <span style="color: #808080;">// ADDRESS (optional) </span>
            address.name = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"addressName"</span>))).Text;
            address.street1 = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"addressStreet1"</span>))).Text;
            address.street2 = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"addressStreet2"</span>))).Text;
            address.cityName = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"addressCity"</span>))).Text;
            address.zipCode = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"addressZipCode"</span>))).Text;
            address.country = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"addressCountry"</span>))).Text;
            address.phone = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"addressPhone"</span>))).Text;
                                                       
            <span style="color: #808080;">// BUYER (optional) </span>
            buyer.shippingAdress = address;
            buyer.walletId = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"buyerWalletId"</span>))).Text;
            buyer.lastName = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"buyerLastName"</span>))).Text;
            buyer.firstName = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"buyerFirstName"</span>))).Text;
            buyer.email = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"buyerEmail"</span>))).Text;
            buyer.accountCreateDate = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"buyerAccountCreateDate"</span>))).Text;
            buyer.accountAverageAmount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"buyerAverageAmount"</span>))).Text;
            buyer.accountOrderCount = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"buyerOrderCount"</span>))).Text;
                                                        
            <span style="color: #808080;">// PRIVATE DATA (optional) </span>
            privateData1.key = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"privateDataKey1"</span>))).Text;
            privateData1.value = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"privateDataValue1"</span>))).Text;
            privateData2.key = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"privateDataKey2"</span>))).Text;
            privateData2.value = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"privateDataValue2"</span>))).Text;
            privateData3.key = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"privateDataKey3"</span>))).Text;
            privateData3.value = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"privateDataValue3"</span>))).Text;
                                                                           
            privateDataList.SetValue(privateData1,0);
            privateDataList.SetValue(privateData2,1);
            privateDataList.SetValue(privateData3,2);
            
            <span style="color: #808080;">// CARD INFO</span>
            card.number = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"cardNumber"</span>))).Text;
            card.type = ((<span style="color: #6666ff;">DropDownList</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"cardType"</span>))).Text;
            card.expirationDate = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"cardExpirationDate"</span>))).Text;
            card.cvx = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"cardCrypto"</span>))).Text;
            card.ownerBirthdayDate = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"cardOwnerBirthdayDate"</span>))).Text;
            card.password = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"cardPassword"</span>))).Text;
            
            <span style="color: #808080;">// AUTHENTICATION 3D SECURE (optional) </span>
            authentication3DSecure.md = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"md"</span>))).Text;
            authentication3DSecure.pares = ((<span style="color: #6666ff;">TextBox</span>)(Page.PreviousPage.FindControl(<span style="color: #ff0000;">"doDebit"</span>.FindControl(<span style="color: #ff0000;">"pares"</span>))).Text;
            
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
            
            <span style="color: #6666ff;">result</span> resultat = ws.doDebit(payment, card, order, buyer, privateDataList, authentication3DSecure, <span style="color: #0000ff;">out</span> transaction, <span style="color: #0000ff;">out</span> authorization);

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

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;cardType&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
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

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentMode&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;CPT&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>CPT<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                 <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:DropDownList&gt;</span></span> 
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;paymentFonction&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Payment fonction<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:DropDownList <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;paymentFonction&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

                <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:ListItem</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">&quot;204&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Debit<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/asp:ListItem&gt;</span></span>
                
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

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderTaxes&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;0&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
         <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderCurrency&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Order currency<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderCurrency&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;978&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;orderAmount&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Order amount<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;orderAmount&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;33300&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

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

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;buyerLastName&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Buyer Last name<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;buyerLastName&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;buyerFirstName&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Buyer First name<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;buyerFirstName&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;buyerWalletId&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Buyer wallet ID<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;buyerWalletId&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

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
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Information about Authentication 3D Secure<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>     
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;md&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>MD<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;md&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;pares&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Pares<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;pares&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;1&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
       
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;fieldset&gt;</span></span>
   
     <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;h4&gt;</span></span>Authorization<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/h4&gt;</span></span>     
       
         
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;number&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Number<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;number&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;div</span> <span style="color: #000066;">class</span>=<span style="color: #ff0000;">&quot;row&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;label</span> <span style="color: #000066;">for</span>=<span style="color: #ff0000;">&quot;date&quot;</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Date<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/label&gt;</span></span>

            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:TextBox</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">id</span>=<span style="color: #ff0000;">&quot;date&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/div&gt;</span></span>
       
       <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/fieldset&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;asp:Button</span> <span style="color: #000066;">PostBackUrl</span>=<span style="color: #ff0000;">&quot;~/direct/doDebit.aspx&quot;</span> <span style="color: #000066;">runat</span>=<span style="color: #ff0000;">&quot;server&quot;</span> <span style="color: #000066;">CssClass</span>=<span style="color: #ff0000;">&quot;submit&quot;</span> <span style="color: #000066;">Text</span>=<span style="color: #ff0000;">&quot;Start payment process&quot;</span> /<span style="color: #000000; font-weight: bold;">&gt;</span></span>

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
            </asp:DropDownList>
        </div>
        <div class="row">
            <label for="paymentFonction">Payment fonction</label>
            <asp:DropDownList ID="paymentFonction" runat="server">
                <asp:ListItem value="204">Debit</asp:ListItem>
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
        <h4>Informations about order</h4>
        <div class="row">
            <label for="orderRef">Order reference</label>
            <asp:TextBox runat="server" Id="orderRef" Text="1234" />
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
            <asp:TextBox runat="server" Id="orderTaxes" Text="0" />
        </div>
         <div class="row">
            <label for="orderCurrency">Order currency</label>
            <asp:TextBox runat="server" Id="orderCurrency" Text="978" />
        </div>
        <div class="row">
            <label for="orderAmount">Order amount</label>
            <asp:TextBox runat="server" Id="orderAmount" Text="33300" />
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
            <textarea name="orderDetailComment1" id="orderDetailComment1" runat="server">Comment for item 1</textarea>
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
            <textarea name="orderDetailComment2" id="orderDetailComment2" runat="server">Comment for item 2</textarea>
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
        <h4>Authorization</h4>     
        <div class="row">
            <label for="number">Number</label>
            <asp:TextBox runat="server" Id="number" Text="" />
        </div>
        <div class="row">
            <label for="date">Date</label>
            <asp:TextBox runat="server" Id="date" Text="" />
            <span class="help">(required format : "dd/mm/yyyy HH24:MM")</span>
        </div>
    </fieldset>
    <asp:Button ID="Button1" PostBackUrl="~/direct/doDebit.aspx" CssClass="submit" runat="server" Text="Start payment process" />
</form>