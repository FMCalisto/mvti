<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<!--#INCLUDE virtual="/includes/inc_variaveis_globaisCSV.asp"-->
<!--#INCLUDE virtual="/includes/inc_FuncoesCRTCSV.asp"-->

<%

'if not (session("ComercialON")=TRUE or session("ClienteON")=TRUE) Then response.Redirect("DO_logout_run.asp")

Dim FileName
FileName="CatalogoMinitelCSV.csv" 
 response.contentType="text/vnd.ms-excel" 
 'response.contentType="application/vnd.ms-excel" 
response.AddHeader "content-disposition", "inline; filename=" & FileName 


MySQL="SELECT indice,forref as RefFornecedor,ref,design,imagem,Fabricante,CAT1,dbo.isempty(CAT2,'&nbsp;') as CAT2,dbo.isempty(CAT3,'&nbsp;') as CAT3,Preco,PVP,Descricao,stock FROM View_ClientesPRODUTOS_Catalogo ORDER BY design"
db.QueryExec(cstr("execute Hit_WN_EventosMENU " & "ExpFiltros2Excel"))

	' Funcao para remover as tags HTML das linhas da descricao
	Dim RegEx

	Set RegEx = New RegExp

	RegEx.Pattern = "<[^>]*>"
	RegEx.Global = True

	'Funcao para remover espaços a mais no meio das frases
	DIM RegEx2
	
	Set RegEx2 = New RegExp
	
	RegEx2.Pattern = "\s{2,}"
	RegEx2.Global = True
	RegEx2.IgnoreCase = True

	Set ListaProdutos=db.query(cstr(MySQL))
	Do While not ListaProdutos.eof
		%>
<%=TRIM(ListaProdutos("indice"))%>;<%=TRIM(ListaProdutos("ref"))%>;<%=TRIM(ListaProdutos("RefFornecedor"))%>;<%=TRIM(ListaProdutos("design"))%>;<%=TRIM(ListaProdutos("Fabricante"))%>;<%=TRIM(ListaProdutos("CAT1"))%>;<%=TRIM(ListaProdutos("CAT2"))%>;<%=TRIM(REPLACE(ListaProdutos("CAT3"),"&nbsp;",""))%>;<%=TRIM(Replace(Moeda(ListaProdutos("Preco")), "€",""))%>;<%=TRIM(Replace(Moeda(ListaProdutos("pvp")), "€",""))%>;<%=TRIM(ListaProdutos("Stock"))%>;<%=TRIM(ListaProdutos("imagem"))%>;<%=TRIM(Replace(RegEx2.Replace(REPLACE(REPLACE(RegEx.Replace(ListaProdutos("Descricao"), " "),vbCRLF,""),"&nbsp;",""), " "),";",":"))%>;
<%
		response.Flush()
		ListaProdutos.movenext
	Loop
	ListaProdutos.close
	set ListaProdutos=nothing
%>



