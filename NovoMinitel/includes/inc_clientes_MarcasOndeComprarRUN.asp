<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<%If session("ComercialON")="" Then response.redirect("DO_logout_run.asp")%>
<%
	MySQL="execute Add_Wn_Clientes_OndeComprar '" & request.QueryString("clstamp") & "'," & request.QueryString("fabricanteid")
	db.queryexec(cstr(MySQL))
	response.Redirect("/?OP=ACT&CLSTAMP=" & request.QueryString("clstamp"))
%>