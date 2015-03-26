<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE virtual="/includes/inc_variaveis_globais.asp"-->
<%
	AInt=Request.QueryString("ID")
	MySQL="Select * from WN_Clientes_ACT where IDWN_Clientes_ACT=" & AInt
	Set Clientes=db.query(cstr(MySQL))
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Impressão de relatório ACT</title>
<link href="/includes/Minitel.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<p align="center"><strong>Relat&oacute;rio de Visita Comercial</strong></p>
	<p align="left">&nbsp;</p>
	<p align="left"><strong>Numero</strong> : <%=Clientes("no")%> </p>
	<p align="left"><strong>Nome do cliente</strong> : <%=Clientes("nome")%></p>
	<p align="left"><strong>Data da visita</strong> : <%=Clientes("Data")%></p>
	<p align="left"><strong>Data de impress&atilde;o</strong> : <%=now()%></p>
	<p align="left"><strong>Texto</strong> : <%=Clientes("Texto")%></p>
	<%Clientes.Close%>
	<%Set Clientes=Nothing%>
	<script language="javascript" type="text/javascript">
			window.print();
	</script>
</body>
</html>
