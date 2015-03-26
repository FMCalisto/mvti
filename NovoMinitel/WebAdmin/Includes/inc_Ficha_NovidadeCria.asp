<%

Dim KMenu(12,2)

KMenu(1,1)="Criação de uma Novidade."
KMenu(2,1)="Não ha registos"
KMenu(3,1)="Procurar "

KMenu(1,2)="Creacción de novedades."
KMenu(2,2)="No hay registros"
KMenu(3,2)="Buscar "

%>
<link href="../Backoffice.css" rel="stylesheet" type="text/css">
<table width="650" border="0" cellpadding="0" cellspacing="0" class="texto">
  <tr align="center" valign="middle">
    <td height="55" valign="middle" class="titulos_laranja"><p><%=KMenu(1,Session("Lingua"))%></p></td>
  </tr>
</table>
<%Function GetHeader%>
	<form action="/WebAdmin/Ficha_Novidade.asp?Referencia=NEW" method="post">
	<table width="650" border="0" cellpadding="0" cellspacing="0" class="texto">
		  <!--DWLayoutTable-->
		  <tr valign="middle" align="center">
			<td width="121" height="24" valign="middle">
				<div align="center"><strong><%=KMenu(3,Session("Lingua"))%></strong> </div></td>
			<td width="70">		  <div align="center">
			  <input name="Referencia" type="text" class="titulos" value="<%=Request.form("Referencia")%>">	    
			</div></td>
			<td width="71">          <div align="center">
			  <input name="Submit" type="submit" class="titulos" value="<%=KMenu(3,Session("Lingua"))%>">        
			</div></td>
		  </tr>
	  </table>
	  <input type="hidden" name="primeirapesquisa" value="10501699">
	</form>
<%End Function%>

<%if request.QueryString("Referencia")="NEW" Then
	Call GetHeader
End if%>

<%If request.Form("primeirapesquisa")="10501699" Then%>
<%
Dim StringX : StringX=""
Dim ConnObjX : Set ConnObjX=Server.CreateObject("ADODB.Connection")
Dim RsX : Set RsX=Server.CreateObject("ADODB.RecordSet")

	StringX=Trim(Request.form("Referencia"))
	
	ConnObjX.Open("Provider=SQLOLEDB;Server=SRVWEB;Uid=web;PWD=web;Database=WebMinitel;")
		StringX="Select referencia from Wn_ListaProdutosT where referencia='" & StringX & "' and Tipo='" & Session("Tipo") & "';"
		rsx.open (StringX),ConnObjX,1,1	
		If rsx.eof Then %>
			<table width="650" border="0" cellpadding="0" cellspacing="0" class="texto">
			  <tr align="center" valign="middle">
				<td height="55" valign="middle" class="titulos_laranja"><p><%=KMenu(2,Session("Lingua"))%></p></td>
			  </tr>
			</table>
		<%Else
			rsx.close
			StringX="Insert Novidades (Referencia,Tipo,Texto,Activa) Values ('" & Trim(Request.form("Referencia")) & "','" & Session("Tipo") & "','<p>Colocar texto</p>',0);"
'			response.Write(StringX) : Response.Flush()

			ConnObjX.execute(StringX)
				
			StringX="Select NovidadeID From Novidades where referencia='" & Trim(Request.form("Referencia")) & "' and Tipo='" & Session("Tipo") & "';"
			rsx.open (StringX),ConnObjX,1,1	
			rsx.movelast
			stringx=rsx("NovidadeID")
			rsx.close			
			ConnObjX.Close
			response.redirect ("/WebAdmin/Ficha_Novidade.asp?Referencia=" & stringx)
		End if
End if%>