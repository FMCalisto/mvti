<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
213.58.110.102
<br>
<%
response.write("ALL_HTTP:" & request.ServerVariables("ALL_HTTP") & "<br>")
response.write("ALL_RAW:" & request.ServerVariables("ALL_RAW") & "<br>")
response.write("APPL_MD_PATH:" & request.ServerVariables("APPL_MD_PATH") & "<br>")
response.write("APPL_PHYSICAL_PATH:" & request.ServerVariables("APPL_PHYSICAL_PATH") & "<br>")
response.write("AUTH_PASSWORD:" & request.ServerVariables("AUTH_PASSWORD") & "<br>")
response.write("AUTH_TYPE:" & request.ServerVariables("AUTH_TYPE") & "<br>")
response.write("AUTH_USER:" & request.ServerVariables("AUTH_USER") & "<br>")
response.write("CERT_COOKIE:" & request.ServerVariables("CERT_COOKIE") & "<br>")
response.write("CERT_FLAGS:" & request.ServerVariables("CERT_FLAGS") & "<br>")
response.write("CERT_ISSUER:" & request.ServerVariables("CERT_ISSUER") & "<br>")
response.write("CERT_KEYSIZE:" & request.ServerVariables("CERT_KEYSIZE") & "<br>")
response.write("CERT_SECRETKEYSIZE:" & request.ServerVariables("CERT_SECRETKEYSIZE") & "<br>")
response.write("CERT_SERIALNUMBER:" & request.ServerVariables("CERT_SERIALNUMBER") & "<br>")
response.write("CERT_SERVER_ISSUER:" & request.ServerVariables("CERT_SERVER_ISSUER") & "<br>")
response.write("CERT_SERVER_SUBJECT:" & request.ServerVariables("CERT_SERVER_SUBJECT") & "<br>")
response.write("CERT_SUBJECT:" & request.ServerVariables("CERT_SUBJECT") & "<br>")
response.write("CONTENT_LENGTH:" & request.ServerVariables("CONTENT_LENGTH") & "<br>")
response.write("CONTENT_TYPE:" & request.ServerVariables("CONTENT_TYPE") & "<br>")
response.write("GATEWAY_INTERFACE:" & request.ServerVariables("GATEWAY_INTERFACE") & "<br>")
response.write("HTTP_<HeaderName>:" & request.ServerVariables("HTTP_<HeaderName>") & "<br>")
response.write("HTTP_ACCEPT:" & request.ServerVariables("HTTP_ACCEPT") & "<br>")
response.write("HTTP_ACCEPT_LANGUAGE:" & request.ServerVariables("HTTP_ACCEPT_LANGUAGE") & "<br>")
response.write("HTTP_COOKIE:" & request.ServerVariables("HTTP_COOKIE") & "<br>")
response.write("HTTP_REFERER:" & request.ServerVariables("HTTP_REFERER") & "<br>")
response.write("HTTP_USER_AGENT:" & request.ServerVariables("HTTP_USER_AGENT") & "<br>")
response.write("HTTPS:" & request.ServerVariables("HTTPS") & "<br>")
response.write("HTTPS_KEYSIZE:" & request.ServerVariables("HTTPS_KEYSIZE") & "<br>")
response.write("HTTPS_SECRETKEYSIZE:" & request.ServerVariables("HTTPS_SECRETKEYSIZE") & "<br>")
response.write("HTTPS_SERVER_ISSUER:" & request.ServerVariables("HTTPS_SERVER_ISSUER") & "<br>")
response.write("HTTPS_SERVER_SUBJECT:" & request.ServerVariables("HTTPS_SERVER_SUBJECT") & "<br>")
response.write("INSTANCE_ID:" & request.ServerVariables("INSTANCE_ID") & "<br>")
response.write("INSTANCE_META_PATH:" & request.ServerVariables("INSTANCE_META_PATH") & "<br>")
response.write("LOCAL_ADDR:" & request.ServerVariables("LOCAL_ADDR") & "<br>")
response.write("LOGON_USER:" & request.ServerVariables("LOGON_USER") & "<br>")
response.write("PATH_INFO:" & request.ServerVariables("PATH_INFO") & "<br>")
response.write("PATH_TRANSLATED:" & request.ServerVariables("PATH_TRANSLATED") & "<br>")
response.write("QUERY_STRING:" & request.ServerVariables("QUERY_STRING") & "<br>")
response.write("REMOTE_ADDR:" & request.ServerVariables("REMOTE_ADDR") & "<br>")
response.write("REMOTE_HOST:" & request.ServerVariables("REMOTE_HOST") & "<br>")
response.write("REMOTE_USER:" & request.ServerVariables("REMOTE_USER") & "<br>")
response.write("REQUEST_METHOD:" & request.ServerVariables("REQUEST_METHOD") & "<br>")
response.write("SCRIPT_NAME:" & request.ServerVariables("SCRIPT_NAME") & "<br>")
response.write("SERVER_NAME:" & request.ServerVariables("SERVER_NAME") & "<br>")
response.write("SERVER_PORT:" & request.ServerVariables("SERVER_PORT") & "<br>")
response.write("SERVER_PORT_SECURE:" & request.ServerVariables("SERVER_PORT_SECURE") & "<br>")
response.write("SERVER_PROTOCOL:" & request.ServerVariables("SERVER_PROTOCOL") & "<br>")
response.write("SERVER_SOFTWARE:" & request.ServerVariables("SERVER_SOFTWARE") & "<br>")
response.write("URL:" & request.ServerVariables("URL") & "<br>")



%>
</body>
</html>
