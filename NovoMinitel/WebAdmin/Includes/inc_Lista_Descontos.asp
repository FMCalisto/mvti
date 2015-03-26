<link href="/includes/minitel.css" rel="stylesheet" type="text/css">
<%
MySQL="SELECT IDDescontos,Desconto,DataInicio,DataFim,Codigo,Ref,Design,Hits,QuemColocou,dbo.Get_DesenhoByStatus(Activo) as ActivoTXT FROM WebSiteMINITEL.dbo.WN_TDescontos order by activo,IDDescontos;"
Set ListaProdutos=db.query(cstr(MySQL))
%>
<table width="650" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita" align="center">
<tr align="center">
   <td height="38" valign="middle" class="Titulo_laranja"><strong>Lista de descontos </strong></td>
</tr>
<tr>
	<td>
		<table bgcolor="#E7E9FE" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" class="lista_produtos_direita" border="1" width="100%">
			<tr align="center" class="Texto_branco" bgcolor="#82B7F2">
				<td>Ref</td>
				<td>Design</td>
				<td>Desconto %</td>
				<td>Data Inicio</td>
				<td>Data Fim</td>
				<td>Codigo</td>
				<td>Hits</td>
				<td align="center">Des/Activo</td>
			</tr>
			<%If ListaProdutos.Eof Then%>
				<tr>
				   <td colspan="8" valign="middle" class="Titulo_laranja" align="center"><strong>Não ha produtos pra listar.</strong></td											
				</tr>
			<%else%>
				<%Do While not ListaProdutos.Eof%>
<tr align="left" class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F3F3F3'" onMouseOut="this.style.backgroundColor = '#E7E9FE'" bgcolor="">
						<td align="left"><%=ListaProdutos("Ref")%></td>
						<td align="left"><%=ListaProdutos("Design")%></td>
						<td align="center"><%=ListaProdutos("Desconto")%></td>
						<td align="center"><%=ListaProdutos("DataInicio")%></td>
						<td align="center"><%=ListaProdutos("DataFim")%></td>
						<td align="center"><%=ListaProdutos("Codigo")%></td>
						<td align="center"><%=ListaProdutos("Hits")%></td>
						<td align="center">
							<a href="/webadmin/includes/DO_Descontos_RUN.asp?OP=STATUS&ID=<%=ListaProdutos("IDDescontos")%>">
							<img src="<%=ListaProdutos("ActivoTXT")%>" border="0" />
							</a>
						</td>
					</tr>
				<%ListaProdutos.MoveNext : Loop : ListaProdutos.close : set ListaProdutos=nothing%>
			<%End if%>
			<form method="post" action="/webadmin/includes/DO_Descontos_RUN.asp">
			<tr align="center">
				<td><input type="text" value="" name="Ref" size="10" maxlength="18"  id="Ref"/></td>
				<td>&nbsp;</td>
				<td><input type="text" value="" name="Desconto" size="2" maxlength="2"  id="Desconto"/></td>
				<td><input type="text" value="" name="DataInicio" size="10" maxlength="10"  id="DataInicio"/></td>
				<td><input type="text" value="" name="DataFim" size="10" maxlength="10"  id="DataFim"/></td>
				<td><input type="text" value="" name="Codigo" size="10" maxlength="25"  id="Codigo"/></td>
				<td colspan="2" align="center"><input type="image" src="/images/b_actualiza.gif" value="1" name="Grava" id="Grava"/></td>
			</tr>
			<input type="hidden" name="OP" value="NOVALINHA" />
			</form>
		</table>
	</td>
</tr>	
</table>
<%Set Clientes=Nothing%>