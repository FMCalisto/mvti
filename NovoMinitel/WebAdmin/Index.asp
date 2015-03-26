<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE virtual="/includes/inc_variaveis_globais.asp"-->
<!--#INCLUDE virtual="/includes/inc_javascript.asp"-->
<!--#INCLUDE virtual="/includes/inc_FuncoesCRT.asp"-->
<%
if Session("autenticado")<>1 Then
	response.Redirect("login.asp")
End if
if Ucase(request.QueryString("OP"))="LOGOUT"  Then 
	Session("autenticado")=0
	Session.Abandon()
	response.Redirect("login.asp")
End if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>WebAdmin</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META NAME="creationdate" CONTENT="Janeiro 2007">
<META NAME="webmaster" CONTENT="Rui Fernandes, rui.fernandes@minitel.pt">
<META NAME="Author" CONTENT="Rui Fernandes (rui.fernandes@minitel.pt)">
<META NAME="Description" CONTENT="Minitel - Sociedade de Fomento de Aplicações Informáticas, L.da.">
<link href="/WebAdmin/Backoffice.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0">
<%Session("Lingua")=1%>
<table border="0" cellpadding="0" cellspacing="0" align="left">
	<tr>
		  <td width="800" height="100" colspan="2">
	  		<a href="/webadmin/index.asp"><img border="0" src="/WebAdmin/Images/header.jpg" width="800" ></a></td>
	</tr>
	<tr valign="top">
		  <td width="150" height="600" valign="top" bgcolor="#E8E8E8" align="center">
				<!--#INCLUDE VIRTUAL="/WebAdmin/includes/inc_gera_menus.asp"-->
		  </td>
		  <td width="450" height="600" align="center">
				<!--#INCLUDE VIRTUAL="/WebAdmin/includes/inc_index.asp"-->
		  </td>
	</tr>

</table>
</body>
</html>
<%Set TXT=Nothing:Set DB=Nothing%>