<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<!--#INCLUDE file="FuncoesGENERICAS.asp"-->
<%
	If request.Form("OP")="EDIT" Then
		mysql="update WN_Clientes_ACT set Texto='" & request.Form("Texto") & "' from dbo.WN_Clientes_ACT where IDWN_Clientes_ACT=" & request.Form("ID")
		db.queryexec(cstr(MySQL))
		response.Redirect("/?OP=ACT&CLSTAMP=" & request.Form("CLSTAMP"))
	End if

	if request.Form("Gravar")<>"" Then
		MySQL="execute Add_WN_Clientes_ACT '" & txt.abstxt(request.Form("texto")) & "','" & txt.abstxt(DataIngles(request.Form("data"))) & "','" & txt.abstxt(request.Form("CLSTAMP")) & "';"
		db.queryexec(cstr(MySQL))
		response.Redirect("/?OP=ACT&CLSTAMP=" & request.Form("CLSTAMP"))
	end if

	If request.QueryString("OP")="DEL" and request.QueryString("ID")<>"" Then
		MySQL="update WN_Clientes_ACT set Activa=0 where IDWN_Clientes_ACT=" & request.QueryString("ID")
		db.queryexec(cstr(MySQL))
		response.Redirect("/?OP=ACT&CLSTAMP=" & request.querystring("CLSTAMP"))
	End if
	
%>