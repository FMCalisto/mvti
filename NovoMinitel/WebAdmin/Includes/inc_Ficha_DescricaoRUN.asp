<% @ Language=VBScript %>
<%
Option Explicit 
Dim StringX : StringX=""
Dim ConnObjX : Set ConnObjX=Server.CreateObject("ADODB.Connection")
Dim RsX : Set RsX=Server.CreateObject("ADODB.RecordSet")

ConnObjX.Open("Provider=SQLOLEDB;Server=SRVWEB;Uid=web;PWD=web;Database=WebMinitel;")
		rsx.open("Select StockEspanhaID from StockEspanha where referencia='" & trim(request.Form("Referencia")) & "';"),ConnObjX,1,1
		If Not(RsX.Eof) Then		
			ConnObjX.execute ("Update StockEspanha Set Designacao='" & trim(Request.Form("Designacao")) & "' Where Referencia='" & Trim(Request.Form("Referencia")) &"';")
		Else
			'Se nao Existe vou fazer um registo novo
			RsX.Close '
			Set RsX=Nothing
			ConnObjX.execute("Insert StockEspanha (Designacao,Referencia) Values ('" & trim(Request.Form("Designacao")) & "','" & trim(request.Form("Referencia")) & "');")
		End IF
ConnObjX.Close
response.Redirect("/WebAdmin/Ficha_Descricao.asp?Referencia=" & request.Form("Referencia"))
%>