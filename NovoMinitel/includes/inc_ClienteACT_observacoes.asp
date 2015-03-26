<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE virtual="/includes/inc_variaveis_globais.asp"-->
<!--#INCLUDE virtual="/includes/inc_FuncoesCRT.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Observações do cliente</title>
<link href="/includes/Minitel.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#0099FF">
	<p align="center"><strong>Observações</strong></p>
	<p align="left">&nbsp;</p>
	<%If request.Form("Code")<>Session.SessionID Then%>	
	<form action="#" method="post">
		<p align="center">Area de acesso reservado !</p>
		<p align="center">Palavra-passe : <input type="password" value="" name="password" /></p>
		<p align="center"><input type="submit" value="Verificar"/></p>
		<input type="hidden" name="ClStamp" value="<%=URLDecode(request.querystring("ClStamp"))%>" />
		<input type="hidden" name="code" value="<%=session.SessionID%>" />
	</form>
	<%Else%>
		<%if db.ClienteValido("NA","@"+left(session("Comercial"),instr(session("Comercial"),"@")-1),request.Form("password"))="100" Then%>
			<p align="left"><strong>Texto</strong> : <%=db.query(cstr("Select Obs from wn_clientes where ClStamp='" & URLDecode(request.form("ClStamp")) & "'"))("OBS")%> </p>
		<%Else%>
			<p align="center">Erro !</p>
		<%End if%>
	<%End if%>

</body>
</html>
