		  <tr>
          <td height="24"  valign="middle" class="Texto_castanho"><strong>Adiccionar e-mail
                para receber a newsletter electr&oacute;nica</strong><span class="Texto"></span></td>
		  </tr>
		  <tr>
	          <td height="24" valign="middle"><input class="Texto"type="text" size="30" maxlength="45" name="email" id="email" /></td>
		  </tr>
		  <tr>
            <td height="24" align="center" valign="middle"><input name="botao3" type="submit" class="Texto" id="botao3" value="Submeter" onclick="return validamail();"/></td>
		  </tr>
		  <tr>
          <td height="24"  valign="middle" class="Texto_castanho"><strong>Endere&ccedil;os extra onde recebe
              a newsletter : </strong></td>
		  </tr>
		  <tr>
	          <td height="24"  valign="middle" align="left">
			  <table width="100%" cellpadding="0"  cellspacing="0" border="0" style="border-bottom-style: dotted;border-bottom-width: 1px;border-bottom-color: #CCCCCC;">
					<%
					MySQL="select CLSTAMP,Clientes_OutrosMailsID,EMAIL from WN_Clientes_OutrosEMails where no=" & session("NO") & " order by email asc;"
					Set Clientes=db.query(cstr(MySQL))
					%>
					<%If Clientes.EOF Then%>
					<tr align="center">
						<td colspan="2" class="Titulo_laranja">Sem registos</td>
					</tr>
					<%Else%>
						<%Do While not Clientes.EOF%>
						<tr class="Texto">
							<td width="5%" align="center"><a onclick="javascript:return confirm('Tem a certeza ?');" href="/includes/inc_ClienteFichaSiteRUN.asp?CLSTAMP=<%=trim(clientes("CLSTAMP"))%>&ID=<%=trim(clientes("Clientes_OutrosMailsID"))%>"><img src="../images/apagar.gif" border="0" alt="Apagar registo" /></a></td>
							<td width="95%"><%=Clientes("Email")%></td>
						</tr>
						<%Clientes.MoveNext:Loop:Clientes.Close:Set Clientes=Nothing%>					
					<%End if%>
			  </table>
			  </td>
		  </tr>
