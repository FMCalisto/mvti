<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Inscrição na Formação...</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
<%
'*********************************************************************************************
Function Header(Texto,Colunas)
	%>
	<tr>
		<td colspan="<%=Colunas%>" align="center"><b><%=Texto%></b></td>
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
<td align="center"><font size="6">Forma&ccedil;&atilde;o ReadyNAS NV+ </font></td>
</tr>
</table>
<br>
<form action="SeminarioRun.asp" method="post">
	<table BORDER="1" CELLSPACING="0" WIDTH="100%" cellpadding="5" bordercolor="#EEEEEE" bordercolorlight="#EEEEEE" bordercolordark="#EEEEEE">
	<%=Header("Dia pretendido",2)%>
	<tr>
		<td colspan="2"><%=label("Data em que pretende ter a formação sobre ReadyNAS NV+","Extra5","10")%></td>
	</tr>
	<%=Header("Dados pessoais",2)%>
	<tr>
		<td><%=label("Empresa","Empresa","40")%></td>
		<td>&nbsp;<input type="hidden" name="Funcao" value="Valor não pedido"></td>
	</tr>
	<tr>
		<td><%=label("Nome","Nome","40")%></td>
		<td><%=label("Cargo","Profissao","40")%></td>
	</tr>
	<tr>
		<td colspan="2"><%=label("Morada","Morada","80")%></td>
	</tr>
	<tr>
		<td><%=label("Localidade","Localidade","40")%></td>
		<td><%=label("Código Postal","CodeP4","4")%> - <%=label("","CodeP3","3")%></td>
	</tr>
	<tr>
		<td><%=label("Número de telefone","Telefone","13")%></td>
		<td><%=label("Número de fax","Fax","13")%></td>
	</tr>
	<tr>
		<td colspan="2"><%=label("E-Mail","Email","40")%></td>
	</tr>
	<tr>
		<td colspan="2"><b>Para que marcas gostaria de receber forma&ccedil;&atilde;o adiccional : </b></td>
	</tr>
		<tr><td colspan="2"><%=label("","Extra4","60")%></td></tr>
	</table>
	<hr>
	<p align="center"><input type='submit' value='Submeter inscrição'></p>
	<input type="hidden" name="Extra0" value="SiteMinitel">
	<input type="hidden" name="Titulo" value="FormacaoReadyNAS">
</form>
</body>
</html>
