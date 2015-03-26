<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<!--#INCLUDE file="inc_FuncoesCRT.asp"-->
<%If not(Get_ClienteColaboradorPodeFazer("SubmeterEncomenda")) Then response.Redirect("/includes/DO_logout_run.asp")%>
<%If session("no")="" Then response.redirect("DO_logout_run.asp")%>
<%If Session("ProcessoCompra")<>True Then response.redirect("/?")%>
<%
Dim MoradaEntregaDiferente : MoradaEntregaDiferente=0
Dim EntregarClienteFinal : EntregarClienteFinal=0
Dim LevantarNaMinitel : LevantarNaMinitel=0
Dim SatisfacaoTotal : SatisfacaoTotal=0
Dim Agrupar : Agrupar=0
Dim Cartao : Cartao=0

Dim Contacto : Contacto=""
Dim Morada : Morada=""
Dim codpost : codpost=""
Dim local : local=""
Dim telefone : telefone=""
Dim fax : fax=""
Dim email : email=""
Dim Observacoes : Observacoes=""

MySQL="Select * from CarrinhoTemp_MoradaEntrega where no=" & session("No")
Set Clientes=db.query(cstr(MySQL))
If Not (Clientes.eof) Then
	MoradaEntregaDiferente=clientes("MoradaEntregaDiferente")
	EntregarClienteFinal=clientes("EntregarClienteFinal")
	LevantarNaMinitel=clientes("LevantarNaMinitel")
	SatisfacaoTotal=clientes("SatisfacaoTotal")
	Agrupar=clientes("Agrupar")

	Contacto=trim(clientes("Contacto"))
	Morada=trim(clientes("Morada"))
	codpost=trim(clientes("codpost"))
	local=trim(clientes("local"))
	telefone=trim(clientes("telefone"))
	fax=trim(clientes("fax"))
	email=trim(clientes("email"))
	observacoes=trim(clientes("observacoes"))
End if
Clientes.close
Set Clientes=Nothing
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt" xml:lang="pt">
<head>
<title>MINITEL Lda.</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="/includes/MINITEL.css" rel="stylesheet" type="text/css">
<meta name="description" content="">
<meta name="keywords" content="">
<!--#INCLUDE file="inc_javascript.asp"-->
</head>
<body background="/images/quadrado.gif">
<form action="DO_Carros_step2RUN.asp" method="post" name="formulario" id="formulario">
<table width="800" border="0" cellpadding="2" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita" align="center">
<tr><td>

<table width="100%" border="0" cellpadding="5" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
	<tr>
		<td align="right" rowspan="2" width="600"><img src="/images/passo2.jpg"  width="500" height="50"></td>
		<td align="right"><input onclick="return outramoradapreenchida();" type="image" src="/images/b_passo_seguinte.gif" alt="Passo seguinte da compra" border="0">
		</td>
	</tr>
	<tr>
		<td align="right"><a href="/?<%=session("QueryString")%>"><img src="/images/b_voltar_comprar.gif" alt="Voltar a lista de produtos" width="156" height="22" border="0"></a></td>
	</tr>
</table>
<br>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
<tr>
	 <td height="25" colspan="3" align="center" valign="middle" bgcolor="#81B9D1" class="Titulo_branco">Dados de cliente e envio</td>
</tr>
<tr valign="top">
	<td width="48%">
		<%
		MySQL="Select * from wn_clientes where no=" & Session("no")
		Set Clientes=db.query(cstr(MySQL))
		%>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr height="19">
				<td colspan="3"align="center" valign="middle" bgcolor="#C92B5B"><strong class="Titulo_branco">Dados actuais de entrega</strong></td>
			</tr>
			<tr height="19">
				<td colspan="3"align="center" valign="middle" bgcolor="#CCCCCC" class="Titulo_branco">Nome da Empresa</td>
			</tr>
			<tr height="30">
				<td colspan="3" align="left" valign="middle" class="Texto"><%=Clientes("Nome")%></td>
			</tr>
			<tr height="19">
				<td colspan="3"align="center" valign="middle" bgcolor="#CCCCCC" class="Titulo_branco">Contacto na Empresa</td>
			</tr>
			<tr height="30">
				<td colspan="3" align="left" valign="middle" class="Texto"><%=Clientes("Contacto")%>&nbsp;</td>
			</tr>
			<tr height="19">
				<td colspan="3"align="center" valign="middle" bgcolor="#CCCCCC" class="Titulo_branco">Morada de entrega</td>
			</tr>
			<tr height="30">
				<td colspan="3" align="left" valign="middle" class="Texto"><%=Clientes("Morada")%>&nbsp;</td>
			</tr>
			<tr height="19">
				<td width="49%" align="center" valign="middle" bgcolor="#CCCCCC" class="Titulo_branco">C&oacute;digo Postal</td>
				<td width="2%">&nbsp;</td>
				<td width="49%" align="center" valign="middle" bgcolor="#CCCCCC" class="Titulo_branco">Localidade</td>
			</tr>
			<tr height="30">
				<td align="left" valign="middle" class="Texto"><%=Clientes("codpost")%>&nbsp;</td>
				<td width="2%">&nbsp;</td>
				<td align="left" valign="middle" class="Texto"><%=Clientes("local")%>&nbsp;</td>
			</tr>
			<tr height="19">
				<td width="49%" align="center" valign="middle" bgcolor="#CCCCCC" class="Titulo_branco">Telefone</td>
				<td width="2%">&nbsp;</td>
				<td width="49%" align="center" valign="middle" bgcolor="#CCCCCC" class="Titulo_branco">Fax</td>
			</tr>
			<tr height="30">
				<td align="left" valign="middle" class="Texto"><%=Clientes("telefone")%>&nbsp;</td>
				<td width="2%">&nbsp;</td>
				<td align="left" valign="middle" class="Texto"><%=Clientes("fax")%>&nbsp;</td>
			</tr>
			<tr height="19">
				<td width="49%" align="center" valign="middle" bgcolor="#CCCCCC" class="Titulo_branco">E-mail de contacto</td>
				<td width="2%">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr height="30">
				<td align="left" valign="middle" class="Texto"><%=Clientes("email")%>&nbsp;</td>
				<td width="2%">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
		<%Clientes.Close:Set Clientes=Nothing%>
	</td>
	<td width="2%" bgcolor="#FFFFFF">&nbsp;</td>
	<td width="48%">
		<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#F7F7F2">
			<tr height="19">
				<td colspan="3"align="center" valign="middle" bgcolor="#C92B5B"><strong class="Titulo_branco">Dados
				    alternativos de entrega</strong></td>
			</tr>
			<tr height="19">
				<td colspan="3" align="left" valign="middle" class="Texto">
				<input type="checkbox" name="EntregarClienteFinal" id="EntregarClienteFinal" value="-1" 
				<%if cint(EntregarClienteFinal)=-1 Then response.Write("checked=""""checked""""")%> onClick="return outramorada();"> A
				  encomenda &eacute; para ser entregue no cliente final.</td>
			</tr>
			<tr height="30">
				<td colspan="3" align="left" valign="middle" class="Texto"><%=txt.choose("checkbox","","MoradaEntregaDiferente",cint(MoradaEntregaDiferente),"-1")%> Entregar a encomenda na seguinte morada : </td>
			</tr>
			<tr height="19">
				<td colspan="3"align="center" valign="middle" bgcolor="#CCCCCC" class="Titulo_branco">Pessoa de contacto </td>
			</tr>
			<tr height="30">
				<td colspan="3" align="left" valign="middle" class="Texto">&nbsp;<input class="Texto"type="text" size="30" maxlength="30" name="contacto" id="contacto" value="<%=contacto%>">&nbsp;</td>
			</tr>
			<tr height="19">
				<td colspan="3"align="center" valign="middle" bgcolor="#CCCCCC" class="Titulo_branco">Morada de entrega</td>
			</tr>
			<tr height="30">
				<td colspan="3" align="center" valign="middle" class="Texto"><input class="Texto"type="text" size="70" maxlength="55" name="morada" id="morada" value="<%=morada%>">&nbsp;</td>
			</tr>
			<tr height="19">
				<td width="49%" align="center" valign="middle" bgcolor="#CCCCCC" class="Titulo_branco">C&oacute;digo Postal</td>
				<td width="2%">&nbsp;</td>
				<td width="49%" align="center" valign="middle" bgcolor="#CCCCCC" class="Titulo_branco">Localidade</td>
			</tr>
			<tr height="30">
				<td valign="middle" class="Texto" align="center"><input class="Texto"type="text" size="30" maxlength="45" name="codpost" id="codpost" value="<%=codpost%>">&nbsp;</td>
				<td width="2%">&nbsp;</td>
				<td valign="middle" class="Texto" align="center"><input class="Texto"type="text" size="30" maxlength="43" name="local" id="local" value="<%=local%>">&nbsp;</td>
			</tr>
			<tr height="19">
				<td width="49%" align="center" valign="middle" bgcolor="#CCCCCC" class="Titulo_branco">Telefone</td>
				<td width="2%">&nbsp;</td>
				<td width="49%" align="center" valign="middle" bgcolor="#CCCCCC" class="Titulo_branco">Fax</td>
			</tr>
			<tr height="30">
				<td valign="middle" class="Texto" align="center"><input class="Texto"type="text" size="30" maxlength="60" name="telefone" id="telefone" value="<%=telefone%>">&nbsp;</td>
				<td width="2%">&nbsp;</td>
				<td valign="middle" class="Texto" align="center"><input class="Texto"type="text" size="30" maxlength="60" name="fax" id="fax" value="<%=fax%>">&nbsp;</td>
			</tr>
			<tr height="19">
				<td width="49%" align="center" valign="middle" bgcolor="#CCCCCC" class="Titulo_branco">E-mail de contacto</td>
				<td width="2%">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr height="30">
				<td valign="middle" class="Texto" align="center"><input class="Texto"type="text" size="30" maxlength="45" name="email" id="email" value="<%=email%>">&nbsp;</td>
				<td width="2%">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</td>
</tr>
</table>
<br>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
<tr>
	 <td height="25" colspan="2" align="center" valign="middle" bgcolor="#81B9D1" class="Titulo_branco">M&eacute;todo de entrega</td>
</tr>
<tr>
	<td width="2%"><span class="Texto"><%=txt.choose("radio","","LevantarNaMinitel",cint(LevantarNaMinitel),"0")%></span></td>
	<td width="98%" valign="middle" class="Texto"> Enviar por transportadora (TAXA de portes de acordo com o peso da encomenda) </td>
</tr>
<tr>
	<td width="2%"><span class="Texto"><%=txt.choose("radio","","LevantarNaMinitel",cint(LevantarNaMinitel),"-1")%></span></td>
	<td width="98%" valign="middle" class="Texto"> Levantar na MINITEL (Travessa L&eacute;gua da P&oacute;voa, 1A - 1250-136 Lisboa) </td>
</tr>
</table>
<br>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
<tr valign="top">
	<td width="40%" class="Texto">Observa&ccedil;&otilde;es :<br><textarea cols="50" class="Texto_azul" rows="5" name="Observacoes"><%=observacoes%></textarea></td>
	<td width="60%" class="Texto"> 
			<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
			<tr>
			  <td><%=txt.choose("checkbox","","Cartao",cint(Cartao),"-1")%></td>
			  <td valign="middle" class="Titulo_laranja">Pretendo Pagar com Cart&atilde;o de Distribui&ccedil;&atilde;o</td>
			  </tr>
			<tr>
				<td width="2%"><%=txt.choose("checkbox","","Agrupar",cint(Agrupar),"-1")%></td>
				<td width="98%" valign="middle" class="Texto">Desejo agrupar esta encomenda, com outra que possuo a aguardar produtos na Minitel.</td>
			</tr>	
			<tr>
				<td width="2%"><%=txt.choose("checkbox","","SatisfacaoTotal",cint(SatisfacaoTotal),"-1")%></td>
				<td width="98%" valign="middle" class="Texto">Pretendo apenas receber esta encomenda, quando estiverem todos os produtos em stock.</td>
			</tr>	
			</table>
	</td></tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
<tr valign="top">
<td align="right">
<input onclick="return outramoradapreenchida();" type="image" src="/images/b_passo_seguinte.gif" alt="Passo seguinte da compra" border="0"><br><br>
<a href="/includes/DO_Carros_step1.asp"><img src="/images/b_passo_anterior.gif" alt="Voltar ao Passo Anterior" width="156" height="22" border="0" align="Voltar ao Passo Anterior"></a></td>
</tr>
</table>
</td>
</tr></table>
</form>
</body></html>
