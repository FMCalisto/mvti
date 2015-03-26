<%

if session("ClienteON") or Session("ComercialON") Then
	MySQL="Select top 15 StStamp,Design,FABRICANTEID,fabricante,imagem,CAT_ID1,CAT_ID2,CAT_ID3,Ref,preco,ImagemStock_ProdutoLista from WN_ListaProdutos where 1=1"
Else
	MySQL="Select top 15 StStamp,Design,FABRICANTEID,fabricante,imagem,CAT_ID1,CAT_ID2,CAT_ID3,Ref,pvp as PRECO,'' as ImagemStock_ProdutoLista from WN_ListaProdutos where 1=1"
End if
BBoo=Get_ClienteColaboradorPodeFazer("EncherCesto")

	Session("QueryString")=request.QueryString

	if request.QueryString<>"" Then

		ATxT="" 'Atenção que esta variavel passa para a zona das ordenações
	  	Cat1QS=cint(txt.QSV("Cat1QS",request.QueryString,1))
	    Cat2QS=cint(txt.QSV("Cat2QS",request.QueryString,1))
	    Cat3QS=cint(txt.QSV("Cat3QS",request.QueryString,1))
		If Cat1QS<>-1 Then ATxT=ATxT & " And Cat_ID1=" & Cat1QS
		If Cat2QS<>-1 Then ATxT=ATxT & " And Cat_ID2=" & Cat2QS
		If Cat3QS<>-1 Then ATxT=ATxT & " And Cat_ID3=" & Cat3QS


		BInt=cint(txt.QSV("STOCK",request.QueryString,1))
		If BInt<>-1 Then
				ATxT=ATxT & " And Filtro_Stock=" & BInt
		End if

		FabricanteID=cint(txt.qsv("FabricanteID",request.QueryString,1))
		If FabricanteID<>-1 Then ATxT=ATxT & " And FabricanteID=" & FabricanteID

		Aint=cint(txt.QSV("Ordem",request.QueryString,1))
		If Aint<>-1 Then
			Select Case AInt
				case 0
					CTxt=" order by Sort1 Asc " 
					CampoDeOrdenacao="Sort1"
				case 1
					if session("ClienteON") or Session("ComercialON") Then
						CTxt=" order by Sort2 Asc " 'PVP Ascendente / SORT2  EPv1
						CampoDeOrdenacao="Sort2"
					Else
						CTxt=" order by Sort3 Asc " 'PVP Ascendente / SORT2  EPv1
						CampoDeOrdenacao="Sort3"
					End if	
				case 2
					if session("ClienteON") or Session("ComercialON") Then
						CTxt=" order by Sort2 Desc " 'PVP Descendente / SORT2  EPv1
						CampoDeOrdenacao="Sort21"
					Else
						CTxt=" order by Sort3 Desc " 'PVP Descendente / SORT2  EPv1
						CampoDeOrdenacao="Sort31"
					End if
				case 3
					CTxt=" order by Sort1 Desc " 
					CampoDeOrdenacao="Sort11"
			End Select	
		Else
			CTxt=" order by Sort1 Asc " 
			CampoDeOrdenacao="Sort1"
		End if
		
		'Campturo a MySQL de forma a que esta não seja alterada
		Rem Isto é por causa dos filtros
		DTxt=UCASE(txt.qsv("Passagem",request.QueryString,1))
		If DTxt<>"-1" and cint(txt.QSV("Filtro",request.QueryString,1))<>-1 Then
			select case DTxt
				Case "FABRICANTE"
					ATxT=ATxT & " AND FabricanteID=" & cint(txt.QSV("Filtro",request.QueryString,1)) 
				Case "CATEGORIA"
					ATxT=ATxT & " AND Cat_ID1=" & cint(txt.QSV("Filtro",request.QueryString,1)) 
				Case "PESQUISATEXTO"
					ATxT=ATxT & " And (ref like '%" & txt.QSV("TEXTO",request.QueryString,1) & "%' or design like '%" & txt.QSV("TEXTO",request.QueryString,1) & "%' or descricao like '%" & txt.QSV("TEXTO",request.QueryString,1) & "%')"
					If txt.QSV("Filtro",request.QueryString,1)<>"" Then 
						ATxT=ATxT & " AND FabricanteID=" & cint(txt.QSV("Filtro",request.QueryString,1)) 
					End if
			 End Select
		 End if
  
		BTxT=txt.qsv("OP",request.QueryString,1) 
		if BTxT="PESQUISATEXTO" Then
		   BTXT=replace(txt.QSV("TEXTO",request.QueryString,1),"+"," ")
					ATxT=ATxT & " And (ref like '%" & BTXT & "%' or design like '%" & BTXT & "%')"
		End if

	'Vou Buscar o index para saber desde que produto mostro a lista
	DTxt=UCASE(txt.qsv("Indice",request.QueryString,1))
	StringParaListaDeProdutos=ATxT
	If DTxt<>"-1" Then
		ATxT=ATxT & " AND " & CampoDeOrdenacao & ">" & DTxt
	End if
	Call CalculaIndices(CampoDeOrdenacao, 15 , StringParaListaDeProdutos, CTxt ) 
  End if

	'If ATxT="" Then ATxT=" and 1=2" 'Com isto faço com que NÃO haja qquer resultado
	MySQL=trim(mysql & ATxT & CTXt)
'	Teste(MySQL)
    Set ListaProdutos=db.query(cstr(MySQL))
	Session("MySQL")=MySQL
%>
<%BInt=db.Query(cstr(MYSQL)).recordcount%>
<%If Bint>0 Then%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#E4E4E4" height="25">
		<tr><td height="25" class="Texto" align="left">&nbsp;Listagem dos produtos seleccionados.</td></tr>
	</table>
	<%=Ordenacoes%>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<%Do While Not ListaProdutos.EOF%>
	<tr>
	<td>
	<%=ListaFichaProduto(trim(ListaProdutos("StStamp")),trim(ListaProdutos("Design")),ListaProdutos("FABRICANTEID"),trim(ListaProdutos("fabricante")),trim(ListaProdutos("imagem")),trim(ListaProdutos("PRECO")),ListaProdutos("CAT_ID1"),ListaProdutos("CAT_ID2"),ListaProdutos("CAT_ID3"),ListaProdutos("Ref"),ListaProdutos("ImagemStock_ProdutoLista"))%>
	</td>	
	</tr>
	<%ListaProdutos.MoveNext:Loop%>
	<%ListaProdutos.Close:Set ListaProdutos=Nothing%>
	</table>
	<br />
	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="Texto_azul">
		<tr>
		<td align="center">
			<%=ObtemIndices%><br /><br />
		</td>
		</tr>
	</table>
<%Else%>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" height="50%">
		<tr>
			<td align="center">
				<table width="96%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td class="Texto">
			A sua pesquisa não encontrou qualquer resultado.<br /><br />
			Tente pesquisar no <a href="/?OP=MAPA" class="Texto_azul"><strong>Mapa de Produtos</strong></a> para que possa ser mais específico no que procura.<br />
			<br />
			Caso necessite de ajuda, contacte-nos (Tel : 21.381.09.00)<br />ou através do e-mail : <a href="mailto:info@minitel.pt&subject=Produto n&atilde;o encontrado">info@minitel.pt</a><br />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<%End if%>
 
	