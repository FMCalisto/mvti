<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<%If session("no")="" Then response.redirect("DO_logout_run.asp")%>
<%
	mysql="EXECUTE WEB_Add2_CarrinhoTemp_MoradaEntrega "
	mysql=mysql  & Session("NO")
	mysql=mysql  & "," & txt.CBoolean(request.Form("MoradaEntregaDiferente"))
	mysql=mysql  & "," & txt.CBoolean(request.Form("EntregarClienteFinal"))
	mysql=mysql  & ",'" & txt.abstxt(request.Form("contacto"))
	mysql=mysql  & "','" & txt.abstxt(request.Form("morada"))
	mysql=mysql  & "','" & txt.abstxt(request.Form("codpost"))
	mysql=mysql  & "','" & txt.abstxt(request.Form("local"))
	mysql=mysql  & "','" & txt.abstxt(request.Form("telefone"))
	mysql=mysql  & "','" & txt.abstxt(request.Form("fax"))
	mysql=mysql  & "','" & txt.abstxt(request.Form("email"))
	mysql=mysql  & "'," & txt.abstxt(request.Form("LevantarNaMinitel"))
	mysql=mysql  & ",'" & txt.abstxt(request.Form("Observacoes"))
	mysql=mysql  & "'," & txt.CBoolean(request.Form("SatisfacaoTotal"))
	mysql=mysql  & "," & txt.CBoolean(request.Form("Agrupar"))
	mysql=mysql  & "," & txt.CBoolean(request.Form("Cartao"))
	db.queryexec(cstr(mysql))
	response.Redirect("/includes/DO_Carros_step3.asp")
%>