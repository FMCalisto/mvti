<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE VIRTUAL="/includes/OpenCon.asp"-->
<!--#INCLUDE VIRTUAL="/includes/FuncoesGenericas.asp"-->
<!--#INCLUDE VIRTUAL="/includes/FuncoesCOMBO.asp"-->
<%Call GravaEvento("WebAdminIndex")%>
<%Session("From")="Ficha_artigo.asp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>WebAdmin</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META NAME="creationdate" CONTENT="Janeiro 2005">
<META NAME="webmaster" CONTENT="Rui Fernandes, rui.fernandes@minitel.pt">
<META NAME="Author" CONTENT="Rui Fernandes (rui.fernandes@minitel.pt)">
<META NAME="Description" CONTENT="Minitel - Sociedade de Fomento de Aplicações Informáticas, L.da.">
<link href="/WebAdmin/Backoffice.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0">
<table border="0" cellpadding="0" cellspacing="0" width="800" height="600">
	<tr>
	  <td width="600" height="100" colspan="2">
	  		<a href="/index.asp"><img border="0" src="<%=GetImage("header" & valor & ".jpg")%>" width="800" height="100"></a>
	  </td>
	</tr>
	<tr valign="top">
	  <td width="150" height="500" valign="top" bgcolor="#E8E8E8">
		<div align="center">
			<!--#INCLUDE VIRTUAL="/WebAdmin/includes/inc_gera_menus.asp"-->
		</div>
	  </td>
	  <td width="450" height="500">
		<div align="center">
			<!--#INCLUDE VIRTUAL="/WebAdmin/includes/inc_Ficha_Artigo.asp"-->
		</div>
	  </td>
	</tr>
</table>
</body>
</html>
<!--#INCLUDE VIRTUAL="/includes/CloseCon.asp"-->