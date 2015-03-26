<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE virtual="/includes/inc_variaveis_globais.asp"-->
<!--#INCLUDE virtual="/includes/inc_FuncoesCRT.asp"-->
<%
Dim Imagem

response.contentType="application/vnd.ms-excel" 

MySQL=Session("MySQL")
MySQL=right(MySQL,Len(MySQL)-instr(MySQL,"where")-4 )' Fico apenas com a parte do Where

MySQL="select substring(substring(imagem,charindex('/',imagem),len(imagem)),1,charindex('""',substring(imagem,charindex('/',imagem),len(imagem)))-1) as imglink,Ref,forref,design,usr1,usr4,usr3,usr2,epv1 as Preco,pvp, case dbo.Get_EstadoDoStock (stock,qttfor,qttcli) when 2 then 'SIM' when 1 then  'BREVEMENTE' when 3 then  'NÃO' end as StockC,Stock as StockReal,qttfor,qttcli from WebSiteMINITEL_Stock where " & MySQL


rem response.Write(MySQL) : response.Flush()



db.QueryExec(cstr("execute Hit_WN_EventosMENU " & "ExpFiltros2Excel"))
%>
<html>
<link href="Minitel.css" rel="stylesheet" type="text/css">
<body> 
<table border="1" cellspacing="0" cellpadding="2" align="left" width="100%"> 
<tr align="center" class="Texto"> 
	<td bgcolor="#E0FDCE">Referencia</td> 
	<td bgcolor="#E0FDCE">Referencia Fabricante</td> 
	<td bgcolor="#E0FDCE">Nome</td> 
	<td bgcolor="#E0FDCE">Marca</td> 
	<td bgcolor="#E0FDCE">1ºCategoria</td> 
	<td bgcolor="#E0FDCE">2ºCategoria</td> 
	<td bgcolor="#E0FDCE">3ºCategoria</td> 
	<td bgcolor="#E0FDCE">Preco</td> 
	<td bgcolor="#E0FDCE">PVP</td> 
	<%If Session("ComercialON") Then%>	
		<td bgcolor="#E0FDCE">StockReal</td> 
		<td bgcolor="#E0FDCE">Encomendado</td>
		<td bgcolor="#E0FDCE">Reservado</td>
	<%Else%>
		<td bgcolor="#E0FDCE">Stock</td>
	<%End if%>
	<td bgcolor="#E0FDCE">Imagem</td>
</tr> 
<%
	Set ListaProdutos=db.query(cstr(MySQL))
	Do While not ListaProdutos.eof
		%>
		<tr valign="top" class="Texto_azul"> 
				<td align="left"><%=ListaProdutos("Ref")%></td> 
				<td align="left"><%=ListaProdutos("forref")%></td> 
				<td align="left"><%=ListaProdutos("design")%></td> 
				<td align="center"><%=ListaProdutos("usr1")%></td> 
				<td align="center"><%=ListaProdutos("usr4")%></td> 
				<td align="center"><%=ListaProdutos("usr3")%></td> 
				<td align="center"><%=ListaProdutos("usr2")%></td> 
				<td align="right"><%=Moeda(ListaProdutos("Preco"))%></td> 
				<td align="right"><%=Moeda(ListaProdutos("pvp"))%></td> 
				<%If Session("ComercialON") Then%>	
					<td align="center"><%=ListaProdutos("StockReal")%></td> 
					<td align="center"><%=ListaProdutos("qttfor")%></td> 
					<td align="center"><%=ListaProdutos("qttcli")%></td> 
				<%Else%>
					<td align="center"><%=ListaProdutos("StockC")%></td> 
				<%End if%>
				<td align="left">http://www.minitel.pt/<%=ListaProdutos("imglink")%></td> 
		</tr> 
		<%
		response.Flush()
		ListaProdutos.movenext
	Loop
	ListaProdutos.close
	set ListaProdutos=nothing
%>
<tr align="center" class="Texto"> 
	<%If Session("ComercialON") Then%>	
		<td colspan="13" bgcolor="#E0FDCE">Minitel - <%=Now()%></td> 
	<%Else%>
		<td colspan="13" bgcolor="#E0FDCE">Minitel - <%=Now()%></td> 
	<%End if%>
</tr> 
</table> 
</body> 
</html>

