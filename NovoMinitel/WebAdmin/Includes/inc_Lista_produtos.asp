<%

Dim MySQL2 : MySQL2=""
Dim Condicao : Condicao=""
Dim Parametros :Parametros=""
Dim Metodo: Metodo="" ' MARCA ; REFERENCIA ; COMPLETO
Dim R
Dim ValorDoParametro : ValorDoParametro=""

Dim ListaP(5,5) 
Dim Menu(9,2)


Menu(0,1)="Nada para listar"
Menu(1,1)="Listar produtos"
Menu(2,1)="Marcas"
Menu(3,1)="Referência"
Menu(4,1)="Titulo do produto"
Menu(5,1)="PDF"
Menu(6,1)="Texto"
Menu(7,1)="Foto"
Menu(8,1)="Produtos listados."
Menu(9,1)="Lista de produtos existentes no site."

Menu(0,2)="Nada para mostrar"
Menu(1,2)="Lista de productos"
Menu(2,2)="Marcas"
Menu(3,2)="Referencia"
Menu(4,2)="Nombre del producto"
Menu(5,2)="PDF"
Menu(6,2)="Texto"
Menu(7,2)="Foto"
Menu(8,2)="Productos en lista."
Menu(9,2)="Lista de productos existentes en el site."





'Texto
ListaP(1,1)="Todos"
ListaP(2,1)="Sem fotografia"
ListaP(3,1)="Sem descrição"
ListaP(4,1)="Completos"
ListaP(5,1)="INcompletos"

'Texto em espanhol
ListaP(1,2)="Todos"
ListaP(2,2)="Sin fotografia"
ListaP(3,2)="Sin descricion"
ListaP(4,2)="Completos"
ListaP(5,2)="INcompletos"

'Valor para o FORM
ListaP(1,3)="TODOS"
ListaP(2,3)="SEM FOTOGRAFIA"
ListaP(3,3)="SEM DESCRICAO"
ListaP(4,3)="COMPLETOS"
ListaP(5,3)="INCOMPLETOS"


'Seleccionado ou nao no form
ListaP(1,4)=""
ListaP(2,4)=""
ListaP(3,4)=""
ListaP(4,4)=""
ListaP(5,4)=""

	Metodo=Ucase(request.Form("Metodo")) 'Capturo o metodo da pesquisa utilizado
	Condicao=" Where 1=1 " ' Inicio a Condicao da QueryString
	Select case Metodo
		Case "FABRICANTEID"
			ValorDoParametro=Request.Form("FABRICANTEID")
			Condicao=Condicao & " AND FabricanteID=" & ValorDoParametro  
		Case "REFERENCIA"
			ValorDoParametro=request.Form("Referencia")
			Condicao=Condicao & " AND (Ref like '%" & ValorDoParametro & "%'" 
			Condicao=Condicao & " or Descricao like '%" & ValorDoParametro & "%')" 
		Case "COMPLETO"
			ValorDoParametro=request.Form("COMPLETO")
			'Vou activar a opção selecionada
			For r=1 to 5
				if ValorDoParametro=ListaP(r,3) Then ListaP(r,4)="Selected"
			Next 
			select case ValorDoParametro
				case "TODOS"
				case "SEM FOTOGRAFIA"
						Condicao=Condicao & " and imagem like '%NOIMG.JPG%'"
				case "SEM DESCRICAO"
						Condicao=Condicao & " and len(cast(Descricao as char(1)))=0"
				case "INCOMPLETOS"
						Condicao=Condicao & " and len(cast(Descricao as char(1)))=0 OR imagem like '%NOIMG.JPG%'"
				case "COMPLETOS"
						Condicao=Condicao & " and imagem<>'/IMG/semfoto.gif' and len(cast(Descricao as char(1)))>0"
			end Select
		end select

	if Metodo="" Then Condicao=Condicao & "and 1=2" 'Assim nao listo nada quando se entra pela 1ºvez
	MySQL2="select Imagem,Design,Descricao,Ref FROM WN_ListaProdutos " & Condicao & " order by Design"
%>
<link href="../Backoffice.css" rel="stylesheet" type="text/css">
<table width="650" border="0" cellpadding="0" cellspacing="0" class="texto">
  <tr align="center" valign="middle">
    <td height="55" colspan="10" valign="middle" class="titulos_laranja"><p><%=Menu(9,Session("Lingua"))%></p></td>
  </tr>
  <tr align="center" valign="middle">
    <td width="17" height="23">&nbsp;</td>
    <td width="168" valign="middle" class="titulos"><%=Menu(1,Session("Lingua"))%></td>
    <td width="130" align="center" valign="middle" class="titulos"><%=Menu(2,Session("Lingua"))%></td>
    <td width="66">&nbsp;</td>
    <td colspan="4" align="center" valign="middle" class="titulos"><%=Menu(3,Session("Lingua"))%></td>
    <td width="32">&nbsp;</td>
    <td width="58">&nbsp;</td>
  </tr>
  <tr align="center" valign="middle">
    <td height="24">&nbsp;</td>
    <td valign="top"><form name="form1" method="post" action="/WebAdmin/Lista_Produtos.asp">
        <div align="center">
          <select name="COMPLETO" onchange="this.form.submit();">
		    <%
			For r=1 to 5
				%>
		    <option <%=ListaP(r,4)%> value="<%=ListaP(r,3)%>"><%=ListaP(r,Session("Lingua"))%></option>
		    <%
			Next 'r
		%>
          </select>
          <input type="hidden" name="metodo" value="COMPLETO">
        </div>
    </form></td>
    <td valign="top">
	<form name="form1" method="post" action="/WebAdmin/Lista_Produtos.asp">
        <div align="center">
		<%=txt.combobox(txt.e36("FABRICANTEID"),txt.qsv("FABRICANTEID",request.form,1),"select distinct fabricante as DataOutTXT,FABRICANTEID as DataOutID From WN_Fabricante",1)%>
          <input type="hidden" name="metodo" value="FABRICANTEID">
        </div>
    </form></td>
    <td>&nbsp;</td>
    <form name="FormRef" method="post" action="/WebAdmin/Lista_Produtos.asp">
      <td colspan="2" valign="top"><div align="center">
        <input type="text" name="Referencia" value="<%=request.Form("Referencia")%>">
      </div></td>
      <td colspan="2" valign="top"><div align="center">
          <input type="image" src="/Images/Seta_Pesquisa.jpg" onClick="FormRef.Submit">
          <input type="hidden" name="metodo" value="REFERENCIA">
      </div></td>
    </form>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="middle" class="titulos"><%=Menu(3,Session("Lingua"))%></td>
    <td height="20" colspan="4" align="center" valign="middle" class="titulos"><%=Menu(4,Session("Lingua"))%></td>
    <td colspan="2" align="center" valign="middle" class="titulos"><%=Menu(5,Session("Lingua"))%></td>
    <td colspan="2" align="center" valign="middle" class="titulos"><%=Menu(6,Session("Lingua"))%></td>
    <td align="center" valign="middle" class="titulos"><%=Menu(7,Session("Lingua"))%></td>
  </tr>
  <tr align="center" valign="middle">
    <td height="10" colspan="10"><hr></td>
  </tr>

 <%RS.open MySQL2,ConnObj,1
 if rs.eof Then
 	%>
	  <tr>
		<td colspan="10"> <div align="center"><br><%=Menu(0,Session("Lingua"))%><br></div></td>
	  </tr>
	<%
 Else
 Do While Not rs.eof%>
  <tr>
  	<td><%=trim(rs("Ref"))%></td>
    <td height="20" colspan="4" align="left" valign="middle" class="texto">&nbsp;&nbsp;<a href="Ficha_Descricao.asp?Referencia=<%=trim(rs("Ref"))%>"><%=rs("Design")%></a> </td>
    <td colspan="2" align="center" valign="middle" class="texto">
		<div align="center"><%=DesenhaActivo(ExisteFicheiro("\PDF_Documentos\" & trim(rs("Ref")) & ".pdf"))%>
        </div></td>
    <td colspan="2" valign="center">
		<div align="center"><%=DesenhaActivo(trim(rs("Descricao"))<>"")%>
        </div></td>
    <td colspan="2" valign="center">
		<div align="center"><%=DesenhaActivo(instr(rs("Imagem"),"NOIMG")=0)%>
        </div></td>
  </tr>
 <%
 	Rs.MoveNext
	Loop
  %>
  <tr align="center" valign="middle">
    <td height="10" colspan="10"><hr></td>
  </tr>
  <tr>
	<td colspan="10"> <div align="center"><%=Rs.RecordCount%>&nbsp;<%=Menu(8,Session("Lingua"))%></div></td>
  </tr>
  <%
 End if
 RS.Close%>
</table>
