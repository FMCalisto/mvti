<%
Dim Menu(12,2)

Menu(1,1)="Gravar dados"
Menu(1,2)="Grabar datos"


Function Carrinho(PrecoRevenda,ID,Referencia,Marca,Categoria,Titulo,Imagem)
%>
<link href="../Backoffice.css" rel="stylesheet" type="text/css">

	<table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#F0F0F0">
		<tr>
			<td colspan="2" align="center" valign="middle" colpan="2" class="titulos"><p title="<%=Titulo%>"><%response.write(left(Titulo,30)) : if len(Titulo)>30 Then response.write("...")%></p></td>
		</tr>
		<tr>
			<td rowspan="2" align="center"><a class="link" href="../ProdutoFicha.asp?Ref=<%=Referencia%>&Marca=<%=Marca%>&Categoria=<%=Categoria%>" target="_self"><img src="<%=Imagem%>" width="70" height="70" border="0"></a></td>
			<td align="center" class="titulos"><%=PrecoRevenda%>€</td>
		</tr>
		<tr>
			<td  width="50%" align="center" valign="middle" bgcolor="<%=cor%>">
					<input name="Referencia" size="20" maxlength="20" class="titulos" align="center" value="<%=Referencia%>">
					<input name="DestaqueID" type="hidden" value="<%=ID%>">
			</td>
		</tr>
	</table>
	<%
End Function

	'Dim TotalRegistos
	'Dim TotalLinhas
	'Dim Count

	Dim StringX : StringX=""
	Dim ConnObjX : Set ConnObjX=Server.CreateObject("ADODB.Connection")
	ConnObjX.Open("Provider=SQLOLEDB;Server=SRVWEB;Uid=web;PWD=web;Database=WebMinitel;")

	Dim RsX : Set RsX=Server.CreateObject("ADODB.RecordSet")

	StringX="select distinct top 10 WN_ListaProdutosT.PrecoRevenda,destaque.DestaqueID,destaque.referencia,WN_ListaProdutosT.Marca,WN_ListaProdutosT.Categoria,WN_ListaProdutosT.imagem,WN_ListaProdutosT.Descricao from destaque left outer join WN_ListaProdutosT on WN_ListaProdutosT.Referencia=destaque.referencia and WN_ListaProdutosT.tipo=destaque.tipo where activa=1 and destaque.Tipo='" & Session("Tipo") & "'"

	rsx.Open StringX,ConnObjX,1
		TotalRegistos=rsx.recordcount
		TotalLinhas=Round(TotalRegistos / 2)
%>
<form name="formulario" method="post" action="/webadmin/includes/inc_ficha_destaqueRUN.asp">
<table  height="100%" width="650" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
   <td>
	<table  height="100%" width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr valign="bottom">
		<td colspan="2" valign="top" height="19"><img src="/images/Destaques.gif" border="0"></td>
	</tr>
	<%
	 If TotalLinhas<>0 Then
	 For Count=1 to TotalLinhas
		%>
		<tr valign="top">
			<td><%Call Carrinho(trim(rsx("PrecoRevenda")),trim(rsx("DestaqueID")),trim(rsx("Referencia")),trim(rsx("Marca")),trim(rsx("Categoria")),trim(rsx("Descricao")),trim(rsx("imagem")))%></td>
			<%rsx.movenext%>
			<td><%Call Carrinho(trim(rsx("PrecoRevenda")),trim(rsx("DestaqueID")),trim(rsx("Referencia")),trim(rsx("Marca")),trim(rsx("Categoria")),trim(rsx("Descricao")),trim(rsx("imagem")))%></td>
		</tr>
		<%
	rsx.movenext
	 Next
	 End if
	%>
	</table>
	</td>
  </tr>
	<tr valign="bottom">
		<td colspan="2" align="center"><input name="botao" type="submit" value="<%=Menu(1,Session("Lingua"))%>"></td>
	</tr>
</table>
</form>
<%
	rsx.close
%>