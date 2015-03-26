<!--#INCLUDE VIRTUAL="/includes/FuncoesGenericas.asp"-->
<%
Function Carrinho(Referencia,Marca,Categoria,Titulo,Imagem,Preco)
%>
	<table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#F0F0F0">
		<tr>
			<td colspan="2" align="center" valign="middle" colpan="2" class="titulos1"><p title="<%=Titulo%>"><%response.write(left(Titulo,30)) : if len(Titulo)>30 Then response.write("...")%></p></td>
		</tr>
		<tr>
			<td rowspan="2" align="center"><a class="link" href="ProdutoFicha.asp?Ref=<%=Referencia%>&Marca=<%=Marca%>&Categoria=<%=Categoria%>" target="_self"><img src="<%=Imagem%>" width="70" height="70" border="0"></a></td>
			<td align="center"><a class="link" href="ProdutoFicha.asp?Ref=<%=Referencia%>&Marca=<%=Marca%>&Categoria=<%=Categoria%>" target="_self"><%=Referencia%></a></td>
		</tr>
		<tr>
			<%
			  Dim IImagem
			  if QQCarrinho=0 Then 
				QQCarrinho=""
				IImagem=GetImage("Carro5.gif")
				Texto="Colocar no carrinho"
			  Else
				IImagem=GetImage("Carro_actualizar.gif")
				Texto="Actualizar valor"
			  End if
			%>
			<form action="/includes/CarrinhoProdutoAdd.asp" method="post">
			<td  width="50%" align="center" valign="middle" bgcolor="<%=cor%>">
					<p class="titulos1"><%=FormatNumber(Preco,2) & "€"%><br>
					<input name="Quantidade" size="2" maxlength="2" class="ComboBOX" align="middle" value="<%=QQCarrinho%>">
					<input type="image" src="<%=IImagem%>" onClick="FormRef.Submit" alt="<%=Texto%>">
					<input type="hidden" name="Referencia" value="<%=Referencia%>">
					<input type="hidden" name="link" value="">
					<input type="hidden" name="origem" value="/Index.asp">
					</p>
			</td>
			</form>
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

	StringX="select distinct top 10 destaque.referencia,WN_ListaProdutosT.Marca,WN_ListaProdutosT.Categoria,WN_ListaProdutosT.imagem,WN_ListaProdutosT.precorevenda,WN_ListaProdutosT.Descricao from destaque left outer join WN_ListaProdutosT on WN_ListaProdutosT.Referencia=destaque.referencia and WN_ListaProdutosT.tipo=destaque.tipo where activa=1 and destaque.Tipo='" & Session("Tipo") & "'"

	rsx.Open StringX,ConnObjX,1
		TotalRegistos=rsx.recordcount
		TotalLinhas=Round(TotalRegistos / 2)
%>
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
			<td><%Call Carrinho(trim(rsx("Referencia")),trim(rsx("Marca")),trim(rsx("Categoria")),trim(rsx("Descricao")),trim(rsx("imagem")),trim(rsx("precorevenda")))%></td>
			<%rsx.movenext%>
			<td><%Call Carrinho(trim(rsx("Referencia")),trim(rsx("Marca")),trim(rsx("Categoria")),trim(rsx("Descricao")),trim(rsx("imagem")),trim(rsx("precorevenda")))%></td>
		</tr>
		<%
	rsx.movenext
	 Next
	 End if
	%>
	</table>
	</td>
  </tr>
</table>
<%
	rsx.close
%>