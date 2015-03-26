<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<%If session("Clientes_ColaboradoresID")="" Then response.redirect("DO_logout_run.asp")%>
<%
	if request.Form("botao2")<>"" Then
		MySQL="execute WEB_RecPasswordColaborador '" & session("Clientes_ColaboradoresID") & "','" & txt.abstxt(request.Form("PASSNOVA"))& "';"
		db.queryexec(cstr(MySQL))
	end if
	response.Redirect("/?OP=CLIENTEFICHASITECOLABORADOR&RES=OK")
%>