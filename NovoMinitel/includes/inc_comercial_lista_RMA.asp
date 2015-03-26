<%
MySQL="SELECT     TOP (100) PERCENT dbo.WN_RMA.fechado,dbo.WN_RMA.RMAID, dbo.WN_RMA.no, dbo.WN_RMA.nome, dbo.WN_RMA.TipoDocumento, RTRIM(ISNULL(CAST(dbo.WN_RMA.NDocumento AS char(40)), 'Aguarda Valida&ccedil;&atilde;o')) AS ndocumentotxt, DATEDIFF(day,dbo.WN_RMA.RecepcionadoQuando, GETDATE()) AS Idade,dbo.Get_DesenhoByStatus(dbo.WN_RMA.Recepcionado) AS Recepcionado,dbo.Get_DesenhoByStatus(dbo.WN_RMA.AprovadoComercial) AS AprovadoComercialTXT,AprovadoComercial,dbo.Get_DesenhoByStatus(dbo.WN_RMA.AprovadoDepComercial) AS AprovadoDepComercialTXT, dbo.Get_DesenhoByStatus(dbo.WN_RMA.AprovadoTecnico) as AprovadoTecnicoTXT,dbo.WN_RMA.QuandoInput FROM dbo.WN_RMA INNER JOIN dbo.WN_Clientes ON dbo.WN_RMA.clstamp = dbo.WN_Clientes.clstamp COLLATE Latin1_General_CI_AS WHERE (dbo.WN_Clientes.VendedorNumero = " & Session("vendedornumero") & ") and fechado=0 ORDER BY dbo.WN_RMA.fechado desc,dbo.WN_RMA.RMAID;"
Set Clientes=db.query(cstr(MySQL))
%>
<script language="javascript">
	function muda(nome,valor)
	{
	    var valorx = document.getElementById(nome).search;
		if (valorx.indexOf("&H=1&") != -1)
		{
		document.getElementById(nome).href='/WebAdmin/Includes/DO_RMA_RUN.asp?OP=APC&VALOR=-1&ID=' + valor;
		}
		else
		{
		document.getElementById(nome).href='/WebAdmin/Includes/DO_RMA_RUN.asp?OP=APC&VALOR=-1&H=1&ID=' + valor;
		}
	}
</script>
<table width="600" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
<tr>
   <td height="38" valign="middle" class="Titulo_laranja"><strong>R.M.A.</strong></td>
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
				<td>Qdo Inputado</td>
				<td>Recepc.</td>
				<td>Eu <br />
			    Aprovo </td>
				<td>Dir. Aprova</td>
				<td>Dep.<br />
				  T&eacute;cnico</td>
				<td>Idade</td>
			</tr>
		<%If Clientes.Eof Then%>
		<tr align="center" class="Texto_leranja" bgcolor="#FFFFFF">
		   <td height="38" valign="middle" class="Titulo_laranja" colspan="11"><strong>N&atilde;o ha registos.</strong></td>
		</tr>
		<%Else%>
			<%Do While not Clientes.Eof%>
			<tr align="left" class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F3F3F3'" onMouseOut="this.style.backgroundColor = '<%if Clientes("Fechado")="True" Then response.Write("#CDF1BE") else response.Write("#E7E9FE")%>'" bgcolor="<%if Clientes("Fechado")="True" Then response.Write("#CDF1BE")%>">
				<td width="1%" align="center"><a href="#<%=trim(Clientes("RMAID"))%>" onClick="shoh('ShowRMA<%=trim(Clientes("RMAID"))%>');" name="<%=trim(Clientes("RMAID"))%>" style="text-decoration:none"><b>[+]</b></a></td>
				<td align="center"><%=Clientes("No")%></td>
				<td align="left"><%=Clientes("nome")%></td>
				<td align="center"><%=Clientes("TipoDocumento")%></td>
				<td align="center"><%=Clientes("ndocumentotxt")%></td>
			  <td align="center"><%=formatdatetime(Clientes("quandoinput"),2)%></td>
				<td align="center"><img src="<%=Clientes("recepcionado")%>" /></td>
				<td align="center" nowrap="nowrap">
				<%If isnull(Clientes("AprovadoComercial")) and trim(Clientes("TipoDocumento"))="Devolução" Then%>
					<input title="Haverá substituição por outro produto ?" type="checkbox" name="ProdutoSubstituicao" onclick="javascript:muda('link<%=Clientes("RMAID")%>',<%=Clientes("RMAID")%>)"/> Subs. ?<br />
					<a href="/WebAdmin/Includes/DO_RMA_RUN.asp?OP=APC&VALOR=0&ID=<%=Clientes("RMAID")%>">N&Atilde;O</a>
					/
					<a id="link<%=Clientes("RMAID")%>" href="/WebAdmin/Includes/DO_RMA_RUN.asp?OP=APC&VALOR=-1&ID=<%=Clientes("RMAID")%>">SIM</a>
				<%else%>				
					<img src="<%=Clientes("AprovadoComercialTXT")%>" />
				<%end if%>				</td>
				<td align="center"><img src="<%=Clientes("AprovadoDepComercialTXT")%>" /></td>
				<td align="center"><img src="<%=Clientes("AprovadoTecnicoTXT")%>" /></td>
				<td align="center"><%=Clientes("Idade")%></td>
 			</tr>
			<tr style="display:none" id="ShowRMA<%=trim(Clientes("RMAID"))%>">
				<td colspan="11">
				<%Set ListaProdutos=Db.query(cstr("select * from wn_rma where RMAID=" & Clientes("RMAID")))%>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
					<tr align="center" class="Texto">
						<td align="center" bgcolor="#EEAEB4">Ref.</td>
						<td colspan="2" align="center" bgcolor="#EEAEB4">Designa&ccedil;&atilde;o</td>
						<td align="center" bgcolor="#EEAEB4">Resp.Tecnico</td>
						<td align="center" bgcolor="#EEAEB4">Status</td>
						<td align="center" bgcolor="#EEAEB4">N&ordm;Pat</td>
					</tr>
					<tr align="center" class="Texto">
						<td align="center"><%=ListaProdutos("Ref")%></td>
						<td colspan="2" align="center"><%=ListaProdutos("Design")%></td>
						<td align="center"><%=ListaProdutos("tecnnm")%></td>
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
					</table>				</td>
			</tr>
			<%Clientes.MoveNext:Loop:Clientes.Close%>
		<%End if%>
		</table>
	</td>
</tr>	
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
<%Set Clientes=Nothing%>