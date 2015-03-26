<!-- INICIO : FuncoesMENU.asp -->
<%Function Separador%>
	<tr><td height="3"><!-- LINHA SEPARADOR--></td></tr>
<%End Function%>
<%Function AreaClientes%>
<%
	Dim T(10,2)
		T(1,1)="Produtos"
		T(2,1)="Promoções"
		T(3,1)="Novidades"
		T(4,1)="Artigos Imprensa"
		T(5,1)="Assistência Técnica"
		T(6,1)="Apoio a Clientes"
		T(7,1)="Eventos"

		T(1,2)="Productos"
		T(2,2)="Promociones"
		T(3,2)="Novedades"
		T(4,2)="Árticulos en Prensa"
		T(5,2)="Asistencia Técnica"
		T(6,2)="Apoyo a Clientes"
		T(7,2)="Eventos"
%>
        <tr>
          <td valign="top" class="Minitel">
			<img src="<%=GetImage("Aclientes.gif")%>" width="150" height="25">
		  </td>
        </tr>
        <tr>
          <td valign="top">
		  	<table width="100%">
			<tr>
			  <td><a href="/produtos.ASP" target="_self" class="Letra_Menu"><%=T(1,Session("Lingua"))%></a></td>
			</tr>
			<tr>
			  <td><a href="/Novidades.asp" target="_self" class="Letra_Menu"><%=T(3,Session("Lingua"))%></a></td>
   		    </tr>
			<tr>
			  <td><a href="/ArtigosImprensa.asp" target="_self" class="Letra_Menu"><%=T(4,Session("Lingua"))%></a></td>
   		    </tr>
			<tr>
			  <td><a href="/AssitenciaTecnica.asp" target="_self" class="Letra_Menu"><%=T(5,Session("Lingua"))%></a></td>
			</tr>
			<tr>
			  <td><a href="/ApoioClientes.ASP" target="_self" class="Letra_Menu"><%=T(6,Session("Lingua"))%></a></td>
			  </tr>
			<tr>
			  <td><a href="/eventos.asp" target="_self" class="Letra_Menu"><%=T(7,Session("Lingua"))%></a></td>
			</tr>
			</table>
		</td>
        </tr>
<%End Function%>
<!-- FIM : FuncoesMENU.asp -->
