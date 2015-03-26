<%
	'Vou obter o fabricante...
	BTxt=txt.QSV("ProdutoID",cstr(URLDecode(request.QueryString)),1)
	MySQL="select top 1 FabricanteID From WN_ListaProdutos where ststamp='"& BTxt & "'"
	AInt=db.query(cstr(MySQL))("FabricanteID")

	'Tenho de me certificar que o producto existe na lista
	If cint(db.query(cstr("Select Count(1) Conta From WN_ListaProdutos where FabricanteID="& AInt))("Conta"))<1 Then response.Redirect("/")

	DTxt=txt.QSV("LZona",cstr(URLDecode(request.QueryString)),1)

	MySQL="select '/images/Logotipos/' + RTRIM(Fabricante) + '.gif' AS MarcaIMG from dbo.WN_Fabricante where FabricanteID='"& AInt &"'"
	
	ATXT=cstr(db.query(cstr(MySQL))("MarcaIMG"))

%>
<link href="Minitel.css" rel="stylesheet" type="text/css">
<table width="100%" bgcolor="#EFEFEF" align="center">
	<tr height="65"><td align="center">
		<img onerror="javascript:TrocaImagem('img_Fab') " src="<%=ATXT%>" name="img_Fab" border="0" width="50" height="50" alt="">
	</td></tr>	
</table>
<p align="center" class="Texto_azul"><br /><br /><br /><br /><br />
	Entre em contacto connosco atrav&eacute;s de:
<p align="center" class="Texto_azul"><a href="mailto:geral@minitel.pt">geral@minitel.pt</a>
<p align="center" class="Texto_azul">ou
<p align="center" class="Texto_azul">21 381 09 00
</p>
<p align="center" class="Texto_azul">