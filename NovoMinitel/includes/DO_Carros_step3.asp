<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<!--#INCLUDE file="inc_FuncoesCRT.asp"-->
<%If session("no")="" Then response.redirect("DO_logout_run.asp")%>
<%If Session("ProcessoCompra")<>True Then response.redirect("/?")%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt" xml:lang="pt">
<head>
<title>MINITEL Lda.</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="/includes/MINITEL.css" rel="stylesheet" type="text/css">
<meta name="description" content="">
<meta name="keywords" content="">
</head>
<body background="/images/quadrado.gif">
<div align="center">
<table width="800" border="0" cellpadding="2" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
<tr><td>
<table width="100%" border="0" cellpadding="5" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
	<tr>
		<td align="right" rowspan="2" width="600"><img  src="/images/passo3.jpg" width="500" height="50"></td>
		<td align="right"><a href="/includes/DO_Carros_step3RUN.asp"><img src="/images/b_passo_finalizar.gif" alt="Finalizar a Compra" width="156" height="22" border="0"></a></td>
	</tr>
	<tr>
		<td align="right"><a href="/?<%=session("QueryString")%>"><img src="/images/b_voltar_comprar.gif" alt="Voltar a lista de produtos" width="156" height="22" border="0"></a></td>
	</tr>
</table>
<br>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
<tr>
	 <td height="25" align="center" valign="middle" bgcolor="#81B9D1" class="Titulo_branco">Estes s&atilde;o
	   os dados da sua encomenda </td>
</tr>
<tr valign="top">
<td>
<%
MySQL="Select * from View_Clientes_CarrinhoFINAL where no=" & Session("no")
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
	</td>
</tr>
</table>

<%If clientes("Agrupar") or clientes("LevantarNaMinitel") or clientes("EntregarClienteFinal") or clientes("MoradaEntregaDiferente") or clientes("SatisfacaoTotal") or trim(clientes("observacoes"))<>"" then%>
<br/>
<table width="100%" border="0" cellpadding="10" cellspacing="0" bgcolor="#F3F3F3" class="lista_produtos_direita">
<tr>
<td class="Texto">
<div class="Texto_castanho">Dados adicionais da encomenda</div>
<blockquote>
<%If clientes("MoradaEntregaDiferente") Then response.Write("<li>A morada de entrega é diferente da actual.</li>")%>

<%If clientes("EntregarClienteFinal") Then response.Write("<li>A encomenda é para ser entregue no cliente final.</li>")%>

<%If not(clientes("LevantarNaMinitel")) Then response.Write("<li>Enviar por transportadora (TAXA de portes de acordo com o peso da encomenda)</li>")%>

<%If clientes("LevantarNaMinitel") Then response.Write("<li>Levantar na MINITEL (Travessa Légua da Póvoa, 1A - 1250-136 Lisboa)</li>")%>

<%If clientes("Agrupar") Then response.Write("<li>Desejo agrupar esta encomenda, com outra que possuo a aguardar produtos na Minitel.</li>")%>

<%If clientes("SatisfacaoTotal") Then response.Write("<li>Pretendo apenas receber esta encomenda, quando estiverem todos os produtos em stock.</li>")%>
<%If trim(clientes("observacoes"))<>"" Then response.Write("<li>Observações : " & trim(clientes("observacoes")) & "</li>")%>
</blockquote>
</td>
</tr>
</table>
<%End if%>

<br/>
<%
Clientes.Close:Set Clientes=Nothing
MySQL="Select * from View_Clientes_CarrinhoTemp where no=" & Session("no")
Set ListaProdutos=db.query(cstr(MySQL))
%>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
   <tr align="center" valign="middle" height="19">
      <td width="119" bgcolor="#D1D1BA" colspan="2" class="Titulo_branco">Refer&ecirc;ncia</td>
      <td width="273"  bgcolor="#81B9D1" class="Titulo_branco">Produto</td>
      <td width="35" bgcolor="#D1D1BA" class="Titulo_branco">Stock</td>
      <td width="70" bgcolor="#81B9D1" colspan="2" class="Titulo_branco">Quantidade</td>
      <td width="59" bgcolor="#D1D1BA" class="Titulo_branco">Pre&ccedil;o</td>
      <td width="75" bgcolor="#81B9D1" class="Titulo_branco">Total</td>
      <td width="69" bgcolor="#D1D1BA" class="Titulo_branco">%Desconto</td>
    </tr>
	<%
	If (ListaProdutos.Eof) Then
	%><tr align="center">
      <td colspan="9" bgcolor="#F3F3F3" class="Titulo_laranja">N&atilde;o existem produtos para listar </td>
	</tr><%
	Else
		AInt=ListaProdutos("STotal")
		Bint=ListaProdutos("TDesconto")
		dint=csng(ListaProdutos("Total"))
		Do While not (ListaProdutos.Eof) 
		%>
			<form action="DO_Carros1_step1_RUNQuantidade.asp" method="post">
			<tr align="center" class="Texto" onMouseOver="this.style.backgroundColor = '#F3F3F3'" onMouseOut="this.style.backgroundColor = '#FfFFFF'" >
				<td>
					<%if trim(ListaProdutos("Existe"))<>"0" Then%>
						<a href="<%=txt.href("/?OP=FICHADEPRODUTO&ProdutoID=" & trim(ListaProdutos("StSTAMP")))%>"><img border="0" src="/images/lupa.gif" alt="<%=trim(ListaProdutos("Ref"))%>"></a>
					<%Else%>
						<img src="/images/stock_descontinuado.gif" alt="Produto descontinuado">
					<%End if%>
				</td>
				<td align="left"><%=ListaProdutos("Ref")%></td>
			  <td align="left"><%=ListaProdutos("Design")%></td>
				<td><%=ListaProdutos("ImagemStock_ProdutoLista")%></td>
				<td align="center" colspan="2"><%=ListaProdutos("Quantidade")%></td>
				<td align="right"><%=Moeda(ListaProdutos("Preco"))%></td>
				<td align="right"><%=Moeda(ListaProdutos("TLinha"))%></td>
				<td align="right">
					<%if csng(ListaProdutos("Desconto"))<>0 Then%>
						<%=formatnumber(ListaProdutos("Desconto"),2)%>&nbsp;%&nbsp;
					<%else%>
						&nbsp;
					<%end if%>
				</td>
			</tr>
			<input type="hidden" name="IDCarrinhoTemp" value="<%=ListaProdutos("IDCarrinhoTemp")%>">
			</form>
		<%
			ListaProdutos.MoveNext
		Loop
		ListaProdutos.Close : Set ListaProdutos=nothing
	End if
	%>
	<tr>
		<td colspan="6"></td>
		<td colspan="3">
			<hr hr style="height: '1'; text-align: 'left'; color: '#EFEFEF'; width: '100%'">
		</td>
	</tr>
	<tr class="Texto">
		<td colspan="5"></td>
		<td colspan="2" class="Titulo_laranja" align="right">Sub-Total :</td>
		<td align="right"><%=Moeda(Aint)%></td>
		<td colspan="1"></td>
	</tr>
	<tr class="Texto">
		<td colspan="5"></td>
		<td colspan="2" class="Titulo_laranja" align="right">Descontos :</td>
		<td align="right"><%=FormatNumber(bint,2)%>&nbsp;&euro;</td>
		<td colspan="1"></td>
	</tr>
	<tr>
		<td colspan="6"></td>
		<td colspan="3">
			<hr hr style="height: '1'; text-align: 'left'; color: '#EFEFEF'; width: '100%'">
		</td>
	</tr>
	<tr class="Texto">
		<td colspan="5"></td>
		<td colspan="2" class="Titulo_laranja" align="right">Total-Descontos :</td>
		<td align="right"><%=Moeda(dint)%></td>
		<td colspan="1"></td>
	</tr>
	<tr class="Texto">
		<td colspan="5"></td>
		<td colspan="2" class="Titulo_laranja" align="right">I.V.A. :</td>
		<td align="right"><%=Moeda(dint*.23)%></td>
		<td colspan="1"></td>
	</tr>
	<tr>
		<td colspan="6"></td>
		<td colspan="3">
			<hr hr style="height: '1'; text-align: 'left'; color: '#EFEFEF'; width: '100%'">
		</td>
	</tr>
	<tr class="Texto">
		<td colspan="5"></td>
		<td colspan="2" class="Titulo_laranja" align="right">Total :</td>
		<td align="right"><%=Moeda(dint*1.23)%></td>
		<td colspan="1"></td>
	</tr>
</table>
<br>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
<tr valign="top">
<td align="right"><a href="/includes/DO_Carros_step3RUN.asp"><img src="/images/b_passo_finalizar.gif" alt="Finalizar a Compra" width="156" height="22" border="0"></a><br>
  <br>
<a href="/includes/DO_Carros_step2.asp"><img src="/images/b_passo_anterior.gif" alt="Voltar ao Passo Anterior" width="156" height="22" border="0" align="Voltar ao Passo Anterior"></a></td>
</tr>
</table>
</td>
</tr></table></div></body></html>
