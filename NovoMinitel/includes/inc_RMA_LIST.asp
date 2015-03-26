<%
if ListaProdutos.Eof Then%>
	<table width="99%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
		<tr align="center">
		  <td height="23" bgcolor="#E06D76" class="Texto_branco">
			Hist&oacute;rico de R.M.A. </td>
		</tr>
		<tr align="center" class="Texto">
			<td width="100%" align="center">Sem registos </td>
		</tr>
	</table>
<%Else%>
	<table width="99%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
		<tr align="center">
		  <td height="23" colspan="7" bgcolor="#E06D76" class="Texto_branco">
			Equipamentos submetidos devolvidos</td>
		</tr>
		<tr align="center" class="Texto">
			<td align="center" bgcolor="#EEAEB4" colspan="2">Tipo <br />de Documento</td>
		  	<td align="center" bgcolor="#EEAEB4">N&uacute;mero<br />Factura</td>
			<td align="center" bgcolor="#EEAEB4">N&uacute;mero<br />
		    Serie</td>
			<td align="center" bgcolor="#EEAEB4">N&uacute;mero<br />
		    Documento</td>
			<td align="center" bgcolor="#EEAEB4">Recepcionado</td>
			<td align="center" bgcolor="#EEAEB4">Dias</td>
		</tr>
		<%Do While Not ListaProdutos.EOF%>
			<tr align="left" class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F3F3F3'" onMouseOut="this.style.backgroundColor = '#FFFFFF'">
				<td width="1%" align="center"><a href="#" onClick="shoh('RMA<%=trim(ListaProdutos("RMAID"))%>');" style="text-decoration:none"><b>[+]</b></a></td>
				<td align="center"><%=ListaProdutos("TipoDocumento")%></td>
				<td align="center"><%=ListaProdutos("fno")%></td>
				<td align="center"><%=ListaProdutos("serie")%></td>
				<td align="center"><%=ListaProdutos("ndocumentotxt")%></td>
				<td align="center"><img src="<%=ListaProdutos("Recepcionado")%>" alt="" /></td>
				<td align="center"><%=ListaProdutos("Idade")%></td>
			</tr>
			<tr>
				<td colspan="7" style="display:none" id="RMA<%=trim(ListaProdutos("RMAID"))%>">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
					<tr align="center" class="Texto">
						<td align="center" bgcolor="#EEAEB4">Refer&ecirc;ncia</td>
						<td colspan="2" align="center" bgcolor="#EEAEB4">Designa&ccedil;&atilde;o</td>
						<td align="center" bgcolor="#EEAEB4">Resp.Tecnico</td>
						<td align="center" bgcolor="#EEAEB4">Status </td>
						<td align="center" bgcolor="#EEAEB4">N&ordm;Pat</td>
					</tr>
					<tr align="center" class="Texto">
						<td align="center"><%=ListaProdutos("Ref")%></td>
						<td colspan="2" align="center"><%=ListaProdutos("Design")%></td>
						<td align="center"><%=ListaProdutos("Tecnnm")%></td>
						<td align="center"><%=ListaProdutos("stpub")%></td>
						<td align="center"><%=ListaProdutos("nopat")%></td>
					</tr>
					<tr align="center" class="Texto">
						<td align="center" bgcolor="#EEAEB4">Data Fact.</td>
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
					<tr align="center" class="Texto">
						<td align="center" bgcolor="#EEAEB4">Marca</td>
						<td align="center" bgcolor="#EEAEB4">Modelo</td>
						<td colspan="4" align="center" bgcolor="#EEAEB4">V/Refer&ecirc;ncia</td>
					  </tr>
					<tr align="center" class="Texto">
						<td align="center"><%=ListaProdutos("Marca")%></td>
						<td align="center"><%=ListaProdutos("Modelo")%></td>
						<td colspan="4" align="center"><%=ListaProdutos("vref")%></td>
					  </tr>
					<tr>
						<td width="100%" align="center" bgcolor="#EEAEB4" colspan="6"></td>
					</table>
				</td>
			</tr>
		<%ListaProdutos.MoveNext:Loop:ListaProdutos.Close%>
	</table>
	<br />
	<table width="99%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center"  class="Texto">

		<tr>
			<td width="100%" align="center" bgcolor="#EEAEB4"></td>
		</tr>
		<tr align="left">
			<td><strong>Legenda :</strong><br /><br /></td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;<img src="/images/stock_carro_breve.gif" /> Indeterminado / Falta analisar</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;<img src="/images/stock_carro_off.gif" /> Não aceite </td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;<img src="/images/stock_carro_on.gif" />  Aceite / OK </td>
		</tr>
	</table>	
<%End if%>
