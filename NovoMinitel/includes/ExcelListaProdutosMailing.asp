<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE virtual="/includes/inc_variaveis_globais.asp"-->
<!--#INCLUDE virtual="/includes/inc_FuncoesCRT.asp"-->
<%
db.QueryExec(cstr("execute Hit_WN_EventosMENU " & "ExpFiltros2Mail"))
rem response.contentType="application/vnd.ms-excel" 

MySQL=Session("MySQL")
MySQL=right(MySQL,Len(MySQL)-instr(MySQL,"where")-4 )' Fico apenas com a parte do Where
MySQL=mid(MySQL,1,instr(MySQL,"order")-1)' Tiro a parte da ordenação

%>
<html>
<link href="Minitel.css" rel="stylesheet" type="text/css">
<body> 
<table width="100%" border="1" align="left" cellpadding="2" cellspacing="0" class="Texto"> 
<tr align="center" bgcolor="#FFFF99">
	<td>Refer&ecirc;ncia</td>
	<td>Designa&ccedil;&atilde;o</td>
	<td>Pre&ccedil;o</td>
</tr>
<%
Set Letras=db.query(cstr("select distinct cat2 from WN_ListaProdutos where " & MySQL & " order by cat2"))
Do While not Letras.EOF
		%>
		<tr>
			<td colspan="3" align="center" bgcolor="#FFBF80">CAT 2 - <%=Letras("cat2")%></td>
		</tr>
		<%
		Set ListaProdutos=db.query(cstr("select distinct cat3 from WN_ListaProdutos where " & MySQL & " and cat2='" & Letras("cat2") & "' order by cat3"))
		Do While not ListaProdutos.EOF
			%>
				<tr>
					<td colspan="3" align="center" bgcolor="#FFE7CE">CAT 3 - <%=ListaProdutos("cat3")%></td>
				</tr>
				<%
				Set Clientes=db.query(cstr("select ststamp,ref,design,preco,cat3 from WN_ListaProdutos where " & MySQL & " and cat2='" & Letras("cat2") & "' and cat3='" & ListaProdutos("cat3") & "' order by design,preco"))
				Do While not Clientes.EOF
					%>
					<tr>
						<td align="left"><a href="/?OP=FICHADEPRODUTO&ProdutoID=<%=trim(Clientes("ststamp"))%>"><%=trim(Clientes("ref"))%></a></td>
						<td align="left"><a href="/?OP=FICHADEPRODUTO&ProdutoID=<%=trim(Clientes("ststamp"))%>"><%=trim(Clientes("design"))%></a></td>
						<td align="right"><%=moeda(Clientes("preco"))%></td>
					</tr>
			<%
			Clientes.MoveNext : Loop : Clientes.Close:Set Clientes=Nothing
		ListaProdutos.MoveNext : Loop : ListaProdutos.Close : Set ListaProdutos=Nothing
  Letras.Movenext : Loop : Letras.Close : Set Letras=Nothing
%>
</table> 
</body> 
</html>

