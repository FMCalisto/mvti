<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="inc_variaveis_globais.asp"-->
<!--#INCLUDE file="inc_FuncoesCRT.asp"-->
<%
	ATxt=txt.abstxt(request.QueryString("UTILIZADOR"))
	BTxt=txt.abstxt(request.QueryString("NIF"))
	MySQL="SELECT ColaboradorUser,WN_Clientes.No,vendedornome,vendedoremail,vendedortelefone,WN_Clientes.Nome,Clientes_ColaboradoresID, ColaboradorEmail, ColaboradorNome FROM WN_Clientes INNER JOIN WN_Clientes_Colaboradores ON WN_Clientes.clstamp = WN_Clientes_Colaboradores.clstamp WHERE (WN_Clientes.ncont = '" & BTxt & "') AND (WN_Clientes_Colaboradores.ColaboradorUser = '" & ATxt & "')"
	
	Set Clientes=db.query(cstr(MySQL))
	if clientes.eof Then
		ABoo=False
	Else
		ABoo=True
		BTxt=txt.fillrnd(10)
		Call db.queryexec (cstr("execute dbo.WEB_RecPasswordColaborador '" & Clientes("Clientes_ColaboradoresID") & "','" & BTXT & "'"))
	End if



	IF ABoo=True Then 'Envia um e-mail para o cliente e pro comercial
			CTXT="U=" & trim(Clientes("NO")) & "&P=" & BTxt & "&C=" & trim(Clientes("ColaboradorUser"))
			CTXT=txt.EncodeTXT36(cstr(CTXT))
			CTXT="http://" & Request.ServerVariables("SERVER_NAME") & "/Includes/Do_LinkDirecto_RUN.asp?X=" & CTXT

			ATXT=File2String(server.MapPath("\Includes\PaginasPorMail\RecupercaoPassword.txt"))

			ATXT=Replace(ATXT,"XTEMPO",Now())
			ATXT=Replace(ATXT,"XEMPRESA",trim(Clientes("Nome")))
			ATXT=Replace(ATXT,"XCONTACTO",trim(Clientes("ColaboradorNome")))
			ATXT=Replace(ATXT,"XPASSWORD",BTxt)
			ATXT=Replace(ATXT,"XLINK",CTXT)

			ATXT=Replace(ATXT,"XCODIGOCLIENTE",trim(Clientes("NO")))
			ATXT=Replace(ATXT,"XUTILIZADOR",trim(Clientes("ColaboradorUser")))
			ATXT=Replace(ATXT,"XLINK",CTXT)

			ATXT=Replace(ATXT,"XCOMERCIAL",trim(Clientes("vendedornome")))
			ATXT=Replace(ATXT,"XEMAIL",trim(Clientes("vendedoremail")))
			ATXT=Replace(ATXT,"XTELEFONE",trim(Clientes("vendedortelefone")))

		
			'Function EnviaEmail(MailTo,CCto,BCCto,Subject,BodyTXT,BodyHTML)
			Call EnviaEmail(trim(Clientes("ColaboradorEmail")),trim(Clientes("VendedorEmail")),"", trim(Clientes("NO")) & " - Obter Chave de Acesso para Site MINITEL - Colaborador",ATXT,"")

			%>
			<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
			<html xmlns="http://www.w3.org/1999/xhtml" lang="pt" xml:lang="pt">
			<head>
			<title>MINITEL Lda.</title>
			<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
			<link href="/includes/MINITEL.css" rel="stylesheet" type="text/css">
			</head>
			<body>
			<table border="0" cellpadding="0" cellspacing="30" width="95%" align="center" class="Texto">
					<tr>
					  <td align="middle">Pedido de altera&ccedil;&atilde;o de password.<br /><br /></td>
					</tr>
					<tr>
					  <td align="middle">A password foi enviada com sucesso.<br />
						  <br />
						Consulte o e-mail <strong><%=trim(Clientes("ColaboradorEmail"))%></strong> para obter a nova password.</td>
					</tr>
					<tr align="middle">
					  <td><div align="center"><img src="/Images/password.jpg" alt="Y" border="0" /> <br />
		    <a href="/index.asp">Voltar à página inicial</a></div></td>
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
			</body>
			</html>
			<%Clientes.Close:Set Clientes=Nothing%>
<%Else%>
	<!--#include file="inc_login_recpass_erro.asp"-->
<%End if%>
