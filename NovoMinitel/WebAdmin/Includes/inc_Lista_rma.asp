<link href="/includes/minitel.css" rel="stylesheet" type="text/css">
<%
MySQL="SELECT  * from  View_RMA_Backoffice ORDER BY Idade DESC, fechado DESC, RMAID;"
Set Clientes=db.query(cstr(MySQL))
%>
<table width="650" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita" align="center">
<tr align="center">
   <td height="38" valign="middle" class="Titulo_laranja"><strong>Lista de Devolu&ccedil;&otilde;es </strong></td>
</tr>
<tr>
	<td>
		<table bgcolor="#E7E9FE" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" class="lista_produtos_direita" border="1" width="100%">
			<tr align="center" class="Texto_branco" bgcolor="#82B7F2">
				<td>RMA</td>
				<td>Nº</td>
				<td>Nome</td>
				<td>Documento</td>
				<td>P.A.T.</td>
				<td>NºDoc.</td>
				<td>Recepcionado</td>
				<td>Qdo Inputado</td>
				<td>Idade</td>
			</tr>
		<%If Clientes.Eof Then%>
		<tr align="center" class="Texto_leranja" bgcolor="#FFFFFF">
		   <td height="38" valign="middle" class="Titulo_laranja" colspan="9"><strong>N&atilde;o ha registos.</strong></td>
		</tr>
		<%Else%>
			<%Do While not Clientes.Eof%>
			<tr align="left" class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F3F3F3'" onMouseOut="this.style.backgroundColor = '<%if Clientes("Fechado")="True" Then response.Write("#CDF1BE") else response.Write("#E7E9FE")%>'" bgcolor="<%if Clientes("Fechado")="True" Then response.Write("#CDF1BE")%>">
				<td width="1%" align="left" nowrap="nowrap"><a href="#<%=trim(Clientes("RMAID"))%>" onClick="shoh('ShowRMA<%=trim(Clientes("RMAID"))%>');" name="<%=trim(Clientes("RMAID"))%>" style="text-decoration:none"><b>[+]<%=Clientes("RMAID")%></b></a></td>
				<td align="center"><%=Clientes("No")%></td>
				<td align="left"><%=Clientes("nome")%></td>
				<td align="center"><%=Clientes("TipoDocumento")%></td>
				<td align="center">
				<%if isnumeric(Clientes("NOPAt")) Then
					if clng(Clientes("NOPAt")) > 0 Then
						%><%=Clientes("NOPAt")%><%
					else
						%><img src="<%=Clientes("patTXT")%>"/><%
					end if
				Else
					if ucase(rtrim(Clientes("TipoDocumento")))="REPARAÇÃO" Then
						%>
		<a href="/WebAdmin/Includes/DO_RMA_RUN.ASP?OP=CRIAPAT&VALOR=0&ID=<%=Clientes("RMAID")%>">N&Atilde;O</a>
		<img src="<%=Clientes("patTXT")%>"/>
		<a href="/WebAdmin/Includes/DO_RMA_RUN.ASP?OP=CRIAPAT&VALOR=-1&ID=<%=Clientes("RMAID")%>">SIM</a>
						<%
					else
							if rtrim(Clientes("TipoDocumento"))="D.O.A." and not isnumeric(Clientes("NDocumentoTXT")) Then
				REM Dia 2008.05.16 Rui Martinho pediu-me que os DOAs fosse processados como PATs, logo esta parte ficou PARADA NO TEMPO
				REM OP=CRIADOA passou para OP=CRIAPAT, assim mantenho o código intacto
								%>
				<a href="/WebAdmin/Includes/DO_RMA_RUN.ASP?OP=CRIAPAT&VALOR=0&ID=<%=Clientes("RMAID")%>">N&Atilde;O</a>
				<img src="<%=Clientes("patTXT")%>"/>
				<a href="/WebAdmin/Includes/DO_RMA_RUN.ASP?OP=CRIAPAT&VALOR=-1&ID=<%=Clientes("RMAID")%>">SIM</a>
								<%
							else
								%>&nbsp;<%
							end if	
					end if
				End if%>					</td>
				<td align="center"><%=Clientes("ndocumentotxt")%></td>
				<td align="center"><%if isnull(Clientes("recepcionado"))  Then%>
                  <a href="/WebAdmin/Includes/DO_RMA_RUN.ASP?OP=RECEBIDO&VALOR=0&ID=<%=Clientes("RMAID")%>">N&Atilde;O</a>
                  <%End if%>
                  <img src="<%=Clientes("recepcionadotxt")%>" />
                  <%if isnull(Clientes("recepcionado")) Then%>
                  <a href="/WebAdmin/Includes/DO_RMA_RUN.ASP?OP=RECEBIDO&VALOR=-1&ID=<%=Clientes("RMAID")%>">SIM</a>
              <%End if%></td>
				<td align="center"><%=Clientes("quandoinput")%></td>
				<td align="center"><%=Clientes("Idade")%></td>
 			</tr>
			<tr style="display:none" id="ShowRMA<%=trim(Clientes("RMAID"))%>">
				<td colspan="9">
				<%Set ListaProdutos=Db.query(cstr("select * from wn_rma where RMAID=" & Clientes("RMAID")))%>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
					<tr align="center" class="Texto" bgcolor="#EEAEB4">
						<td align="center">N&ordm;Factura.</td>
						<td align="center">F. Data</td>
						<td align="center">Contacto</td>
						<td align="center">Tec. Minitel</td>
					</tr>
					<tr align="center" class="Texto">
						<td align="center"><%=ListaProdutos("fno")%></td>
						<td align="center"><%=ListaProdutos("fdata")%></td>
						<td align="center"><%=ListaProdutos("ContactoCliente")%></td>
						<td align="center"><%=ListaProdutos("tecnnm")%></td>
					</tr>
					<tr align="center" class="Texto" bgcolor="#EEAEB4">
						<td align="center">Ref</td>
						<td align="center">Designa&ccedil;&atilde;o</td>
						<td align="center">N&ordm;Pat</td>
						<td align="center">E. Repara&ccedil;&atilde;o</td>
					  </tr>
					<tr align="center" class="Texto">
					  <td align="center"><%=ListaProdutos("Ref")%></td>
					  <td align="center"><%=ListaProdutos("Design")%></td>
					  <td align="center"><%=ListaProdutos("nopat")%></td>
					  <td align="center"><%=ListaProdutos("stpub")%></td>
 				    </tr>
					<tr align="center" class="Texto" bgcolor="#EEAEB4">
					  <td align="center">Motivo</td>
					  <td align="center">&nbsp;</td>
					  <td align="center">Sintoma</td>
					  <td align="center">&nbsp;</td>
 				    </tr>
					<tr align="center" class="Texto">
					  <td align="center"><%=ListaProdutos("Motivo")%></td>
					  <td align="center">&nbsp;</td>
					  <td align="center"><%=ListaProdutos("Sintoma")%></td>
					  <td align="center">&nbsp;</td>
 				    </tr>
					<tr>
						<td width="100%" align="center" bgcolor="#EEAEB4" colspan="6"></td>
					<tr>
					  <td align="center" bgcolor="#EEAEB4" colspan="4"></td>
				    <tr>
		            </table>				</td>
			</tr>
			<%Clientes.MoveNext:Loop:Clientes.Close%>
		<%End if%>
		</table>
	</td>
</tr>	
</table>
<%Set Clientes=Nothing%>