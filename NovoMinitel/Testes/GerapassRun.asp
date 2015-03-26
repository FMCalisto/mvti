<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE VIRTUAL="/includes/OpenCon.asp"-->
<!--#INCLUDE VIRTUAL="/includes/FuncoesGenericas.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GetPass</title>
</head>
<body>
<%
'**********************************************
Function EnviaMail(ValorIN)

Dim INCont
Dim MySQL
Dim Password
Dim BodyText
Dim ResultadoDeEnvio

	INCont=trim(ValorIN)
	
	MySQL ="SELECT distinct Nome, ClienteEmail FROM Wn_Revendedor where (ClienteNCont='" & INCont & "');"
	rs.Open MySQl,ConnObj,3,3
	if not (rs.eof) Then
		Password=FillRnd(10)
		if rs("ClienteEmail")<>"" Then 'Envia o mail
			BodyText=""
			BodyText=BodyText & "A Chave de Acesso foi alterada em " & Now & vblf
			BodyText=BodyText & "Código de Cliente :" & rs("nome") & vblf
			BodyText=BodyText & "Chave de Acesso actual :" & Password & vblf
			BodyText=BodyText & vblf
			BodyText=BodyText & "Os códigos são pessoais e intransmissíveis e não os deve dar a conhecer a ninguém." & vblf
			BodyText=BodyText & "Altere regularmente a Chave de Acesso." & vblf
			BodyText=BodyText & vblf
			BodyText=BodyText & "Visite nosso site : " & GetOutLoginLink(rs("nome"),Password) & vblf
			BodyText=BodyText & vblf
			BodyText=BodyText & "***************************************************************** " & vblf
			BodyText=BodyText & "Esta mensagem foi-lhe enviada por um sistema automático. " & vblf
			BodyText=BodyText & vblf
			BodyText=BodyText & "Qualquer duvida acerca do conteúdo da mesma, contacte-nos. " & vblf
			BodyText=BodyText & "Minitel - Sociedade de Fomento de Aplicações Informáticas, L.da. " & vblf
			BodyText=BodyText & "Travessa Légua da Póvoa, 1A - 1250-136 Lisboa " & vblf
			BodyText=BodyText & "Tel: +351 21 381 09 00 - Fax: +351 21 385 05 44 " & vblf
			BodyText=BodyText & "E-mail: info@minitel.pt " & vblf
			BodyText=BodyText & "*****************************************************************" & vblf
						   			  '(MailNome,          MailTo,    CCNome,CCto Subject,Body)
				ResultadoDeEnvio=EnviaEmail("Estimado Cliente",rs("ClienteEmail"),"","","",rs("nome") & " - Recuperacao da Chave de Acesso",BodyText)
			If Resultado=0 Then
				Call MudaPass(rs("nome"),Password)
				ResultadoDeEnvio="Envio pr e-mail OK"
			Else
				ResultadoDeEnvio="Erro na ligação ao servidor interno de e-mail"
			End if
		Else
			ResultadoDeEnvio="Cliente sem e-mail definido"
		end if
	Else
		ResultadoDeEnvio="Não encontrei o registo na DB"
	End if
	Rs.close
	EnviaMail=ResultadoDeEnvio
End Function
'**********************************************
Function SeparaNIF(ValorIN)
Dim r : r=0
Dim Palavra : Palavra=""
Dim Letra : Letra=""
	For r=1 to Len(ValorIN)
		Letra=mid(ValorIn,r,1)
		If IsNumeric(Letra) Then 
			Palavra=Palavra & Letra
		Else
			If Len(Palavra)=9 Then
				Response.Write(Palavra & " : " & EnviaMail(Palavra) & "<br>")
				Palavra=""
			End if
		End if
	Next
End Function
'**********************************************
Call SeparaNIF(request.Form("NIF") & " ")
%>
<!--#INCLUDE VIRTUAL="/includes/CloseCon.asp"-->
</body>
</html>
