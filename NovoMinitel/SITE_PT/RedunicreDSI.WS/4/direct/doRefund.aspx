<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="doRefund.aspx.cs" Inherits="_Default" %>
<%@ PreviousPageType VirtualPath="~/index.aspx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
	<title>Payline demo</title>
	<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/reset.css" />
	<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/style.css" />
	<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/header.css" />
    <link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/forms.css" />
    <script type = "text/javascript" src = "../scripts/mootools-1.11.js"></script>
    <script type = "text/javascript" src = "../scripts/demos.js"></script>   
	<style type="text/css">
            
            ul, li {
                list-style-type: none;
            }
            ul {
                margin: 0 0 10px 0;			}
            li {
                padding-left: 10px;
            }
            .object {
                color:#A6C835;
                font-size: 14px;
            }
        </style>
</head>
<body>
<div id="header">
            <div id="header-inside">
                <div id="logo">
                    <h1><a href="http://www.payline.com"><span>payline</span></a></h1>
                    <p>by experian</p>
                </div>
            </div>
        </div>
        <div id="wrapper">
            <div id="container">
                <div id="content" class="en">  
                <a href="javascript:history.back()" class="goback">Back</a>
                <br />                                
                <%  
                    if (errorMessage != "" || errorDetails != "")
                    {
                        Response.Write("<ul><li class=object>Error Message</li>");
                        Response.Write("<li>" + errorMessage + "</li></ul>");
                        Response.Write("<ul><li class=object>Error Details</li>");
                        Response.Write("<li>" + errorDetails + "</li></ul>");
                    }
                    else
                    {

                        try
                        {
                            Response.Write(SDKPayline.Utils.objectDetails(resultat));
                            Response.Write(SDKPayline.Utils.objectDetails(payment));
                            Response.Write(SDKPayline.Utils.objectDetails(transaction));
                            Response.Write(SDKPayline.Utils.arrayDetails(privateDataList));                        
                            Response.Write("<ul><li class=object>transactionID</li>");
                            Response.Write("<li>transactionID => " + transactionID + "</li></ul>");
                            Response.Write("<ul><li class=object>sequenceNumber</li>");
                            Response.Write("<li>transactionID => " + sequenceNumber + "</li></ul>");
                            Response.Write("<ul><li class=object>comment</li>");
                            Response.Write("<li>comment => " + comment + "</li></ul>");
                        }
                        catch (Exception exc)
                        {
                            Response.Write("<ul><li class=object>Erreur</li>");
                            Response.Write("<li>" + exc.Message + "</li></ul>");
                        }
                    }                              
                %>                        
                </div>
            </div>
        </div>
        <div id="footer">
		<div id="footer-inside">
			<a href="http://www.experian.fr/" class="copy"></a>
			<p>copyright &copy;2007 <a href="http://www.experian.fr/">Experian</a></p>
		</div>
	</div>
    </body>
</html>