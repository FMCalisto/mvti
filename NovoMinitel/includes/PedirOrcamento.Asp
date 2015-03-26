<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE virtual="/includes/inc_variaveis_globais.asp"-->
<!--#INCLUDE virtual="/includes/inc_FuncoesCRT.asp"-->
<!--#INCLUDE virtual="/includes/inc_javascript.asp"-->
<%
	ATXT=txt.QSV("CLSTAMP",cstr(URLDecode(request.QueryString)),1)
	BTXT=txt.QSV("PRODUTOID",cstr(URLDecode(request.QueryString)),1)

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Pedir Orcamento</title>
<link href="Minitel.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {font-size: 14}
-->
</style>
</head>
<body background="/images/quadrado.gif">
<p align="center" class="Titulo_laranja style1">Pedido de Orçamento</p>
<form action="PedirOrcamento_RUN.asp" method="post" name="formulario_orcamento" id="formulario_orcamento">
<input type="hidden" name="CLSTAMP" value="<%=ATXT%>" />
<input type="hidden" name="PRODUTOID" value="<%=BTXT%>" />
	<table width="100%" cellpadding="2" cellspacing="0" border="0" align="center">
		<tr>
			<td align="right"><span class="Titulo_laranja">Nome :</span> </td>
			<td align="left">
				<input class="Texto_azul" name="nome" id="nome" type="text" value="" size="50" maxlength="100" />
			</td>
		</tr>
		<tr>
			<td align="right"><span class="Titulo_laranja">Telefone :</span></td>
			<td align="left">
				<input class="Texto_azul" name="telefone" id="telefone" type="text" value="" size="50" maxlength="60" />
			</td>
		</tr>
		<tr>
			<td align="right"><span class="Titulo_laranja">E-Mail :</span></td>
			<td align="left">
				<input class="Texto_azul" name="email" id="email" type="text" value="" size="50" maxlength="45" />
			</td>
		</tr>
	</table>
	<%MySQL="Select Nome From WN_Clientes_OndeComprar Where CLStamp='"&  ATXT &"'"%>
	<br />
	<span class="Titulo_laranja" style="font-size:14px">Enviado para : <%=db.query(cstr(MySQL))("Nome")%></span>
	<%MySQL="Select design,ref From WN_ListaProdutos Where StStamp='"&  BTXT &"'"%>
	<p align="center"><textarea name="MailBody" cols="45" rows="10" disabled="disabled">Exmo Sr.

Gostaria de receber mais informações sobre o produto 
"<%=trim(db.query(cstr(MySQL))("design"))%>" 
Ref&ecirc;ncia : "<%=trim(db.query(cstr(MySQL))("ref"))%>"
que vi no site da Minitel Lda.

Queria por favor contactar-me.</textarea>
<br /><br />
	<p align="left"><span class="Titulo_laranja" style="font-size:14px">Observações : </span></p>
	<p align="center">
	<textarea name="MailBodyUSR" cols="45" rows="5">Escreva aqui o seu texto...
	</textarea>
	<br />
	<input type="submit" value="Enviar pedido" onClick="return valida_orcamento();" />
	</p>
</p>
</form>
</body>
</html>
