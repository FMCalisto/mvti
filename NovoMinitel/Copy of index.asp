<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="includes/inc_variaveis_globais.asp"-->
<!--#INCLUDE file="includes/inc_FuncoesCRT.asp"-->
<!--#INCLUDE file="includes/FuncoesGENERICAS.asp"-->
<%
if Ucase(request.QueryString("OP"))="LOGOUT"  Then 
	Session.Abandon()
End if 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt" xml:lang="pt">
<head>
<link href="/includes/MINITEL.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META NAME="creationdate" CONTENT="Março 2007">
<META NAME="webmaster" CONTENT="IT Netcetera, it@minitel.pt">
<META NAME="Author" CONTENT="Rui Fernandes (rui.fernandes@minitel.pt)">
<META NAME="Description" LANG="pt" CONTENT="A Minitel é representante e distribuidora em informatica em Portugal das marcas Adobe, Crucial, GDATA, GFI, Ion, Kaspersky, Kensington, LaCie, Lexar, Netgear, Symantec, Wacom, WatchGuard, Dazzle, El Gato, Exspect, FileMaker, Gear4, Intracom, Iris, Mimio, Monster, Pinnacle, Seiko Instruments, Sony, Tucano, XtremeMac, entre outras.">
<META NAME="keywords" LANG="pt" CONTENT="compras sites, lojas informaticas, comercio informatica, em informatica, preços informatica, atacado informatica, venda acessórios, informatica periféricos, informatica componentes, shopping informatica, programa informatica, micro informatica, vendas informatica, acessórios computador, artigos informática, equipamento informatica, memoria informatica, informatica computador, produtos distribuidor, informatica distribuidores, fornecedores informática, fornecedor informatica, distribuidora informatica, distribuidor informática, Adobe, Crucial, GDATA, GFI, Ion, Kaspersky, Kensington, LaCie, Lexar, Netgear, Symantec, Wacom, WatchGuard, Dazzle, El Gato, Exspect, FileMaker, Gear4, Intracom, Iris, Mimio, Monster, Pinnacle, Seiko Instruments, Sony, Tucano, XtremeMac">
<meta name="robots" content="index,follow">
<!--#INCLUDE file="includes/inc_javascript.asp"-->
</head>
<body topmargin="0" background="/images/quadrado.gif">
<div align="center">
<table width="800" border="0" cellpadding="0" cellspacing="0">
	<tr valign="top">
	  <td width="100%"><!--#INCLUDE file="includes/inc_header.asp"--></td>
    </tr>
	<tr valign="top">
		<td>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td height="100%" width="200" align="left" bgcolor="#F9F9F9">
					<!--#INCLUDE file="includes/inc_Pmenu_esquerdo.asp"-->
				</td>
				<%
				OP=UCASE(txt.qsv("OP",request.QueryString,1))
				If OP="-1" Then OP=UCASE(txt.qsv("OP",request.form,1))
				IF OP<>"" Then  db.QueryExec(cstr("execute Hit_WN_EventosMENU " & OP))
				select case OP
					Case "LISTAPRODUTOS","PESQUISATEXTO","PESQUISAFABRICANTE","FABRICANTEID"
						if instr(ucase(request.QueryString),"FABRICANTEID") and request.QueryString("FABRICANTEID")="" Then
							response.Redirect("/index.asp")
						End if
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="450" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_produtos_lista.asp"-->
							</td>
							<td width="150" align="right" bgcolor="#EFEFE9">
								<%=Bloco_Estatisticas%>
							</td>
						<%
					CASE "ONDECOMPRAR"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="450" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_OndeComprar.asp"-->
							</td>
							<td width="150" align="right" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_OndeComprar_header.asp"-->
							</td>
						<%
					CASE "ACT"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_ClienteACT.asp"-->
							</td>
						<%
					CASE "FICHADECLIENTE"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="400" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_ClienteFicha.asp"-->
							</td>
							<td width="200" align="right" bgcolor="#EFEFE9">
								<!--#INCLUDE file="includes/inc_caixa_userhelp.asp"-->
							</td>
						<%
					CASE "ENCOMENDAS"
						if Get_ClienteColaboradorPodeFazer("ConsultarEncPendente") Then
							Conteudo=True
							%>
								<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
								<td width="430" align="center" bgcolor="#FFFFFF">
									<!--#INCLUDE file="includes/inc_Cliente_Encomendas.asp"-->
								</td>
								<td width="170" align="right" bgcolor="#EFEFE9">
									<!--#INCLUDE file="includes/inc_caixa_userhelp.asp"-->
								</td>
							<%Else Conteudo=False:End if
					CASE "FACTURAS"
						if Get_ClienteColaboradorPodeFazer("ConsultarEncFacturada") Then
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="430" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_Cliente_Facturas.asp"-->
							</td>
							<td width="170" align="right" bgcolor="#EFEFE9">
								<!--#INCLUDE file="includes/inc_caixa_userhelp.asp"-->
							</td>
						<%Else Conteudo=False:End if
					CASE "CLIENTEFICHASITE"
						if Get_ClienteColaboradorPodeFazer("GerirAreaRevenda") Then
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="400" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_ClienteFichaSite.asp"-->
							</td>
							<td width="200" align="right" bgcolor="#EFEFE9">
								<!--#INCLUDE file="includes/inc_caixa_userhelp.asp"-->
							</td>
						<%Else Conteudo=False:End if
					CASE "CLIENTEFICHASITECOLABORADOR"
						if session("Clientes_ColaboradoresID")>0 Then
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="400" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_ClienteFichaSiteCOLABORADOR.asp"-->
							</td>
							<td width="200" align="right" bgcolor="#EFEFE9">
								<!--#INCLUDE file="includes/inc_caixa_userhelp.asp"-->
							</td>
						<%Else Conteudo=False:End if
					CASE "COLABORADOR"
						if Get_ClienteColaboradorPodeFazer("GerirColaboradores") Then
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="430" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_ClienteColaboradores.asp"-->
							</td>
							<td width="170" align="right" bgcolor="#EFEFE9">
								<!--#INCLUDE file="includes/inc_caixa_userhelp.asp"-->
							</td>
						<%Else Conteudo=False:End if
					CASE "RMA"
						if Session("ClienteON") Then
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_RMA.asp"-->
							</td>
						<%Else Conteudo=False:End if
					CASE "FICHADEPRODUTO"
						Conteudo=True
						%>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_produtos_ficha.asp"-->
							</td>
						<%
					CASE "IV"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_international_visitors.html"-->
							</td>
						<%
					CASE "QS"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_quem_somos.html"-->
							</td>
						<%
					CASE "MAPA"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_mapa_tree.asp"-->
							</td>
						<%
					CASE "LOGINERRO"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_login_erro.asp"-->
							</td>
						<%
					CASE "LOGINCOMERCIALOK"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_comercial_listaclientes.asp"-->
								<br />
								<!--#INCLUDE file="includes/inc_comercial_enc_pendentes.asp"-->
								<br />
								<!--#INCLUDE file="includes/inc_comercial_lista_RMA.asp"-->
								<br />
							</td>
						<%
					CASE "RECPASS"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_login_recpass.asp"-->
							</td>
						<%
					CASE "RECPASS_RUN"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_login_recpassRUN.asp"-->
							</td>
						<%
					Case "PEDIRPASSWORD"
						%>
						<form action="/?OP=RECPASS_RUN" method="post" name="passrecover">
							<input type="hidden" name="CLSTAMP" value="<%=request.QueryString("CLSTAMP")%>" />
						</form>
						<script language="javascript">
							document.passrecover.submit();
						</script>
						<%
					CASE "COMPRAR","CARRINHO"
						Conteudo=True
						If OP="COMPRAR" AND  Get_ClienteColaboradorPodeFazer("EncherCesto") Then
							MySQL="execute [WebSiteMINITEL].[dbo].[Web_Add2_CarrinhoTemp] " & Session("no") & ",'" & UCASE(txt.qsv("STSTAMP",request.QueryString,1)) & "',1," & session("Clientes_ColaboradoresID")
							Call db.queryexec(cstr(MySQL))
							response.Redirect("/includes/DO_carros_step1.asp")
						End If
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
							</td>
						<%
					Case Else
						%>
							<title>MINITEL - Distribuidora em informatica e electronica aos melhores preços</title>
							<td width="600" align="center">
							<%if Session("ClienteON") Then%>
								<!--#INCLUDE file="includes/inc_start2revenda.asp"-->
							<%else%>
								<!--#INCLUDE file="includes/inc_start2anonimo.asp"-->
							<%end if%>
							</td>
						<%
					End Select 
				%>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
	<td>
		<!--#INCLUDE file="includes/inc_footer.asp"-->
	</td>
	</tr>
</table></div>
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-9163021-3");
pageTracker._trackPageview();
} catch(err) {}</script>
</body>

</html>
<%Set TXT=Nothing:Set DB=Nothing%>