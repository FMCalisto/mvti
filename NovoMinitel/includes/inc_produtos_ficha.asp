<%
	ProdutoID=UCASE(txt.qsv("ProdutoID",request.QueryString,1))
	MySQL="Select * From WN_ListaProdutos where StSTAMP='" & ProdutoID & "'"
	Set ListaProdutos=db.query(cstr(MySQL))
	If ListaProdutos.Eof Then Response.Redirect("/")
	db.queryexec(cstr("execute dbo.Hit_WN_ListaProdutos_HITS '" & ProdutoID & "'"))
%>
<script src="DWConfiguration/ActiveContent/IncludeFiles/AC_RunActiveContent.js" type="text/javascript"></script>
<title>MINITEL Lda. - <%=ListaProdutos("Design")%></title>
<table width="100%" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
		<td>
<!--------------------------->
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="lista_produtos_direita">
	  <tr>
		<td height="25" align="left" valign="middle" bgcolor="#8C9594" class="Titulo_branco">
			<strong><%=ListaProdutos("Design")%></strong>
		</td>
	  </tr>
	  <tr>
		<td height="227" valign="top" align="center">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="200" height="200" valign="middle"><%=replace(ListaProdutos("Imagem"),"width=""50"" height=""50""","width=""200"" height=""200""")%></td>
			  <td width="100%" valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F2F2F2">
				<tr height="21">
				  <td colspan="4" valign="top">&nbsp; </td>
				  </tr>
				<tr height="21">
				  <td colspan="4" valign="middle" class="Texto"><strong class="Texto_azul">&nbsp;Refer&ecirc;ncia Minitel:</strong> <%=ListaProdutos("Ref")%> </td>
				  </tr>
				<tr height="21">
				  <td colspan="4" valign="middle" class="Texto"><strong class="Texto_azul">&nbsp;Categoria: </strong>
				  <a title="Filtrar por categoria." href="<%=txt.href("?OP=ListaProdutos&Cat1QS=" & ListaProdutos("Cat_ID1"))%>"><%=ListaProdutos("Cat1")%></a>
				  </td>
				  </tr>
				<tr height="21">
				  <td colspan="4" valign="middle" class="Texto"><strong class="Texto_azul">&nbsp;Sub-Categoria: </strong>								  <a title="Filtrar por sub-categoria." href="<%=txt.href("?OP=ListaProdutos&Cat1QS=" & ListaProdutos("Cat_ID1") & "&Cat2QS=" & ListaProdutos("Cat_ID2") )%>"><%=ListaProdutos("Cat2")%></a>
				  </td>
				  </tr>
				<tr height="21">
				  <td colspan="4" valign="middle" class="Texto"><strong class="Texto_azul">&nbsp;Refer&ecirc;ncia do fabricante:</strong> <%=ListaProdutos("forref")%></td>
				  </tr>
				<%if session("ClienteON") or session("ComercialON") Then%>
				<tr height="21">
				  <td colspan="4" valign="middle" class="Texto"><strong class="Texto_azul">&nbsp;Pre&ccedil;o:</strong> <%=Moeda(ListaProdutos("preco"))%> | <strong class="Texto_azul">&nbsp;PVP&nbsp;:&nbsp;</strong><%=Moeda(ListaProdutos("PVP"))%></td>
				  </tr>
				  <%else%>
  				<tr height="21">
				  <td colspan="4" valign="middle" class="Texto"><strong class="Texto_azul">&nbsp;PVP&nbsp;:&nbsp;</strong><%=Moeda(ListaProdutos("PVP"))%></td>
				  </tr>
				  <%end if%>
				<tr height="21">
				  <td colspan="4" valign="top">&nbsp; </td>
				  </tr>
				<tr height="30" align="center" valign="middle">
				  <td width="100">
					<%If ExisteFicheiro("\PDF_Documentos\" & trim(ListaProdutos("Ref")) & ".PDF") Then%>					  	<a target="_blank" href="/PDF_Documentos/<%=trim(ListaProdutos("Ref"))%>.pdf"><img src="images/pdf_on.gif" width="30" height="30" border="0"></a>
					<%Else%>
						  	<img src="images/pdf_off.gif" width="30" height="30">
					<%End if%>
	   		      </td>
				  <td width="100">
					<%=ListaProdutos("ImagemStock_ProdutoFicha")%>				  
				   </td>
				  <td width="100">
				  	<a href="/?OP=ONDECOMPRAR&PRODUTOID=<%=ProdutoID%>">
				  	<img src="/images/bussola_on.gif" width="30" height="30" border="0"></A>				  					</td>
				  <td width="100">
					<%If ExisteFicheiro("\PDF_Imprensa\" & trim(ListaProdutos("Ref")) & ".PDF") Then%>
						  	<a target="_blank"  href="/PDF_Imprensa/<%=trim(ListaProdutos("Ref"))%>.pdf"><img src="images/imprensa_on.gif" width="30" height="30" border="0"></a>
					<%Else%>
						  	<img src="images/imprensa_off.gif" width="30" height="30">
					<%End if%>
				   </td>
				</tr>
				<tr height="23" valign="middle" align="center" class="Texto">
				  <td>Datasheet</td>
				  <td>Disponibilidade</td>
				  <td><a href="/?OP=ONDECOMPRAR&PRODUTOID=<%=ProdutoID%>">Onde Comprar</a></td>
				  <td>Imprensa</td>
				</tr>
				<tr height="6">
				  <td colspan="4"></td>
				</tr>
	 		  <%If Session ("ClienteON") Then%>
				<tr height="20" align="center" valign="middle">
<%If Get_ClienteColaboradorPodeFazer("EncherCesto") Then %>
				  <td>
				  <a href="/?OP=Comprar&StStamp=<%=ListaProdutos("Ststamp")%>" title="Adicionar este produto ao carrinho." class="Titulo_laranja">
					<img src="images/online.gif" width="30" height="30" border="0"></a>
				  </td>
				  <td colspan="3" align="left"><a href="/?OP=Comprar&StStamp=<%=ListaProdutos("Ststamp")%>" title="Adicionar este produto ao carrinho." class="Titulo_laranja">Adicionar este produto ao carrinho.</a></td>
<%else%>
				  <td>
				  <img src="images/online.gif" width="30" height="30" border="0"></a>
				  </td>
				  <td colspan="3" align="left"><span class="Titulo_laranja" style="text-decoration:line-through">Adicionar este produto ao carrinho.</span></td>
		
<%End if%>

				  </tr>
			<%else%>
				<tr height="20" align="center" valign="middle">
				  <td>
					<!--<img src="images/online.gif" width="30" height="30">-->
				  </td>
				  <td colspan="3" align="left"><div class="Texto_azul"><!--Consulte  uma loja online que comercialize
				      este produto--></div></td>
				  </tr>
			  <%End if%>
				<tr>
				  <td height="23" colspan="4">&nbsp;</td>
				</tr>
			  </table>
			  </td>
		   </tr>
		<%if session("ComercialON") or session("no")=18044 or session("no")=17939 or session("no")=19559 Then 'rui F e pedro cortez susanafrade%>
		
			   <tr align="center">
				  <td height="25" colspan="2" valign="middle" bgcolor="#9DEABC" class="Titulo_Branco">
					<a target="_blank" href="/WebAdmin/Ficha_Descricao.asp?Referencia=<%=ListaProdutos("Ref")%>">Editar descrição</a>
				  </td>	
			  </tr>
		<%end if%>
		<%if len(trim(ListaProdutos("Descricao")))>4 Then%>
		   <tr>
			  <td height="25" colspan="2" valign="middle" bgcolor="#81B9D1" class="Titulo_Branco">&nbsp;Descrição do produto</td>	
			  </tr>
		  </table>
		  <table width="98%" border="0" cellpadding="0" cellspacing="0" class="lista_produtos_direita" bgcolor="#FFFFFF">
			<tr height="5"><td></td></tr>
			<tr align="justify" valign="top">
				<td colspan="2" class="Texto"><%=ListaProdutos("Descricao")%></td>
			</tr>
			<tr height="5"><td></td></tr>
		<%end if%>
 		  </table>
		</td>
		</tr>
		</table>
<!--------------------------->		
		</td>
	</tr>
</table>
<%

if session("ClienteON") or Session("ComercialON") Then
MySQL="Select top 5 ImagemStock_ProdutoLista,StStamp,Design,FABRICANTEID,fabricante,imagem,CAT_ID1,CAT_ID2,CAT_ID3,Ref,preco from WN_ListaProdutos where stock>0 and CAT_ID1 =" & ListaProdutos("CAT_ID1") & " and (CAT_ID2 =" & ListaProdutos("CAT_ID2") & " or CAT_ID2=0) and ststamp<>'" &  ListaProdutos("ststamp") & "' AND preco>0"
Else
MySQL="Select top 5 ImagemStock_ProdutoLista,StStamp,Design,FABRICANTEID,fabricante,imagem,CAT_ID1,CAT_ID2,CAT_ID3,Ref,PVP as preco from WN_ListaProdutos where stock>0 and CAT_ID1 =" & ListaProdutos("CAT_ID1") & " and (CAT_ID2 =" & ListaProdutos("CAT_ID2") & " or CAT_ID2=0) and ststamp<>'" &  ListaProdutos("ststamp") & "' AND preco>0"
End if

ListaProdutos.Close
Set ListaProdutos=db.query(cstr(MySQL))
%>
<table width="100%" cellpadding="0" cellspacing="0" bgcolor="#FFCCFF" border="0">
	<tr align="left" valign="middle">
	  <td height="25" colspan="2" valign="middle" bgcolor="#81B9D1" class="Titulo_Branco">&nbsp;<%=ListaProdutos.RecordCount%> produtos alternativos</td>
	</tr>
</table>
<%If NOT ListaProdutos.Eof Then%>
<table width="65%" border="0" cellpadding="0" cellspacing="0">
<%Do While Not ListaProdutos.EOF%>
	<tr>
	<td>
	<%=ListaFichaProduto(trim(ListaProdutos("StStamp")),trim(ListaProdutos("Design")),ListaProdutos("FABRICANTEID"),trim(ListaProdutos("fabricante")),trim(ListaProdutos("imagem")),ListaProdutos("PRECO"),ListaProdutos("CAT_ID1"),ListaProdutos("CAT_ID2"),ListaProdutos("CAT_ID3"),ListaProdutos("Ref"),ListaProdutos("ImagemStock_ProdutoLista"))%>
	</td>	
	</tr>
<%ListaProdutos.MoveNext:Loop%>
<%ListaProdutos.Close:Set ListaProdutos=Nothing%>
</table>
<%End if%>