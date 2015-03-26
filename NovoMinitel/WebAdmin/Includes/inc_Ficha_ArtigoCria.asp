<%

Dim KMenu(12,2)

KMenu(1,1)="Ficha do Artigo de imprensa."
KMenu(2,1)="Não ha registos"
KMenu(3,1)="Referência : "
KMenu(4,1)="Alterado em : "
KMenu(5,1)="Nome do produto : "
KMenu(6,1)="Nome da revista : "
KMenu(7,1)="Titulo na revista : "
KMenu(8,1)="PDF do artigo :"
KMenu(9,1)="Gravar o nome do PDF sempre com a referência do produto."
KMenu(10,1)="Activo"
KMenu(11,1)="Inactivo"
KMenu(12,1)="Gravar dados"


KMenu(1,2)="Ficha del Artículo de prensa."
KMenu(2,2)="No hay registros"
KMenu(3,2)="Referencia : "
KMenu(4,2)="Alterado en : "
KMenu(5,2)="Nombre del producto : "
KMenu(6,2)="Nombre de la revista : "
KMenu(7,2)="Título en la revista : "
KMenu(8,2)="PDF del artículo :"
KMenu(9,2)="Grabar el nombre del PDF siempre con la referencia del producto."
KMenu(10,2)="Activo"
KMenu(11,2)="Inactivo"
KMenu(12,2)="Grabar datos"

%>
<link href="../Backoffice.css" rel="stylesheet" type="text/css">
<table width="650" border="0" cellpadding="0" cellspacing="0" class="texto">
  <tr align="center" valign="middle">
    <td height="55" valign="middle" class="titulos_laranja"><p><%=KMenu(1,Session("Lingua"))%></p></td>
  </tr>
</table>
<form action="/WebAdmin/Includes/inc_Ficha_Artigo_RUN.asp" method="post">
<input type="hidden" name="ArtigoID" value="NEW">
<table width="650" border="0" cellpadding="0" cellspacing="0" class="texto">
	  <!--DWLayoutTable-->
	  <tr valign="middle" align="center">
	  	<td width="121" height="24" valign="middle">
			<div align="right"><strong><%=KMenu(3,Session("Lingua"))%></strong> </div></td>
		<td colspan="3"><div align="left">
		  <input name="Referencia" type="text" class="titulos" value="">
	    </div></td>
      </tr>
	  <tr valign="middle" align="center">
	    <td valign="middle"><div align="right"><strong><%=KMenu(6,Session("Lingua"))%></strong></div></td>
	    <td colspan="3" align="left" valign="top">
	      <br>
	      <input name="NomeRevista" type="text" class="titulos" size="80">
	      <br>
	      <br>
        </td>
      </tr>
	  <tr valign="middle" align="center">
	    <td height="47" rowspan="2" valign="middle"><div align="right"><strong><%=KMenu(7,Session("Lingua"))%></strong></div></td>
	    <td width="196" rowspan="2" valign="middle">
	      <div align="left"><br>
            <input name="TituloArtigo" type="text" class="titulos" size="50">
	      </div></td>
	    <td width="103" bgcolor="#FF3333"><div align="center"><%=KMenu(11,Session("Lingua"))%></div></td>
	    <td width="38"><%=radio2("","Activa",False,False)%></td>
	  </tr>
	  <tr valign="middle" align="center">
	    <td  bgcolor="#00CC99"><div align="center"><%=KMenu(10,Session("Lingua"))%></div></td>
        <td><%=radio2("","Activa",False,True)%></td>
	  </tr>
<!--  <tr valign="middle" align="center">
	    <td height="24" align="center" valign="middle"><div align="right"><strong><br><%=KMenu(8,Session("Lingua"))%></strong></div></td>
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
          <div align="center"><font color="#FF0000"><b><%=KMenu(9,Session("Lingua"))%></b></font>
        </div></td>
      </tr>
-->
	  <tr>
	    <td colspan="4" align="center">
	        <p><br><br><input name="Submit" type="submit" class="titulos" value="<%=KMenu(12,Session("Lingua"))%>"></p>
		</td>
      </tr>
  </table>
</form>
