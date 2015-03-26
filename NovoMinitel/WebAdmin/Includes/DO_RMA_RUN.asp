<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE virtual="/includes/inc_variaveis_globais.asp"-->
<!--#INCLUDE virtual="/includes/inc_FuncoesCRT.asp"-->
<!--#INCLUDE virtual="/includes/inc_wait.html"-->

<%Response.Flush()%>
<%
	Dim RuiMartinho
	ATxt=ucase(request.QueryString("OP"))
	Select case Atxt
		Case "APDC" 'Aprovação pela direcção comercial
			BTXT="/includes/semsaida.asp"
			MySQL="Update WN_RMA set AprovadoDepComercial=" & request.QueryString("VALOR") & ",AprovadoDepComercialQuando=getdate() where NDocumento is null and RMAID=" & request.QueryString("ID")
			db.queryexec(MySQL)
			If request.QueryString("VALOR")="-1" Then
				MySQL="Update dbo.WN_RMA Set NDocumento=RMAID where  NDocumento is null and RMAID=" & request.QueryString("ID")
				db.queryexec(MySQL)

				REM Enviar o mail pro cliente
				ATXT=File2String(server.MapPath("\Includes\PaginasPorMail\RMA_AvisaClienteEnviarEquipamentoDEV.txt"))
				MySQL="select FNO,FDATA,REF,SERIE,DESIGN,MOTIVO,SINTOMA,ContactoCliente,Modelo,Marca,NOPAT,NDOCUMENTO,NO from wn_rma where rmaid=" & request.QueryString("ID")
				response.write("cheguei aqui")
				
				Set Clientes=db.query(cstr(MySQL))
					ATXT=Replace(ATXT,"XXRMAID",request.QueryString("ID"))
					ATXT=Replace(ATXT,"XNO",Clientes("NO"))
					ATXT=Replace(ATXT,"XXEK",txt.EncodeTXT36(cstr(cint(request.QueryString("ID"))*10000+cint(Clientes("NO")))))

					ATXT=Replace(ATXT,"XFACTURA",trim(Clientes("FNO")))
					ATXT=Replace(ATXT,"XFDATA",trim(Clientes("FDATA")))
					ATXT=Replace(ATXT,"XREF",trim(Clientes("REF")))
					ATXT=Replace(ATXT,"XSERIE",trim(Clientes("SERIE")))
					ATXT=Replace(ATXT,"XDESIGN",trim(Clientes("DESIGN")))
					ATXT=Replace(ATXT,"XMOTIVO",trim(Clientes("MOTIVO")))
					ATXT=Replace(ATXT,"XSINTOMA",trim(Clientes("SINTOMA")))
					ATXT=Replace(ATXT,"YCONTACTO",trim(Clientes("ContactoCliente")))
					ATXT=Replace(ATXT,"XMODELO",trim(Clientes("Modelo")))
					ATXT=Replace(ATXT,"XMARCA",trim(Clientes("Marca")))
					ATXT=Replace(ATXT,"XXNDOCUMENTO",trim(Clientes("NDOCUMENTO")))
				Clientes.Close : Set Clientes=NOTHING
	
				MySQL="Select email,no,Contacto,Nome,vendedornome,vendedortelefone,vendedoremail from WN_Clientes where clstamp='"& db.query(cstr("Select clstamp from wn_rma where rmaid=" & request.QueryString("ID")))("CLSTAMP") &"';"
				
				Set Clientes=db.query(cstr(MySQL))
					ATXT=Replace(ATXT,"XCONTACTO",txt.abstxt(Clientes("Contacto")))
					ATXT=Replace(ATXT,"XEMPRESA",txt.abstxt(Clientes("Nome")))
					ATXT=Replace(ATXT,"XTEMPO",Now())
					ATXT=Replace(ATXT,"XCOMERCIAL",txt.abstxt(Clientes("vendedornome")))
					ATXT=Replace(ATXT,"XEMAIL",txt.abstxt(Clientes("vendedoremail")))
					ATXT=Replace(ATXT,"XTELEFONE ",txt.abstxt(Clientes("vendedortelefone")))
					Call EnviaEmail(txt.abstxt(Clientes("email")),txt.abstxt(Clientes("VendedorEmail")),"", txt.abstxt(Clientes("NO")) & " - Devolução Aprovada.",ATXT,"")
				Clientes.Close : Set Clientes=NOTHING
			end if

			If request.QueryString("VALOR")="0" Then
				REM Enviar o mail pro Comerical
				ATXT=File2String(server.MapPath("\Includes\PaginasPorMail\RMA_AvisaComercialNaoAceite.txt"))
				MySQL="select FNO,FDATA,REF,SERIE,DESIGN,MOTIVO,SINTOMA,ContactoCliente,Modelo,Marca,NOPAT,NDOCUMENTO from wn_rma where rmaid=" & request.QueryString("ID")
				Set Clientes=db.query(cstr(MySQL))
					ATXT=Replace(ATXT,"XFACTURA",trim(Clientes("FNO")))
					ATXT=Replace(ATXT,"XFDATA",trim(Clientes("FDATA")))
					ATXT=Replace(ATXT,"XREF",trim(Clientes("REF")))
					ATXT=Replace(ATXT,"XSERIE",trim(Clientes("SERIE")))
					ATXT=Replace(ATXT,"XDESIGN",trim(Clientes("DESIGN")))
					ATXT=Replace(ATXT,"XMOTIVO",trim(Clientes("MOTIVO")))
					ATXT=Replace(ATXT,"XSINTOMA",trim(Clientes("SINTOMA")))
					ATXT=Replace(ATXT,"YCONTACTO",trim(Clientes("ContactoCliente")))
					ATXT=Replace(ATXT,"XMODELO",trim(Clientes("Modelo")))
					ATXT=Replace(ATXT,"XMARCA",trim(Clientes("Marca")))
					ATXT=Replace(ATXT,"XXNDOCUMENTO",request.QueryString("ID"))
				Clientes.Close : Set Clientes=NOTHING

				MySQL="Select email,no,Contacto,Nome,vendedoremail from WN_Clientes where clstamp='"& db.query(cstr("Select clstamp from wn_rma where rmaid=" & request.QueryString("ID")))("CLSTAMP") &"';"
				
				Set Clientes=db.query(cstr(MySQL))
					ATXT=Replace(ATXT,"XCONTACTO",txt.abstxt(Clientes("Contacto")))
					ATXT=Replace(ATXT,"XEMPRESA",txt.abstxt(Clientes("Nome")))
					ATXT=Replace(ATXT,"XTEMPO",Now())
					ATXT=Replace(ATXT,"XEMAIL",txt.abstxt(Clientes("vendedoremail")))
					Call EnviaEmail(txt.abstxt(Clientes("VendedorEmail")),"","", txt.abstxt(Clientes("NO")) & " - Devolução NÃO Aprovada.",ATXT,"")
				Clientes.Close : Set Clientes=NOTHING
			End if
		Case "APC" 'Aprovação pelo Comercial
			BTXT="/?OP=LoginComercialOK#" + request.QueryString("ID")

			if request.QueryString("H")="1" Then
				MySQL="Update WN_RMA set AprovadoComercial=" & request.QueryString("VALOR") & ",AprovadoComercialQuando=getdate(),ProdutoSubstituicao=-1 where RMAID=" & request.QueryString("ID")
			else
				MySQL="Update WN_RMA set AprovadoComercial=" & request.QueryString("VALOR") & ",AprovadoComercialQuando=getdate() where RMAID=" & request.QueryString("ID")
			end if
			db.queryexec(MySQL)


			REM Enviar o mail pro EngArriaga
			If request.QueryString("VALOR")="-1" Then
				ATXT=File2String(server.MapPath("\Includes\PaginasPorMail\RMA_AvisaDirComercialPAprovar.txt"))
			Else
				ATXT=File2String(server.MapPath("\Includes\PaginasPorMail\RMA_AvisaComerciaSELFNaoAceite.txt"))
			end if
			
			MySQL="select ProdutoSubstituicao,FNO,FDATA,REF,SERIE,DESIGN,MOTIVO,SINTOMA,Modelo,Marca from wn_rma where rmaid=" & request.QueryString("ID")
			Set Clientes=db.query(cstr(MySQL))
				ATXT=Replace(ATXT,"XFACTURA",trim(Clientes("FNO")))
				ATXT=Replace(ATXT,"XFDATA",trim(Clientes("FDATA")))
				ATXT=Replace(ATXT,"XREF",trim(Clientes("REF")))
				ATXT=Replace(ATXT,"XSERIE",trim(Clientes("SERIE")))
				ATXT=Replace(ATXT,"XDESIGN",trim(Clientes("DESIGN")))
				ATXT=Replace(ATXT,"XMOTIVO",trim(Clientes("MOTIVO")))
				ATXT=Replace(ATXT,"XSINTOMA",trim(Clientes("SINTOMA")))
				ATXT=Replace(ATXT,"XMODELO",trim(Clientes("Modelo")))
				ATXT=Replace(ATXT,"XMARCA",trim(Clientes("Marca")))
				
				If cint(Clientes("ProdutoSubstituicao"))=-1 Then
					ATXT=Replace(ATXT,"XPROD","SIM")
				Else
					ATXT=Replace(ATXT,"XPROD","NÃO")
				End if
				
			Clientes.Close : Set Clientes=NOTHING

			MySQL="Select email,no,Contacto,Nome,vendedornome,vendedortelefone,vendedoremail from WN_Clientes where clstamp='"& db.query(cstr("Select clstamp from wn_rma where rmaid=" & request.QueryString("ID")))("CLSTAMP") &"';"
			
			ATXT=Replace(ATXT,"XXNDOCUMENTO",request.QueryString("ID"))
			ATXT=Replace(ATXT,"XXRMAID",request.QueryString("ID"))

				Set Clientes=db.query(cstr(MySQL))
					ATXT=Replace(ATXT,"XCONTACTO",txt.abstxt(Clientes("Contacto")))
					ATXT=Replace(ATXT,"XEMPRESA",txt.abstxt(Clientes("Nome")))
					ATXT=Replace(ATXT,"XTEMPO",Now())
					ATXT=Replace(ATXT,"XCOMERCIAL",txt.abstxt(Clientes("vendedornome")))
					ATXT=Replace(ATXT,"XEMAIL",txt.abstxt(Clientes("vendedoremail")))

				If request.QueryString("VALOR")="-1" Then
					Call EnviaEmail("joao.arriaga@minitel.pt",txt.abstxt(Clientes("VendedorEmail")),"",txt.abstxt(Clientes("NO")) & " - RMA Aprovado pelo Comercial.",ATXT,"")
				else
					Call EnviaEmail(txt.abstxt(Clientes("VendedorEmail")),"","",txt.abstxt(Clientes("NO")) & " - RMA Não aprovado pelo Comercial.",ATXT,"")
				end if

			Clientes.Close : Set Clientes=NOTHING
		Case "RECEBIDO" 'O material chegou à recepção
			MySQL="Update WN_RMA set Recepcionado=" & request.QueryString("VALOR") & ",recepcionadoQuando=getdate() where (Not(NDocumento is null)) and RMAID=" & request.QueryString("ID")
			db.queryexec(MySQL)
			
				ATXT=File2String(server.MapPath("\Includes\PaginasPorMail\RMA_AvisaRecepcaoDoEquipamento.txt"))
				MySQL="select TipoDocumento,FNO,FDATA,REF,SERIE,DESIGN,MOTIVO,SINTOMA,Modelo,Marca,IsNull(NOPAT,0) as NOPAT ,isnull(NDOCUMENTO,0) as NDOCUMENTO from wn_rma where rmaid=" & request.QueryString("ID")
				Set Clientes=db.query(cstr(MySQL))
					ATXT=Replace(ATXT,"XFACTURA",trim(Clientes("FNO")))
					ATXT=Replace(ATXT,"XFDATA",trim(Clientes("FDATA")))
					ATXT=Replace(ATXT,"XREF",trim(Clientes("REF")))
					ATXT=Replace(ATXT,"XSERIE",trim(Clientes("SERIE")))
					ATXT=Replace(ATXT,"XDESIGN",trim(Clientes("DESIGN")))
					ATXT=Replace(ATXT,"XMOTIVO",trim(Clientes("MOTIVO")))
					ATXT=Replace(ATXT,"XSINTOMA",trim(Clientes("SINTOMA")))
					ATXT=Replace(ATXT,"XMODELO",trim(Clientes("Modelo")))
					ATXT=Replace(ATXT,"XMARCA",trim(Clientes("Marca")))
					ATXT=Replace(ATXT,"XXNDOCUMENTO",trim(Clientes("NDOCUMENTO")))
					ATXT=Replace(ATXT,"XXNOPAT",trim(Clientes("NOPAT")))
					ATXT=Replace(ATXT,"XXTDOCUMENTO",trim(Clientes("TipoDocumento")))
				Clientes.Close : Set Clientes=NOTHING
			MySQL="Select TipoDocumento From WN_RMA where (Not(NDocumento is null)) and RMAID=" & request.QueryString("ID")
			BTXT=trim(db.query(cstr(MySQL))("TipoDocumento"))
			MySQL="Select email,no,Contacto,Nome,vendedornome,vendedortelefone,vendedoremail from WN_Clientes where clstamp='"& db.query(cstr("Select clstamp from wn_rma where rmaid=" & request.QueryString("ID")))("CLSTAMP") &"';"
			Select case ucase(BTXT)
				Case "REPARAÇÃO","D.O.A." : REM se for RMA ou DOA  -> mail pro RM e COmercial
					Set Clientes=db.query(cstr(MySQL))
						ATXT=Replace(ATXT,"XCONTACTO",txt.abstxt(Clientes("Contacto")))
						ATXT=Replace(ATXT,"XEMPRESA",txt.abstxt(Clientes("Nome")))
						ATXT=Replace(ATXT,"XTEMPO",Now())
						ATXT=Replace(ATXT,"XCOMERCIAL",txt.abstxt(Clientes("vendedornome")))
						ATXT=Replace(ATXT,"XEMAIL",txt.abstxt(Clientes("vendedoremail")))
						ATXT=Replace(ATXT,"XTELEFONE",txt.abstxt(Clientes("vendedortelefone")))
						Call EnviaEmail("rui.martinho@minitel.pt",txt.abstxt(Clientes("VendedorEmail")),"", txt.abstxt(Clientes("NO")) & " - Recepção de material na Minitel.",ATXT,"")
					Clientes.Close : Set Clientes=NOTHING

				Case "DEVOLUÇÃO"  : REM se for DEVOLUCAO  -> mail pro VIRIATO e COmercial
					Set Clientes=db.query(cstr(MySQL))
						ATXT=Replace(ATXT,"XCONTACTO",txt.abstxt(Clientes("Contacto")))
						ATXT=Replace(ATXT,"XEMPRESA",txt.abstxt(Clientes("Nome")))
						ATXT=Replace(ATXT,"XTEMPO",Now())
						ATXT=Replace(ATXT,"XCOMERCIAL",txt.abstxt(Clientes("vendedornome")))
						ATXT=Replace(ATXT,"XTELEFONE",txt.abstxt(Clientes("vendedortelefone")))
						ATXT=Replace(ATXT,"XEMAIL",txt.abstxt(Clientes("vendedoremail")))
						Call EnviaEmail("jose.alves@minitel.pt",txt.abstxt(Clientes("VendedorEmail")),"", txt.abstxt(Clientes("NO")) & " - Recepção de material na Minitel.",ATXT,"")
					Clientes.Close : Set Clientes=NOTHING

				end select
				BTXT="/webadmin/Lista_RMA.Asp"
		CASE "CRIAPAT"
			BTXT="/webadmin/Lista_RMA.Asp"

			MySQL="Update wn_rma set AprovadoTecnico=" & request.QueryString("VALOR") & ",AprovadoTecnicoQuando=Getdate() where RMAID=" & request.QueryString("ID") 
			db.queryexec(MySQL)

			If request.QueryString("VALOR")="-1" Then
				MySQL="execute CRIA_rma2pat " & request.QueryString("ID") 
				db.queryexec(MySQL)
				REM Enviar o mail pro cliente
				ATXT=File2String(server.MapPath("\Includes\PaginasPorMail\RMA_AvisaClienteEnviarEquipamentoRMA.txt"))
			Else
				ATXT=File2String(server.MapPath("\Includes\PaginasPorMail\RMA_AvisaComercialNaoAceiteTECNICA.txt"))
				MySQL="Update wn_rma set Nopat=0,ndocumento=rmaid where RMAID=" & request.QueryString("ID") 
				db.queryexec(MySQL)
			end if			



			MySQL="select no,FNO,FDATA,REF,SERIE,DESIGN,MOTIVO,SINTOMA,ContactoCliente,Modelo,Marca,ISNULL(NOPAT,0) AS NOPAT,NDOCUMENTO from wn_rma where rmaid=" & request.QueryString("ID")
			Set Clientes=db.query(cstr(MySQL))
				ATXT=Replace(ATXT,"XXRMAID",request.QueryString("ID"))
				ATXT=Replace(ATXT,"XNO",Clientes("NO"))
				ATXT=Replace(ATXT,"XXEK",txt.EncodeTXT36(cstr(cint(request.QueryString("ID"))*10000+cint(Clientes("NO")))))

				ATXT=Replace(ATXT,"XFACTURA",trim(Clientes("FNO")))
				ATXT=Replace(ATXT,"XFDATA",trim(Clientes("FDATA")))
				ATXT=Replace(ATXT,"XREF",trim(Clientes("REF")))
				ATXT=Replace(ATXT,"XSERIE",trim(Clientes("SERIE")))
				ATXT=Replace(ATXT,"XDESIGN",trim(Clientes("DESIGN")))
				ATXT=Replace(ATXT,"XMOTIVO",trim(Clientes("MOTIVO")))
				ATXT=Replace(ATXT,"XSINTOMA",trim(Clientes("SINTOMA")))
				ATXT=Replace(ATXT,"YCONTACTO",trim(Clientes("ContactoCliente")))
				ATXT=Replace(ATXT,"XMODELO",trim(Clientes("Modelo")))
				ATXT=Replace(ATXT,"XMARCA",trim(Clientes("Marca")))
				ATXT=Replace(ATXT,"XXNDOCUMENTO",trim(Clientes("NDOCUMENTO")))
				RuiMartinho=trim(Clientes("NOPAT"))
				ATXT=Replace(ATXT,"XXNOPAT",RuiMartinho)
			Clientes.Close : Set Clientes=NOTHING

			MySQL="Select email,no,Contacto,Nome,vendedornome,vendedortelefone,vendedoremail from WN_Clientes where clstamp='"& db.query(cstr("Select clstamp from wn_rma where rmaid=" & request.QueryString("ID")))("CLSTAMP") &"';"
			
			Set Clientes=db.query(cstr(MySQL))
				ATXT=Replace(ATXT,"XCONTACTO",txt.abstxt(Clientes("Contacto")))
				ATXT=Replace(ATXT,"XEMPRESA",txt.abstxt(Clientes("Nome")))
				ATXT=Replace(ATXT,"XTEMPO",Now())
				ATXT=Replace(ATXT,"XCOMERCIAL",txt.abstxt(Clientes("vendedornome")))
				ATXT=Replace(ATXT,"XEMAIL",txt.abstxt(Clientes("vendedoremail")))

			If request.QueryString("VALOR")="-1" Then
				Call EnviaEmail(txt.abstxt(Clientes("email")),txt.abstxt(Clientes("VendedorEmail")),"", txt.abstxt(Clientes("NO")) & " - RMA (" & RuiMartinho & ") Aprovado.",ATXT,"")
			else
				Call EnviaEmail(txt.abstxt(Clientes("VendedorEmail")),"rui.martinho@minitel.pt","", txt.abstxt(Clientes("NO")) & " - RMA NÃO Aprovado.",ATXT,"")
			end if

			Clientes.Close : Set Clientes=NOTHING

		CASE "CRIADOA"
			BTXT="/webadmin/Lista_RMA.Asp"

			MySQL="Update wn_rma set AprovadoTecnico=" & request.QueryString("VALOR") & ",AprovadoTecnicoQuando=Getdate(),ndocumento=rmaid where RMAID=" & request.QueryString("ID") 
			db.queryexec(MySQL)

			If request.QueryString("VALOR")="-1" Then
				REM Enviar o mail pro cliente
				ATXT=File2String(server.MapPath("\Includes\PaginasPorMail\RMA_AvisaClienteEnviarEquipamentoDOA.txt"))
			Else
				ATXT=File2String(server.MapPath("\Includes\PaginasPorMail\RMA_AvisaComercialNaoAceiteDOATECNICA.txt"))
				MySQL="Update wn_rma set Nopat=0,ndocumento=rmaid where RMAID=" & request.QueryString("ID") 
				db.queryexec(MySQL)
			end if			



			MySQL="select no,FNO,FDATA,REF,SERIE,DESIGN,MOTIVO,SINTOMA,ContactoCliente,Modelo,Marca,ISNULL(NOPAT,0) AS NOPAT,NDOCUMENTO from wn_rma where rmaid=" & request.QueryString("ID")
			Set Clientes=db.query(cstr(MySQL))
				ATXT=Replace(ATXT,"XXRMAID",request.QueryString("ID"))
				ATXT=Replace(ATXT,"XNO",Clientes("NO"))
				ATXT=Replace(ATXT,"XXEK",txt.EncodeTXT36(cstr(cint(request.QueryString("ID"))*10000+cint(Clientes("NO")))))

				ATXT=Replace(ATXT,"XFACTURA",trim(Clientes("FNO")))
				ATXT=Replace(ATXT,"XFDATA",trim(Clientes("FDATA")))
				ATXT=Replace(ATXT,"XREF",trim(Clientes("REF")))
				ATXT=Replace(ATXT,"XSERIE",trim(Clientes("SERIE")))
				ATXT=Replace(ATXT,"XDESIGN",trim(Clientes("DESIGN")))
				ATXT=Replace(ATXT,"XMOTIVO",trim(Clientes("MOTIVO")))
				ATXT=Replace(ATXT,"XSINTOMA",trim(Clientes("SINTOMA")))
				ATXT=Replace(ATXT,"YCONTACTO",trim(Clientes("ContactoCliente")))
				ATXT=Replace(ATXT,"XMODELO",trim(Clientes("Modelo")))
				ATXT=Replace(ATXT,"XMARCA",trim(Clientes("Marca")))
				ATXT=Replace(ATXT,"XXNDOCUMENTO",trim(Clientes("NDOCUMENTO")))
				ATXT=Replace(ATXT,"XXNOPAT",trim(Clientes("NOPAT")))
			Clientes.Close : Set Clientes=NOTHING

			MySQL="Select email,no,Contacto,Nome,vendedornome,vendedortelefone,vendedoremail from WN_Clientes where clstamp='"& db.query(cstr("Select clstamp from wn_rma where rmaid=" & request.QueryString("ID")))("CLSTAMP") &"';"
			
			Set Clientes=db.query(cstr(MySQL))
				ATXT=Replace(ATXT,"XCONTACTO",txt.abstxt(Clientes("Contacto")))
				ATXT=Replace(ATXT,"XEMPRESA",txt.abstxt(Clientes("Nome")))
				ATXT=Replace(ATXT,"XTEMPO",Now())
				ATXT=Replace(ATXT,"XCOMERCIAL",txt.abstxt(Clientes("vendedornome")))
				ATXT=Replace(ATXT,"XEMAIL",txt.abstxt(Clientes("vendedoremail")))

			If request.QueryString("VALOR")="-1" Then
				Call EnviaEmail(txt.abstxt(Clientes("email")),txt.abstxt(Clientes("VendedorEmail")),"", txt.abstxt(Clientes("NO")) & " - DOA Aprovado.",ATXT,"")
			else
				Call EnviaEmail(txt.abstxt(Clientes("VendedorEmail")),"rui.martinho@minitel.pt","", txt.abstxt(Clientes("NO")) & " - DOA NÃO Aprovado.",ATXT,"")
			end if
			Clientes.Close : Set Clientes=NOTHING
	End Select
%>
<script language="javascript">
	window.location.href="<%=BTXT%>"; 
</script>
