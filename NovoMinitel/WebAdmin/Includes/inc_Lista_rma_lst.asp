<%
MySQL="SELECT     TOP (100) PERCENT wn_rma.fechado,dbo.WN_RMA.RMAID, dbo.WN_RMA.no, dbo.WN_RMA.nome, dbo.WN_RMA.TipoDocumento, RTRIM(ISNULL(CAST(dbo.WN_RMA.NDocumento AS char(40)), 'Aguarda Valida&ccedil;&atilde;o')) AS ndocumentotxt, DATEDIFF(day,                    dbo.WN_RMA.RecepcionadoQuando, GETDATE()) AS Idade,dbo.Get_DesenhoByStatus(dbo.WN_RMA.Recepcionado) AS Recepcionado, dbo.WN_RMA.QuandoInput FROM dbo.WN_RMA INNER JOIN dbo.WN_Clientes ON dbo.WN_RMA.clstamp = dbo.WN_Clientes.clstamp COLLATE Latin1_General_CI_AS WHERE 1=1 ORDER BY fechado asc,dbo.WN_RMA.RMAID;"
Set Clientes=db.query(cstr(MySQL))
%>

<table width="600" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
<tr>
   <td height="38" valign="middle" class="Titulo_laranja"><strong>Devoluções</strong></td>
</tr>
<tr>
	<td>
		<table bgcolor="#E7E9FE" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" class="lista_produtos_direita" border="1" width="100%">
			<tr align="center" class="Texto_branco" bgcolor="#82B7F2">
				<td>&nbsp;</td>
				<td>Nº</td>
				<td>Nome</td>
				<td>Documento</td>
				<td>NºDoc.</td>
				<td>Idade</td>
				<td>Recepcionado</td>
				<td>Qdo Inputado</td>
			</tr>
		<%If Clientes.Eof Then%>
		<tr align="center" class="Texto_leranja" bgcolor="#FFFFFF">
		   <td height="38" valign="middle" class="Titulo_laranja" colspan="8"><strong>N&atilde;o ha registos.</strong></td>
		</tr>
		<%Else%>
			<%Do While not Clientes.Eof%>
			<tr align="left" class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F3F3F3'" onMouseOut="this.style.backgroundColor = '#E7E9FE'">
				<td width="1%" align="center"><a href="#<%=trim(Clientes("RMAID"))%>" onClick="shoh('ShowRMA<%=trim(Clientes("RMAID"))%>');" name="<%=trim(Clientes("RMAID"))%>" style="text-decoration:none"><b>[+]</b></a></td>
				<td align="center"><%=Clientes("No")%></td>
				<td align="left"><%=Clientes("nome")%></td>
				<td align="center"><%=Clientes("TipoDocumento")%></td>
				<td align="center"><%=Clientes("ndocumentotxt")%></td>
				<td align="center"><%=Clientes("Idade")%></td>
				<td align="center"><img src="<%=Clientes("recepcionado")%>" /></td>
				<td align="center"><%=Clientes("quandoinput")%></td>
 			</tr>
			<tr style="display:none" id="ShowRMA<%=trim(Clientes("RMAID"))%>">
				<td colspan="8">
				<%Set ListaProdutos=Db.query(cstr("select * from wn_rma where RMAID=" & Clientes("RMAID")))%>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
					<tr align="center" class="Texto">
						<td align="center" bgcolor="#EEAEB4">Ref.</td>
						<td colspan="2" align="center" bgcolor="#EEAEB4">Designa&ccedil;&atilde;o</td>
						<td align="center" bgcolor="#EEAEB4">Tec. Minitel </td>
						<td align="center" bgcolor="#EEAEB4">Estado Repara&ccedil;&atilde;o </td>
						<td align="center" bgcolor="#EEAEB4">N&ordm;Pat</td>
					</tr>
					<tr align="center" class="Texto">
						<td align="center"><%=ListaProdutos("Ref")%></td>
						<td colspan="2" align="center"><%=ListaProdutos("Design")%></td>
						<td align="center"><%=ListaProdutos("cmdesc")%></td>
						<td align="center"><%=ListaProdutos("stpub")%></td>
						<td align="center"><%=ListaProdutos("nopat")%></td>
					</tr>
					<tr align="center" class="Texto">
						<td align="center" bgcolor="#EEAEB4">F. Data</td>
						<td align="center" bgcolor="#EEAEB4">Contacto</td>
						<td colspan="2" align="center" bgcolor="#EEAEB4">Motivo</td>
						<td colspan="2" align="center" bgcolor="#EEAEB4">Sintoma</td>
					  </tr>
					<tr align="center" class="Texto">
						<td align="center"><%=ListaProdutos("fdata")%></td>
						<td align="center"><%=ListaProdutos("ContactoCliente")%></td>
						<td colspan="2" align="center"><%=ListaProdutos("Motivo")%></td>
						<td colspan="2" align="center"><%=ListaProdutos("Sintoma")%></td>
					  </tr>
					<tr>
						<td width="100%" align="center" bgcolor="#EEAEB4" colspan="6"></td>
					</table>
				</td>
			</tr>
			<%Clientes.MoveNext:Loop:Clientes.Close%>
		<%End if%>
		</table>
	</td>
</tr>	
</table>
<%Set Clientes=Nothing%>