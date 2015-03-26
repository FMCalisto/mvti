<%
  Cat1QS=cint(txt.QSV("Cat1QS",request.QueryString,1))
  Cat2QS=cint(txt.QSV("Cat2QS",request.QueryString,1))
  Cat3QS=cint(txt.QSV("Cat3QS",request.QueryString,1))
  Dim Cat1
  Dim Cat2
  Dim Cat3
%>
<link href="/includes/Minitel.css" rel="stylesheet" type="text/css" />
  <table width="100%" border="0" cellpadding="0" cellspacing="1">
	<%Set Cat1=db.query("select distinct PESO,rtrim(Cat1) Cat1,CAT_ID1 from WN_Categorias where Cat1<>'' ORDER BY PESO")
	Do While not Cat1.Eof%>
	<tr class="Cat1">
			<%if cint(Cat1("CAT_ID1"))<>cint(Cat1QS) Then%>
			 <td>&nbsp;<a class="Texto" href="<%=txt.href("?OP=ListaProdutos&Cat1QS=" & Cat1("CAT_ID1"))%>"><%=Cat1("Cat1")%></a></td>
			<%Else%>
			 <td>&nbsp;<a class="Texto_azul" href="<%=txt.href("?OP=ListaProdutos&Cat1QS=" & Cat1("CAT_ID1"))%>"><%=Cat1("Cat1")%></a></td>
			<%End if%>
	</tr>
		<%If Cat1QS=Cint(Cat1("CAT_ID1")) Then 'Serve para expandir o ramo se esta opcao for a escolhido%> 
			<%Set Cat2=db.query("select distinct PESO,rtrim(Cat2) Cat2,CAT_ID2 from WN_Categorias where Cat2<>'' and CAT_ID1=" & Cat1("CAT_ID1") & " ORDER BY PESO")
			Do While not Cat2.Eof%>
			<tr class="Cat2">
				<%if cint(Cat2("CAT_ID2"))<>cint(Cat2QS) Then%>
				  <td>&nbsp;&nbsp;&nbsp;<font color="#FF9900">></font>&nbsp;<a class="Texto" href="<%=txt.href("?OP=ListaProdutos&Cat2QS=" & Cat2("CAT_ID2") & "&Cat1QS=" & Cat1QS)%>"><%=Cat2("Cat2")%></a></td>
				<%Else%>
				  <td>&nbsp;&nbsp;&nbsp;<font color="#FF9900">></font>&nbsp;<a class="Texto_azul" href="<%=txt.href("?OP=ListaProdutos&Cat2QS=" & Cat2("CAT_ID2") & "&Cat1QS=" & Cat1QS)%>"><%=Cat2("Cat2")%></a></td>
				<%End if%>
			</tr>
				<%If Cat2QS=Cint(Cat2("CAT_ID2")) Then 'Serve para expandir o ramo se esta opcao for a escolhido%> 
					<%Set Cat3=db.query("select distinct PESO,rtrim(CAT3) CAT3,CAT_ID3 from WN_Categorias where CAT3<>'' and CAT_ID1=" & Cat1("CAT_ID1") & " and  CAT_ID2=" & Cat2("CAT_ID2") & " ORDER BY PESO")
					Do While not Cat3.Eof%>
					<tr class="Cat3">
							<%if cint(Cat3("CAT_ID3"))<>cint(Cat3QS) Then%>
							  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#00CC00">>></font>&nbsp;<a class="Texto" href="<%=txt.href("?OP=ListaProdutos&Cat3QS=" & Cat3("CAT_ID3") & "&Cat2QS=" & Cat2("CAT_ID2") & "&Cat1QS=" & Cat1QS)%>"><%=Cat3("CAT3")%></a></td>
							<%Else%>
							  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#00CC00">>></font>&nbsp;<a class="Texto_azul" href="<%=txt.href("?OP=ListaProdutos&Cat3QS=" & Cat3("CAT_ID3") & "&Cat2QS=" & Cat2("CAT_ID2") & "&Cat1QS=" & Cat1QS)%>"><%=Cat3("CAT3")%></a></td>
							<%End if%>
					</tr>
					<%Cat3.MoveNext%>
					<%Loop%>
					<%Cat3.Close%>
				<%end if%>
			<%Cat2.MoveNext%>
			<%Loop%>
			<%Cat2.Close%>
	    <%end if%>
	<%Cat1.MoveNext%>
	<%Loop%>
	<%Cat1.Close%>
</table>
<%
	Set Cat1=Nothing
	Set Cat2=Nothing
	Set Cat3=Nothing
%>