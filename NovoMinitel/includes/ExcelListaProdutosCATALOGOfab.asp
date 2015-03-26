<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE virtual="/includes/inc_variaveis_globais.asp"-->
<!--#INCLUDE virtual="/includes/inc_FuncoesCRT.asp"-->
<%
if not (session("ComercialON")=TRUE or session("ClienteON")=TRUE) Then response.Redirect("DO_logout_run.asp")

'Dim FileName
 'FileName="test.xls" 
 response.contentType="application/vnd.ms-excel" 
 'response.AddHeader "content-disposition", "inline; filename=" & FileName 


MySQL="SELECT indice,forref as RefFornecedor,ref,design,imagem,Fabricante,CAT1,dbo.isempty(CAT2,'&nbsp;') as CAT2,dbo.isempty(CAT3,'&nbsp;') as CAT3,Preco,PVP,Descricao,stock FROM View_ClientesPRODUTOS_Catalogo ORDER BY design"
db.QueryExec(cstr("execute Hit_WN_EventosMENU " & "ExpFiltros2Excel"))
%>
<html>
<body> 
<table border="1" cellspacing="0" cellpadding="2" align="left" width="100%"> 
<tr align="center" class="Texto"> 
	<td bgcolor="#E0FDCE">Indice</td> 
	<td bgcolor="#E0FDCE">Ref Minitel</td> 
	<td bgcolor="#E0FDCE">Ref Fabricante</td>
	<td bgcolor="#E0FDCE">Nome</td> 
	<td bgcolor="#E0FDCE">Marca</td> 
	<td bgcolor="#E0FDCE">1ºCategoria</td> 
	<td bgcolor="#E0FDCE">2ºCategoria</td> 
	<td bgcolor="#E0FDCE">3ºCategoria</td> 
	<td bgcolor="#E0FDCE">Preco</td> 
	<td bgcolor="#E0FDCE">PVP</td> 
	<td bgcolor="#E0FDCE">Stock</td>
	<td bgcolor="#E0FDCE">Imagem</td>
	<td bgcolor="#E0FDCE">Descricao</td>
</tr> 
<%
	' Funcao para remover as tags HTML das linhas da descricao
	Dim RegEx

	Set RegEx = New RegExp

	RegEx.Pattern = "<[^>]*>"
	RegEx.Global = True

	Set ListaProdutos=db.query(cstr(MySQL))
	Do While not ListaProdutos.eof
		%>
		<tr valign="top" class="Texto_azul" style="white-space:nowrap"> 
				<td align="left"><%=ListaProdutos("indice")%></td> 
				<td align="left"><%=ListaProdutos("ref")%></td> 
				<td align="left"><%=ListaProdutos("RefFornecedor")%></td>
				<td align="left"><%=ListaProdutos("design")%></td> 
				<td align="center"><%=ListaProdutos("Fabricante")%></td> 
				<td align="center"><%=ListaProdutos("CAT1")%></td> 
				<td align="center"><%=ListaProdutos("CAT2")%></td> 
				<td align="center"><%=ListaProdutos("CAT3")%></td> 
				<td align="right"><%=Moeda(ListaProdutos("Preco"))%></td> 
				<td align="right"><%=Moeda(ListaProdutos("pvp"))%></td> 
				<td align="LEFT"><%=ListaProdutos("Stock")%></td> 
				<td align="LEFT"><%=ListaProdutos("imagem")%></td> 
				<td align="LEFT"><%=RegEx.Replace(ListaProdutos("Descricao"), " ")%></td> 
		</tr> 
		<%
		response.Flush()
		ListaProdutos.movenext
	Loop
	ListaProdutos.close
	set ListaProdutos=nothing
%>
</table> 
</body> 
</html>



