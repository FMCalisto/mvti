<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Carrinho de compras</title>
<link href="/includes/Minitel.css" rel="stylesheet" type="text/css" />
</head>
<%If session("no")="" Then response.redirect("DO_logout_run.asp")%>
<%If Session("ProcessoCompra")<>True Then response.redirect("/?")%>
<body>
<br /><br />
<p align="center">
<img src="/images/i_carro_final.jpg" />
</p>
<br />
<table width="800" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita" align="center">
<tr><td class="Texto">
<hr hr style="height: '1'; text-align: 'left'; color: '#EFEFEF'; width: '100%'">
<p>A sua encomenda foi devidamente processada.
  <br />
    <br />
  Foi enviada uma cópia da encomenda para a sua caixa de e-mail (<%=db.query(cstr("select email as DataTXT from wn_clientes where no=" & session("NO")))("DataTXT")%>). Agradecemos que consulte a caixa de e-mail para verificar se recebeu os dados da mesma. 
  <br />
    <br />
  Caso não receba a mensagem, ou tenha alguma dúvida, consulte o seu Comercial (<%=db.query(cstr("select VendedorNome DataTXT from wn_clientes where no=" & session("NO")))("DataTXT")%> | <%=db.query(cstr("select VendedorTelefone DataTXT from wn_clientes where no=" & session("NO")))("DataTXT")%> | <a href="mailto:<%=db.query(cstr("select VendedorEmail DataTXT from wn_clientes where no=" & session("NO")))("DataTXT")%>"><%=db.query(cstr("select VendedorEmail DataTXT from wn_clientes where no=" & session("NO")))("DataTXT")%></a>)<br />
  ou o Departamento Comercial (<a href="mailto:comercial@minitel.pt">comercial@minitel.pt</a> | 213810900)
  <br />
  <br />
  Agradecemos o <a href="mailto:info@minitel.pt"><em><strong>feedback</strong></em></a> da navegabilidade do site.
  <br />
    <br />
    <br />
  Muito Obrigado.</p>
<hr hr style="height: '1'; text-align: 'left'; color: '#EFEFEF'; width: '100%'">
<p align="right">
<a href="/?"><img src="/images/b_passo_index.gif" border="0"/></a>
</p>
</td>
</tr>
</table>
<%Session("ProcessoCompra")=False%>
</body>
</html>
