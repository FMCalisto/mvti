<link href="/includes/MINITEL.css" rel="stylesheet" type="text/css">
<%
Function Quarter(Ano,Qx)
Dim LocalRS
	MySQL="Select usr1,etiliquido from WN_ClientesComprasQuarter where ano=" & Ano & " and quarter=" & Qx & " and ClStamp='" & request.QueryString("ClStamp") & "'"
	Set LocalRS=db.query(cstr(MySQL))
	IF Not LocalRS.Eof Then
	%>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="Texto_branco">
		<%Do While Not(LocalRS.EOF)%>
		<tr>
			<td align="left"><%=LocalRS("Usr1")%></td>
			<td align="right"><%=Moeda(LocalRS("etiliquido"))%></td>
		</tr>
		<%LocalRS.MoveNext:Loop%>
	</table>
	<%
	Else
		%>&nbsp;<%
	End if
	LocalRS.Close
	Set LocalRS=Nothing
End Function
%>
<br />
<!-- #include file="inc_ClienteACT_TabelaQuarter.asp"-->
<br />
<!-- #include file="inc_clientes_MarcasOndeComprar.asp"-->
<br />
<%
if request.QueryString("MODE")="EDIT" Then
	MySQL="select WN_Clientes_ACT.*,Zona from WN_Clientes_ACT INNER JOIN WN_Clientes ON WN_Clientes_ACT.clstamp = WN_Clientes.clstamp COLLATE Latin1_General_CI_AS where WN_Clientes_ACT.ClStamp='" & request.QueryString("ClStamp") & "' and IDWN_Clientes_ACT=" & request.QueryString("ID")
	Set Clientes=db.query(cstr(MySQL))
Else
	MySQL="Select obs,no,Nome,ClStamp,zona From WN_Clientes where ClStamp='" & request.QueryString("ClStamp") & "'"
	Set Clientes=db.query(cstr(MySQL))
End if

If request.QueryString("MODE")="EDIT"  Then
	ATxt=clientes("Texto")
	BTXt=clientes("Data")
	CTXT=trim(clientes("IDWN_Clientes_ACT"))
	DTXT="EDIT"
Else
	ATXt="Escrever aqui o relatório...."
	BTXt=formatdatetime(Now(),2)
	CTXT=""
	DTXT=""
End if
%>
<form action="includes/inc_ClienteACTRUN.asp" method="post">
<table width="95%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita" align="center">
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr height="20" class="Texto_azul">
		<td width="80%"><%=Clientes("NO")%> : <%=Clientes("NOME")%> </td>
		<td align="right">Data :&nbsp;</td>
		<td align="left"><input name="data" type="text" class="Texto" value="<%=BTxt%>" size="7" maxlength="10"></td>
	</tr>
	<tr height="20" class="Texto_azul">
		<td width="100%" colspan="3">Zona : <%=Clientes("Zona")%> </td>
	</tr>
	<tr height="20" class="Texto_azul">
		<td colspan="3" ><a href="#" onclick="javascript:openpopup('/includes/inc_ClienteACT_observacoes.asp?CLSTAMP=<%=request.QueryString("ClStamp")%>');" title="Ver observações...">Ver observações...</a></td>
	</tr>
	<tr height="20" class="Titulo_laranja">
		<td colspan="3" >Divida : <%=db.query(cstr("Select divida from wn_clientes where ClStamp='" & request.QueryString("ClStamp") & "'"))("divida")%> &euro; Atenção que este valor não está 100% correcto !</td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr align="center">
		<td colspan="3"><textarea name="texto" class="Texto_azul" rows="10" cols="80"><%=ATXt%></textarea></td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
		<td align="left"><input type="submit" value="Gravar" class="Texto_castanho" onClick="return confirm('Tens a certeza!?');" name="Gravar"></td>
	</tr>
</table>
	<input type="hidden" name="clstamp" value="<%=trim(clientes("clstamp"))%>">
	<input type="hidden" name="ID" value="<%=CTXT%>">
	<input type="hidden" name="OP" value="<%=DTXT%>">
	
</form>
<%Clientes.close%>
<table width="95%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita" align="center">
	<tr class="Texto_branco" align="center" bgcolor="#81B9D1">
		<td width="80%">Texto</td>
		<td width="10%">Data</td>
		<td width="5%">&nbsp;</td>
		<td width="5%">&nbsp;</td>
	</tr>
	<%
	MySQL="Select * from WN_Clientes_ACT where activa=1 and vendedornumero=" & Session("vendedornumero") & " and ClStamp='" & request.QueryString("ClStamp") & "' order by Data desc"
	Set Clientes=db.query(cstr(MySQL))
	If Clientes.eof Then
		%>
		<tr class="Texto_branco" align="center" bgcolor="#DFDFD0">
			<td colspan="5" class="Texto_azul">Sem registos</td>
		</tr>
		<%
	Else
		Do While not Clientes.EOF
			%>
			<tr class="Titulo_laranja" align="center" bgcolor="#DFDFD0">
				<td align="Left">
					<a  title="Editar registo" href="/?OP=ACT&ID=<%=clientes("IDWN_Clientes_ACT")%>&MODE=EDIT&CLSTAMP=<%=clientes("CLSTAMP")%>">
					<%=left(clientes("Texto"),70)%>
					</a>
				</td>
				<td align="center"><%=clientes("Data")%></td>
				<td width="5%"><img title="Imprimir Registo" src="/images/b_print.gif" border="0" onclick="javascript:openpopup('/includes/inc_ClienteACT_PRINT.asp?ID=<%=clientes("IDWN_Clientes_ACT")%>')"></td>
				<td width="5%">
					<a  title="Apgar registo" onClick="return confirm('Tens a certeza ?');" href="/includes/inc_ClienteACTRUN.asp?ID=<%=clientes("IDWN_Clientes_ACT")%>&OP=DEL&CLSTAMP=<%=clientes("CLSTAMP")%>">
						<img src="/images/apagar.gif" border="0">
					</a>
				</td>
			</tr>
			<%
			Clientes.MoveNext
		Loop
	end if
	Clientes.Close
	%>
</table>
<br />
