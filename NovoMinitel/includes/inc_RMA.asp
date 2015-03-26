<link href="/includes/MINITEL.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript">
function Disab()
{
	if(document.formulario2.concordo.checked) 
		 {document.formulario2.seguintexx.disabled=false}
	else
		{document.formulario2.seguintexx.disabled=true}
}

function IsNumeric(sText)
{
   var ValidChars = "0123456789";
   var IsNumber=true;
   var Char;

 
   for (i = 0; i < sText.length && IsNumber == true; i++) 
      { 
      Char = sText.charAt(i); 
      if (ValidChars.indexOf(Char) == -1) 
         {
         IsNumber = false;
         }
      }
   return IsNumber;
   
   }

function valButton(btn)
{ /*Verifica em todos os radio se algum esta seleccionado*/
	var cnt = -1;
	for (var i=btn.length-1; i > -1; i--) 
		{
			if (btn[i].checked) {cnt = i; i = -1;}
		}
	if (cnt > -1) 
	{return btn[cnt].value;}
	else 
	{return null;}
}
function preenchido(tipo)
{
	var saida=false;
	if (tipo==1)
	{
		if (formulario_p.nserie.value=='')
		{
			alert('Tem de preencher o Numero de Serie');
			return saida;
		}
		else
		{
			formulario_p.fno.value='';	
		}
	}
	if (tipo==2)
	{
		if (formulario_p.fno.value=='')
		{
			alert('Tem de preencher o Numero da Factura');
			return saida;
		}
		else
		{
			 if (IsNumeric(formulario_p.fno.value)) 
			{
				formulario_p.nserie.value='';
		    }
			else
			{
				alert('Factura com valor errado !');
				return saida;
			}
	
				
		}
	}
	if (tipo==3)
	{
		if (formularioX.x_ref.value=='')
		{
			alert('Tem de preencher Referência');
			return saida;
		}
		if (formularioX.x_serie.value=='')
		{
			alert('Tem de preencher o Numero de Serie');
			return saida;
		}
		if (formularioX.x_fno.value=='')
		{
			alert('Tem de preencher o Numero da Factura');
			return saida;
		}
		else
		{
			if (!IsNumeric(formularioX.x_fno.value)) 
			{
				alert('Factura com valor errado !');
				return saida;
			}
		}
	

		if (formularioX.x_data.value=='')
		{
			alert('Tem de preencher a Data da Factura');
			return saida;
		}
		else
		{
			return ValidateForm(formularioX.x_data);
		}

	}
	if (tipo==4)
	{

		if (formulario2.concordo.checked!=true)
		{
			alert('Tem de aceitar as condições de devolução!');
			return saida;
		}


		if (formulario2.MARCA.value=='')
		{
			alert('Qual a Marca ?');
			return saida;
		}


		if (formulario2.MODELO.value=='')
		{
			alert('Qual o Tipo de Modelo ?');
			return saida;
		}


		if (formulario2.TipoDocumento.value=='')
		{
			alert('Qual o Tipo de Documento ?');
			return saida;
		}
		if (formulario2.motivo.value=='')
		{
			alert('Tem de identificar o Motivo');
			return saida;
		}
		if (formulario2.sintoma.value=='')
		{
			alert('Qual o Sintoma da Avaria');
			return saida;
		}
	}

	if (tipo==5)
	{
		if (valButton(formulario5.escolhido) == null)
		{
			alert('Tem de escolher uma opção !');
			return saida;
		}
	}
}
</script>
<%
Dim TipoDocumento : TipoDocumento=txt.abstxt(Request.QueryString("TipoDocumento"))
Dim escolhido : escolhido=txt.abstxt(request.Form("escolhido"))
if instr(escolhido,"-LIXO")>0 Then ' o lixo entra por causa da verificacao dos radiobutton em que se acrescentou pelo menos 1 (lixo) para que a rotina de contagem funcione sempre
	escolhido=txt.ABSTxt(cstr(escolhido),len(escolhido)-7)
end if

Dim nserie : nserie=""
Dim fno : fno=""
	ABoo=False
If request.Form("pesquisa_S.x")<>"" or request.Form("nserie")<>"" Then
	nserie=txt.abstxt(request.Form("nserie"))
		MySQL="select * from openquery(SQLSRV_MIN,'SELECT mastamp,marca,modelo,Idade,fistamp,ref,design,serie,fno,fdata FROM [Min_PHC].[dbo].[WebSiteMINITEL_GetFacturaNSerie] (" & Session("NO") & ",-1,''" & nserie & "'')')"
End if

If request.Form("pesquisa_F.x")<>"" or request.Form("fno")<>"" Then
	fno=txt.abstxt(request.Form("fno"))
	if request.Form("x_fno")<>"" Then fno=txt.abstxt(request.Form("x_fno"))
	if isnumeric(fno) Then
		MySQL="select * from openquery(SQLSRV_MIN,'SELECT  mastamp,marca,modelo,Idade,fistamp,ref,design,serie,fno,fdata FROM [Min_PHC].[dbo].[WebSiteMINITEL_GetFacturaNSerie] (" & Session("NO") & "," & fno & ",''-1'')')"
	Else
		MySQL="select * from openquery(SQLSRV_MIN,'select  mastamp,marca,modelo,Idade,fistamp,ref,design,serie,fno,fdata from WebSiteMINITEL_GetFacturaNSerie (1,1,'NUMERO MAL PASSADO')"
	End if
End if

If nserie="" Then nserie=txt.abstxt(request.Form("x_serie"))


%>
<br />
<table width="99%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
	<tr align="center">
		<td height="23" colspan="4" bgcolor="#E06D76" class="Texto_branco">Reparações de Equipamento</td>
	</tr>
	<tr align="center">
		<td height="2" colspan="4" bgcolor="#FFFFFF" class="Texto_branco"></td>
	</tr>
	<tr align="center"><td height="23" colspan="4" bgcolor="#E06D76" class="Texto_branco">Dados do Equipamento</td>
	</tr>
	<form action="/?OP=RMA" method="post" name="formulario_p" id="formulario_p">
	<tr align="center">
		<td width="25%" align="center" class="Texto">N&uacute;mero de Serie : </td>
	  <td width="25%" align="center"><input name="nserie" type="text" class="Texto" id="nserie" onkeypress="javascript:formulario_p.fno.value='';" value="<%=nserie%>" size="10"/></td>
	  <td width="25%" height="23"><span class="Texto">N&uacute;mero da Factura :</span></td>
	  <td width="25%" align="center"><input name="fno" type="text" class="Texto" id="fno"  onkeypress="javascript:formulario_p.nserie.value='';" value="<%=fno%>" size="4" maxlength="6"/></td>
	</tr>
	<tr align="center">
	  <td align="center" class="Texto">&nbsp;</td>
	  <td><input  name="pesquisa_S" type="image" id="pesquisa_S" src="../images/lupa.gif" alt="Pesquisa por n&uacute;meros de s&eacute;rie" onclick="javascript:return preenchido(1)"/></td>
	  <td height="23">&nbsp;</td>
	  <td align="center"><input  name="pesquisa_F" type="image" id="pesquisa_F" src="../images/lupa.gif" alt="Pesquisa por n&uacute;mero de Factura" onclick="javascript:return preenchido(2)"/></td>
	  </tr>
	</form>
</table>
<!-- RESULTAADO DA PESQUISA POR NumeroFactura -->
<br />
<table width="99%" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center" style="te">
	<tr align="center">
		<td height="23" colspan="6" bgcolor="#E06D76" class="Texto_branco">Resultado da pesquisa</td>
	</tr>
	<tr>
	  <td width="13%" align="center" bgcolor="#E06D76" class="Titulo_branco">Refer&ecirc;ncia</td>
	  <td width="43%" align="center" bgcolor="#E06D76" class="Titulo_branco">Descri&ccedil;&atilde;o</td>
	  <td width="17%" align="center" bgcolor="#E06D76" class="Titulo_branco">Nº Serie</td>
	  <td width="10%" align="center" bgcolor="#E06D76" class="Titulo_branco">N&ordm; Fact.</td>
	  <td width="10%" align="center" bgcolor="#E06D76" class="Titulo_branco">Data</td>
	  <td width="7%" align="center" bgcolor="#E06D76" class="Titulo_branco">&nbsp;</td>
 	</tr>
	<%if nserie+fno<>"" Then%>
			<%
			Set ListaProdutos=db.query(cstr(MySQL))
			If Not ListaProdutos.EOF Then
			ABoo=True
			%>
			<form action="/?OP=RMA" method="POST" name="formulario5" id="formulario5">
				<%Do While Not ListaProdutos.EOF%>
				<tr>
				  <td nowrap="nowrap" width="13%" align="center" class="Texto"><%=ListaProdutos("Ref")%></td>
				  <td nowrap="nowrap" width="43%" align="center" class="Texto"><%=left(ListaProdutos("Design"),20)%>...</td>
				  <td nowrap="nowrap" width="17%" align="center" class="Texto"><%=ListaProdutos("serie")%></td>
				  <td nowrap="nowrap" width="10%" align="center" class="Texto"><%=ListaProdutos("fno")%></td>
				  <td nowrap="nowrap" width="10%" align="center" class="Texto"><%=ListaProdutos("fdata")%></td>
				  <td nowrap="nowrap" width="07%" align="center" class="Texto">
				  	<%=txt.choose("Radio","","escolhido",cstr(escolhido),trim(ListaProdutos("mastamp"))&"«"&trim(ListaProdutos("serie"))&"»"&trim(ListaProdutos("fistamp")))%>
				  </td>
				</tr>
				<%ListaProdutos.MoveNext:Loop:ListaProdutos.Close%>
				<%if escolhido="" Then%>
				<tr>
					<td  align="center" height="23" colspan="2" class="Texto_castanho">Seleccione o produto a reparar </td>
					<td  align="right" height="23" colspan="4" class="Texto_castanho">
					<input type="image" src="../images/b_passo_seguinte.gif" alt="Seguinte" onclick="javascript:return preenchido(5)"/></td>
				</tr>
				<%END IF%>
				<input name="nserie" type="hidden" value="<%=nserie%>"/>
	  			<input name="fno" type="hidden" value="<%=fno%>"/>
			  	<input type="hidden" name="escolhido" value="-LIXO" />
				</form>
			<%Else%>
			<form action="/?OP=RMA" method="POST" name="formularioX" id="formularioX">
				<tr align="center">
					<td height="23" colspan="6" class="Texto_castanho">
						Não encontrei o registo procurado...<br />Qualquer questão, contacte o seu comercial.
					</td>
				</tr>
					<input type="hidden" name="fno" value="10501699" /> 
				</form>
			<%End if%>
	<%Else%>
	<tr align="center">
		<td height="23" colspan="6" class="Texto_castanho">Ainda não submeteu qualquer pesquisa...</td>
	</tr>
	<%End if%>
</table>
<!-- FIM DO RESULTADO -->
<%
If escolhido<>"" Then
	Dim Kescolhido
	if instr(escolhido,"»")>0 Then
			Kescolhido=mid(escolhido,instr(escolhido,"»")+1,len(escolhido))
	End if
	MySQL="select * from openquery(SQLSRV_MIN,'SELECT datediff(day,fdata,getdate()) as DiffDay,Marca,Modelo,Idade,fistamp FROM [Min_PHC].[dbo].[WebSiteMINITEL_GetFacturaNSerie] (" & Session("NO") & ",-1,''-1'')') where fistamp='" & Kescolhido & "';"

	Set ListaProdutos=db.query(cstr(MySQL))
	ATxt=""
	MySQL="select * From Get_MenuOP(1) order by DataOutTXT"
	if not ListaProdutos.eof then
		CTXT=ListaProdutos("Marca")
		DTXT=ListaProdutos("Modelo")
		AINT=cint(ListaProdutos("DiffDay"))
		If cint(ListaProdutos("Idade"))>15 Then
			MySQL="select * From Get_MenuOP(1) where DataOutTXT<>'D.O.A.' order by DataOutTXT"
		end if
	Else
		CTXT=""
		DTXT=""
		AINT=-1
		if datediff("d",request.Form("x_data"),now())>15 Then
			MySQL="select * From Get_MenuOP(1) where DataOutTXT<>'D.O.A.' order by DataOutTXT"
		end if
	End if
%>
	<br />
	<form id="formulario2" name="formulario2" method="post" action="/includes/inc_RMARUN.asp">
	<table width="99%" border="0" cellpadding="5" cellspacing="0" bgcolor="#FFFFFF" align="center">

		<%if AINT>=731 Then%>
		<!--REM PROCESSO PEDIDO POR RUI MARTINHO a 26/Setembro/2008 FSantos 16/11/2008-->
		<tr align="center">
			<td height="23" colspan="3" bgcolor="#E06D76" class="Texto_branco">
				Atenção ! O equipamente tem mais de 2 Anos. Está fora de garantia !
			</td>
		</tr>
		<%end if%>

		<tr>
			<td width="19%" align="center" bgcolor="#E06D76" class="Texto_branco">Documento : </td>
			<td width="37%" height="75%" align="left" class="Texto_castanho"><%=txt.ComboBox_FxJAVA("","TipoDocumento",Cstr(TipoDocumento),cstr(MySQL))%></td>
			<td width="44%" rowspan="7" valign="top" class="Texto_Top2"><span class="Titulo_laranja">D.O.A. :</span> Quando a avaria se manifestou nos primeiros 15 dias a contar da data da factura.<br />
			  <br />
			  <span class="Titulo_laranja">Devolu&ccedil;&atilde;o :</span> Quando pretende devolver o produto por motivos comerciais (<span class="Titulo_laranja">sujeito a aprova&ccedil;&atilde;o</span>).<br />
		      <br />
	          <span class="Titulo_laranja">Repara&ccedil;&atilde;o :</span> Quando pretenda enviar um produto avariado para ser reparado.</td>
		</tr>

		<tr>
			<td width="19%" align="center" bgcolor="#E06D76" class="Texto_branco">Marca :</td>
			<td width="37%" height="75%" align="left" class="Texto_castanho"><span class="Texto"><%=txt.ComboBox_FxJAVA("","MARCA",cstr(CTXT),"select distinct fabricante as DataOutTXT,fabricante as DataOutID From WN_Fabricante")%></span></td>
		</tr>
		<tr>
			<td width="19%" align="center" bgcolor="#E06D76" class="Texto_branco">Modelo :</td>
			<td width="37%" height="75%" align="left" class="Texto_castanho"><span class="Texto"><input name="MODELO" type="text" class="Texto" id="MODELO" value="<%=cstr(DTXT)%>" size="25" maxlength="20"/>
			</span></td>
		</tr>
		<tr>
			<td width="19%" align="center" bgcolor="#E06D76" class="Texto_branco">V/Refer&ecirc;ncia :</td>
			<td width="37%" height="75%" align="left" class="Texto_castanho"><span class="Texto">
		<input name="VREF" type="text" class="Texto" id="VREF" value="" size="47" maxlength="80"/>
				</span></td>
		</tr>
		<tr valign="middle">
			<td align="center" bgcolor="#E06D76" class="Titulo_branco">Motivo da devolução :</td>
			<td width="37%" height="75%" align="left">
		  <textarea name="motivo" cols="50" rows="3" class="Texto" id="motivo"></textarea>		  </td>
	    </tr>
		<tr valign="middle">
			<td align="center" bgcolor="#E06D76" class="Titulo_branco">Sintoma da avaria : </td>
			<td width="37%" height="75%" align="left">
		  <textarea name="sintoma" cols="50" rows="3" class="Texto" id="sintoma"></textarea>		  </td>
		</tr>
		<tr valign="middle">
			<td align="center" bgcolor="#E06D76" class="Titulo_branco">Contacto do cliente : </td>
			<td width="37%" height="75%" align="left">
		  <input name="contactodocliente" type="text"  class="Texto" id="contactodocliente" size="40" maxlength="100" value="<%=db.query(cstr("select (rtrim(contacto) + ' ' + rtrim(telefone)) as contactox from WN_Clientes where no=" & Session("NO")))("contactox")%>" /></td>
		</tr>
		<tr valign="middle">
			<td align="right" colspan="3">
				<table width="100%" cellpadding="10" cellspacing="10">
				<tr>
					<td class="Texto_castanho"><div align="center">Condi&ccedil;&otilde;es Gerais</div></td>
				</tr>
				<tr>
					<td><p class="Texto_azul">Se necessitar de enviar um produto para a MINITEL (repara&ccedil;&otilde;es dentro/ fora de garantia e devolu&ccedil;&otilde;es) dever&aacute; obter, primeiro, um n&uacute;mero de autoriza&ccedil;&atilde;o RMA, sem o qual n&atilde;o poderemos aceitar o seu envio. </p>
					  <p class="Texto_azul">A solicita&ccedil;&atilde;o de RMA ser&aacute; feita por fax/email atrav&eacute;s deste pedido, que dever&aacute; indicar o todos os dados acima mencionados, para o Departamento Comercial, o qual lhe enviar&aacute; por fax o seu n&uacute;mero de autoriza&ccedil;&atilde;o RMA </p>
					  <p class="Texto_azul">A autoriza&ccedil;&atilde;o de Envio RMA tem um prazo de validade de 7 dias, a contar da data de emiss&atilde;o  da mesma, findo o qual se considerar&aacute; nula caso n&atilde;o se recepcionem os respectivos produtos. O n&atilde;o cumprimento deste prazo implicar&aacute; solicitar nova autoriza&ccedil;&atilde;o RMA. </p>
					  <p> <span class="Texto_azul">  O produtos dever&atilde;o ser enviados/entregues nas condi&ccedil;&otilde;es descritas abaixo: <br />
&middot; O n&uacute;mero de devolu&ccedil;&atilde;o RMA atribu&iacute;do dever&aacute; estar claramente indicado no exterior da embalagem de envio. <br />
&middot; Sem o n&ordm; de RMA n&atilde;o poderemos aceitar quaisquer produtos que nos sejam enviados. <br />
&middot; A utiliza&ccedil;&atilde;o de transportadoras dever&aacute; ser efectuada na modalidade de portes pagos. <br />
&middot; S&atilde;o da responsabilidade do Cliente eventuais danos causados, pelo manuseamento ou embalagem incorrectos, durante o transporte, por si ou por terceiros. </span></p>
					  <p> <span class="Texto_azul">  Os produtos dever&atilde;o ser entregues na seguinte morada: <br />
				      Minitel, Lda <br />
				      Departamento de Servi&ccedil;o ao Cliente <br />
				      Travessa da L&eacute;gua da P&oacute;voa, 1 A <br />
				      1250-136 Lisboa <br />
                      <br />
                      Todo e qualquer equipamento deve ser devidamente testado antes de ser enviado &agrave; Minitel para repara&ccedil;&atilde;o, de forma a confirmar, ou n&atilde;o, a eventual avaria. Caso o equipamento seja enviado como estando avariado e n&atilde;o seja detectada, pelo nosso Departamento T&eacute;cnico, qualquer avaria ou defeito ser&aacute; cobrada uma taxa de &euro; 25 + IVA (dentro ou fora de garantia). A mesma taxa ser&aacute; aplicada para or&ccedil;amentos pedidos e n&atilde;o aceites. <br />
				      </span></p>
					  <p class="Texto_azul"> Qualquer devolu&ccedil;&atilde;o de Software s&oacute; ser&aacute; considerada caso a embalagem permane&ccedil;a inviolada. <br />
  A troca de produtos de Hardware s&oacute; ser&aacute; considerada se a embalagem (original) contiver todos os componentes originais. </p></td>
				</tr>
				<tr>
					<td class="Texto_azul"><div align="right">Li, e concordo com as Condi&ccedil;&otilde;es Gerais
				      <input type="checkbox" name="concordo" id="concordo">
			          <input type="image" src="../images/b_passo_seguinte.gif" alt="Seguinte" onclick="javascript:return preenchido(4)"  />			
				    </div></td>
				</tr>
				</table>
			</td>
		</tr>
	</table>
	<%
	for each item in request.Form
		if item="escolhido" Then
					if instr(escolhido,"-LIXO")<0 Then 
						escolhido=request.Form(ITEM)
					end if
			%><input type="hidden" name="escolhido" value="<%=escolhido%>" /><%
		else			
			%><input type="hidden" name="<%=ITEM%>" value="<%=request.Form(item)%>" /><%
		end if
	next
	%>
  </form>
<%End if%>
<br />
<br />
<%Set ListaProdutos=Db.query(cstr("select * from dbo.Get_RMAByNO(" & Session("NO") & ")"))%>
<!--#INCLUDE virtual="/includes/inc_RMA_LIST.asp"-->
