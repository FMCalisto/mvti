<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<!--#INCLUDE file="inc_FuncoesCRT.asp"-->
<%If session("no")="" Then response.redirect("DO_logout_run.asp")%>
<%Session("ProcessoCompra")=True%>
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
<%
MySQL="Select * from View_Clientes_CarrinhoTemp where no=" & Session("no")
Set ListaProdutos=db.query(cstr(MySQL))
%>
<body background="/images/quadrado.gif">
<table width="800" border="0" cellpadding="2" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita" align="center">
<tr><td>
<table width="100%" border="0" cellpadding="5" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
	<tr>
		<td align="right" rowspan="2" width="600"><img src="/images/passo1.jpg"  width="500" height="50"></td>
		<td align="right">
			<%If NOT ListaProdutos.eof AND Get_ClienteColaboradorPodeFazer("SubmeterEncomenda") Then%>
			<a href="/includes/DO_Carros_step2.asp">
			<img src="/images/b_passo_seguinte.gif" alt="Passo seguinte da compra" width="156" height="22" border="0">			</a>
			<%Else%>
				&nbsp;
			<%end if%>
		</td>
	</tr>
	<tr>
		<td align="right"><a href="/?<%=session("QueryString")%>"><img src="/images/b_voltar_comprar.gif" alt="Voltar a lista de produtos" width="156" height="22" border="0"></a></td>
	</tr>
</table>
<br>
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
			  <td align="left"><input type="image" src="../images/apagar.gif" alt="Apagar registo" width="11" height="11" align="bottom" name="apaga" onClick="return confirm('Tem a certeza ?')"/>&nbsp;<%=ListaProdutos("Design")%></td>
				<td><%=ListaProdutos("ImagemStock_ProdutoLista")%></td>
				<td align="right"><input align="absmiddle" type="text" class="Texto_castanho" size="1" maxlength="3" value="<%=ListaProdutos("Quantidade")%>" name="quantidade"></td>
				<td align="left"><input type="image" src="/images/b_actualiza.gif" alt="Actulizar valor" name="corrige"></td>
				<td align="right"><%=Moeda(ListaProdutos("Preco"))%></td>
				<td align="right"><%=Moeda(ListaProdutos("TLinha"))%></td>
				<td align="right">
					<%if csng(ListaProdutos("Desconto"))<>0 Then%>
						<%=ListaProdutos("Desconto")%>&nbsp;%&nbsp;
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
		ListaProdutos.Close
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
		<td align="right"><%=FormatNumber(Bint,2)%>&nbsp;&euro;</td>
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
		<td align="right"><%=Moeda(Dint)%></td>
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
<br/>
<%
MySQL="SELECT count(1) as Total FROM WN_TDescontos inner join CarrinhoTemp on CarrinhoTemp.StStamp=WN_TDescontos.StStamp and CarrinhoTemp.no=" & Session("NO") & " where getdate() between datainicio and datafim and activo=1"
if cint(db.query(cstr(MySQL))("Total"))>0 then%>
	<table width="100%" border="0" cellpadding="10" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
	<tr>
		  <td colspan="2" height="22" align="center" valign="middle" bgcolor="#87AFAF" class="Titulo_branco">C&oacute;digos de promo&ccedil;&atilde;o</td>
	</tr>
	<form name="form_descontos" method="post"  action="DO_Carros_step1_RUNDESCONTO.asp" id="form_descontos">
	<tr valign="middle" height="30">
		<td width="50%" align="right"><input name="valor_desconto" type="text" class="Texto_azul"  id="valor_desconto" value="C&oacute;digo Promo&ccedil;&atilde;o" size="20" maxlength="20">
		&nbsp;&nbsp;</td>
		<td width="50%" align="left" class="Texto_azul">&nbsp;&nbsp;<input class="Texto" type="submit" name="b_desconto"  id="b_desconto" value="Submeter"></td>
	</tr>
	</form>
	<tr>
		<td colspan="2"  class="Texto"  height="42" ><p><strong>O c&oacute;digo &eacute; valido para os produtos em  campanha e apenas faz desconto sobre refer&ecirc;ncias afectas ao mesmo.</strong><br />
			No valor da encomenda n&atilde;o est&atilde;o inclu&iacute;dos os custos de  transporte.<br />
		  Estes valores n&atilde;o incluem I.V.A. </p></td>
	</tr>
	</table>
	<br>
<%End if%>
<table width="100%" border="0" cellpadding="10" cellspacing="0" bgcolor="#F3F3F3" class="lista_produtos_direita">
<tr>
<td>
<p align="left" class="Texto_castanho"><span class="Titulo_laranja"><br>Instru&ccedil;&otilde;es para realizar encomendas:</span><br />
          <span class="Texto_azul"><br />
          </span><span class="Texto"><img src="../images/minisites.gif" width="9" height="9" /> Se pretende alterar as quantidades de uma  refer&ecirc;ncia no cesto de compras, introduza a nova quantidade e clique&quot; em: <img src="../images/b_actualiza.gif" width="20" height="20" /><br />
          <img src="../images/minisites.gif" width="9" height="9" /> Caso n&atilde;o deseje um produto clique em: <img src="../images/apagar.gif" width="11" height="11" align="bottom" /><br />
          <br />
<%if cint(db.query("SELECT count(1) as Total FROM WN_TDescontos where getdate() between datainicio and datafim")("Total"))>1 then%>
      * Para usufruir de descontos deve inserir o  c&oacute;digo de promo&ccedil;&atilde;o. Poder&aacute; encontrar c&oacute;digos de promo&ccedil;&atilde;o nos e-mails  promocionais enviados diariamente pela Minitel.</span><br><br></p>
<%end if%>
</td>
</tr>
</table>
</td></tr></table>
<%Set ListaProdutos=Nothing%>
</body>
</html>