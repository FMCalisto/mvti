<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<!--#INCLUDE file="inc_FuncoesCRT.asp"-->
<%If session("no")="" Then response.redirect("DO_logout_run.asp")%>
<%If Session("ProcessoCompra")<>True Then response.redirect("/?")%>
<!--#INCLUDE file="inc_wait.html"-->
<%Response.Flush()%> 
<%
	on error resume next

	ATXT=File2String(server.MapPath("\Includes\PaginasPorMail\CarrinhoDeCompras.txt"))
	
	mysql="EXECUTE Web_Add2_WN_CarrinhoFINAL " & Session("NO")
	db.queryexec(cstr(mysql))

	MySQL="select * from View_Carrinho2Email"
	Set ListaProdutos=db.query(cstr(MySQL))

			if session("Clientes_ColaboradoresID")>0 Then
				ATXT=Replace(ATXT,"XCOLABORADOR","Encomenda feita pelo colaborador : " & ListaProdutos("ColaboradorNome") )
			Else
				ATXT=Replace(ATXT,"XCOLABORADOR","")
			End if
			
			DTXT=trim(ListaProdutos("RI"))
			ATXT=Replace(ATXT,"XREFERENCIA",DTXT)

			CTXT=""
				If ListaProdutos("MoradaEntregaDiferente") Then CTXT=CTXT & "-A morada de entrega é diferente da actual. " & vbcrlf 
				If ListaProdutos("EntregarClienteFinal") Then CTXT=CTXT & "-A encomenda é para ser entregue no cliente final. " & vbcrlf 
				If not(ListaProdutos("LevantarNaMinitel")) Then CTXT=CTXT & "-Enviar por transportadora (TAXA de portes de acordo com o peso da encomenda) " & vbcrlf 
				If ListaProdutos("Agrupar") Then CTXT=CTXT & "-Desejo agrupar esta encomenda, com outra que possuo a aguardar produtos na Minitel. " & vbcrlf 
				If ListaProdutos("Cartao") Then CTXT=CTXT & "-Pretendo Pagar com Cartão de Distribuição. " & vbcrlf 
				If ListaProdutos("SatisfacaoTotal") Then CTXT=CTXT & "-Pretendo apenas receber esta encomenda, quando estiverem todos os produtos em stock. " & vbcrlf 
				If ListaProdutos("LevantarNaMinitel") Then CTXT=CTXT & "-Levantar na MINITEL (Travessa Légua da Póvoa, 1A - 1250-136 Lisboa) " & vbcrlf & vbcrlf 
				If trim(ListaProdutos("observacoes"))<>"" Then CTXT=CTXT &  vbcrlf  & "Observações : " & trim(ListaProdutos("observacoes")) & vbcrlf
			
			
			ATXT=replace(ATXT,"XOXBSERVACOES",CTXT) 'Linha de Observacoes
			CTXT=""

			if ListaProdutos("MoradaEntregaDiferente") Then
				Set Clientes=db.query(cstr("select * from WN_CarrinhoFINAL where ReferenciaInterna='" & DTXT & "'")) 
				CTXT="-----------------------------"  & vbcrlf & vbcrlf 
				CTXT=CTXT & "Morada de entrega alternativa"  & vbcrlf & vbcrlf 
				CTXT=CTXT & "-----------------------------"  & vbcrlf & vbcrlf 
				CTXT=CTXT & "Pessoa de contacto :" & trim(clientes("contacto")) & vbcrlf & vbcrlf 
				CTXT=CTXT & "Morada :" & trim(clientes("morada")) & vbcrlf & vbcrlf 
				CTXT=CTXT & "Localidade :" & trim(clientes("local")) & vbcrlf & vbcrlf 
				CTXT=CTXT & "Código Postal :" & trim(clientes("codpost")) & vbcrlf & vbcrlf 
				CTXT=CTXT & "Telefone :" & trim(clientes("Telefone")) & vbcrlf & vbcrlf 
				CTXT=CTXT & "Fax :" & trim(clientes("Fax")) & vbcrlf & vbcrlf 
				CTXT=CTXT & "email :" & trim(clientes("email")) & vbcrlf & vbcrlf 
				ATXT=replace(ATXT,"YYNOTA",CTXT) 'Linha de Observacoes
			Else
				ATXT=replace(ATXT,"YYNOTA","") 'Linha de Observacoes
			End if


			CTXT="" 'Linhas de factur
			Do While Not ListaProdutos.EOF 'ListaProdutos("Design")
				BTXT="REFXXX|DESXXX|PREXXX|QYYY|DESCXXX|FRAXXX|TLXXX"
				BTXT=replace(BTXT,"REFXXX",txt.FillCHAR(trim(ListaProdutos("Ref")),23," ","R"))

				BTXT=replace(BTXT,"DESXXX",txt.FillCHAR(left(trim(ListaProdutos("Design")),37),37," ","R"))

				BTXT=replace(BTXT,"PREXXX",txt.FillCHAR(trim(formatnumber(ListaProdutos("Preco"),2)),9," ","L"))
				BTXT=replace(BTXT,"QYYY",txt.FillCHAR(trim(ListaProdutos("Quantidade")),4," ","L"))
				BTXT=replace(BTXT,"DESCXXX",txt.FillCHAR(trim(formatnumber(ListaProdutos("Desconto"),2)),5," ","L"))
				BTXT=replace(BTXT,"FRAXXX",txt.FillCHAR(trim(ListaProdutos("DescontoFrase")),10," ","R"))
				BTXT=replace(BTXT,"TLXXX",txt.FillCHAR(trim(formatnumber(ListaProdutos("TLinha"),2)),10," ","L"))
				CTXT=CTXT + BTXT & vbcrlf 
				ListaProdutos.Movenext
			Loop
			CTXT=left(CTXT,len(CTXT)-1) ' ao fim tiro o ENTER 
	ListaProdutos.Close
	Set ListaProdutos=Nothing

	AInt=csng(db.query("select sum(preco*quantidade) as total from View_Carrinho2Email")("Total"))
	ATXT=Replace(ATXT,"XSub-Total",txt.FillCHAR(trim(formatnumber(AInt,2)),9," ","L") & "€")
	BInt=csng(db.query("select sum((preco*desconto)*quantidade) as total from View_Carrinho2Email")("Total"))
	ATXT=Replace(ATXT,"XDescontos",txt.FillCHAR(trim(formatnumber(BInt,2)),9," ","L") & "€")
	DInt=Aint-Bint
	ATXT=Replace(ATXT,"XTotal-Descontos",txt.FillCHAR(trim(formatnumber(DInt,2)),9," ","L") & "€")
	ATXT=Replace(ATXT,"XIVA",txt.FillCHAR(trim(formatnumber(DInt*0.23,2)),9," ","L") & "€")
	ATXT=Replace(ATXT,"XTotal",txt.FillCHAR(trim(formatnumber(DInt*1.23,2)),9," ","L") & "€")

 
	MySQL="select nocredit,clstamp,no,email,vendedornome,vendedoremail,vendedortelefone,contacto,nome from dbo.WN_Clientes where no='" & Session("NO") & "'"
	Set Clientes=db.query(cstr(MySQL))
			ATXT=Replace(ATXT,"XTEMPO",Now())
			ATXT=Replace(ATXT,"XEMPRESA",trim(Clientes("Nome")))
			ATXT=Replace(ATXT,"XCONTACTO",trim(Clientes("Contacto")))
			ATXT=Replace(ATXT,"XCOMERCIAL",trim(Clientes("VendedorNome")))
			ATXT=Replace(ATXT,"XTELEFONE",trim(Clientes("VendedorTelefone")))
			ATXT=Replace(ATXT,"XEMAIL",trim(Clientes("vendedoremail")))
			
			If cint(Clientes("nocredit"))=-1 Then	
				ATXT=Replace(ATXT,"XXNOTA","* * * * Encomenda em Validação. Por favor contacte o seu comercial. * * * *")
				Call EnviaEmail(trim(Clientes("vendedoremail")),"comercial@minitel.pt , depcontabilidade@minitel.pt",""," - Compra WEB - Facturação cancelada","Foi feita uma encomenda na web pelo cliente " & Session("NO") & ", mas este tem a facturação cancelada !","")

			Else
				ATXT=Replace(ATXT,"XXNOTA","")
			END IF			

			ATXT=replace(ATXT,"10501699",CTXT) 'Linhas da encomenda


		REM Insere a encomenda no PHC
		 mysql="EXECUTE Web_Add2_PHC '" & DTXT & "'"
		 db.queryexec(cstr(mysql))
		mysql="select top 1 isnull(obrano,0) as obrano from WN_CarrinhoFINAL where ReferenciaInterna='" & DTXT & "'"
		 ATXT=replace(ATXT,"XDOCX",db.query(cstr(mysql))("obrano")) 'Linhas da encomenda

		'Inclusão da Publicidade
		BTXT=File2String(server.MapPath("\Includes\PaginasPorMail\PUB.txt"))
		If BTXT<>"" Then
	   	    ATXT=replace(ATXT,"YPUBY",BTXT)
		Else
	   	    ATXT=replace(ATXT,"YPUBY","")
		End if

		Call EnviaEmail(trim(Clientes("email")),trim(Clientes("VendedorEmail")),"", Clientes("NO") & " - Compra WEB - " & DTXT ,CStr(ATXT),"")
		'Call EnviaEmail2(trim(Clientes("email")),trim(Clientes("VendedorEmail")),"", Clientes("NO") & " - Compra WEB - " & DTXT ,CStr(ATXT),"")
		'Call EnviaEmail(txt.abstxt(Clientes("email")),txt.abstxt(Clientes("VendedorEmail")),"", txt.abstxt(Clientes("NO")) & " - Compra WEB - " & DTXT ,CStr(ATXT),"")
	
		'4/Fev/2008 Fernando Santos quer que a susana manhita tambem receba as encomendas Web no seu e-mail
		REM Call EnviaEmail("susana.manhita@minitel.pt","","", Clientes("NO") & " - Compra WEB - " & DTXT ,CStr(ATXT),"")
		'19/Fev/2008 Susana foi embora da empresa... Com autorização do fernando, tirei a linha

	Clientes.Close
	Set Clientes=Nothing
	
%>
<script language="javascript">
	window.location.href="/includes/DO_Carros_stepFIM.asp"; 
</script>