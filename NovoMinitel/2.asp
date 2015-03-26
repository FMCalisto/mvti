<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>
<body>
<% 
Dim strFileName 
Response.Buffer = True
Response.Expires = 0
Response.Clear

strFileName = "fx.zip" 

Response.ContentType = "application/octet-stream" 
Response.AddHeader "Content-disposition","attachment;filename=" & strFileName 

Set objStream = Server.CreateObject("ADODB.Stream") 
objStream.Open 
objStream.Type = 1 '1=binary 2=text 
'objStream.LoadFromFile Server.MapPath(strFileName) 
objStream.LoadFromFile "c:\fx.zip" 

Response.BinaryWrite objStream.Read 

objStream.Close 
Set objStream = Nothing 
%> 

</body>
</html>
