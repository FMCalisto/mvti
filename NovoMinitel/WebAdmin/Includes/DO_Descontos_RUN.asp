<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE virtual="/includes/inc_variaveis_globais.asp"-->
<!--#INCLUDE virtual="/includes/FuncoesGENERICAS.asp"-->
<!--#INCLUDE virtual="/includes/inc_wait.html"-->
<%Response.Flush()%>
<%
	ATxt=ucase(request.QueryString("OP"))
	if ATxt="" Then ATxt=ucase(request.Form(("OP")))
	Select case Atxt
		Case "STATUS" 'Alteração do Status
			MySQL="Corrige_WN_TDescontos " & ucase(request.QueryString("ID"))
			db.queryexec(cstr(MySQL))

		Case "NOVALINHA" 'Novo Registo
			MySQL="execute [WebSiteMINITEL].[dbo].[Cria_WN_TDescontos] " & request.Form("Desconto") & ",'" & DataEUA(request.Form("DataInicio")) & "','" & DataEUA(request.Form("DataFim")) & "','" & request.Form("Codigo") & "','" & request.Form("Ref") & "','" & Session("Comercial") & "'"
			db.queryexec(cstr(MySQL))
	End Select
%>
<script language="javascript">
	window.location.href="/webadmin/Lista_DESCONTOS.Asp"; 
</script>
