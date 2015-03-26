<html>
<head>
<title></title>
</head>
<body>

<% 

Dim webServiceUrl, httpReq, node, myXmlDoc 

webServiceUrl = "https://servicos.redunicre.pt/servicosru/GlobalInfo.asmx?op=ExecFunc"
Set httpReq = Server.CreateObject("MSXML2.ServerXMLHTTP") ("WinHttp.WinHttpRequest.5.1")

httpReq.Open "GET", webServiceUrl, False 
httpReq.Send 

Set myXmlDoc =Server.CreateObject("MSXML.DOMDocument")
myXmlDoc.load(httpReq.responseBody) 

Set httpReq = Nothing 

Set objLst = myxmlDoc.getElementsByTagName("*")
If objLst is Nothing Then 
Response.Write("There are no Nodes")
Else
Response.Write("There are nodes")
Response.Write("</BR>Number of nodes in response:" & objLst.length)
'For i = 0 to (objLst.length-1)
'Response.Write(CStr(objLst.item(i).nodeName))
'Next
End If


Set node = myXmlDoc.documentElement.selectSingleNode("//fullname")
If Not node Is Nothing Then 
consumeWebService = "<b>No User present in AD</b><font color = blue>" & node.text & "</font>" 

Else 
consumeWebService = "<b>User is present in AD</b>" 

End If 

Response.write(consumeWebService)

%>

</body>
</html>