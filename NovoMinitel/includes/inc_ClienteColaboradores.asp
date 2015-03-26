<script language="javascript">
function validamail_novo()
{
	var Email=document.formulario_novo.email.value;

	if (Email=='')
		return true;
	else
		{
		if (Email.match(/\b(^(\S+@).+((\.com)|(\.net)|(\.edu)|(\.mil)|(\.gov)|(\.org)|(\..{2,2}))$)\b/gi)!=null)
		{return true;}
		else
		{	if (Email!='')
			{
				alert('O endereço de e-mail é inválido.');
				return false;
			}
		}
	}
	return true;
}

function validamail_sub(pos)
{
	var Email=document.formulario[pos].email.value;

	if (Email=='')
		return true;
	else
		{
		if (Email.match(/\b(^(\S+@).+((\.com)|(\.net)|(\.edu)|(\.mil)|(\.gov)|(\.org)|(\..{2,2}))$)\b/gi)!=null)
		{return true;}
		else
		{	if (Email!='')
			{
				alert('O endereço de e-mail é inválido.');
				return false;
			}
		}
	}
	return true;
}

function vcolaborador(pos)
{
	var saida=false;
	var erro=false;		

	if (document.formulario[pos].ColaboradorPassword.value=='' && erro==false)
		{
			alert('A Password é um campo obrigatório !');
			saida=false;
			erro=true;
		}
	
	if (document.formulario[pos].email.value=='' && erro==false)
		{
		alert('O E-mail é um campo obrigatório !');
		saida=false;
		erro=true;
		}
	else
		{	if (document.formulario[pos].email.value!='')
			{saida=validamail_sub(pos);}
		}

	return saida;
}

function vcolaborador_novo()
{
	var saida=false;
	var erro=false;		
	if (document.formulario_novo.ColaboradorNome.value=='' && erro==false)
		{
			alert('O Nome é um campo obrigatório !');
			saida=false;
			erro=true;
		}
	
	if (document.formulario_novo.ColaboradorUser.value=='' && erro==false)
		{
			alert('O Código de Utilizador é um campo obrigatório !');
			saida=false;
			erro=true;
		}

	if (document.formulario_novo.ColaboradorPassword.value=='' && erro==false)
		{
			alert('A Password é um campo obrigatório !');
			saida=false;
			erro=true;
		}
	
	if (document.formulario_novo.email.value=='' && erro==false)
		{
		alert('O E-mail é um campo obrigatório !');
		saida=false;
		erro=true;
		}
	else
		{	if (document.formulario_novo.email.value!='')
			{saida=validamail_novo();}
		}

	return saida;
}

function limpaformulario()
{
  if (confirm("Tem a certeza que pretende limpar o conteudo dos campos para preenchimento ?"))
   {
      document.formulario_novo.reset();
   }
  return true;
}

</script>
<%
	If isempty(Session("NO")) Then response.Redirect("/index.asp")
	MySQL="SELECT Clientes_ColaboradoresID,ColaboradorNome,UltimoAcesso,TotalAcessos  FROM [WebSiteMINITEL].[dbo].[WN_Clientes_Colaboradores] WHERE (no = " & Session("NO") & ") order by ColaboradorNome Asc "
	Set Clientes=db.query(cstr(MySQL))
%>
<link href="Minitel.css" rel="stylesheet" type="text/css" />

<table width="100%" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
	<tr>
		<td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="lista_produtos_direita">
		 <tr>
		   <td height="38" valign="middle" class="Titulo_laranja"><strong>Colaboradores da Empresa</strong></td>
		 </tr>
		 </table>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="lista_produtos_direita">
		 <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#81B9D1">
		   <td width="5%">&nbsp;</td>
		   <td width="35%" align="center"><strong>Nome</strong></td>
		   <td width="30%" align="center"><strong>Ultimo acesso</strong></td>
		   <td width="30%" align="center"><strong>Quantos acessos</strong></td>
		 </tr>
		<%If Clientes.Eof Then%>
		 <tr>
		   <td height="38" colspan="4" valign="middle" class="Titulo_laranja" align="center"><strong>N&atilde;o ha registos.</strong></td>
		 </tr>
		 <%Else%>
		 	<%AInt=0%>
			<%Do while not Clientes.Eof%>
			<tr class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F3F3F3'" onMouseOut="this.style.backgroundColor = '#E7E9FE'" bgcolor="#F3F3F3">
			   <td align="center"><a href="#" onClick="shoh('first<%=trim(Clientes("Clientes_ColaboradoresID"))%>');" style="text-decoration:none"><b>[+]</b></a></td>
			   <td align="center"><strong><%=Clientes("ColaboradorNome")%></strong></td>
			   <td align="center"><strong><%=Clientes("UltimoAcesso")%></strong></td>
			   <td align="center"><strong><%=Clientes("TotalAcessos")%></strong></td>
			 </tr>
			 <tr>
			 	<td colspan="4" style="display:none" id="first<%=trim(Clientes("Clientes_ColaboradoresID"))%>">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<%
							MySQL="SELECT * FROM WN_Clientes_Colaboradores WHERE  (Clientes_ColaboradoresID = '" & clientes("Clientes_ColaboradoresID") & "') "
							Set ListaProdutos=db.query(cstr(MySQL))
							Do while not ListaProdutos.Eof
						%>						
					<form action="/includes/inc_ClienteColaboradoresRUN.asp" method="post" name="formulario" id="formulario">
				   	    <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#996699">
							<td colspan="2" title="C&oacute;digo que o colaborador usa para se identificar">C&oacute;digo de Utilizador</td>
							<td colspan="2" title="Palavra-passe de acesso ao site">Password</td>
						</tr>
						<tr class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F0F3F0'" onMouseOut="this.style.backgroundColor = '#E0E9F0'" bgcolor="#F0F3F0">
							<td colspan="2" align="center"><%=ListaProdutos("ColaboradorUser")%></td>
							<td colspan="2" align="center"><input maxlength="10" size="15" type="password" name="ColaboradorPassword" id="ColaboradorPassword" value="<%=trim(ListaProdutos("ColaboradorPassword"))%>"></td>
						</tr>

				   	    <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#996699">
							<td colspan="2" title="Endere&ccedil;o de e-mail do colaborador">E-mail</td>
							<td colspan="2" title="Telefone/Telemovel de contacto">Telefone/Telemovel</td>
						</tr>

						<tr class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F0F3F0'" onMouseOut="this.style.backgroundColor = '#E0E9F0'" bgcolor="#F0F3F0">
							<td colspan="2" align="center"><input class="Texto" maxlength="100" size="25" type="text" name="email" id="email" value="<%=trim(ListaProdutos("ColaboradorEmail"))%>" /></td>
							<td colspan="2" align="center"><input class="Texto" maxlength="20" size="15" type="text" name="ColaboradorTelefone" value="<%=trim(ListaProdutos("ColaboradorTelefone"))%>" /></td>
						</tr>

				   	    <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#996699">
							<td title="Colocar produtos no cesto de compras">Encomendar</td>
							<td title="Submeter para encomenda os produtos no cesto">Submeter Enc.</td>
							<td title="Consultar produtos facturados">Consultar Fact.</td>
							<td title="Consultar encomendas pendentes">Consultar Enc.</td>
						</tr>
						<tr class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F0F3F0'" onMouseOut="this.style.backgroundColor = '#E0E9F0'" bgcolor="#F0F3F0">
							<td align="center"><%=txt.choose("checkbox","","EncherCesto",ListaProdutos("EncherCesto"),True)%></td>
							<td align="center"><%=txt.choose("checkbox","","SubmeterEncomenda",ListaProdutos("SubmeterEncomenda"),True)%></td>
							<td align="center"><%=txt.choose("checkbox","","ConsultarEncFacturada",ListaProdutos("ConsultarEncFacturada"),True)%></td>
							<td align="center"><%=txt.choose("checkbox","","ConsultarEncPendente",ListaProdutos("ConsultarEncPendente"),True)%></td>
						</tr>

				   	    <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#996699">
							<td  colspan="2" title="Apaga o registo ">Apagar</td>
							<td  colspan="2" title="Grava as altera&ccedil;&otilde;es efectuadas">Gravar</td>
						</tr>
				   	    <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#FFFFFF">
							<td  colspan="2" align="center"><input type="image" src="../images/apagar.gif" name="APAGAR" onClick="javascript:return confirm('Tem a certeza ?');"></td>
							<td  colspan="2" align="center"><input type="image" src="../images/b_actualiza.gif" name="GRAVAR" onclick="javascript:return vcolaborador(<%=AInt%>);"></td>
						</tr>
						<input type="hidden" name="Clientes_ColaboradoresID" value="<%=ListaProdutos("Clientes_ColaboradoresID")%>" />
						</form>
						<%ListaProdutos.MoveNext:AInt=AInt+1:Loop:ListaProdutos.Close:Set ListaProdutos=nothing%>
					</table>
				</td>
   		    </tr>
			<%Clientes.MoveNext:Loop:Clientes.Close%>
		 <%End if%>
		 </table>
<!--------------------------->
	 	</td>
	</tr>
</table>
<%Set Clientes=Nothing%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="middle" class="Texto_azul" bgcolor="#81B9D1">
		<td width="100%" align="left"><a href="#" onClick="shoh('NovoRegisto');" style="text-decoration:none"><span class="Texto_branco"><strong><b>[+]</b> Criar nova conta...</strong></span></a></td>
	</tr>
    <tr>
	 	<td style="display:none" id="NovoRegisto"> 
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<form action="/includes/inc_ClienteColaboradoresRUN.asp" method="post" name="formulario_novo" id="formulario">
				   	    <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#996699">
							<td colspan="2" title="Nome do utilizador">Nome</td>
							<td colspan="2" title="">&nbsp;</td>
						</tr>
						<tr class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F0F3F0'" onMouseOut="this.style.backgroundColor = '#E0E9F0'" bgcolor="#F0F3F0">
							<td colspan="2" align="center"><input class="Texto"  maxlength="50" size="25" type="text" name="ColaboradorNome" id="ColaboradorNome" value=""></td>
							<td colspan="2" title="">&nbsp;</td>
						</tr>

				   	    <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#996699">
							<td colspan="2" title="C&oacute;digo que o colaborador usa para se identificar">C&oacute;digo de Utilizador</td>
							<td colspan="2" title="Palavra-passe de acesso ao site">Password</td>
						</tr>
						<tr class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F0F3F0'" onMouseOut="this.style.backgroundColor = '#E0E9F0'" bgcolor="#F0F3F0">
							<td colspan="2" align="center"><input class="Texto"  maxlength="50" size="25" type="text" name="ColaboradorUser" id="ColaboradorUser" value=""></td>
							<td colspan="2" align="center"><input class="Texto"  maxlength="10" size="15" type="password" name="ColaboradorPassword" id="ColaboradorPassword" value=""></td>
						</tr>

				   	    <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#996699">
							<td colspan="2" title="Endere&ccedil;o de e-mail do colaborador">E-mail</td>
							<td colspan="2" title="Telefone/Telemovel de contacto">Telefone/Telemovel</td>
						</tr>

						<tr class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F0F3F0'" onMouseOut="this.style.backgroundColor = '#E0E9F0'" bgcolor="#F0F3F0">
							<td colspan="2" align="center"><input class="Texto" maxlength="100" size="25" type="text" name="email" id="email" value="" /></td>
							<td colspan="2" align="center"><input class="Texto" maxlength="20" size="15" type="text" name="ColaboradorTelefone" value="" /></td>
						</tr>
				   	    <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#996699">
							<td title="Colocar produtos no cesto de compras">Encomendar</td>
							<td title="Submeter para encomenda os produtos no cesto">Submeter Enc.</td>
							<td title="Consultar produtos facturados">Consultar Fact.</td>
							<td title="Consultar encomendas pendentes">Consultar Enc.</td>
						</tr>
						<tr class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F0F3F0'" onMouseOut="this.style.backgroundColor = '#E0E9F0'" bgcolor="#F0F3F0">
							<td align="center"><%=txt.choose("checkbox","","EncherCesto",False,True)%></td>
							<td align="center"><%=txt.choose("checkbox","","SubmeterEncomenda",False,True)%></td>																			
							<td align="center"><%=txt.choose("checkbox","","ConsultarEncFacturada",False,True)%></td>
							<td align="center"><%=txt.choose("checkbox","","ConsultarEncPendente",False,True)%></td>
						</tr>
				   	    <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#996699">
							<td  colspan="2" title="Apaga o registo ">Limpar campos do formul&aacute;rio </td>
							<td  colspan="2" title="Grava as altera&ccedil;&otilde;es efectuadas">Gravar</td>
						</tr>
				   	    <tr valign="middle" class="Texto_branco" align="center"  bgcolor="#FFFFFF">
							<td  colspan="2" align="center"><a href="#"><img name="APAGAR" onClick="javascript:return limpaformulario();"src="../images/apagar.gif" border="0" alt="Limpar campos..."/></a></td>
							<td  colspan="2" align="center"><input type="image" src="../images/b_actualiza.gif" name="ADICIONAR" onclick="javascript:return vcolaborador_novo();"></td>
						</tr>
						</form>
					</table>






		</td>
	</tr>
</table>