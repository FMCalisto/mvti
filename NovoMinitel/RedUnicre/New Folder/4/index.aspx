<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="index.aspx.cs" Inherits="_Default" %>

<%@ Register TagPrefix="uc1" TagName="doWebPayment" Src="web/doWebPaymentForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="fullWebPayment" Src="web/fullWebPaymentForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="getWebPaymentDetail" Src="web/getWebPaymentDetailForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="doAuthorization" Src="direct/doAuthorizationForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="doCapture" Src="direct/doCaptureForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="doRefund" Src="direct/doRefundForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="doCredit" Src="direct/doCreditForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="doDebit" Src="direct/doDebitForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="verifyEnrollment" Src="direct/verifyEnrollmentForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="doMassCapture" Src="mass/doMassCaptureForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="doMassRefund" Src="mass/doMassRefundForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="getMassTraitmentDetails" Src="mass/getMassTraitmentDetailsForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="createWallet" Src="wallet/createWalletForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="updateWallet" Src="wallet/updateWalletForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="getWallet" Src="wallet/getWalletForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="disableWallet" Src="wallet/disableWalletForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="enableWallet" Src="wallet/enableWalletForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="doImmediateWalletPayment" Src="wallet/doImmediateWalletPaymentForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="doScheduledWalletPayment" Src="wallet/doScheduledWalletPaymentForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="doRecurrentWalletPayment" Src="wallet/doRecurrentWalletPaymentForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="getPaymentRecord" Src="wallet/getPaymentRecordForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="disablePaymentRecord" Src="wallet/disablePaymentRecordForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="createWebWallet" Src="wallet/createWebWalletForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="updateWebWallet" Src="wallet/updateWebWalletForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="getWebWallet" Src="wallet/getWebWalletForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="getTransactionDetails" Src="extended/getTransactionDetailsForm.ascx" %>
<%@ Register TagPrefix="uc1" TagName="transactionsSearch" Src="extended/transactionsSearchForm.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Payline demo</title>
	<link rel = "stylesheet" type = "text/css" media = "screen" href = "css/reset.css" />
	<link rel = "stylesheet" type = "text/css" media = "screen" href = "css/style.css" />
	<link rel = "stylesheet" type = "text/css" media = "screen" href = "css/header.css" />
    <link rel = "stylesheet" type = "text/css" media = "screen" href = "css/forms.css" />
    <script type = "text/javascript" src = "scripts/mootools-1.11.js"></script>
    <script type = "text/javascript" src = "scripts/demos.js"></script>
</head>
<body>
    <div id="header">
		<div id="header-inside">
			<div id="logo">
				<h1><a href="http://www.payline.com"><span>payline</span></a></h1>
				<p>by Monext</p>
			</div>
			<ul id="menu">
			    <% if ((Request.Params["m"] == "1") || (Request.Params["m"]) == null) { %>	
				    <li><a href="index.aspx?m=1" class="on">Install</a></li>
				<% } else { %>
				    <li><a href="index.aspx?m=1">Install</a></li>
				<% }%>    
				
				<% if (Request.Params["m"] == "2") { %>	
				    <li><a href="index.aspx?m=2" class="on">Web</a></li>
				<% } else { %>
				    <li><a href="index.aspx?m=2">Web</a></li>
				<% }%>   
				
				<% if (Request.Params["m"] == "3") { %>	
				    <li><a href="index.aspx?m=3" class="on">Direct</a></li>
				<% } else { %>
				    <li><a href="index.aspx?m=3">Direct</a></li>
				<% }%>   
				
				<% if (Request.Params["m"] == "4") { %>	
				    <li><a href="index.aspx?m=4" class="on">Mass</a></li>
				<% } else { %>
				    <li><a href="index.aspx?m=4">Mass</a></li>
				<% }%>   
				
				<% if (Request.Params["m"] == "5") { %>	
				    <li><a href="index.aspx?m=5" class="on">Wallet</a></li>
				<% } else { %>
				    <li><a href="index.aspx?m=5">Wallet</a></li>
				<% }%>  
				 
				<% if (Request.Params["m"] == "6") { %>	
				    <li><a href="index.aspx?m=6" class="on">Extended</a></li>
				<% } else { %>
				    <li><a href="index.aspx?m=6">Extended</a></li>
				<% }%>   
			</ul>
	  </div>
	</div>

	<div id="wrapper">
		<div id="container">
			<div id="content">
			    <% if ((Request.Params["m"] == "1") || (Request.Params["m"]) == null ) { %>				        
				    <h2>Installation and configuration</h2>
                    <ol>
                	    <li>
                		    <strong>Compatibility</strong><br/>
                            <p>
                                Examples have been tested with following configuration : IIS 5.1, .NET 3.5 SP1
                                with system Windows XP Professionnal<br/>
                            </p>
                            <br/>
                	    </li>
               		    <li>
                    	    <strong>Installation and usage</strong><br/>
                            <p>
                                Unzip the archive "payline_Net_1.0.6.zip".<br/>
                                Open the folder install, click the executable (.msi or .exe) and follow the instructions.<br/>
                                Open the folder APP_GlobalResources on your server and modify 'Resource.resx' file and change following vars :<br/>
                                MERCHANT_ID, ACCESS_KEY
                            </p>
                            <br/>
                		    <p>
                    		    If you're using a proxy to access the web, change following vars in the same file :<br/>
                    		    PROXY_HOST, PROXY_PORT, PROXY_USER, PROXY_PASSWORD
                            </p>
                            <br/>
                            <p>
                        	    Do the same with this file if you want change default currencies, URL's, payment mode, or your contract number.
                            </p>
                            <br/>
                            <p>
                                You can see ascx, aspx.cs and css code by clicking on link available on the top,<br/>
                                you can use this source code for your web payment page. For documentation on all of the<br/>
                                parameters availables, refer to the payline's documentation
                             </p>
                    	    <br/>
                        </li>
                        <li>
                            <strong>Production</strong><br/>
                            <p>
                                When all test are approved, open folder App_GlobalResources and modify 'Resource.resx' file<br/>
                                and change the "PROD" value to true.
                            </p>
                        </li>
                    </ol>
			    </div>
			    <br/><br/>
			    <div id="content2" class="fr">
				    <h2>Installation et configuration</h2>
                    <ol>
                	    <li>
                		    <strong>Compatibilit&eacute;</strong><br/>
                            <p>
                        	    Ces exemples ont &eacute;t&eacute;s test&eacute;s avec cette configuration : IIS 5.1, .NET 3.5 SP1
                                sur le système Windows XP Professionnel<br/>
                            </p>
                            <br/>
                	    </li>
               		    <li>
                    	    <strong>Installation et utilisation</strong><br/>
                            <p>
                                Dézippez l'archive "payline_Net_1.0.6.zip".<br/>
                                Ouvrez le dossier payline/install, cliquez sur l'executable (soit le .msi soit le .exe) et suivez les instructions.<br/>
                                Modifiez le fichier 'Resource.resx' situ&eacute; dans le dossier 'App_GlobalResources' créé sur votre serveur pour indiquer vos identifiants :<br/>
                                MERCHANT_ID, ACCESS_KEY
                            </p>
                            <br/>
                		    <p>
                    		    Si vous utilisez un proxy pour acc&eacute;der au web, indiquez &eacute;galement les variables suivantes :<br/>
                    		    PROXY_HOST, PROXY_PORT, PROXY_USER, PROXY_PASSWORD
                            </p>
                            <br/>
                            <p>
                        	    D'autres param&egrave;tres peuvent &eacute;galement &ecirc;tre indiqu&eacute;es dans ce fichier.<br/>
                        	    Vous y trouverez comment changer la devise par d&eacute;faut, le mode de paiement, ou votre num&eacute;ro de contrat par exemple.
                            </p>
                            <br/>
                            <p>
                        	    Naviguez ensuite dans nos pages d'exemples pour vous en inspirer et cr&eacute;er vos propres pages de paiement.<br/>
                        	    Vous pouvez utiliser les boutons 'ascx', 'aspx.cs', ou bien 'css' pour consulter le code correspondant.<br/>
                        	    Pour une vision globale sur les possibilit&eacute;s offertes par l'offre Payline, nous vous invitons à consulter notre documentation.
                             </p>
                    	    <br/>
                        </li>
                        <li>
                            <strong>Production</strong><br/>
                            <p>
                        	    Lorsque vous avez v&eacute;rifi&eacute; le bon fonctionnement de vos pages, modifiez le fichier 'Resource.resx' et changez la variable<br/>
                        	    'PROD' à 'true' au lieu de 'false'.
                            </p>
                        </li>
                    </ol>
				<% } else {
              
                    if (Request.Params["m"] == "2") {%> 
				
				        <h2>Web Payment</h2>
				        <h3>
				            <% if (Request.Params["v"] == "1") { %>				        
					            doWebPayment -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/index.aspx?m=2&v=1">doWebPayment</asp:HyperLink> -
				            <% } %>
				            <% if (Request.Params["v"] == "2") { %>				        
					            fullWebPayment -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/index.aspx?m=2&v=2">fullWebPayment</asp:HyperLink> -
				            <% } %>
				            <% if (Request.Params["v"] == "3") { %>				        
					            getWebPaymentDetail
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/index.aspx?m=2&v=3">getWebPaymentDetail</asp:HyperLink>
				            <% } %>
				        </h3>				
                        <p id="info">Demo that shows the usage of Payline classes for web payments.</p>
                
                    <% } else if (Request.Params["m"] == "3") {%>    
				        
				        <h2>Direct Payment</h2>
				        <h3>
				            <% if (Request.Params["v"] == "1") { %>				        
					            doAuthorization -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink25" runat="server" NavigateUrl="~/index.aspx?m=3&v=1">doAuthorization</asp:HyperLink> -				        
				            <% } %>
        				    
				            <% if (Request.Params["v"] == "2") { %>				        
					            doCapture -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink21" runat="server" NavigateUrl="~/index.aspx?m=3&v=2">doCapture</asp:HyperLink> - 
				            <% } %>
        				    
				            <% if (Request.Params["v"] == "3") { %>				        
					            doRefund -
					        <% }else {%>   					 
				                <asp:HyperLink ID="HyperLink22" runat="server" NavigateUrl="~/index.aspx?m=3&v=3">doRefund</asp:HyperLink> - 
				            <% } %>
        				    
				            <% if (Request.Params["v"] == "4") { %>				        
					            doCredit -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink23" runat="server" NavigateUrl="~/index.aspx?m=3&v=4">doCredit</asp:HyperLink> - 
				            <% } %>
        				    
				            <% if (Request.Params["v"] == "5") { %>				        
					            doDebit - 
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink24" runat="server" NavigateUrl="~/index.aspx?m=3&v=5">doDebit</asp:HyperLink> - 
				            <% } %>
				            
				             <% if (Request.Params["v"] == "6") { %>				        
					            verifyEnrollment
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink250" runat="server" NavigateUrl="~/index.aspx?m=3&v=6">verifyEnrollment</asp:HyperLink> 
				            <% } %>
				        </h3>				    
                        <p id="info">Demo that shows the usage of Payline classes for direct payments.</p>
                    
                    <% } else if (Request.Params["m"] == "4") {%> 
                
                        <h2>Mass Payment</h2>
				        <h3>
        				
				            <% if (Request.Params["v"] == "1") { %>				        
					            doMassCapture -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/index.aspx?m=4&v=1">doMassCapture</asp:HyperLink> -				        
				            <% } %>
				            <% if (Request.Params["v"] == "2") { %>				        
					            doMassRefund -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/index.aspx?m=4&v=2">doMassRefund</asp:HyperLink> -
				            <% } %>
				            <% if (Request.Params["v"] == "3") { %>				        
					            getMassTraitmentDetails
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/index.aspx?m=4&v=3">getMassTraitmentDetails</asp:HyperLink>
				            <% } %>
				        </h3>
				        <!--<?php echo $links; ?>-->
                        <p id="info">Demo that shows the usage of Payline classes for mass payments.</p>                
                     
                    <% } else if (Request.Params["m"] == "5") {%> 
                        
                        <h2>Wallet</h2>
				        <h3>
        				
				            <% if (Request.Params["v"] == "1") { %>				        
					            createWallet -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink158" runat="server" NavigateUrl="~/index.aspx?m=5&v=1">createWallet</asp:HyperLink> - 
				            <% } %>
        				
				            <% if (Request.Params["v"] == "2") { %>				        
					           updateWallet -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink156" runat="server" NavigateUrl="~/index.aspx?m=5&v=2">updateWallet</asp:HyperLink> - 
				            <% } %>
        				    
				            <% if (Request.Params["v"] == "3") { %>				        
					            getWallet -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink159" runat="server" NavigateUrl="~/index.aspx?m=5&v=3">getWallet</asp:HyperLink> - 
				            <% } %>
        				
				            <% if (Request.Params["v"] == "4") { %>				        
					           disableWallet -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink160" runat="server" NavigateUrl="~/index.aspx?m=5&v=4">disableWallet</asp:HyperLink> - 
				            <% } %>
        				    
				            <% if (Request.Params["v"] == "5") { %>				        
					            enableWallet -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink161" runat="server" NavigateUrl="~/index.aspx?m=5&v=5">enableWallet</asp:HyperLink> - 
				            <% } %>
        				
				            <% if (Request.Params["v"] == "6") { %>				        
					           doImmediateWalletPayment -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink162" runat="server" NavigateUrl="~/index.aspx?m=5&v=6">doImmediateWalletPayment</asp:HyperLink> - 
				            <% } %>
        				    
				            <% if (Request.Params["v"] == "7") { %>				        
					            doScheduledWalletPayment -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink163" runat="server" NavigateUrl="~/index.aspx?m=5&v=7">doScheduledWalletPayment</asp:HyperLink> - 
				            <% } %>
        				
				            <% if (Request.Params["v"] == "8") { %>				        
					           doRecurrentWalletPayment -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink164" runat="server" NavigateUrl="~/index.aspx?m=5&v=8">doRecurrentWalletPayment</asp:HyperLink> - 
				            <% } %>
        				    
				            <% if (Request.Params["v"] == "9") { %>				        
					            getPaymentRecord -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink165" runat="server" NavigateUrl="~/index.aspx?m=5&v=9">getPaymentRecord</asp:HyperLink> - 
				            <% } %>
        				
				            <% if (Request.Params["v"] == "10") { %>				        
					           disablePaymentRecord -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink166" runat="server" NavigateUrl="~/index.aspx?m=5&v=10">disablePaymentRecord</asp:HyperLink> - 
				            <% } %>
        				    
				            <% if (Request.Params["v"] == "11") { %>				        
					            createWebWallet -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink167" runat="server" NavigateUrl="~/index.aspx?m=5&v=11">createWebWallet</asp:HyperLink> - 
				            <% } %>
        				
				            <% if (Request.Params["v"] == "12") { %>				        
					           updateWebWallet -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink168" runat="server" NavigateUrl="~/index.aspx?m=5&v=12">updateWebWallet</asp:HyperLink> - 
				            <% } %>
        				    
				            <% if (Request.Params["v"] == "13"){ %>				        
					           getWebWallet
					        <% }else{%>    
				                <asp:HyperLink ID="HyperLink169" runat="server" NavigateUrl="~/index.aspx?m=5&v=13">getWebWallet</asp:HyperLink> 
				            <% } %>        
        				   
				        </h3>
				        <!--<?php echo $links; ?>-->
                        <p id="info">Demo that shows the usage of Payline classes for web payments.</p>
                        
                         <% } else if (Request.Params["m"] == "6") {%> 
                
                        <h2>Extended</h2>
				        <h3>
        				
				            <% if (Request.Params["v"] == "1") { %>				        
					            getTransactionDetails  -
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink" runat="server" NavigateUrl="~/index.aspx?m=6&v=1">getTransactionDetails</asp:HyperLink> -				        
				            <% } %>
				            <% if (Request.Params["v"] == "2") { %>				        
					            transactionsSearch 
					        <% }else {%>    
				                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/index.aspx?m=6&v=2">transactionsSearch</asp:HyperLink>
				            <% } %>
				            
				        </h3>
				        <!--<?php echo $links; ?>-->
                        <p id="P1">Demo that shows the usage of Payline classes for mass payments.</p> 
                         
                <% } %>
                
                <p id="sourcelinks">
			        <a href="#" id="exampleonly">display example only</a>
			        <a href="#" id="htmlcode">ascx/html code</a> | <a href="#" id="aspxcode">aspx.cs code</a> | <a href="#" id="csscode">css code</a>
		        </p>			
    			
		        <div id="source">
    	
			        <div class="code" id="css">
					    <pre class="css"><span style="color: #808080; font-style: italic;">/* @group Forms */</span>
                        form<span style="color: #6666ff;">.payline-form</span> <span style="color: #66cc66;">&#123;</span>
	                        <span style="color: #000000; font-weight: bold;">font-size</span>: <span style="color: #933;">11px</span>;
	                        <span style="color: #000000; font-weight: bold;">padding</span>: <span style="color: #933;">10px</span> <span style="color: #933;">30px</span>;
	                        <span style="color: #000000; font-weight: bold;">border</span>: <span style="color: #933;">1px</span> <span style="color: #993333;">solid</span> <span style="color: #cc00cc;">#ddd</span>;
	                        <span style="color: #000000; font-weight: bold;">background</span>: <span style="color: #cc00cc;">#f9f9f9</span>;
	                        <span style="color: #000000; font-weight: bold;">margin-bottom</span>: <span style="color: #933;">10px</span>;
                        <span style="color: #66cc66;">&#125;</span>
                        <span style="color: #6666ff;">.payline-form</span> fieldset <span style="color: #66cc66;">&#123;</span>
	                        <span style="color: #000000; font-weight: bold;">margin-bottom</span>: <span style="color: #933;">1em</span>;
                        <span style="color: #66cc66;">&#125;</span>
                        <span style="color: #6666ff;">.payline-form</span> <span style="color: #6666ff;">.row</span> <span style="color: #66cc66;">&#123;</span>
	                        <span style="color: #000000; font-weight: bold;">clear</span> : <span style="color: #993333;">both</span>;
	                        <span style="color: #000000; font-weight: bold;">margin</span>: <span style="color: #933;">0</span><span style="color: #6666ff;"><span style="color: #933;">.15em</span></span> <span style="color: #933;">0</span><span style="color: #6666ff;"><span style="color: #933;">.5em</span></span>;
	                        <span style="color: #000000; font-weight: bold;">color</span>: <span style="color: #cc00cc;">#3d4d5b</span>;
                        <span style="color: #66cc66;">&#125;</span>
                        <span style="color: #6666ff;">.payline-form</span> hr <span style="color: #66cc66;">&#123;</span>
	                        <span style="color: #000000; font-weight: bold;">clear</span> : <span style="color: #993333;">both</span>;
	                        <span style="color: #000000; font-weight: bold;">border</span>: <span style="color: #993333;">none</span>;
	                        <span style="color: #000000; font-weight: bold;">border-bottom</span>: <span style="color: #933;">1px</span> <span style="color: #993333;">dashed</span> <span style="color: #cc00cc;">#eee</span>;
                        <span style="color: #66cc66;">&#125;</span>
                        <span style="color: #6666ff;">.payline-form</span> label <span style="color: #66cc66;">&#123;</span>
	                        <span style="color: #000000; font-weight: bold;">display</span>: <span style="color: #993333;">inline</span>;
	                        <span style="color: #000000; font-weight: bold;">float</span>: <span style="color: #000000; font-weight: bold;">left</span>;
	                        <span style="color: #000000; font-weight: bold;">text-align</span> : <span style="color: #000000; font-weight: bold;">right</span>;
	                        <span style="color: #000000; font-weight: bold;">margin-bottom</span>: <span style="color: #933;">0</span><span style="color: #6666ff;"><span style="color: #933;">.5em</span></span>;
	                        <span style="color: #000000; font-weight: bold;">line-height</span>: <span style="color: #933;">1</span><span style="color: #6666ff;"><span style="color: #933;">.5em</span></span>;
	                        <span style="color: #000000; font-weight: bold;">width</span>: <span style="color: #933;">150px</span>;
                        <span style="color: #66cc66;">&#125;</span>
                        <span style="color: #6666ff;">.payline-form</span> input, <span style="color: #6666ff;">.payline-form</span> select, <span style="color: #6666ff;">.payline-form</span> textarea <span style="color: #66cc66;">&#123;</span>
	                        <span style="color: #000000; font-weight: bold;">background</span>: <span style="color: #cc00cc;">#ddd</span>;
	                        <span style="color: #000000; font-weight: bold;">border</span>: <span style="color: #933;">1px</span> <span style="color: #993333;">solid</span> <span style="color: #cc00cc;">#<span style="color: #933;">575757</span></span>;
	                        <span style="color: #000000; font-weight: bold;">width</span> : <span style="color: #933;">250px</span>;
	                        <span style="color: #000000; font-weight: bold;">font-size</span>: <span style="color: #933;">1em</span>;
	                        <span style="color: #000000; font-weight: bold;">margin-left</span>: <span style="color: #933;">35px</span>;
	                        <span style="color: #000000; font-weight: bold;">padding</span>: <span style="color: #993333;">auto</span> <span style="color: #933;">0</span><span style="color: #6666ff;"><span style="color: #933;">.5em</span></span>;
	                        <span style="color: #000000; font-weight: bold;">color</span>: <span style="color: #cc00cc;">#<span style="color: #933;">575757</span></span>;
                        <span style="color: #66cc66;">&#125;</span>
                        <span style="color: #6666ff;">.payline-form</span> input<span style="color: #6666ff;">.submit</span> <span style="color: #66cc66;">&#123;</span>
	                        <span style="color: #000000; font-weight: bold;">background</span>: <span style="color: #cc00cc;">#<span style="color: #933;">575757</span></span>;
	                        <span style="color: #000000; font-weight: bold;">color</span>: <span style="color: #993333;">white</span>;
	                        <span style="color: #000000; font-weight: bold;">font-weight</span>: <span style="color: #993333;">bold</span>;
	                        <span style="color: #000000; font-weight: bold;">border</span>: <span style="color: #933;">1px</span> <span style="color: #993333;">solid</span> <span style="color: #cc00cc;">#ddd</span>;
	                        <span style="color: #000000; font-weight: bold;">margin-left</span>: <span style="color: #933;">190px</span>;
	                        <span style="color: #000000; font-weight: bold;">width</span>: <span style="color: #993333;">auto</span>;
	                        <span style="color: #000000; font-weight: bold;">padding</span>: <span style="color: #933;">0</span><span style="color: #6666ff;"><span style="color: #933;">.15em</span></span> <span style="color: #933;">0</span><span style="color: #6666ff;"><span style="color: #933;">.5em</span></span>;
	                        <span style="color: #000000; font-weight: bold;">cursor</span>: <span style="color: #993333;">pointer</span>;
                        <span style="color: #66cc66;">&#125;</span>
                        <span style="color: #6666ff;">.payline-form</span> <span style="color: #6666ff;">.help</span> <span style="color: #66cc66;">&#123;</span>
	                        <span style="color: #000000; font-weight: bold;">margin-left</span>: <span style="color: #933;">10px</span>;
	                        <span style="color: #000000; font-weight: bold;">font-style</span>: <span style="color: #993333;">italic</span>;
	                        <span style="color: #000000; font-weight: bold;">letter-spacing</span>: <span style="color: #933;">1px</span>;
                        <span style="color: #66cc66;">&#125;</span>
                        <span style="color: #6666ff;">.payline-form</span> <span style="color: #cc00cc;">#debug</span>, <span style="color: #cc00cc;">#recurring</span> <span style="color: #66cc66;">&#123;</span>
	                        <span style="color: #000000; font-weight: bold;">width</span>: <span style="color: #993333;">auto</span>;
                        <span style="color: #66cc66;">&#125;</span>
                        <span style="color: #808080; font-style: italic;">/* @end */</span></pre>						</div>

    				<% if (Request.Params["m"] == "2") {%> 
					    
					    <div id="demo">
					        <% if (Request.Params["v"] == "2") { %>					    
					            <uc1:fullWebPayment id="fullWebPayment" runat="server"></uc1:fullWebPayment>
					        <% } else if (Request.Params["v"] == "3") { %>
					            <uc1:getWebPaymentDetail id="getWebPaymentDetail" runat="server"></uc1:getWebPaymentDetail>
					        <% } else { %>
					            <uc1:doWebPayment id="doWebPayment" runat="server"></uc1:doWebPayment>
					        <% } %>
					    </div>
					    
					<% } else if (Request.Params["m"] == "3") {%> 
					
					    <div id="demo">
						    <% if (Request.Params["v"] == "2") { %>					    
					            <uc1:doCapture id="doCapture" runat="server"></uc1:doCapture>
					        <% } else if (Request.Params["v"] == "3") { %>
					            <uc1:doRefund id="doRefund" runat="server"></uc1:doRefund>
					        <% } else if (Request.Params["v"] == "4") { %>
					            <uc1:doCredit id="doCredit" runat="server"></uc1:doCredit>
					        <% } else if (Request.Params["v"] == "5") { %>
					            <uc1:doDebit id="doDebit" runat="server"></uc1:doDebit>
					        <% } else if (Request.Params["v"] == "6") { %>
					            <uc1:verifyEnrollment id="verifyEnrollment" runat="server"></uc1:verifyEnrollment>
					        <% }else {%>
					           <uc1:doAuthorization id="doAuthorization" runat="server"></uc1:doAuthorization>
    					    <% } %>
					    </div>
					    
					<% } else if (Request.Params["m"] == "4") {%> 
					
					    <div id="demo">
						    <% if (Request.Params["v"] == "2") { %>					    
					            <uc1:doMassRefund id="doMassRefund" runat="server"></uc1:doMassRefund>
					        <% } else if (Request.Params["v"] == "3") { %>
					            <uc1:getMassTraitmentDetails id="getMassTraitmentDetails" runat="server"></uc1:getMassTraitmentDetails>
					        <% } else {%>
					            <uc1:doMassCapture id="doMassCapture" runat="server"></uc1:doMassCapture>
					        <% } %>
					    </div>
					    
					<% } else if (Request.Params["m"] == "5") {%> 
    			        <div id="demo">
					        <% if (Request.Params["v"] == "2") { %>					    
				    	        <uc1:updateWallet id="updateWallet" runat="server"></uc1:updateWallet>
					        <% } else if (Request.Params["v"] == "3") { %>
			    		        <uc1:getWallet id="getWallet" runat="server"></uc1:getWallet>
    					    <% } else if (Request.Params["v"] == "4") { %>
			    		        <uc1:disableWallet id="disableWallet" runat="server"></uc1:disableWallet>
    					    <% } else if (Request.Params["v"] == "5") { %>
			    		        <uc1:enableWallet id="enableWallet" runat="server"></uc1:enableWallet>
    					    <% } else if (Request.Params["v"] == "6") { %>
			    		        <uc1:doImmediateWalletPayment id="doImmediateWalletPayment" runat="server"></uc1:doImmediateWalletPayment>
    					    <% } else if (Request.Params["v"] == "7") { %>
			    		        <uc1:doScheduledWalletPayment id="doScheduledWalletPayment" runat="server"></uc1:doScheduledWalletPayment>
    					    <% } else if (Request.Params["v"] == "8") { %>
			    		        <uc1:doRecurrentWalletPayment id="doRecurrentWalletPayment" runat="server"></uc1:doRecurrentWalletPayment>
    					    <% } else if (Request.Params["v"] == "9") { %>
			    		        <uc1:getPaymentRecord id="getPaymentRecord" runat="server"></uc1:getPaymentRecord>
    					    <% } else if (Request.Params["v"] == "10") { %>
			    		        <uc1:disablePaymentRecord id="disablePaymentRecord" runat="server"></uc1:disablePaymentRecord>
			    		    <% } else if (Request.Params["v"] == "11") { %>
			    		        <uc1:createWebWallet id="createWebWallet" runat="server"></uc1:createWebWallet>
			    		    <% } else if (Request.Params["v"] == "12") { %>
			    		        <uc1:updateWebWallet id="updateWebWallet" runat="server"></uc1:updateWebWallet>
			    		    <% } else if (Request.Params["v"] == "13") { %>
			    		        <uc1:getWebWallet id="getWebWallet" runat="server"></uc1:getWebWallet>    
    					    <% } else {%>
	    				        <uc1:createWallet id="createWallet" runat="server"></uc1:createWallet>
		    			    <% } %>		    			
					    </div>
					    
					    <% } else if (Request.Params["m"] == "6") {%> 
					
					    <div id="Div1">
						    <% if (Request.Params["v"] == "2") { %>					    
					            <uc1:transactionsSearch id="transactionsSearch" runat="server"></uc1:transactionsSearch>
					        <% } else { %>
					             <uc1:getTransactionDetails id="getTransactionDetails" runat="server"></uc1:getTransactionDetails>
					        <% } %>		  
					    </div>
					    
    			    <% } %>	
				<% } %>
			    </div>	
			</div>
			<span class="clr"></span>
		</div>
	</div>

	<div id="footer">
		<div id="footer-inside">
			<a href="http://www.monext.fr/" class="copy"></a>
			<p>copyright &copy;2009 <a href="http://www.monext.fr/">Monext</a></p>
		</div>
	</div>
</body>
</html>