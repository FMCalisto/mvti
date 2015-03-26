<!--#INCLUDE virtual="/includes/FuncoesGENERICAS.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>WebAdmin - Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="/includes/minitel.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
<form action="Login_RUN.asp" method="post">
<br>
<br>
<br>
<br>
<br>
<table border="0" cellpadding="0" cellspacing="0" width="550" height="400">
<tr align="center" valign="middle">
	<td background="<%=RandomBanner("/webadmin/fotos/",".jpg")%>" style="background-position:center ; background-repeat:no-repeat" bgcolor="#000000"><img src="/webadmin/images/moldura.gif" width="550"></td>
</tr>
</table>
<br>
<table border="0" cellpadding="0" cellspacing="0" width="594">
<tr align="center" valign="middle" height="20">
	<td align="center" valign="middle">
		  <span class="Texto_Top2">Nome de utilizador PHC : </span>		  <input name="username" type="text" class="Texto" value="<%=request.Cookies("UserLogin")%>" size="20" maxlength="30">
		  <span class="Texto_Top2">Password do PHC : </span>		  <input name="password" type="password" class="Texto" value="" size="20" maxlength="20">
	    &nbsp;<input type="submit" name="botao" value="Login">	</td>
</tr>
</table>
</form>
</div>
</body>
</html>
