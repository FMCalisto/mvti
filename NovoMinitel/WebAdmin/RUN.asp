<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE virtual="/includes/inc_variaveis_globais.asp"-->
<%
	ATxt=ucase(request.QueryString("OP"))
	Select case Atxt
		Case "RMA"
			MySQL="Update WN_RMA set Recepcionado=" & request.QueryString("VALOR") & ",recepcionadoQuando=getdate() where RMAID=" & request.QueryString("ID")
			db.queryexec(MySQL)
			BTXT="/webadmin/Lista_RMA.Asp"
	End Select
response.Redirect(BTXT)
%>

