<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE VIRTUAL="/includes/OpenCon.asp"-->
<%
if trim(request.Form("endereco"))<>"" Then
	Dim Endereco : Endereco=trim(request.Form("endereco"))
	Dim MySQL : MySQL=""

	MySQL="Select * from NewsLetter where email='" & Endereco & "'"
	rs.open(MySQL),connobj,3,3
	If Rs.Eof Then
		Rs.Close 'Não existe
		MySQL="insert into NewsLetter (email,Activo) values ('" & Endereco & "',0)"
		rs.open(MySQL),connobj,3,3
	Else
		rs.update("Activo")=0
		rs.close
	End if
End If
%>
<!--#INCLUDE VIRTUAL="/includes/CloseCon.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Remover E-mail</title>
<link href="includes/Minitel.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style2 {color: #666666}
-->
</style>
</head>
<body>
<div align="center">
  <p class="style1">&nbsp;	</p>
  <p class="style1">&nbsp;</p>
  <p class="style1">&nbsp;</p>
  <p class="style1">&nbsp;</p>
  <p class="style1">&nbsp;</p>
  <p class="style1 style2">O seu e-mail foi removido da nossa base de dados.
  </p>
</div>
</body>
</html>
