<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>
<body>
teste22
<table border="1" width="500" style="border-collapse: collapse"> 
<% 
For each item in Request.ServerVariables 
   Response.Write("<tr><td>" & item & "</td><td>") 
   Response.Write(Request.ServerVariables(item)) 
   Response.Write("</td></tr>" & vbCrLf) 
Next 
%> 
</table>
<%=Request.ServerVariables("SERVER_NAME")%>
<br />
TESTE : <%=formatnumber(12345,2)%>
TESTE : <%=formatnumber(45.98,2)%>
TESTE : <%=formatnumber(45.98,2)%>
</body>
</html>
