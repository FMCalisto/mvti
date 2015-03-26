<%
Dim MySQL : MySQL=""

Dim Menu(6,2)

Menu(0,1)="Nada para listar"
Menu(1,1)="Artigos listados."
Menu(2,1)="Titulo"
Menu(3,1)="Data"
Menu(4,1)="Activo"
Menu(5,1)="Apagar"
Menu(6,1)="Lista de Novidades."

Menu(0,2)="Nada para mostrar"
Menu(1,2)="Artículos en lista."
Menu(2,2)="Título"
Menu(3,2)="Fecha"
Menu(4,2)="Activo"
Menu(5,2)="Cancelar"
Menu(6,2)="Lista de Novedades."


MySQL="select Novidades.*,WN_ListaProdutosT.Descricao From Novidades inner join WN_ListaProdutosT on WN_ListaProdutosT.referencia=Novidades.referencia and WN_ListaProdutosT.tipo=Novidades.tipo  where Novidades.tipo='" & Session("Tipo") & "' order by Quando Desc;"
%>
<link href="../Backoffice.css" rel="stylesheet" type="text/css">
<table width="650" border="0" cellpadding="0" cellspacing="0" class="texto">
  <tr align="center" valign="middle">
    <td height="55" colspan="3" valign="middle" class="titulos_laranja"><p><%=Menu(6,Session("Lingua"))%></p></td>
  </tr>
  <tr align="center">
    <td valign="center"><%=Menu(2,Session("Lingua"))%></td>
    <td valign="center"><%=Menu(3,Session("Lingua"))%></td>
    <td valign="center"><%=Menu(4,Session("Lingua"))%></td>
  </tr>
  <tr>
  	<td colspan="3"><hr></td>
  </tr>
 <%RS.open MySQL,ConnObj,1
 if rs.eof Then
 	%>
  <tr align="center" valign="middle">
    <td colspan="3"><%=Menu(0,Session("Lingua"))%><br></td>
  </tr>
	<%
 Else
 Do While Not rs.eof%>
  <tr valign="middle">
    <td valign="center"><a href="Ficha_Novidade.asp?Referencia=<%=RS("NovidadeID")%>">&nbsp;&nbsp;<%=left(rs("Descricao"),80)%>(...)</a></td>
    <td valign="center" align="right"><%=Left(rs("Quando"),9)%></td>
    <td valign="center"><a title="Activa/Desactiva Artigo" href="/WebAdmin/Includes/inc_Ficha_Novidade_Run.asp?NovidadeID=<%=RS("NovidadeID")%>&Activa=<%=rs("Activa")%>"><%=DesenhaActivo(rs("Activa"))%></a></td>
  </tr>
 <%
 	Rs.MoveNext
	Loop
  %>
  <tr>
  	<td colspan="3"><hr></td>
  </tr>
  <tr>
	<td colspan="3"><div align="center"><%=Rs.RecordCount%>&nbsp;<%=Menu(1,Session("Lingua"))%></div></td>
  </tr>
  <%
 End if
 RS.Close%>
</table>
