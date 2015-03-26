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
<META NAME="webmaster" CONTENT="Minitel, info@minitel.pt">
<META NAME="Author" CONTENT="Rui Fernandes (rui.fernandes@minitel.pt)">
<META NAME="Description" LANG="pt" CONTENT="Fundada em 1987 em Portugal, a Minitel &eacute; um distribuidor especializado no mercado de tecnologias de informa&ccedil;&atilde;o e electr&oacute;nica de consumo, com uma linha alargada e seleccionada das principais marcas de hardware e software para computadores, telem&oacute;veis e smartphones.
As principais marcas de distribui&ccedil;&atilde;o do Minitel incluem ao n&iacute;vel do software as aplica&ccedil;&otilde;es web e gr&aacute;ficas da Adobe, os antiv&iacute;rus da Symantec, Kaspersky e Threat Track VIPRE, o software de DLP da DeviceLock, as appliances Unitrends, e a base de dados FileMaker; relativamente ao hardware a Minitel distribui em exclusividade para Portugal a Lexar e a Crucial, marcas fabricadas pela Micron, o 2&ordm; maior fabricante mundial de mem&oacute;rias, os scanners da Iris e da Microtek, os discos e unidades de NAS da LaCie, Qnap e Infortrend, os acess&oacute;rios para tablets, notebooks e smartphones da Kensington, Clingo, Cygnett, Divoom, G-Form, Innergie e Swissvoice, as mesas digitalizadoras da Wacom e as impressoras de tal&otilde;es e etiquetas da Seiko.
Filosofia empresarial
A Minitel distribui as suas linhas de produtos exclusivamente atrav&eacute;s de canais indirectos de vendas.
Devido ao crescimento das suas vendas de acess&oacute;rios para os sector da electr&oacute;nica de consumo e das telecomunica&ccedil;&otilde;es (acess&oacute;rios para smartphones / tablets), a necessidade de abordar esses novos mercados atrav&eacute;s de canais da grande distribui&ccedil;&atilde;o levou a Minitel a diversificar-se para al&eacute;m da sua clientela tradicional de revendedores de TI, integradores, lojas de inform&aacute;tica e concession&aacute;rios Apple, passando tamb&eacute;m a comercialisar os seus produtos atrav&eacute;s dos grandes hipermercados nacionais e cadeias de retalho, como a FNAC, a Vobis/Worten (Sonae), El Corte Ingl&egrave;s, MediaMarkt , o Auchan, a The Phone House e a Ensitel.

Estes canais de retalho especializado permitem &agrave; Minitel comercializar as suas linhas de produtos e consumo, tais como discos r&iacute;gidos, cart&otilde;es de mem&oacute;ria, acess&oacute;rios de &aacute;udio e v&iacute;deo para tablets e smartphones, em paralelo com a sua rede de revendedores, que comercializa tamb&eacute;m as mesmas linhas de produtos mas que acrescenta &agrave; sua oferta apoio na instala&ccedil;&atilde;o, treino e suporte p&oacute;s-venda.

As marcas de maior tecnologia ou complexidade, como os sistemas de antivirus ou seguran&ccedil;a de dados empresariais, unidades de backup em ambientes virtualizados ou os sistemas de workflow e comunica&ccedil;&atilde;o empresarial s&atilde;o comercializadas atrav&eacute;s de revendedores de valor acrescentado e/ou especializados junto dos seus clientes-alvo, m&eacute;dias e grandes empresas e contas p&uacute;blicas.
Infortrend, entre outras.">
<META NAME="keywords" LANG="pt" CONTENT="compras sites, lojas informaticas, comercio informatica, em informatica, preços informatica, atacado informatica, venda acessórios, informatica periféricos, informatica componentes, shopping informatica, programa informatica, micro informatica, vendas informatica, acessórios computador, artigos informática, equipamento informatica, memoria informatica, informatica computador, produtos distribuidor, informatica distribuidores, fornecedores informática, fornecedor informatica, distribuidora informatica, distribuidor informática, valor acrescentado, value added, distribuicao portugal, Adobe, Crucial, Unitrends, DeviceLock, ThreatTrack, G-Form, Kaspersky, Kensington, LaCie, Lexar, Adonit, Symantec, Wacom, Cygnett, Divoom, El Gato, Qnap, FileMaker, DuneHD, Innergie, Iris, Modecom, Microtek,Seiko Instruments, Sony, Infortrend, Portugal, Espanha, Angola, Moçambique, Value Added, Valor Acrescentado, Software, Hardware, distribuicao">
<meta name="robots" content="index,follow">
<!--#INCLUDE file="includes/inc_javascript.asp"-->
<style type="text/css">
<!--
body {
	background-color: #c1e5fd;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style></head>
<body>
<div align="center" class="xmas">
<table width="1050" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr valign="top">
	  <td width="100%"><!--#INCLUDE file="includes/inc_headerM.asp"--></td>
</tr>
	<tr valign="top">
		<td>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td height="100%" width="200" align="left" bgcolor="#FFFFFF">
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
								<!--#INCLUDE file="includes/inc_international_visitors2.html"-->
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
					CASE "QS2"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_quem_somos2.html"-->
							</td>
						<%
					CASE "NR"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/novosrevendedores.asp"-->
							</td>
							<%
					CASE "CA"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_Carreiras.html"-->
							</td>
						<%
					CASE "EV"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/CEventos.asp"-->
							</td>
						<%
					CASE "AT"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_assistencia.html"-->
							</td>
                            <%
					CASE "LA"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="600" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpagecatalogo2.html"-->
							</td>
                            <%
					CASE "LB"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpagedevicelockhtml.html"-->
							</td>
						<%
						CASE "LC"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_unitrends.html"-->
							</td>
                            <%
						CASE "LD"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_facebook.html"-->
							</td>
                            <%
						CASE "KS"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_kaspersky14.html"-->
							</td>
                             <%
						CASE "KS1"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_kaspersky14_datasheet.html"-->
							</td>
                            <%
						CASE "KS2"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_kaspersky_workshop.html"-->
							</td>
                            <%
						CASE "FL1"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landing_page_filemaker1.html"-->
							</td>

                            <%
						CASE "QS1"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_quem_somos5.html"-->
							</td>
                            
                            <%
						CASE "NVP"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_novos_parceiros.html"-->
							</td>
                            <%
						CASE "SK1"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_seiko_abril.html"-->
							</td>
                            <%
						CASE "SK2"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_seikoportateis_abril.html"-->
							</td>
                            <%
						CASE "SK3"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_seikopos_abril.html"-->
							</td>
                             <%
						CASE "SK4"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_seikoetiquetas_abril.html"-->
							</td>
                            <%
						CASE "JV"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_jivo.html"-->
							</td>
                             <%
						CASE "QNP1"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_qnap1.html"-->
							</td>
                             <%
						CASE "QNP2"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_qnap2.html"-->
							</td>
                            <%
						CASE "QNP3"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_qnap3.html"-->
							</td>
                            <%
						CASE "QNP4"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_qnap4.html"-->
							</td>
                            <%
						CASE "IH"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_ihealth.html"-->
							</td>
                            <%
						CASE "LAC"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_lacie.html"-->
							</td>
                            <%
						CASE "INC"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_incipio.html"-->
							</td>
                            <%
						CASE "INN"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_innergie.html"-->
							</td>
                            <%
						CASE "ADT"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_adonit.html"-->
							</td>
                            <%
						CASE "XT"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_xtorm.html"-->
							</td>
                            <%
						CASE "XT1"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_xtorm_powerb.html"-->
							</td>
                            <%
						CASE "XT2"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_xtorm_mochila.html"-->
							</td>
                            <%
						CASE "XT3"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_xtorm_csolares.html"-->
							</td>
                            <%
						CASE "WAC1"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_wacom.html"-->
							</td>
                            <%
						CASE "WAC2"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_wacom2.html"-->
							</td>
                             <%
						CASE "WAC3"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_wacom3.html"-->
							</td>
                            <%
						CASE "WAC4"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_wacom4.html"-->
							</td>
                            <%
						CASE "PRT1"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_port1.html"-->
							</td>
                            <%
						CASE "PRT2"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_port2.html"-->
							</td>
                            <%
						CASE "PRT3"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_port3.html"-->
							</td>
                            <%
						CASE "PRT4"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_port5.html"-->
							</td>
                            <%
						CASE "LXR1"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_lexar1.html"-->
							</td>
                            <%
						CASE "LXR2"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_lexar2.html"-->
							</td>
                            <%
						CASE "LXR3"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_lexar3.html"-->
							</td>
                            <%
						CASE "LXR4"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_lexar4.html"-->
							</td>
                            <%
						CASE "CRL1"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_crucial_intro.html"-->
							</td>
                            <%
						CASE "CRL2"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_crucial_memorias.html"-->
							</td>
                            <%
						CASE "CRL3"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_crucial_ballstix.html"-->
							</td>
                            <%
						CASE "CRL4"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_crucial_ssd.html"-->
							</td>
                            <%
						CASE "SC1"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_scosche1.html"-->
							</td>
                            <%
						CASE "SC2"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_scosche2.html"-->
							</td>
                            <%
						CASE "SC3"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_scosche3.html"-->
							</td>
                            <%
						CASE "SC4"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_scosche4.html"-->
							</td>
                            <%
						CASE "SC5"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_scosche5.html"-->
							</td>
                            <%
						CASE "MYK1"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_mykronoz_intro.html"-->
							</td>
                            <%
						CASE "MYK2"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_mykronoz_splash.html"-->
							</td>
                            <%
						CASE "MYK3"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_mykronoz_fit.html"-->
							</td>
                            <%
						CASE "MYK4"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_mykronoz_watch.html"-->
							</td>
                            <%
						CASE "MYK5"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_mykronoz_bracelet.html"-->
							</td>
                             <%
						CASE "MYK6"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_mykronoz_nano.html"-->
							</td>
                            <%
						CASE "SMTC"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_symantec.html"-->
							</td>
                          
                         
                            <%
							CASE "N1"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_jornalminitel.html"-->
							</td>
                            <%
							CASE "N2"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_oespecialista_marco.html"-->
							</td>
                            <%
							CASE "N3"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_unitrendsapp.html"-->
							</td>
                            <%
							CASE "N4"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_devicelockfev.html"-->
							</td>
                            <%
							CASE "N5"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_pme_lider.html"-->
							</td>
                            <%
							CASE "A1"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_adobegeral.html"-->
                                </td>
                                  <%
							CASE "A2"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpageadobe.html"-->
                                </td>
                                          <%
							CASE "A3"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpageadobe_gestures.html"-->
                                </td>
                                </td>
                                          <%
							CASE "A4"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file="includes/inc_landingpage_adobeCC.html"-->
                                </td>
                                          <%
							CASE "LB1"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file=
"includes/landing_page_labtech.html"-->
                                </td>
                                       <%
							CASE "LB2"
						Conteudo=True
						%>
							<title>MINITEL - Distribuidora em informatica - <%=OP%></title>
							<td width="810" align="center" bgcolor="#FFFFFF">
								<!--#INCLUDE file=
"includes/landing_page_datasheets_labtech.html"-->
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
								<!--#INCLUDE file="includes/inc_start2anonimoC.asp"-->
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
