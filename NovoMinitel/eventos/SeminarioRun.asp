<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 'Grava os dados
 Set ConnObj=Server.CreateObject("ADODB.Connection")
 Set RS=Server.CreateObject("ADODB.Recordset")
 ConnObj.Open("Provider=SQLOLEDB;Server=SRVWEB;Uid=web;PWD=web;Database=WebSiteMINITEL;")
 MySQL="Seminarios"
 RS.Open MySQL,ConnObj,3,3
	 Rs.Addnew
		rs("Quando")=now 
		rs("Titulo")=left(request.Form("Titulo"),100)
		rs("Empresa")=left(request.Form("Empresa"),100)
		rs("Funcao")=left(request.Form("Funcao"),100)
		rs("Nome")=left(request.Form("Nome"),100)
		rs("Profissao")=left(request.Form("Profissao"),100)
		rs("Morada")=left(request.Form("Morada"),100)
		rs("Localidade")=left(request.Form("Localidade"),100)
		rs("CodigoPostal4")=left(request.Form("CodeP4"),4)
		rs("CodigoPostal3")=left(request.Form("CodeP3"),3)
		rs("Telefone")=left(request.Form("Telefone"),20)
		rs("Fax")=left(request.Form("Fax"),20)
		rs("Email")=left(request.Form("Email"),100)

		rs("op0")=cint(request.Form("opcao0"))=1
		rs("op1")=cint(request.Form("opcao1"))=1
		rs("op2")=cint(request.Form("opcao2"))=1
		rs("op3")=cint(request.Form("opcao3"))=1
		rs("op4")=cint(request.Form("opcao4"))=1
		rs("op5")=cint(request.Form("opcao5"))=1
		rs("op6")=cint(request.Form("opcao6"))=1
		rs("op7")=cint(request.Form("opcao7"))=1
		rs("op8")=cint(request.Form("opcao8"))=1
		rs("op9")=cint(request.Form("opcao9"))=1
		rs("op10")=cint(request.Form("opcao10"))=1
		rs("op11")=cint(request.Form("opcao11"))=1
		
		rs("Extra0")=trim(left(request.Form("Extra0"),100))
		rs("Extra1")=trim(left(request.Form("Extra1"),100))
		rs("Extra2")=trim(left(request.Form("Extra2"),100))
		rs("Extra3")=trim(left(request.Form("Extra3"),100))
		rs("Extra4")=trim(left(request.Form("Extra4"),100))
		rs("Extra5")=trim(left(request.Form("Extra5"),100))
		rs("Extra6")=trim(left(request.Form("Extra6"),100))
		rs("Extra7")=trim(left(request.Form("Extra7"),100))
		rs("Extra8")=trim(left(request.Form("Extra8"),100))
		rs("Extra9")=trim(left(request.Form("Extra9"),100))

     Rs.Update
 Rs.Close : Set Rs=Nothing
 ConnObj.Close : Set ConnObj=Nothing
%>
<html>
<head>
<title>Inscrição concluida</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../includes/Minitel.css" rel="stylesheet" type="text/css">
</head>
<body>
<br>
<br>
<hr>
<p align="center">
<b class="link">Obrigado por se ter registado.</b><br><br>
<span class="Zonas">Se visualizou esta mensagem é porque o seu pedido de registo foi <b>submetido com sucesso</b> na nossa base de dados.
</span><br>
<br>
<span class="link">Não é necessária qualquer outra confirmação. </span></p>
<hr>
</body>
</html>
