<%
Dim Condicao : Condicao=""
Dim DescricaoDoProduto : DescricaoDoProduto=""
Dim Referencia
Dim Menu(6,2)

Menu(1,1)="Ficha de descrição de produtos."
Menu(2,1)="Nada para listar"
Menu(3,1)="Referência :"
Menu(4,1)="Marca :"
Menu(5,1)="Designa&ccedil;&atilde;o PHC :"
Menu(6,1)="Importante: Formatar sempre a letra com as seguintes especificações: <br> Font: Verdana Size:1 Color: #666666 (cinzento)"

Menu(1,2)="Ficha de la descricción del producto."
Menu(2,2)="Nada en lista"
Menu(3,2)="Referencia :"
Menu(4,2)="Marca :"
Menu(5,2)="Descricción del PHC :"
Menu(6,2)="Importante: Formatar siempre la letra con las seguientes especificaciones: <br> Font: Verdana Size:1 Color: #666666 (Gris)"

Condicao="Ref='" & Request.QueryString("Referencia") & "'" 
MySQL="select ststamp,Ref,Descricao,Cat1,Fabricante,imagem,Descricao from WN_ListaProdutos where " & condicao
rs.open MySQL,ConnObj,1
%>
<link href="../Backoffice.css" rel="stylesheet" type="text/css">
<table width="650" border="0" cellpadding="0" cellspacing="0" class="texto">
  <tr align="center" valign="middle">
    <td height="55" valign="middle" class="titulos_laranja"><p><%=Menu(1,Session("Lingua"))%></p></td>
  </tr>
</table>
<%if rs.eof Then%>
	<table width="650" border="0" cellpadding="0" cellspacing="0" class="texto">
		<tr valign="middle" align="center">
			<td><div align="center"><br><%=Menu(2,Session("Lingua"))%><br></div></td>
		</tr>
	</table>
<%Else%>
	<table width="650" border="1" cellpadding="0" cellspacing="0" class="texto">
	  <tr valign="middle" align="center">
		<td><%=Menu(3,Session("Lingua"))%> <%=Rs("Ref")%></td>
		<td><%=Menu(4,Session("Lingua"))%> <%=Rs("Fabricante")%></td>
		<td>
			<a target="_blank" href="/?OP=FICHADEPRODUTO&ProdutoID=<%=Rs("STStamp")%>">
			<%=Rs("Imagem")%>
			</a>
		</td>
	  </tr>
	  <tr valign="middle" align="left">
	    <td colspan="3">
		<%If Session("TIPO")="P" Then%>
	      <blockquote>
	        <p><br><%=Menu(5,Session("Lingua"))%> <%=Trim(rs("Descricao"))%></p>
          </blockquote>
		<%End if%>
		<%If Session("TIPO")="E" Then%>
	      <br>
		  <Form action="/WebAdmin/Includes/inc_Ficha_DescricaoRUN.asp" method="post">
			<%=Menu(5,Session("Lingua"))%> <input  class="texto" type="text" name="Designacao" value="<%=Trim(rs("Descricao"))%>" maxlength="60" size="61">
			<input type="submit" name="Gravar" value="Gravar">
			<input type="hidden" name="Referencia" value="<%=trim(Rs("Referencia"))%>">
		  </form>
		  <br>
		  ATENÇÃO : A Alteração só é efectiva de 30 em 30 minutos !
		<%End if%>
	    </td>
      </tr>
	  <tr valign="middle" align="center">
	    <td colspan="3">
				<%Referencia=Trim(rs("ref"))%>
				<%DescricaoDoProduto=Trim(rs("descricao"))%>
				<!--#INCLUDE VIRTUAL="/WebAdmin/Editor/Default.Asp"-->
	    </td>
      </tr>
	  <tr bgcolor="#FFFF00">
	  	<td colspan="3" align="center"><div align="center"><font color="#FF0000"><b><%=Menu(6,Session("Lingua"))%></b></font></div></td>
	  </tr>
  </table>
  <%End if
Rs.close%>
