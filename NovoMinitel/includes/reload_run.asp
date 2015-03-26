<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Refaz tabelas...</title>
</head>
<body>
<br /><br />
<p align="center">
<%randomize%>
<strong>
A processar o pedido...<br /> !! Não fechar esta janela ! Esperar !!<br />
</strong>
<img src="/images/tempo/T_<%=int(rnd*6)%>.gif" height="150" />
<!--#INCLUDE file="inc_FuncoesCRT.asp"-->
<%
	response.Flush()
	Dim db
	Set db = Server.CreateObject("Interface_min.db")

	Select Case Ucase(request.querystring("OP"))
		Case "STOCK"
				call teste ("Cria Stock (TEMP)...")
				db.queryexec("Execute cria_WebSiteMINITEL_Stock")
				call teste ("OK")

				call teste ("Mapas de ordenação...")
				db.queryexec("execute corrige_WebSiteMINITEL_SORT")
				call teste ("OK")

				call teste ("Corrigir Imagens...")
				db.queryexec("execute Corrige_WebSiteMINITEL_Img")
				call teste ("OK")
				
				call teste ("Calculo de categorias...")
				db.queryexec("execute cria_WN_CategoriasT")
				call teste ("OK")
				
				call teste ("Criar Tabela de Categorias...")
				db.queryexec("execute cria_WN_CategoriasT_2_Categorias")
				call teste ("OK")
				
				call teste ("Criar Tabela de Fabricante...")
				db.queryexec("execute Cria_WN_Fabricante")
				call teste ("OK")
				
				call teste ("Criar Tabela de Fabricante Vs. Categorias")
				db.queryexec("execute Cria_WN_Fabricantes_E_Categorias")
				call teste ("OK")
				
				call teste ("Tabela final dos produtos...")
				db.queryexec("execute Cria_WN_WebSiteMINITEL_2_WN_ListaProdutos")
				call teste ("OK")
				
				call teste ("Tabela final das Categorias...")
				db.queryexec("execute dbo.Cria_WN_Fabricantes_E_Categorias")
				call teste ("OK")
								
				call teste ("Estatisticas...")
				db.queryexec("execute Cria_WN_STAT_Top10")
				call teste ("OK")
		Case "CLIENTES"
			call teste ("Importa clientes...")
				db.queryexec("execute Cria_WN_Clientes")
			call teste ("OK")

	End Select
%>
</p>
<%Set TXT=Nothing:Set DB=Nothing%>
<script language="javascript">
	window.location = "/index.asp"
</script>
</body>
</html>

