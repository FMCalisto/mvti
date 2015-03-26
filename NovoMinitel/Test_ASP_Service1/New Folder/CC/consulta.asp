<html>
<head>
<title>Calling a webservice from classic ASP</title>
</head>
<body>
<%
If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
Dim xmlhttp
Dim DataToSend
DataToSend="val1="&Request.Form("userName")&"&val2="&Request.Form("passWd")
Dim postUrl
If Request.Form.Item("Operation")="Sum" Then
postUrl = "https://servicos.redunicre.pt/servicosru/estabelecimentos.asmx?op=ListaEstabelecimentos"
end if 
Set xmlhttp = server.Createobject("MSXML2.XMLHTTP")
'xmlhttp.Open "POST",postUrl,false
'xmlhttp.setRequestHeader "Content-Type","application/x-www-form-urlencoded"
'xmlhttp.send DataToSend
Response.Write DataToSend & "<br>"
'Response.Write(xmlhttp.responseText)
Else
Response.Write "Loading for first Time" 
End If
%>
<FORM method="POST" name="form1" ID="Form1">
Enter the two Values to perform Operation<BR>
<INPUT type="text" name="text1" ID="sessId">
<INPUT type="text" name="userName" ID="userName">
<INPUT type="text" name="passwd" ID="passWd">
<BR><BR>
<INPUT type="submit" value="GO" name="submit1" ID="Submit1">
</form>
</body>
</html>