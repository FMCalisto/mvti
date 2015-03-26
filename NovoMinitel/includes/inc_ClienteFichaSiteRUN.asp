<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<%If session("no")="" Then response.redirect("DO_logout_run.asp")%>
<%
	if request.Form("botao3")<>"" Then
		MySQL="execute Add_WN_Clientes_OutrosEMails '" & request.Form("email") & "'," & session("NO")
		db.queryexec(cstr(MySQL))
	end if

	if request.Form("botao2")<>"" Then
		MySQL="select clstamp from wn_clientes where no=" & session("NO")
		DTxt=trim(db.query(cstr(mysql))("clstamp"))
	
		MySQL="execute WEB_RecPassword '" & DTxT & "','" & txt.abstxt(request.Form("PASSNOVA"))& "';"
		db.queryexec(cstr(MySQL))
	end if

	if request.QueryString("ID")<>"" Then
		MySQL="delete from WN_Clientes_OutrosEMails where clstamp='" & txt.abstxt(request.QueryString("clstamp")) & "' and Clientes_OutrosMailsID=" & txt.abstxt(request.QueryString("ID"))
		db.queryexec(cstr(MySQL))
	End if
	response.Redirect("/?OP=CLIENTEFICHASITE&RES=OK")
%>