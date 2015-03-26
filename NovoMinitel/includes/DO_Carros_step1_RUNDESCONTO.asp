<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<%
	ATXT=txt.abstxt(request.Form("valor_desconto"))
	if ATxt<>"C%F3digo+Promo%E7%E3o" and Atxt<>"" Then
		mysql="execute WEB_AplicaPromocao " & Session("no") & ",'" & ATXT &  "'"
		db.queryexec(cstr(mysql))
	End if
	response.Redirect("/includes/DO_Carros_step1.asp")
%>