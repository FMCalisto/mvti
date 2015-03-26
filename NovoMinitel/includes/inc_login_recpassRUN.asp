<!--#INCLUDE file="inc_FuncoesCRT.asp"-->
<%
	ABoo=False
	If isnumeric(request.Form("NIF")) and request.Form("NIF")<>"" Then

		if ucase(txt.abstxt(request.Form("utilizador")))<>"ADMIN" and trim(request.Form("utilizador"))<>"" Then
			response.Redirect("/includes/inc_login_recpassColaboradorRUN.asp?UTILIZADOR=" & trim(request.Form("utilizador")) & "&NIF=" & trim(request.Form("NIF")))
		Else
			ATXT=replace(trim(request.Form("NIF")),"'","") 'Evito a utilização do txt.abstxt
			MySQL="select clstamp,no,email,vendedornome,vendedoremail,vendedortelefone,contacto,nome from dbo.WN_Clientes where ncont='" & ATXT & "'"
			Set Clientes=db.query(cstr(MySQL))
			IF Not(Clientes.Eof) Then
				ABoo=True
				BTxt=txt.fillrnd(10)
				Call db.queryexec (cstr("execute dbo.WEB_RecPassword '" & Clientes("clstamp") & "','" & BTXT & "'"))
			End if
		end if
	Else
		if request.Form("CLSTAMP")<>"" Then
			ATXT=trim(request.Form("CLSTAMP"))
			MySQL="select clstamp,no,email,vendedornome,vendedoremail,vendedortelefone,contacto,nome from dbo.WN_Clientes where clstamp='" & ATXT & "'"
			Set Clientes=db.query(cstr(MySQL))
			IF Not(Clientes.Eof) Then
				ABoo=True
				BTxt=txt.fillrnd(10)
				Call db.queryexec (cstr("execute dbo.WEB_RecPassword '" & Clientes("clstamp") & "','" & BTXT & "'"))
			End if
		End if
	End if


	IF ABoo=True Then 'Envia um e-mail para o cliente e pro comercial
			CTXT="U=" & trim(Clientes("NO")) & "&P=" & BTxt & "&C=Admin"
			CTXT=txt.EncodeTXT36(cstr(CTXT))
			CTXT="http://" & Request.ServerVariables("SERVER_NAME") & "/Includes/Do_LinkDirecto_RUN.asp?X=" & CTXT
		
		
			ATXT=File2String(server.MapPath("\Includes\PaginasPorMail\RecupercaoPassword.txt"))

			ATXT=Replace(ATXT,"XTEMPO",Now())
			ATXT=Replace(ATXT,"XEMPRESA",trim(Clientes("Nome")))
			ATXT=Replace(ATXT,"XCONTACTO",trim(Clientes("Contacto")))
			ATXT=Replace(ATXT,"XPASSWORD",BTxt)
			ATXT=Replace(ATXT,"XLINK",CTXT)

			ATXT=Replace(ATXT,"XCODIGOCLIENTE",trim(Clientes("NO")))
			ATXT=Replace(ATXT,"XUTILIZADOR","Admin")
			ATXT=Replace(ATXT,"XLINK",CTXT)

			ATXT=Replace(ATXT,"XCOMERCIAL",trim(Clientes("vendedornome")))
			ATXT=Replace(ATXT,"XEMAIL",trim(Clientes("vendedoremail")))
			ATXT=Replace(ATXT,"XTELEFONE",trim(Clientes("vendedortelefone")))

		
			'Function EnviaEmail(MailTo,CCto,BCCto,Subject,BodyTXT,BodyHTML)
			Call EnviaEmail(trim(Clientes("email")),trim(Clientes("VendedorEmail")),"", trim(Clientes("NO")) & " - Obter Chave de Acesso para Site MINITEL",ATXT,"")

			
			%>
			<table border="0" cellpadding="0" cellspacing="30" width="95%" align="center" class="Texto">
					<tr>
					  <td align="middle">Pedido de altera&ccedil;&atilde;o de password.<br /><br /></td>
					</tr>
					<tr>
					  <td align="middle">A password foi enviada com sucesso.<br />
						  <br />
						Consulte o e-mail <strong><%=trim(Clientes("email"))%></strong> para obter a nova password.</td>
					</tr>
					<tr align="middle">
					  <td><div align="center"><img src="/Images/password.jpg" alt="Y" border="0" /></div></td>
					</tr>
					<tr align="middle">
					  <td><br />
						  <table width="100%" border="0" class="Texto_Top2" with="100%">
							<tbody>
							  <tr>
								<td valign="center" height="52"><div align="center">Minitel - Sociedade de Fomento de Aplica&ccedil;&otilde;es Inform&aacute;ticas,   L.da.<br />
								  Travessa L&eacute;gua da P&oacute;voa, 1A - 1250-136 Lisboa<br />
								  Tel: +351 21 381 09 00   - Fax: +351 21 385 05 44 </div></td>
							  </tr>
							  <tr valign="top">
								<td valign="center"><div align="center">E-mail: <a href="mailto:info@minitel.pt">info@minitel.pt</a></div></td>
							  </tr>
							</tbody>
						</table>
					 </td>
				</tr>
			</table>
			<%Clientes.Close:Set Clientes=Nothing%>
<%Else%>
	<!--#include file="inc_login_recpass_erro.asp"-->
<%End if%>
