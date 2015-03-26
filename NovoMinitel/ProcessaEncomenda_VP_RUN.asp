<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
	Dim ConnObj
	Set ConnObj=Server.CreateObject("ADODB.Connection")
	Dim RS
	Set RS=Server.CreateObject("ADODB.Recordset")
	ConnObj.Open("Provider=SQLOLEDB;Server=SRVPHC14;Uid=sa;PWD=sqladm;Database=min_phc;")
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Processamento de Encomenda</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style1 {
	font-family: "trebuchet MS";
	color: #666666;
	font-size: 12px;
}
-->
</style>
</head>
<body>
	<span class="style1">
		<%
		if isnumeric(trim(request.Form("numero"))) Then
			MySQL="execute  min_phc.dbo.ImportaEncomedasVPortatil_DEFAULT_SUCK " & trim(request.Form("numero"))
			ConnObj.execute(cstr(MySQL))
			%>Encomenda processada !<%
		Else
			%>Problemas no processamento da encomenda !<%
		End if
		%>
    </span>
</body>
</html>
