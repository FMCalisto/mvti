<%
	If isempty(Session("NO")) Then response.Redirect("/index.asp")
	MySQL="SELECT bostamp, obrano, dataobra, dataopen, obranome FROM dbo.WN_EncomendasPHC WHERE     (no = " & Session("NO") & ") GROUP BY bostamp, obrano, dataobra, dataopen, obranome order by obrano asc "
	Set Clientes=db.query(cstr(MySQL))
%>
<table width="100%" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
	<tr>
		<td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="lista_produtos_direita">
		 <tr>
		   <td height="38" valign="middle" class="Titulo_laranja"><strong>Encomendas Pendentes</strong></td>
		 </tr>
		 </table>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="lista_produtos_direita">
		 <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#81B9D1">
		   <td></td>
		   <td><strong>Dossier</strong></td>
		   <td><strong>V/Refer&ecirc;ncia</strong></td>
		   <td align="center"><strong>Data</strong></td>
		 </tr>
		<%If Clientes.Eof Then%>
		 <tr>
		   <td height="38" colspan="3" valign="middle" class="Titulo_laranja" align="center"><strong>N&atilde;o ha registos.</strong></td>
		 </tr>
		 <%Else%>
			<%Do while not Clientes.Eof%>
			<tr class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F3F3F3'" onMouseOut="this.style.backgroundColor = '#E7E9FE'" bgcolor="#F3F3F3">
			   <td align="center"><a href="#" onClick="shoh('first<%=trim(Clientes("bostamp"))%>');" style="text-decoration:none"><b>[+]</b></a></td>
			   <td align="center"><strong><%=Clientes("obrano")%></strong></td>
			   <td align="left"><strong><%=Clientes("obranome")%></strong></td>
			   <td align="center"><strong><%=Clientes("dataobra")%></strong></td>
			 </tr>
			 <tr>
			 	<td colspan="4" style="display:none" id="first<%=trim(Clientes("bostamp"))%>">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
				   	    <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#996699">
							<td>Ref</td>
							<td>Design</td>
							<td>€ Total</td>
							<td>Qt.</td>
						</tr>
						<%
							MySQL="SELECT ref,left(design,20) design,qtt-qtt2 as Falta,ettdeb FROM dbo.WN_EncomendasPHC WHERE  (bostamp = '" & clientes("bostamp") & "') and qtt-qtt2<>0 order by lordem "
							Set ListaProdutos=db.query(cstr(MySQL))
							Do while not ListaProdutos.Eof
						%>						
								<tr class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F0F3F0'" onMouseOut="this.style.backgroundColor = '#E0E9F0'" bgcolor="#F0F3F0">
									<td align="left"><%=ListaProdutos("ref")%></td>
									<td align="left"><%=ListaProdutos("design")%></td>
									<td align="right"><%=ListaProdutos("ettdeb")%></td>
									<td align="center"><%=ListaProdutos("Falta")%></td>
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