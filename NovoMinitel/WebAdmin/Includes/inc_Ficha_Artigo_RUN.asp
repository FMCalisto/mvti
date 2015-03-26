<% @ Language=VBScript %>
<%
Option Explicit 
Dim StringX : StringX=""
Dim ConnObjX : Set ConnObjX=Server.CreateObject("ADODB.Connection")
Dim RsX : Set RsX=Server.CreateObject("ADODB.RecordSet")
If request.querystring("ArtigoID")<>"" and Request.Querystring("Activa")<>"" Then
	Dim Valor
	If Trim(Request.Querystring("Activa"))="True" Then Valor=1 Else Valor=0
	'Agora vou inverter o valor recebido de forma a negalo
	If Valor=1 Then Valor=0 Else Valor=1
	ConnObjX.Open("Provider=SQLOLEDB;Server=SRVWEB;Uid=web;PWD=web;Database=WebMinitel;")
		StringX="update ArtigosImprensa Set Activa=" & Valor & " where ArtigoID=" & trim(request.querystring("ArtigoID"))
		ConnObjX.execute(StringX)
	ConnObjX.Close
	response.Redirect("/WebAdmin/Lista_artigos.asp")
End if

If request.form("ArtigoID")<>"NEW" and Request.Form("ArtigoID")<>"" Then
	'Gravo no servidor web
	ConnObjX.Open("Provider=SQLOLEDB;Server=SRVWEB;Uid=web;PWD=web;Database=WebMinitel;")
	StringX="SELECT ArtigosImprensa.* FROM ArtigosImprensa INNER JOIN WN_ListaProdutosT ON ArtigosImprensa.Referencia=WN_ListaProdutosT.Referencia AND WN_ListaProdutosT.Tipo = '" & Session("Tipo") & "' AND ArtigosImprensa.Tipo = '" & Session("Tipo") & "' WHERE (ArtigosImprensa.ArtigoID =" & Trim(Request.Form("ArtigoID")) &" and ArtigosImprensa.Referencia='" & Trim(Request.Form("Referencia")) & "');"
	RsX.Open (StringX),ConnObjX,3,3
	if not RsX.eof Then
		RsX("Activa")=Trim(Request.Form("Activa"))="True"
		RsX("Quando")=Now()
		RsX("Referencia")=Trim(Request.Form("Referencia"))
		RsX("NomeRevista")=Trim(Request.Form("NomeRevista"))
		RsX("TituloArtigo")=Trim(Request.Form("TituloArtigo"))
		RsX.Update
		RsX.Close : Set RsX=Nothing
		ConnObjX.Close : Set ConnObjX=Nothing
		response.Redirect("/WebAdmin/Ficha_Artigo.asp?ArtigoID=" & trim(request.Form("ArtigoID")))
	Else
		RsX.Close : Set RsX=Nothing
		ConnObjX.Close : Set ConnObjX=Nothing
		Response.Write("Não foi possivel gravar o registo.<br>A refêrencia não existe ou o numero do artigo foi indevidamente alterado.")
	End if
End if
If request.form("ArtigoID")="NEW" Then
	ConnObjX.Open("Provider=SQLOLEDB;Server=SRVWEB;Uid=web;PWD=web;Database=WebMinitel;")
	StringX="Select * From WN_ListaProdutosT where Referencia='" & Request.Form("Referencia") & "' and Tipo='" & Session("Tipo") & "'"

	RsX.Open StringX,ConnObjX,1,1
	If RsX.eof Then
		response.Write("Não encontrei a referência")
	Else
		RsX.Close
		StringX="Select * From ArtigosImprensa"
		RsX.Open StringX,ConnObjX,3,3
			RsX.AddNew
				RsX("Referencia")=Trim(Request.Form("Referencia"))
				RsX("NomeRevista")=Trim(Request.Form("NomeRevista"))
				RsX("TituloArtigo")=Trim(Request.Form("TituloArtigo"))
				RsX("Tipo")=Trim(Session("Tipo"))
			RsX.Update
			rsx.movelast
		RsX.Close : Set RsX=Nothing
		ConnObjX.Close : Set ConnObjX=Nothing
		response.Redirect("/WebAdmin/Ficha_Artigo.asp?ArtigoID=" & rsx("ArtigoID"))
	End if	
End if
%>