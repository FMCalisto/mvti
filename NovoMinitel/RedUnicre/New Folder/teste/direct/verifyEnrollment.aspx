<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="verifyEnrollment.aspx.cs" Inherits="_Default" %>
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
                            if (debug)
                            {
                                Response.Write(SDKPayline.Utils.objectDetails(resultat));
                                Response.Write(SDKPayline.Utils.objectDetails(payment));
                                Response.Write(SDKPayline.Utils.objectDetails(card));
                                Response.Write(SDKPayline.Utils.objectDetails(order));
                                Response.Write("<ul><li class=object>actionUrl</li>");
                                Response.Write("<li>actionUrl => " + actionUrl + "</li></ul>");
                                Response.Write("<ul><li class=object>actionMethod</li>");
                                Response.Write("<li>actionMethod => " + actionMethod + "</li></ul>");
                                Response.Write("<ul><li class=object>pareqFieldName</li>");
                                Response.Write("<li>pareqFieldName => " + pareqFieldName + "</li></ul>");
                                Response.Write("<ul><li class=object>pareqFieldValue</li>");
                                Response.Write("<li>pareqFieldValue => " + pareqFieldValue + "</li></ul>");
                                Response.Write("<ul><li class=object>termUrlName</li>");
                                Response.Write("<li>termUrlName => " + termUrlName + "</li></ul>");
                                Response.Write("<ul><li class=object>termUrlValue</li>");
                                Response.Write("<li>termUrlValue => " + termUrlValue + "</li>");                                
                                Response.Write("<li>termUrlValueFixe => " + Resources.Resource.TERM_URL + "</li></ul>");
                                Response.Write("<ul><li class=object>mdFieldName</li>");
                                Response.Write("<li>mdFieldName => " + mdFieldName + "</li></ul>");
                                Response.Write("<ul><li class=object>mdFieldValue</li>");
                                Response.Write("<li>mdFieldValue => " + mdFieldValue + "</li></ul>");
                            }
                            else
                            {
                                if (resultat.code == "03000")
                                {
                                    %>
                                    <form id="verify" action="<%= actionUrl %>" method="<%= actionMethod %>" class="payline-form">
                                        <input type="hidden" name="<%= pareqFieldName %>" value="<%= pareqFieldValue %>" />
                                        <input type="hidden" name="<%= termUrlName %>" value="<%= Resources.Resource.TERM_URL %>?contractNumber=<%= payment.contractNumber %>" />
                                        <input type="hidden" name="<%= mdFieldName %>" value="<%= mdFieldValue %>" />
                                    </form>
                                    <script type="text/javascript" language="javascript">
                                        document.getElementById("verify").submit();
                                    </script>
                                    <%
                                    
                                    
                                    //Response.Redirect(actionUrl + "?" + pareqFieldName + "=" + pareqFieldValue + "&" + termUrlName + "=" + termUrlValue + "&" + mdFieldName + "=" + mdFieldValue);
                                    //Response.Write(actionUrl + "?" + pareqFieldName + "=" + pareqFieldValue + "&" + termUrlName + "=" + termUrlValue + "&" + mdFieldName + "=" + mdFieldValue);
                                }
                                else
                                    Response.Write("resultat message error : " + resultat.longMessage + " <BR/>");
                            }
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