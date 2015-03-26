<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<%
  Session("ClienteON")=False
  Set Session("No")=nothing
  Set Session("colaborador")=nothing

	ATXT=request.QueryString("X") 'Capturo a codificação que vem no link

	BTXT=txt.QSVTXT("U",cstr(ATXT)) 'Utilizador
	CTXT=txt.QSVTXT("C",cstr(ATXT)) 'Colaborador
	DTXT=txt.QSVTXT("P",cstr(ATXT)) 'Pass

  Session("TXT")=trim(db.ClienteValido(cstr(BTXT),cstr(CTXT),cstr(DTXT)))

  Set Session("no")=nothing
  Set Session("colaborador")=nothing
 
  Select case Session("TXT")
	Case "0"
		Session("no")=ucase(request.Form("no"))
		If Mid(Session("no"), 1, 1) = "C" Then Session("no") = Right(Session("no"), Len(Session("no")) - 1)

		Session("ClienteON")=True
		Session("no")=cint(BTXT)
		Session("colaborador")=trim(CTXT)


		if ucase(Session("colaborador"))<>"ADMIN" Then
			MySQL="select Clientes_ColaboradoresID from WN_Clientes_Colaboradores where no=" & Session("no") & " and ColaboradorUser='" & Session("colaborador") & "'"
			session("Clientes_ColaboradoresID")=cint(db.query(cstr(MySQL))("Clientes_ColaboradoresID"))
		else
			session("Clientes_ColaboradoresID")=-1
		end if

		Response.Redirect("/?OP=LoginOK")
	Case "100" 'Nosso colega comercial

		Session("ClienteON")=False
		Session("ComercialON")=True
		Session("Comercial")=right(trim(request.Form("colaborador")),len(trim(request.Form("colaborador")))-1) & "@minitel.pt"

		Response.Redirect("/?OP=LoginComercialOK")
	Case Else
	Response.Redirect("/?OP=LoginErro")
  End Select
%>