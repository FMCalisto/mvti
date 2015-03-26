<table width="95%" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita" align="center">
	<%Set ListaProdutos=db.query("Select Distinct Ano From WN_ClientesComprasQuarter where clstamp='" & request.QueryString("ClStamp") & "';")%>
	<%
	If not ListaProdutos.EOF Then
	Do While Not ListaProdutos.EOF%>
	<tr class="Texto_castanho" align="center" bgcolor="#DFDFD0">
		<td width="100%" colspan="4" bgcolor="#C5C5C5" class="Titulo_laranja">Ano <%=ListaProdutos("Ano")%></td>
	</tr>
	<tr class="Texto_branco" align="center" bgcolor="#81B9D1">
		<td width="25%">Q1</td>
		<td width="25%">Q2</td>
		<td width="25%">Q3</td>
		<td width="25%">Q4</td>
	</tr>
	<tr class="Texto_branco" align="center" bgcolor="#81B9D1" valign="top">
		<td width="25%"><%=Quarter(ListaProdutos("Ano"),1)%></td>
		<td width="25%"><%=Quarter(ListaProdutos("Ano"),2)%></td>
		<td width="25%"><%=Quarter(ListaProdutos("Ano"),3)%></td>
		<td width="25%"><%=Quarter(ListaProdutos("Ano"),4)%></td>
	</tr>
	<tr class="Texto_branco" align="center" bgcolor="#81B9D1">
		<td width="25%"><%=db.query(cstr("Select isnull(sum(etiliquido),0) as Total from WN_ClientesComprasQuarter where clstamp='" & request.QueryString("ClStamp") & "' and quarter=1 and ano=" & ListaProdutos("Ano")))("Total")%>&euro;</td>
		<td width="25%"><%=db.query(cstr("Select isnull(sum(etiliquido),0) as Total from WN_ClientesComprasQuarter where clstamp='" & request.QueryString("ClStamp") & "' and quarter=2 and ano=" & ListaProdutos("Ano")))("Total")%>&euro;</td>
		<td width="25%"><%=db.query(cstr("Select isnull(sum(etiliquido),0) as Total from WN_ClientesComprasQuarter where clstamp='" & request.QueryString("ClStamp") & "' and quarter=3 and ano=" & ListaProdutos("Ano")))("Total")%>&euro;</td>
		<td width="25%"><%=db.query(cstr("Select isnull(sum(etiliquido),0) as Total from WN_ClientesComprasQuarter where clstamp='" & request.QueryString("ClStamp") & "' and quarter=4 and ano=" & ListaProdutos("Ano")))("Total")%>&euro;</td>
	</tr>
	<tr>
	<tr class="Texto_castanho" align="center" bgcolor="#DFDFD0">
		<td colspan="3" bgcolor="#C5C5C5">&nbsp;</td>
		<td width="100%" bgcolor="#C5C5C5" class="Titulo_laranja">Total : 
		<%=db.query(cstr("Select isnull(sum(etiliquido),0) as Total from WN_ClientesComprasQuarter where clstamp='" & request.QueryString("ClStamp") & "' and ano=" & ListaProdutos("Ano")))("Total")%>&euro;
		</td>
	</tr>
	<%ListaProdutos.MoveNext:Loop:ListaProdutos.Close:Set ListaProdutos=Nothing
	else
	%>	
	<tr class="Texto_castanho" align="center">
		<td width="100%">Ha 2 trimestres não não faz compras na MINTEL</td>
	</tr>
	<%
	End if%>
</table>
