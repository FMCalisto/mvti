<%
	If isempty(Session("NO")) Then response.Redirect("/index.asp")
	MySQL="SELECT Distinct fno, fdata, ettiliq from WN_FacturasPHC WHERE (no = " & Session("NO") & ") order by fno asc "
	Set Clientes=db.query(cstr(MySQL))
%>
<table width="100%" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
	<tr>
		<td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="lista_produtos_direita">
		 <tr>
		   <td height="38" valign="middle" class="Titulo_laranja"><strong>Facturas nos ultimos 30dias</strong></td>
		 </tr>
		 </table>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="lista_produtos_direita">
		 <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#81B9D1">
		   <td></td>
		   <td align="center"><strong>Numero</strong></td>
		   <td align="right"><strong>Total Euros</strong></td>
		   <td align="center"><strong>Data</strong></td>
		 </tr>
		<%If Clientes.Eof Then%>
		 <tr>
		   <td height="38" colspan="3" valign="middle" class="Titulo_laranja" align="center"><strong>N&atilde;o ha registos.</strong></td>
		 </tr>
		 <%Else%>
			<%Do while not Clientes.Eof%>
			<tr class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F3F3F3'" onMouseOut="this.style.backgroundColor = '#E7E9FE'" bgcolor="#F3F3F3">
			   <td align="center"><a href="#" onClick="shoh('first<%=trim(Clientes("fno"))%>');" style="text-decoration:none"><b>[+]</b></a></td>
			   <td align="center"><strong><%=Clientes("fno")%></strong></td>
			   <td align="right"><strong><%=formatnumber(Clientes("ettiliq"),2)%></strong></td>
			   <td align="right"><strong><%=Clientes("fdata")%>&nbsp;&nbsp;</strong></td>
			 </tr>
			 <tr>
			 	<td colspan="4" style="display:none" id="first<%=trim(Clientes("fno"))%>">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
				   	    <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#996699">
							<td align="left">Ref</td>
							<td align="left">Design</td>
							<td align="center">Qt</td>
							<td align="right">Pre&ccedil;o</td>
							<td align="right">Desc %</td>
							<td align="right">Total</td>
						</tr>
						<%
							MySQL="SELECT ref,rtrim(left(design,30)) design,qtt,epv,desconto,etiliquido FROM dbo.WN_FacturasPHC WHERE  (fno = '" & clientes("fno") & "')"
							Set ListaProdutos=db.query(cstr(MySQL))
							Do while not ListaProdutos.Eof
						%>						
								<tr class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F0F3F0'" onMouseOut="this.style.backgroundColor = '#E0E9F0'" bgcolor="#F0F3F0">
									<td align="left"><%=ListaProdutos("ref")%></td>
									<td align="left"><%=ListaProdutos("design")%></td>
									<td align="center"><%=ListaProdutos("qtt")%></td>
									<td align="right"><%=formatnumber(ListaProdutos("epv"),2)%></td>
									<td align="right"><%=formatnumber(ListaProdutos("desconto"),2)%></td>
									<td align="right"><%=formatnumber(ListaProdutos("etiliquido"),2)%></td>
								</tr>
							<%ListaProdutos.MoveNext:Loop:ListaProdutos.Close:Set ListaProdutos=nothing%>
					</table>
				</td>
   		    </tr>
			<%Clientes.MoveNext:Loop:Clientes.Close%>
		 <%End if%>
		 </table>
<!--------------------------->
	 </td>
 </tr>
 </table>
<%Set Clientes=Nothing%>