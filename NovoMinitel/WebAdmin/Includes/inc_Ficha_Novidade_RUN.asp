<% @ Language=VBScript %>
<%
Option Explicit 
Dim StringX : StringX=""
Dim ConnObjX : Set ConnObjX=Server.CreateObject("ADODB.Connection")
Dim RsX : Set RsX=Server.CreateObject("ADODB.RecordSet")
If request.querystring("NovidadeID")<>"" and Request.Querystring("Activa")<>"" Then
	Dim Valor
	If Trim(Request.Querystring("Activa"))="True" Then Valor=1 Else Valor=0
	'Agora vou inverter o valor recebido de forma a negalo
	If Valor=1 Then Valor=0 Else Valor=1
	ConnObjX.Open("Provider=SQLOLEDB;Server=SRVWEB;Uid=web;PWD=web;Database=WebMinitel;")
		StringX="update Novidades Set Activa=" & Valor & " where NovidadeID=" & trim(request.querystring("NovidadeID"))
		ConnObjX.execute(StringX)
	ConnObjX.Close
	response.Redirect("/WebAdmin/Lista_Novidades.asp")
End if
%>