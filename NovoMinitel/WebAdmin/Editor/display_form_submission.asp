<% @ Language=VBScript %>
<%
Dim strEditorContent : strEditorContent = Trim(Request.Form("textarea"))
Dim StringX
Dim ConnObjX : Set ConnObjX=Server.CreateObject("ADODB.Connection")
Dim RsX : Set RsX=Server.CreateObject("ADODB.RecordSet")



If Session("From")="Ficha_Descricao.asp" Then
 	if Session("Tipo")="E" Then
		ConnObjX.Open("Provider=SQLOLEDB;Server=SRVWEB;Uid=web;PWD=web;Database=WebMinitel;")
		'Verifico se o produto j
		rsx.open("Select StockEspanhaID from StockEspanha where referencia='" & trim(request.Form("Referencia")) & "';"),ConnObjX,1,1
		If Not(RsX.Eof) Then		
			ConnObjX.execute("update StockEspanha set Descricao='" & strEditorContent & "' where referencia='" & trim(request.Form("Referencia")) & "';")
			ConnObjX.execute("update WN_ListaProdutosT set Observacoes='" & strEditorContent & "' where referencia='" & trim(request.Form("Referencia")) & "' And Tipo='" & Session("Tipo") & "';")
			ConnObjX.Close
		Else
			'Se nao Existe vou fazer um registo novo
			RsX.Close '
			Set RsX=Nothing
			ConnObjX.execute("Insert StockEspanha (Descricao,Referencia) Values ('" & strEditorContent & "','" & trim(request.Form("Referencia")) & "');")
		End IF
	End if
	If Session("Tipo")="P" Then
		'Gravo no servidor web
		ConnObjX.Open("Provider=SQLOLEDB;Server=SRVWEB;Uid=web;PWD=web;Database=WebSiteMINITEL;")
		ConnObjX.execute("update WN_ListaProdutos set Descricao='" & strEditorContent & "' where ref='" & trim(request.Form("Referencia")) & "';")
		ConnObjX.Close
		'Gravo no servidor web
		ConnObjX.Open("Provider=SQLOLEDB;Server=SRVPHC14;Uid=sa;PWD=sqladm;Database=MIN_PHC;")
		ConnObjX.execute("update stobs set stobs='" & strEditorContent & "' where STOBS.ref='" & trim(request.Form("Referencia")) & "';")
		ConnObjX.Close
	End if
End if
If Session("From")="Ficha_Novidade.asp" Then
		ConnObjX.Open("Provider=SQLOLEDB;Server=SRVWEB;Uid=web;PWD=web;Database=WebMinitel;")
		ConnObjX.execute("update Novidades set Texto='" & strEditorContent & "' where NovidadeID='" & trim(request.Form("Referencia")) & "' And Tipo='" & Session("Tipo") & "';")
End if
response.Redirect("/WebAdmin/" & Session("From") & "?Referencia=" & trim(request.Form("Referencia")))
%>
