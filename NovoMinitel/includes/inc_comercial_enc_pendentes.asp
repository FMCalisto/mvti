<%
If isempty(Session("vendedornumero")) Then response.Redirect("/includes/DO_logout_run.asp")
MySQL="SELECT TOP (100) PERCENT dbo.WN_Clientes.no,dataopen, left(dbo.WN_Clientes.nome,30) as Nome, dbo.WN_EncomendasPHC.obrano, DATEDIFF(day,dbo.WN_EncomendasPHC.dataopen, GETDATE()) AS Idade, SUM(dbo.WN_EncomendasPHC.qtt - dbo.WN_EncomendasPHC.qtt2) AS FaltaEntregar, dbo.WN_EncomendasPHC.obranome FROM         dbo.WN_EncomendasPHC INNER JOIN dbo.WN_Clientes ON dbo.WN_EncomendasPHC.no = dbo.WN_Clientes.no GROUP BY dbo.WN_EncomendasPHC.obrano, dbo.WN_EncomendasPHC.dataopen, dbo.WN_EncomendasPHC.obranome, dbo.WN_Clientes.no,dbo.WN_Clientes.nome, DATEDIFF(day, dbo.WN_EncomendasPHC.dataopen, GETDATE()), dbo.WN_Clientes.VendedorNumero HAVING (dbo.WN_Clientes.VendedorNumero = " & Session("vendedornumero") & ") ORDER BY dbo.WN_EncomendasPHC.dataopen ;"
Set Clientes=db.query(cstr(MySQL))
%>
<table width="600" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
<tr>
   <td height="38" valign="middle" class="Titulo_laranja"><strong>Encomendas Pendentes - Comercial no.: <%=Session("vendedornumero")%></strong></td>
</tr>
<tr>
	<td>
		<table bgcolor="#E7E9FE" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" class="lista_produtos_direita" border="1" width="100%">
			<tr align="center" class="Texto_branco" bgcolor="#82B7F2">
				<td width="5%">Nº</td>
				<td width="40%">Nome</td>
				<td width="5%">Dossier</td>
				<td width="5%">Data</td>
				<td width="20%">Idade</td>
				<td width="20%">Ref/Cliente</td>
				<td width="5%">Pend.</td>
			</tr>
		<%If Clientes.Eof Then%>
		<tr align="center" class="Texto_leranja" bgcolor="#FFFFFF">
		   <td height="38" valign="middle" class="Titulo_laranja" colspan="7"><strong>N&atilde;o ha registos.</strong></td>
		</tr>
		<%Else%>
			<%Do While not Clientes.Eof%>
			<tr align="left" class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F3F3F3'" onMouseOut="this.style.backgroundColor = '#E7E9FE'">
				<td align="center"><%=Clientes("No")%></td>
				<td><%=Clientes("nome")%></td>
				<td align="center"><%=Clientes("obrano")%></td>
				<td><%=Clientes("dataopen")%></td>
				<td align="center"><%=Clientes("Idade")%></td>
				<td><%=Clientes("obranome")%></td>
				<td><%=Clientes("FaltaEntregar")%></td>
 			</tr>
			<%Clientes.MoveNext:Loop:Clientes.Close%>
		<%End if%>
		</table>
	</td>
</tr>	
</table>
<%Set Clientes=Nothing%>