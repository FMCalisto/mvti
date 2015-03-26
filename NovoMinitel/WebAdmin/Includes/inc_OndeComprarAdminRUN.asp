<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE virtual="/includes/inc_variaveis_globais.asp"-->
<%
if request.form("Dados")<>"" Then
	
	
	For AInt=1 to request.Form("Dados").count
		ATxt=request.Form("Dados")(Aint)
		ATxt=Left(ATxt,Instr(ATxt,";")-1)

		BTxt=request.Form("Dados")(Aint)
		BTxt=mid(BTxt,Instr(BTxt,";")+1,5)

		db.queryexec(cstr("execute [WebSiteMINITEL].[dbo].[Add_Wn_Clientes_OndeComprar]  '" & ATxt & "' ," & BTxt))

	Next
	
	
	response.Redirect("/webadmin/Onde_Comprar.asp?LZonas=" & request.QueryString("LZonas"))
Else
	For AInt=1 to request.Form("CLSTAMP").count
		db.queryexec(cstr("execute [WebSiteMINITEL].[dbo].[Add_Wn_Clientes_OndeComprar]  '" & request.Form("CLSTAMP")(AInt) & "' ," & request.Form("FabricanteID")))
	Next
	response.Redirect("/webadmin/Onde_Comprar.asp?FabricanteID=" & request.Form("FabricanteID") & "&Zona=" & request.Form("Zona") )
End if
%>