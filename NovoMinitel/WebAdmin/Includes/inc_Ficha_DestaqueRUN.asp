<%
Option Explicit 
Dim StringX : StringX=""
Dim ConnObjX : Set ConnObjX=Server.CreateObject("ADODB.Connection")
Dim RsX : Set RsX=Server.CreateObject("ADODB.RecordSet")

Dim R : R=0
Dim Ref : Ref=""
Dim ID : ID=0


ConnObjX.Open("Provider=SQLOLEDB;Server=SRVWEB;Uid=web;PWD=web;Database=WebMinitel;")
For r=1 to request.Form("DestaqueID").Count
	StringX="select Referencia from wn_listaprodutosT where referencia='" & Request.Form("Referencia").item(r) & "' and Tipo='" & Session("Tipo") & "';"
	rsx.open (StringX),ConnObjX,1,1
	If not rsx.eof Then
		ConnObjX.execute ("Update Destaque Set referencia='" & Request.Form("Referencia").item(r) & "' Where DestaqueID=" & Request.Form("DestaqueID").item(r) & " and tipo='"& Session("Tipo") &"';")
	End if
	rsx.close
Next 'r
ConnObjX.Close


'Agora vou inverter o valor recebido de forma a negalo
'If Valor=1 Then Valor=0 Else Valor=1
'	StringX="update Novidades Set Activa=" & Valor & " where NovidadeID=" & trim(request.querystring("NovidadeID"))
'	ConnObjX.execute(StringX)
response.Redirect("/WebAdmin/Lista_Destaque.asp")
%>