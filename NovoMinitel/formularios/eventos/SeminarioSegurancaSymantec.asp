<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Inscri��o no semin�rio...</title>
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
<td align="center"><font size="6">Semin�rio Solu&ccedil;&otilde;es Symantec</font></td>
</tr>
</table>
<br>
<form action="SeminarioRun.asp" method="post">
	<table BORDER="1" CELLSPACING="0" WIDTH="100%" cellpadding="5" bordercolor="#EEEEEE" bordercolorlight="#EEEEEE" bordercolordark="#EEEEEE">
	<%=Header("Dia pretendido",2)%>
	<tr>
		<td colspan="2"><%=check("- Quero assistir ao semin�rio de <b>dia 22 de Novembro, em LISBOA</b>","Opcao1","1")%></td>
	</tr>
	<tr>
		<td colspan="2"><%=check("- Quero assistir ao semin�rio de <b>dia 29 de Novembro, no PORTO</B>","Opcao2","1")%></td>
	</tr>
	<%=Header("Dados pessoais",2)%>
	<tr>
		<td><%=label("Empresa","Empresa","40")%></td>
		<td>&nbsp;<input type="hidden" name="Funcao" value="Valor n�o pedido"></td>
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
		<td><%=label("C�digo Postal","CodeP4","4")%> - <%=label("","CodeP3","3")%></td>
	</tr>
	<tr>
		<td><%=label("N�mero de telefone","Telefone","13")%></td>
		<td><%=label("N�mero de fax","Fax","13")%></td>
	</tr>
	<tr>
		<td colspan="2"><%=label("E-Mail","Email","40")%></td>
	</tr>
	<%=Header("Gostaria de ir acompanhado/a por outra pessoa da minha empresa :",2)%>
	<tr>
		<td><%=label("Nome","Extra1","40")%></td>
		<td><%=label("Cargo","Extra2","40")%></td>
	</tr>
	<tr>
		<td colspan="2"><%=label("E-Mail","Extra3","40")%></td>
	</tr>
	<tr>
		<td colspan="2"><b>Quais s�o os produtos da Symantec que costuma instalar nos seus clientes ? : </b></td>
	</tr>
		<tr><td colspan="2"><%=check("AntiVirus","Opcao5","1")%></td></tr>
		<tr><td colspan="2"><%=check("Mail Security","Opcao6","1")%></td></tr>
		<tr><td colspan="2"><%=check("Anti Spam","Opcao7","1")%></td></tr>
		<tr><td colspan="2"><%=check("Backup Exec","Opcao8","1")%></td></tr>
		<tr><td colspan="2"><%=check("Backup Exec System Recovery","Opcao9","1")%></td></tr>
		<tr><td colspan="2"><%=check("EndPoint Security","Opcao10","1")%></td></tr>
		<tr><td colspan="2">Outros :<%=label("","Extra4","50")%></td></tr>
	</table>
	<hr>
	<p align="center"><u>N�o deixe de se preparar para um mercado em franco crescimento e de ter acesso �s vantagens, assistindo a este semin�rio.</u><br><br><input type='submit' value='Submeter inscri��o'></p>
	<input type="hidden" name="Extra0" value="SiteMinitel">
	<input type="hidden" name="Titulo" value="SegurancaSymantec2007">
</form>
</body>
</html>
