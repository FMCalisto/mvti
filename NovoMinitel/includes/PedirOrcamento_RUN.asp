<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE virtual="/includes/inc_variaveis_globais.asp"-->
<!--#INCLUDE virtual="/includes/inc_FuncoesCRT.asp"-->
<!--#INCLUDE virtual="/includes/inc_javascript.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Envio de e-mail...</title>
<link href="Minitel.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {font-size: 14}
-->
</style>
</head>
<%
MySQL="INSERT INTO WN_Clientes_OndeComprar_HITS (clstamp,ststamp,nome,telefone,email,MailBodyUSR) VALUES ('"& request.Form("CLSTAMP")  &"','"& request.Form("PRODUTOID")  &"','"& request.Form("nome")  &"','"& request.Form("telefone")  &"','"& request.Form("email")  &"','"& txt.abstxt(cstr(URLDecode(request.Form("MailBodyUSR"))))  &"')"
db.queryexec(cstr(MySQL))

MySQL="Select nome,email from WN_Clientes_OndeComprar where clstamp='" & request.Form("CLSTAMP") & "'"
Set Clientes=db.query(cstr(MySQL))

MySQL="Select design,ref From WN_ListaProdutos Where StStamp='"&  request.Form("PRODUTOID") &"'"

ATxt=trim(clientes("nome")) & vbcrlf & vbcrlf 
ATxt=ATxt & " ----------------------------  " & vbcrlf & vbcrlf 
ATxt=ATxt & "Exmo Sr. " & vbcrlf & vbcrlf 
ATxt=ATxt & "Gostaria de receber mais informações sobre o produto ''" & trim(db.query(cstr(MySQL))("design")) & "'' " & vbcrlf & vbcrlf 
ATxt=ATxt & "Referência : ''" & trim(db.query(cstr(MySQL))("ref")) & "'' que vi no site da Minitel Lda. " & vbcrlf & vbcrlf 
ATxt=ATxt & vbcrlf & vbcrlf 
ATxt=ATxt & "Queira por favor contactar-me. " & vbcrlf & vbcrlf 
ATxt=ATxt & " ----------------------------  " & vbcrlf & vbcrlf 
ATxt=ATxt & " Nome : " & request.Form("nome") & vbcrlf & vbcrlf 
ATxt=ATxt & " Telefone : " & request.Form("telefone") & vbcrlf & vbcrlf 
ATxt=ATxt & " E-MAIL : " & request.Form("email") & vbcrlf & vbcrlf 
ATxt=ATxt & " ----------------------------  " & vbcrlf & vbcrlf 
ATxt=ATxt & "- Texto escrito pelo cliente - " & vbcrlf & vbcrlf 
ATxt=ATxt & " ----------------------------  " & vbcrlf & vbcrlf 
ATxt=ATxt &  txt.abstxt(cstr(URLDecode(request.Form("MailBodyUSR"))))

REM Call EnviaEmail(trim(clientes("email")),trim(request.Form("email")),"mario.castro@minitel.pt; paulo.fialho@minitel.pt; pedro.cortez@minitel.pt","MINITEL - Pedido de Orçamento",ATxt"")

Call EnviaEmail(trim(request.Form("email")),"",trim(clientes("email")) & "pedro.cortez@minitel.pt","MINITEL - Pedido de Orçamento",ATxt"")


Clientes.Close
Set Clientes=Nothing
%>
<body background="/images/quadrado.gif">
<p align="center" class="Titulo_laranja style1">&nbsp;</p>
<p align="center" class="Titulo_laranja style1">Envio de pedido de or&ccedil;amento conclu&iacute;do.</p>
<p align="center" class="Titulo_laranja style1">&nbsp;</p>
<p align="center" class="Titulo_laranja style1">Desde j&aacute; agradece-mos o seu interesse pelo produto.</p>
<p align="center" class="Titulo_laranja style1">&nbsp;</p>
<p align="center" class="Titulo_laranja style1">Ser&aacute; contactado em breve pelo nosso parceiro.</p>
<p align="center" class="Titulo_laranja style1">&nbsp;</p>
<p align="center" class="Titulo_laranja style1">&nbsp;</p>
<p align="center" class="Titulo_laranja style1">&nbsp;</p>
<p align="center"><form> <input type="button" value="Fechar a Janela" onClick="window.close()"> </form> </p>
</body>
</html>
