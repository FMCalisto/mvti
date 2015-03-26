<%
Function Testa(ValorIn)
	if instr(request.ServerVariables("REMOTE_ADDR"),"192.168.0.64")=1 Then 
		%>
			<br>
			<b>Valor :</b><%=ValorIn%>
			<br>
		<%
		response.Flush()
	End if
End Function
'******************************************************************************
'if Session("ConOpen")<>"OK" Then
	Dim ConnObj
	Set ConnObj=Server.CreateObject("ADODB.Connection")
	Dim RS
	Set RS=Server.CreateObject("ADODB.Recordset")
	ConnObj.Open("Provider=SQLOLEDB;Server=SRVWEB;Uid=web;PWD=web;Database=WebSiteMINITEL;")
	Session("ConOpen")="OK"
	rem ConnObj.connectiontimeout=1440
session("Lingua")=1 'Portugal

if instr(ucase(request.ServerVariables("SERVER_NAME")),"MINITELSPAIN")>=1 or instr(ucase(request.ServerVariables("SERVER_NAME")),".ES")>=1 Then
	session("Lingua")=2 'Espanha
	Session("TIPO")="E"
Else
	session("Lingua")=1 'Portugal
	Session("TIPO")="P"
End if
%>
