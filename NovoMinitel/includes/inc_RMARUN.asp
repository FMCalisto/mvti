<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<!--#INCLUDE file="inc_FuncoesCRT.asp"-->
<!--#INCLUDE file="FuncoesGENERICAS.asp"-->
<!--#INCLUDE file="inc_wait.html"-->
<%Response.Flush()%>
<%

Dim L_escolhido	
L_escolhido=txt.abstxt(request.Form("escolhido"))
response.Write(L_escolhido & " :  escolhido <br>")


DIM MASTAMP
MASTAMP=left(L_escolhido,instr(L_escolhido,"«")-1)
response.Write(MASTAMP & " :  MASTAMP <br>")

DIM FISTAMP
FISTAMP=mid(L_escolhido,instr(L_escolhido,"»")+1,len(L_escolhido))
response.Write(FISTAMP & " :  FISTAMP <br>")


Dim L_TipoDocumento		:L_TipoDocumento=txt.abstxt(request.Form("TipoDocumento"))
L_TipoDocumento=db.query(cstr("select DataOutTXT From Get_MenuOP(1) where DataOutID=" & L_TipoDocumento))("DataOutTXT")
Dim L_motivo			:L_motivo=txt.abstxt(request.Form("motivo"))
Dim L_sintoma			:L_sintoma=txt.abstxt(request.Form("sintoma"))
Dim L_contactodocliente	:L_contactodocliente=txt.abstxt(request.Form("contactodocliente"))

Dim L_fno				:L_fno=txt.abstxt(request.Form("fno"))
Dim L_nserie 			:L_nserie=txt.abstxt(request.Form("nserie"))
Dim L_Ref 				:L_Ref=txt.abstxt(request.Form("Ref"))

Dim L_x_fno				:L_x_fno=txt.abstxt(request.Form("x_fno"))
Dim L_x_ref				:L_x_fno=txt.abstxt(request.Form("x_ref"))
Dim L_x_serie			:L_x_serie=txt.abstxt(request.Form("x_serie"))
Dim L_x_data			:L_x_data=DataEUA(txt.abstxt(request.Form("x_data")))

Dim L_VREF				:L_VREF=txt.abstxt(request.Form("VREF"))

Dim F_clstamp
Dim F_no
Dim F_Morada
Dim F_local
Dim F_codpost
Dim F_ref
Dim F_design
Dim F_serie
Dim F_fno
Dim F_fdata
Dim F_nome

Dim F_Marca				
Dim F_Modelo			

Dim DiffDay : DiffDay=0

If MASTAMP<>"1" Then
MySQL="select * from openquery(SQLSRV_MIN,'SELECT  datediff(day,ft.fdata,getdate()) as DiffDay,fi.fistamp,usr1,usr4,dbo.cl.nome,dbo.cl.clstamp, dbo.ft.no, dbo.ft.morada, dbo.ft.local, dbo.ft.codpost, dbo.fi.ref, dbo.fi.design, dbo.ft.fno, dbo.ft.fdata FROM dbo.ft INNER JOIN dbo.cl ON dbo.cl.no = dbo.ft.no RIGHT OUTER JOIN dbo.fi ON dbo.ft.ftstamp = dbo.fi.ftstamp LEFT OUTER JOIN dbo.ftma ON dbo.fi.fistamp = dbo.ftma.fistamp WHERE dbo.ftma.mastamp=''" & MASTAMP & "''  and dbo.fi.fistamp=''" & FISTAMP & "'' ')"


	Set ListaProdutos=db.query(cstr(MySQL))
	If Not ListaProdutos.Eof Then


		DiffDay=cint(ListaProdutos("DiffDay"))
		F_marca=txt.abstxt(ListaProdutos("usr1"))
		F_Modelo=txt.abstxt(ListaProdutos("usr4"))
		F_clstamp=txt.abstxt(ListaProdutos("clstamp"))
		F_no=txt.abstxt(ListaProdutos("no"))
		F_Morada=txt.abstxt(ListaProdutos("Morada"))
		F_local=txt.abstxt(ListaProdutos("local"))
		F_codpost=txt.abstxt(ListaProdutos("codpost"))
		F_ref=txt.abstxt(ListaProdutos("ref"))
		F_design=txt.abstxt(ListaProdutos("design"))

		mysql="select serie from openquery(SQLSRV_MIN,'SELECT serie,fistamp  FROM [Min_PHC].[dbo].[WebSiteMINITEL_GetFacturaNSerie] (" & session("no") & ",-1,''-1'') where mastamp=''" & MASTAMP & "'' ') ;"
		Set Letras=db.Query(cstr(MySQL))
		If Not Letras.EOF Then
			F_serie=trim(Letras("serie"))
		Else
			F_serie="N/D"
		End if
		Letras.Close : Set Letras=Nothing

		F_fno=txt.abstxt(ListaProdutos("fno"))
		F_fdata=DataEUA(txt.abstxt(ListaProdutos("fdata")))
		F_nome=txt.abstxt(ListaProdutos("nome"))
		MySQL="execute [WebSiteMINITEL].[dbo].[Cria_WN_RMA] '" & L_TipoDocumento &"','"& F_clstamp &"'," & F_no & ",'" & F_Morada & "','" & F_local & "','" & F_codpost & "','" & F_ref & "','" & F_design & "','" & F_serie & "'," & F_fno & ",'" & F_fdata & "','" & L_motivo & "','" & L_sintoma & "','" & L_contactodocliente &"','" & F_nome &"','" & F_Marca &"','" & F_Modelo & "','" & L_VREF & "'"
		db.queryexec(cstr(MySQL))
		'response.Write(MySQL)
	end if
	ListaProdutos.Close :  Set ListaProdutos=nothing
End if


If MASTAMP="1" Then
	MySQL="select nome,clstamp,no,morada,local,codpost from WN_Clientes where no=" & session("NO")
	Set ListaProdutos=db.query(cstr(MySQL))
	If Not ListaProdutos.Eof Then
		F_clstamp=txt.abstxt(ListaProdutos("clstamp"))
		F_no=txt.abstxt(ListaProdutos("no"))
		F_Morada=txt.abstxt(ListaProdutos("Morada"))
		F_local=txt.abstxt(ListaProdutos("local"))
		F_codpost=txt.abstxt(ListaProdutos("codpost"))
		F_nome=txt.abstxt(ListaProdutos("nome"))

		MySQL=""

		mysql="select * from openquery(SQLSRV_MIN,'SELECT top 1 datediff(day,fdata,getdate()) as DiffDay,fno,ref,design,serie,fdata  FROM [Min_PHC].[dbo].[WebSiteMINITEL_GetFacturaNSerie] (" & session("no") & ",-1,''-1'') where fistamp=''" & fistamp & "'' ') ;"
		Set Letras=db.Query(cstr(MySQL))
			DiffDay=cint(Letras("DiffDay"))
			F_fno=trim(letras("fno"))
			If Not isnumeric(F_fno) Then F_fno=-1
			F_ref=trim(letras("ref"))
			F_design=trim(letras("design"))
			F_serie=trim(letras("serie"))
			F_fdata=DataEUA(trim(letras("fdata")))
		Letras.Close : Set Letras=Nothing
		F_Marca=txt.abstxt(request.Form("Marca"))
		F_Modelo=txt.abstxt(request.Form("Modelo"))
MySQL="execute [WebSiteMINITEL].[dbo].[Cria_WN_RMA] '" & L_TipoDocumento &"','"& F_clstamp &"'," & F_no & ",'" & F_Morada & "','" & F_local & "','" & F_codpost & "','" & F_ref & "','" & F_design & "','" & F_serie & "'," & F_fno & ",'" & F_fdata & "','" & L_motivo & "','" & L_sintoma & "','" & L_contactodocliente &"','" & F_nome &"','" & F_Marca &"','" & F_Modelo & "','" & L_VREF & "'"
		db.queryexec(cstr(MySQL))
	End if
	ListaProdutos.Close :  Set ListaProdutos=nothing
End if
%>

<%
REM Envio de mail

MySQL="Select email,no,Contacto,Nome,vendedornome,vendedortelefone,vendedoremail from WN_Clientes where clstamp='"& F_clstamp &"';"

Set Clientes=db.query(cstr(MySQL))

ATXT=File2String(server.MapPath("\Includes\PaginasPorMail\RMA_Insercao.txt"))


ATXT=Replace(ATXT,"XCONTACTO",txt.abstxt(cstr(Clientes("Contacto"))))
ATXT=Replace(ATXT,"XEMPRESA",txt.abstxt(cstr(Clientes("Nome"))))
ATXT=Replace(ATXT,"XTEMPO",Now())

ATXT=Replace(ATXT,"XDOCUMENTO",L_TipoDocumento)
ATXT=Replace(ATXT,"XFACTURA",F_fno)
ATXT=Replace(ATXT,"XFDATA",F_fdata)
ATXT=Replace(ATXT,"XREF",F_ref)
ATXT=Replace(ATXT,"XSERIE",F_serie)
ATXT=Replace(ATXT,"XDESIGN",F_design)
ATXT=Replace(ATXT,"XMOTIVO",L_motivo)
ATXT=Replace(ATXT,"XSINTOMA",L_sintoma)
ATXT=Replace(ATXT,"YCONTACTO",L_contactodocliente)

ATXT=Replace(ATXT,"XMODELO",F_Modelo)
ATXT=Replace(ATXT,"XMARCA",F_Marca)

ATXT=Replace(ATXT,"XCOMERCIAL",txt.abstxt(Clientes("vendedornome")))
ATXT=Replace(ATXT,"XTELEFONE",txt.abstxt(Clientes("vendedortelefone")))
ATXT=Replace(ATXT,"XEMAIL",txt.abstxt(Clientes("vendedoremail")))


If DiffDay>=731 Then
	ATXT=Replace(ATXT,"XNOTA","Atenção ! O equipamente tem mais de 2 Anos. Está fora de garantia ! ")
Else
	ATXT=Replace(ATXT,"XNOTA","")
End if

'Function EnviaEmail(MailTo,CCto,BCCto,Subject,BodyTXT,BodyHTML)
Call EnviaEmail(txt.abstxt(Clientes("email")),txt.abstxt(Clientes("VendedorEmail")),"", txt.abstxt(Clientes("NO")) & " - Pedido de RMA.",ATXT,"")

REM João Arriaga
if UCASE(L_TipoDocumento)="DEVOLUÇÃO" Then
	Call EnviaEmail("João Arriaga <joao.arriaga@minitel.pt>","","", txt.abstxt(Clientes("NO")) & " - Pedido de Devolução",ATXT,"")
End if
rem tirado de proposito parar nao gerar mails a mais

Rem Rui Martinho
if instr("D.O.A. REPARAÇÃO",UCASE(L_TipoDocumento))>0 Then
	Call EnviaEmail("Rui Martinho <rui.martinho@minitel.pt>","Fernando Santos <fernando.santos@minitel.pt>","", txt.abstxt(Clientes("NO")) & " - Pedido de RMA/DOA",ATXT,"")
End if

%>
<script language="javascript">
	window.location.href="/?OP=RMA"; 
</script>
