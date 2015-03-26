<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<%
  Session("ClienteON")=False
  Set Session("No")=nothing
  Set Session("colaborador")=nothing

  Session("ComercialON")=False
  Set Session("Comercial")=Nothing

  'Pro caso de algum utilizador ainda usar o C antes do numero C18044 ->> 18044
  Atxt=txt.abstxt(request.Form("no"))
  If ucase(left(Atxt,1))="C" Then Atxt=right(Atxt,5)

  Session("TXT")=trim(db.ClienteValido(cstr(Atxt),txt.abstxt(request.Form("colaborador")),txt.abstxt(request.Form("password"))))

  Set Session("no")=nothing
  Set Session("colaborador")=nothing
 
  Select case Session("TXT")
	Case "0"
		Session("no")=ucase(request.Form("no"))
		If Mid(Session("no"), 1, 1) = "C" Then Session("no") = Right(Session("no"), Len(Session("no")) - 1)

		Session("ClienteON")=True
		Session("no")=cint(Session("no"))
		Session("colaborador")=trim(request.Form("colaborador"))
		If Session("colaborador")="" Then Session("colaborador")="ADMIN"

		
		if ucase(Session("colaborador"))<>"ADMIN" Then
			MySQL="select Clientes_ColaboradoresID from WN_Clientes_Colaboradores where no=" & Session("no") & " and ColaboradorUser='" & Session("colaborador") & "'"
			session("Clientes_ColaboradoresID")=cint(db.query(cstr(MySQL))("Clientes_ColaboradoresID"))
		else
			session("Clientes_ColaboradoresID")=-1
		end if

		Response.Redirect("/?OP=LoginOK")
	Case "100" 'Nosso colega comercial
		Session("no")=0
		Session("ClienteON")=False
		Session("ComercialON")=True
		Session("autenticado")=1 ' Serve para acerder à administração do site 
		Session("Comercial")=right(trim(request.Form("colaborador")),len(trim(request.Form("colaborador")))-1) & "@minitel.pt"
		if ucase(Session("Comercial"))="FERNANDO.SANTOS@MINITEL.PT" or ucase(Session("Comercial"))="ISABEL.RICO@MINITEL.PT" Then
			Session("Admin")=1
		else
			Session("Admin")=0
		end if
		
		MySQL=right(trim(request.Form("colaborador")),len(trim(request.Form("colaborador")))-1)
		MySQL=Replace(mysql,"."," ")
		
		if instr(MySQL,"luis")>0 Then mysql=replace(mysql,"luis","luís") 'Porque o PLuis tem asento no nome do Comercial
		
		mysql="select top 1 vendedornumero from View_ClientesComercialDados where cmdesc='" & MySQL & "';"
			Set Clientes=db.Query(cstr(mysql))
			if not Clientes.Eof Then
				Session("vendedornumero")=Clientes("vendedornumero")
			Else
				Session("vendedornumero")=-1 'É porque o comercial nao tem clientes atribuidos
			End if
			Clientes.Close
		Set Clientes=Nothing

		Response.Redirect("/?OP=LoginComercialOK")
	Case Else
	Response.Redirect("/?OP=LoginErro")
  End Select
%>