<%
Dim MySQL : MySQL=""
Dim Condicao : Condicao=""

Dim Menu(12,2)

Menu(1,1)="Ficha do Artigo de imprensa."
Menu(2,1)="Não ha registos"
Menu(3,1)="Referência : "
Menu(4,1)="Alterado em : "
Menu(5,1)="Nome do produto : "
Menu(6,1)="Nome da revista : "
Menu(7,1)="Titulo na revista : "
Menu(8,1)="PDF do artigo :"
Menu(9,1)="Gravar o nome do PDF sempre com a referência do produto."
Menu(10,1)="Activo"
Menu(11,1)="Inactivo"
Menu(12,1)="Gravar dados"


Menu(1,2)="Ficha del Artículo en Prensa."
Menu(2,2)="Noy hay registros"
Menu(3,2)="Referencia : "
Menu(4,2)="Alterado en : "
Menu(5,2)="Nombre del producto : "
Menu(6,2)="Nombre de la revista : "
Menu(7,2)="Título en la revista : "
Menu(8,2)="PDF del artículo :"
Menu(9,2)="Grabar el nombre del PDF siempre con la referencia del producto."
Menu(10,2)="Activo"
Menu(11,2)="Inactivo"
Menu(12,2)="Grabar datos"

Condicao="ArtigoID='" & Trim(Request.QueryString("ArtigoID")) & "';"
MySQL="select ArtigosImprensa.*,WN_ListaProdutosT.Descricao,WN_ListaProdutosT.Imagem,WN_ListaProdutosT.Marca,WN_ListaProdutosT.Categoria from ArtigosImprensa inner join WN_ListaProdutosT on WN_ListaProdutosT.Referencia=ArtigosImprensa.referencia and WN_ListaProdutosT.Tipo='" & Session("Tipo") & "' where " & condicao
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
<form action="/WebAdmin/Includes/inc_Ficha_Artigo_RUN.asp" method="post">
<input type="hidden" name="ArtigoID" value="<%=Trim(Request.QueryString("ArtigoID"))%>">
<table width="650" border="0" cellpadding="0" cellspacing="0" class="texto">
	  <!--DWLayoutTable-->
	  <tr valign="middle" align="center">
	  	<td width="121" height="24" valign="middle">
			<div align="right"><strong><%=Menu(3,Session("Lingua"))%></strong> </div></td>
		<td width="196"><div align="left">
		  <input name="Referencia" type="text" class="titulos" value="<%=trim(rs("Referencia"))%>">
	    </div></td>
	    <td width="192" valign="middle"><strong><%=Menu(4,Session("Lingua"))%></strong><br><%=RS("Quando")%></td>
		<td colspan="2"><a target="_blank" href="/ProdutoFicha.asp?Ref=<%=trim(Rs("Referencia"))%>&Marca=<%=trim(Rs("Marca"))%>&Categoria=<%=trim(Rs("Categoria"))%>"><img alt="Carrega na imagem para ir para a ficha on-line do produto" border="0" src="<%=Rs("Imagem")%>" width="70"></a></td>
      </tr>
	  <tr valign="middle" align="center">
	    <td align="center" valign="middle"><div align="right"><strong><%=Menu(5,Session("Lingua"))%></strong></div></td>
	    <td colspan="4" valign="middle"><p align="left"><br><%=trim(Rs("Descricao"))%><br><br></p></td>
      </tr>
	  <tr valign="middle" align="center">
	    <td valign="middle"><div align="right"><strong><%=Menu(6,Session("Lingua"))%></strong></div></td>
	    <td colspan="4" align="left" valign="top">
	      <br>
	      <input name="NomeRevista" type="text" class="titulos" value="<%=Trim(Rs("NomeRevista"))%>" size="80">
	      <br>
	      <br>
        </td>
      </tr>
	  <tr valign="middle" align="center">
	    <td height="47" rowspan="2" valign="middle"><div align="right"><strong><%=Menu(7,Session("Lingua"))%></strong></div></td>
	    <td colspan="2" rowspan="2" valign="middle">
	      <div align="left"><br>
            <input name="TituloArtigo" type="text" class="titulos" value="<%=trim(Rs("TituloArtigo"))%>" size="50">          
            <br>
            <br>
          </div></td>
	    <td width="103" bgcolor="#FF3333"><%=Menu(11,Session("Lingua"))%></td>
	    <td width="38"><%=radio2("","Activa",rs("Activa"),False)%></td>
	  </tr>
	  <tr valign="middle" align="center">
	    <td  bgcolor="#00CC99"><%=Menu(10,Session("Lingua"))%></td>
        <td><%=radio2("","Activa",rs("Activa"),True)%></td>
	  </tr>
<!--  <tr valign="middle" align="center">
	    <td height="24" align="center" valign="middle"><div align="right"><strong><br><%=Menu(8,Session("Lingua"))%></strong></div></td>
	    <td colspan="4" valign="top">
	      <div align="left"><br>
	        <%
		  	'Dim PDF : PDF=""
			'If ExisteFicheiro("\PDF_Documentos\" & trim(rs("Referencia")) & ".pdf") Then 
			'	Pdf=trim(rs("Referencia")) & ".pfd"
			'Else
			'	Pdf="N/A"
			'End if
		    'response.Write(Pdf)
			%>
			<input name="PDF" type="file" class="titulos" size="50">
	      </div>
		</td>
      </tr>
	  <tr bgcolor="#FFCC00">
	    <td height="20" colspan="5">
          <div align="center"><font color="#FF0000"><b><%=Menu(9,Session("Lingua"))%></b></font>
        </div></td>
      </tr>
-->
	  <tr>
	    <td colspan="5" align="center">
	        <p><br><br><input name="Submit" type="submit" class="titulos" value="<%=Menu(12,Session("Lingua"))%>"></p>
		</td>
      </tr>
  </table>
</form>
<%End if
Rs.close%>
