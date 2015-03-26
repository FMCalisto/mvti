<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<%
	ATXT=cint(txt.abstxt(request.Form("quantidade")))
	if isnumeric(ATXT) Then
		mysql="execute WEB_AcertaQuantidade " & request.Form("IDCarrinhoTemp") & "," & ATXT
		db.queryexec(cstr(mysql))
	End if

	if request.Form("apaga.x")<>"" Then
		mysql="execute WEB_AcertaQuantidade " & request.Form("IDCarrinhoTemp") & ",0"
		db.queryexec(cstr(mysql))
	end if


	response.Redirect("/includes/DO_Carros_step1.asp")
%>