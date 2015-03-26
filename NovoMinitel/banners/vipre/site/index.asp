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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(/banners/vipre/site/imagens/background.jpeg);
}
-->
</style></head>
<body>