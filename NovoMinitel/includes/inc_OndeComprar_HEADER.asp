	<table width="100%"  border="0" bgcolor="#FFFFFF">
		<tr height="65"><td align="center"><img src="/images/Logotipos/Retalho/lojas_destaque.gif" alt="Destaque" /></td></tr>	
		<%
		MySQL="select * from [View_WN_Publicidade_ProdutoID] where ststamp='"& BTxt & "'"
		Set Clientes=db.query(cstr(MySQL))
		If Not Clientes.EOF Then
		AInt=75
		Do While Not Clientes.EOF%>
		<tr height="<%=Aint%>">
				<td align="center"><a href="http://<%=trim(clientes("WebSite"))%>"></a><a href="http://<%=trim(clientes("WebSite"))%>"><img src="/images/logotipos/retalho/<%=clientes("Logotipo")%>" width="<%=Aint%>" border="0" title="<%=trim(clientes("nome"))%>" /></a></td>
		</tr>	
			<%Clientes.MoveNext:Loop:Clientes.Close:Set Clientes=Nothing%>
		<%End if%>
		<tr height="<%=Aint%>">
			<td align="center">
			<a href="javascript:openpopup('/includes/PedirOrcamento.asp?CLStamp=12069&ProdutoID=<%=BTxt%>')"><img src="/images/Logotipos/Retalho/loja_MZP.gif" alt="MZP" border="0"></a></td>
		</tr>	
		<tr height="65"><td align="center"><a href="http://www.vidaportatil.pt"><img src="../images/Logotipos/Retalho/loja_vidaportatil.gif" alt="VidaPort&aacute;til ComputerStore" border="0" /></a></td></tr>	
		<tr height="65"><td align="center"><img src="/images/Logotipos/Retalho/loja_nova.gif" alt="Espaço disponivel" /></td></tr>	
		<tr height="65"><td align="center"><img src="/images/Logotipos/Retalho/loja_nova.gif" alt="Espaço disponivel" /></td></tr>	
	</table>
