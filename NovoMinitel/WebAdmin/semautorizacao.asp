<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Area de acesso reservado</title>
</head>
<body>
<p>Esta &eacute; uma &aacute;rea de acesso reservado aos colaboradores da MINITEL.</p>
<p>S&oacute; &eacute; acessivel desde dentro da intranet da empresa.</p>
<p>&nbsp;</p>
<p align="center">IP <%=Request.ServerVariables("REMOTE_ADDR")%></p>
</body>
</html>
