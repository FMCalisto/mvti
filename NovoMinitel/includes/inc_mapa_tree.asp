<link href="/includes/Minitel.css" rel="stylesheet" type="text/css" />
<%
AInt=db.query("select max(a) as Maximo from (select top 50 percent CAT_ID1 a from WN_Categorias where Cat1<>'' ORDER BY 1) as a")("Maximo")
%>
<table border="0" cellpadding="0" cellspacing="30" width="95%" align="center">
<tr>
<td class="Titulo_laranja" colspan="2" align="left">Consulte aqui as linhas de produtos comercializados pela Minitel</td>
</tr>
<tr valign="top">
	<td width="50%">
			  <table border="0" cellpadding="0" cellspacing="0">
				<%Set Cat1=db.query("select distinct PESO,Cat1,CAT_ID1 from WN_Categorias where Cat1<>'' and cat_id1<=" & Aint & " ORDER BY PESO")
				Do While not Cat1.Eof%>
				<tr  class="Cat1" height="20">
					<td bgcolor="#FFFFDF"><img src="/images/minisites.gif">&nbsp;&nbsp;<a href="<%=txt.href("?OP=ListaProdutos&Cat1QS=" & Cat1("CAT_ID1"))%>"><%=Cat1("Cat1")%></a></td>
				</tr>
						<%Set Cat2=db.query("select distinct PESO,Cat2,CAT_ID2 from WN_Categorias where Cat2<>'' and CAT_ID1=" & Cat1("CAT_ID1") & " ORDER BY PESO")
						Do While not Cat2.Eof%>
						<tr class="Cat2">
							  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF9900">></font>&nbsp;<a class="Texto" href="<%=txt.href("?OP=ListaProdutos&Cat2QS=" & Cat2("CAT_ID2") & "&Cat1QS=" & Cat1("CAT_ID1"))%>"><%=Cat2("Cat2")%></a></td>
						</tr>
							<%If Cat2QS-1000=Cint(Cat2("CAT_ID2")) Then 'Serve para expandir o ramo se esta opcao for a escolhido%> 
								<%Set Cat3=db.query("select distinct PESO,CAT3,CAT_ID3 from WN_Categorias where CAT3<>'' and CAT_ID1=" & Cat1("CAT_ID1") & " and  CAT_ID2=" & Cat2("CAT_ID2") & " ORDER BY PESO")
								Do While not Cat3.Eof%>
								<tr class="Cat3">
										  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#00CC00">>></font>&nbsp;<a class="Texto" href="<%=txt.href("?OP=ListaProdutos&Cat3QS=" & Cat3("CAT_ID3") & "&Cat2QS=" & Cat2("CAT_ID2") & "&Cat1QS=" & Cat1QS)%>"><%=Cat3("CAT3")%></a></td>
								</tr>
								<%Cat3.MoveNext%>
								<%Loop%>
								<%Cat3.Close%>
							<%end if%>
						<%Cat2.MoveNext%>
						<%Loop%>
						<%Cat2.Close%>
				<%Cat1.MoveNext%>
				<%Loop%>
				<%Cat1.Close%>
			</table>
	</td>
	<td width="50%">
			  <table  border="0" cellpadding="0" cellspacing="0">
				<%Set Cat1=db.query(cstr("select distinct PESO,Cat1,CAT_ID1 from WN_Categorias where Cat1<>''  and CAT_ID1>" & AInt & " ORDER BY PESO "))
				Do While not Cat1.Eof%>
				<tr  class="Cat1" height="20">
					<td bgcolor="#FFFFDF"><img src="/images/minisites.gif">&nbsp;&nbsp;<a href="<%=txt.href("?OP=ListaProdutos&Cat1QS=" & Cat1("CAT_ID1"))%>"><%=Cat1("Cat1")%></a></td>
				</tr>
						<%Set Cat2=db.query("select distinct PESO,Cat2,CAT_ID2 from WN_Categorias where Cat2<>'' and CAT_ID1=" & Cat1("CAT_ID1") & " ORDER BY PESO")
						Do While not Cat2.Eof%>
						<tr class="Cat2">
							  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF9900">></font>&nbsp;<a class="Texto" href="<%=txt.href("?OP=ListaProdutos&Cat2QS=" & Cat2("CAT_ID2") & "&Cat1QS=" & Cat1("CAT_ID1"))%>"><%=Cat2("Cat2")%></a></td>
						</tr>
							<%If Cat2QS-1000=Cint(Cat2("CAT_ID2")) Then 'Serve para expandir o ramo se esta opcao for a escolhido%> 
								<%Set Cat3=db.query("select distinct PESO,CAT3,CAT_ID3 from WN_Categorias where CAT3<>'' and CAT_ID1=" & Cat1("CAT_ID1") & " and  CAT_ID2=" & Cat2("CAT_ID2") & " ORDER BY PESO")
								Do While not Cat3.Eof%>
								<tr class="Cat3">
										  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#00CC00">>></font>&nbsp;<a class="Texto" href="<%=txt.href("?OP=ListaProdutos&Cat3QS=" & Cat3("CAT_ID3") & "&Cat2QS=" & Cat2("CAT_ID2") & "&Cat1QS=" & Cat1QS)%>"><%=Cat3("CAT3")%></a></td>
								</tr>
								<%Cat3.MoveNext%>
								<%Loop%>
								<%Cat3.Close%>
							<%end if%>
						<%Cat2.MoveNext%>
						<%Loop%>
						<%Cat2.Close%>
				<%Cat1.MoveNext%>
				<%Loop%>
				<%Cat1.Close%>
			</table>
	</td>
</tr>
</table>

<%
	Set Cat1=Nothing
	Set Cat2=Nothing
	Set Cat3=Nothing
%>