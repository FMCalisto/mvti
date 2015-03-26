<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<!--#INCLUDE file="inc_FuncoesCRT.asp"-->
<%If session("no")="" Then response.redirect("DO_logout_run.asp")%>
<%

	if request.Form("GRAVAR.y")<>"" Then
		MySQL="UPDATE [WebSiteMINITEL].[dbo].[WN_Clientes_Colaboradores] SET "
	 	MySQL=MySQL+" [ColaboradorPassword] = '" & txt.ABSTxt(request.Form("ColaboradorPassword"))
		MySQL=MySQL+"' ,[ColaboradorEmail] = '" & txt.ABSTxt(request.Form("email"))
		MySQL=MySQL+"' ,[ColaboradorTelefone] = '" & txt.ABSTxt(request.Form("ColaboradorTelefone"))
		MySQL=MySQL+"' ,[EncherCesto] = '" & cstr(cstr(request.Form("EncherCesto"))="TRUE")
		MySQL=MySQL+"' ,[SubmeterEncomenda] = '" & cstr(cstr(request.Form("SubmeterEncomenda"))="TRUE")
		MySQL=MySQL+"' ,[ConsultarEncFacturada] = '" & cstr(cstr(request.Form("ConsultarEncFacturada"))="TRUE")
		MySQL=MySQL+"' ,[ConsultarEncPendente] = '" & cstr(cstr(request.Form("ConsultarEncPendente"))="TRUE")
	   	MySQL=MySQL+"' WHERE Clientes_ColaboradoresID=" & request.Form("Clientes_ColaboradoresID") & ";"
		db.queryexec(cstr(MySQL))
	end if

	if request.Form("APAGAR.y")<>"" Then
		MySQL="delete from [WebSiteMINITEL].[dbo].[WN_Clientes_Colaboradores] WHERE Clientes_ColaboradoresID=" & request.Form("Clientes_ColaboradoresID") & ";"
		db.queryexec(cstr(MySQL))
	end if

	if request.Form("ADICIONAR.y")<>"" Then
		MySQL="EXECUTE [WebSiteMINITEL].[dbo].[WEB_Clientes_AddColaborador] " & session("NO") &",'" & txt.ABSTxt(request.Form("ColaboradorUser")) & "','" & txt.ABSTxt(request.Form("ColaboradorPassword")) & "','" & txt.ABSTxt(request.Form("ColaboradorNome")) & "','" & txt.ABSTxt(request.Form("email")) & "','" &  txt.ABSTxt(request.Form("ColaboradorTelefone")) & "','" & cstr(cstr(request.Form("EncherCesto"))="TRUE") & "','" & cstr(cstr(request.Form("SubmeterEncomenda"))="TRUE") & "','" & cstr(cstr(request.Form("ConsultarEncFacturada"))="TRUE") & "','" & cstr(cstr(request.Form("ConsultarEncPendente"))="TRUE") & "'"
		db.queryexec(cstr(MySQL))

		ATXT=File2String(server.MapPath("\Includes\PaginasPorMail\CriarContaColaborador.txt"))

		ATXT=Replace(ATXT,"XNOME",txt.ABSTxt(request.Form("ColaboradorNome")))
		ATXT=Replace(ATXT,"XTEMPO",Now())
		ATXT=Replace(ATXT,"XPASSWORD",txt.ABSTxt(request.Form("ColaboradorPassword")))
		CTXT="U=" & session("NO") & "&P=" & txt.ABSTxt(request.Form("ColaboradorPassword")) & "&C=" & txt.ABSTxt(request.Form("ColaboradorUser")) 
		CTXT=txt.EncodeTXT36(cstr(CTXT))
		CTXT="http://" & Request.ServerVariables("SERVER_NAME") & "/Includes/Do_LinkDirecto_RUN.asp?X=" & CTXT
		ATXT=Replace(ATXT,"XLINK",CTXT)
		ATXT=Replace(ATXT,"XCODIGOCLIENTE",session("NO"))
		ATXT=Replace(ATXT,"XUTILIZADOR",txt.ABSTxt(request.Form("ColaboradorUser")))

		MySQL="Select no,vendedornome,nome,vendedoremail,vendedortelefone from WN_Clientes where no=" & session("NO")
		Set Clientes=db.query(cstr(MySQL))
		ATXT=Replace(ATXT,"XEMPRESA",trim(Clientes("nome")))
		ATXT=Replace(ATXT,"XCOMERCIAL",trim(Clientes("vendedornome")))
		ATXT=Replace(ATXT,"XEMAIL",trim(Clientes("vendedoremail")))
		ATXT=Replace(ATXT,"XTELEFONE",trim(Clientes("vendedortelefone")))
		'Function EnviaEmail(MailTo,CCto,BCCto,Subject,BodyTXT,BodyHTML)


		if ucase(request.Form("EncherCesto"))="TRUE" Then
			ATXT=Replace(ATXT,"XCAN1","- Seleccionar produtos do nosso site e coloca-los no carrinho de compra para posteriormente fazer a encomenda.")
		Else
			ATXT=Replace(ATXT,"XCAN1","")
		end if
		if ucase(request.Form("SubmeterEncomenda"))="TRUE" Then
			ATXT=Replace(ATXT,"XCAN2","- Submeter a encomenda à MINTEL para posterior envio e facturação dos produtos existentes no carrinho de compras.")
		Else
			ATXT=Replace(ATXT,"XCAN2","")
		end if
		if ucase(request.Form("ConsultarEncFacturada"))="TRUE" Then
			ATXT=Replace(ATXT,"XCAN3","- Consultar Facturas. Poderá ver os produtos já adquiridos à MINITEL.")
		Else
			ATXT=Replace(ATXT,"XCAN3","")
		end if
		if ucase(request.Form("ConsultarEncPendente"))="TRUE" Then
			ATXT=Replace(ATXT,"XCAN4","- Consultar Encomendas. Poderá ver os produtos encomendados à MINIEL e que ainda não foram expedidos.")
		Else
			ATXT=Replace(ATXT,"XCAN4","")
		end if

		Call EnviaEmail(txt.ABSTxt(request.Form("email")),trim(Clientes("VendedorEmail")),"", trim(Clientes("NO")) & " - Conta de Colaborador",ATXT,"")
		Clientes.Close : Set Clientes=Nothing

	end if


	response.Redirect("/?OP=COLABORADOR")
%>