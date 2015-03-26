<html>
<head>
<title>Calling a webservice from classic ASP</title>
</head>
<body>
<%
If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
    Dim xmlhttp
    Dim DataToSend
    DataToSend="val1="&Request.Form("text1")&"&val2="&Request.Form("text2")
    Dim postUrl
    If Request.Form.Item("Operation")="Sum" Then
		postUrl = "https://servicos.redunicre.pt/servicosru/GlobalInfo.asmx/ExecFunc"
	else
	    postUrl = "https://servicos.redunicre.pt/servicosru/GlobalInfo.asmx/ListFunc" 	
	end if    
    Set xmlhttp = server.Createobject("MSXML2.XMLHTTP")
    xmlhttp.Open "POST",postUrl,false
    xmlhttp.setRequestHeader "Content-Type","application/x-www-form-urlencoded"
    xmlhttp.send DataToSend
    Response.Write DataToSend  & "<br>"
    Response.Write(xmlhttp.responseText)
Else
    Response.Write "Loading for first Time"  
End If
%>
<FORM method=POST name="form1" ID="Form1">
Enter the two Values to perform Operation<BR>
<select name="Operation">Select Operation<option value="ExecFunc">Sum</option><option value="ListFunc">Subtraction</option></select> 
<INPUT type="text" name="text1" ID="Text1">
<INPUT type="text" name="text2" ID="Text2">
<BR><BR>
<INPUT type="submit" value="GO" name="submit1" ID="Submit1">
</form>
</body>
</html></PRE>