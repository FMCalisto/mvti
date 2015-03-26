<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE virtual="/includes/inc_variaveis_globais.asp"-->
<!--#INCLUDE virtual="/includes/inc_FuncoesCRT.asp"-->
<%
Dim Imagem

response.contentType="application/vnd.ms-excel" 

MySQL="select * from SQLSRV_MIN.min_phc.dbo.View_ProdutosPMELink"

rem response.Write(MySQL) : response.Flush()


db.QueryExec(cstr("execute Hit_WN_EventosMENU " & "PMELink"))
%>
<html>
<link href="http://www.minitel.pt/includes/Minitel.css" rel="stylesheet" type="text/css">
<body> 
<table border="1" cellspacing="0" cellpadding="2" align="left" width="100%"> 
<tr align="center" class="Texto"> 
	<td bgcolor="#E0FDCE">DATA</td>
	<td bgcolor="#E0FDCE">REFERENCIA</td>
	<td bgcolor="#E0FDCE">UMV</td>
	<td bgcolor="#E0FDCE">QUANT UMV</td>
	<td bgcolor="#E0FDCE">CATEGORIA</td>
	<td bgcolor="#E0FDCE">MARCA</td>
	<td bgcolor="#E0FDCE">FABRICANTE</td>
	<td bgcolor="#E0FDCE">TITULO</td>
	<td bgcolor="#E0FDCE">DESC CURTA</td>
	<td bgcolor="#E0FDCE">DESC LONGA</td>
	<td bgcolor="#E0FDCE">FOTOGRAFIA</td>
	<td bgcolor="#E0FDCE">FOTOGRAFIA PEQUENA</td>
	<td bgcolor="#E0FDCE">BROCHURA</td>
	<td bgcolor="#E0FDCE">PREÇO RECOMENDADO</td>
	<td bgcolor="#E0FDCE">PREÇO TABELA</td>
	<td bgcolor="#E0FDCE">DESCONTO</td>
	<td bgcolor="#E0FDCE">DESCONTO PROMOCIONAL</td>
	<td bgcolor="#E0FDCE">STOCK</td>
	<td bgcolor="#E0FDCE">COMENTÁRIOS</td>
</tr> 
<%
	Set ListaProdutos=db.query(cstr(MySQL))
	Do While not ListaProdutos.eof
		%>
		<tr valign="top" class="Texto_azul"> 
				<td align="left"><%=ListaProdutos("DATA")%></td>
				<td align="left"><%=ListaProdutos("REFERENCIA")%></td>
				<td align="left"><%=ListaProdutos("UMV")%></td>
				<td align="left"><%=ListaProdutos("QUANT UMV")%></td>
				<td align="left"><%=ListaProdutos("CATEGORIA")%></td>
				<td align="left"><%=ListaProdutos("MARCA")%></td>
				<td align="left"><%=ListaProdutos("FABRICANTE")%></td>
				<td align="left"><%=ListaProdutos("TITULO")%></td>
				<td align="left"><%=ListaProdutos("DESC CURTA")%></td>
				<td align="left"><%=ListaProdutos("DESC LONGA")%></td>
				<td align="left"><%=ListaProdutos("fotografia")%></td>
				<td align="left"><%=ListaProdutos("fotografia pequena")%></td>
				<td align="left"><%=ListaProdutos("brochura")%></td>
				<td align="left"><%=ListaProdutos("Preço Recomendado")%></td>
				<td align="left"><%=ListaProdutos("Preço Tabela")%></td>
				<td align="left"><%=ListaProdutos("Desconto")%></td>
				<td align="left"><%=ListaProdutos("Desconto Promocional")%></td>
				<td align="left"><%=ListaProdutos("Stock")%></td>
				<td align="left"><%=ListaProdutos("Comentários")%></td>
		</tr> 
		<%
		response.Flush()
		ListaProdutos.movenext
	Loop
	ListaProdutos.close
	set ListaProdutos=nothing
%>
<tr align="center" class="Texto"> 
		<td colspan="19" bgcolor="#E0FDCE">Minitel - <%=Now()%></td> 
</tr> 
</table> 
</body> 
</html>

