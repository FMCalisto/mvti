<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Inscrição no seminário...</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.titulo {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 24px;
	font-style: normal;
	font-weight: bold;
	color: #333;
}
.header {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: #FC0;
	background-color: #000;
}
.texto {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #666;
}
.label {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: #FFF;
	background-color: #666;
	font-size: 12px;
}
-->
</style>
</head>
<body>
<%
'*********************************************************************************************
Function Header(Texto,Colunas)
	%>
	<tr>
		<td colspan="<%=Colunas%>" align="center" class="header"><b><%=Texto%></b></td>
	</tr>
	<%
End function
'*********************************************************************************************
function label(texto,variavel,tamanho)
	if texto<>"" Then response.Write(texto & " : ")
	%>
	<input type="text" name="<%=variavel%>" value="" size="<%=tamanho%>">
	<%
End function
'*********************************************************************************************
function check(texto,variavel,valor)
	%>
	<input type="checkbox" name="<%=variavel%>" value="<%=valor%>">
	<%
	if texto<>"" Then response.Write(texto)
End function
'*********************************************************************************************
%>
<table width="100%" border="0">
<tr>
<td width="21%" align="left" class="titulo"><img src="/images/Logotipos/logo_novo_minitel_27.jpg" width="191" height="120" alt=""/></td>
<td width="79%" align="center" class="titulo">&nbsp;</td>
</tr>
</table>
<br>
<form action="file:///Macintosh HD/Users/margaridasilva/Downloads/Enviar(1)/SeminarioRun.asp" method="post">
  <table BORDER="1" CELLSPACING="0" WIDTH="100%" cellpadding="5" bordercolor="#EEEEEE" bordercolorlight="#EEEEEE" bordercolordark="#EEEEEE" bgcolor="333333">
    <tr>
    <td colspan="2" Width=100% class="header"><%=Header("Formulário de Registo","2")%></td></tr>
	<tr>
		<td bgcolor="#CCCCCC" class="label"><%=label("Nome","Nome","40")%></td>
	<td bgcolor="#CCCCCC" class="label"><%=label("Empresa","Empresa","40")%></td>
	  </td>		
	</tr>
	<tr>
		<td bgcolor="#CCCCCC" class="label"><%=label("Telefone","Telefone","40")%></td>
	  <td bgcolor="#CCCCCC" class="label"><%=label("E-Mail","E-Mail","40")%></td>
	</tr>
	
	</table>
  <p align="center" class="texto"><br><input type='submit' value='Submeter inscrição'></p>
    	<input type="hidden" name="Extra0" value="SiteMinitel">
	<input type="hidden" name="Titulo" value="Webinar">
</form>
</body>
</html>
