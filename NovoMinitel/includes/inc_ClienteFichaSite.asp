<%if session("NO")="" then response.Redirect("/includes/DO_logout_run.asp")%>
<form action="/includes/inc_ClienteFichaSiteRUN.asp" method="post" name="formulario">
<table width="95%" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
	<tr>
		<td>
<!--------------------------->
		<table width="100%" border="0" cellpadding="0" cellspacing="5" class="lista_produtos_direita">
		  <tr>
	          <td height="38"  valign="middle" class="Titulo_laranja"><strong>Dados de acesso
	              &agrave; &Agrave;rea de Revenda </strong></td>
		  </tr>
<!--
		  <tr>
          <td height="24"  valign="middle" class="Texto_castanho"><strong>Acesso ao site </strong></td>
		  </tr>
		  <tr>
          <td height="24"  valign="middle" class="Texto">Endere&ccedil;o de e-mail onde quer receber a password :
            <input type="text" name="<%'=txt.e36("EMAILDESTINO")%>" id="<%'=txt.e36("EMAILDESTINO")%>" class="Texto" value=""/></td>
		  </tr>
		  <tr>
            <td height="24" align="center"  valign="middle" ><input class="Texto"name="botao1" type="submit" id="botao1" value="Submeter" /></td>
		  </tr>
-->

		  <tr>
          <td height="24"  valign="middle" class="Texto_castanho"><strong>Alterar password</strong></td>
		  </tr>
		  <tr>
          <td height="24"  valign="middle" class="Texto">Password nova :
            <input name="<%=txt.e36("PASSNOVA")%>" type="password" class="Texto" id="<%=txt.e36("PASSNOVA")%>" value="" size="10" maxlength="10"/></td>
		</tr>
		  <tr>
          <td height="24"  valign="middle" class="Texto">Repetir Password nova :
            <input name="<%=txt.e36("PASSNOVA2")%>" type="password" class="Texto" id="<%=txt.e36("PASSNOVA2")%>" value="" size="10" maxlength="10"/></td>
		  <tr>
	          <td height="24"  valign="middle" class="Texto">A sua password foi alterada ha <%=db.query(cstr("SELECT datediff(day,QuandoAlterada,getdate()) DataOutTXT FROM WN_Clientes_Site where no=" & session("No")))("DataOutTXT")%> dias. </td>
		  </tr>
		  <tr>
            <td height="24" align="center"  valign="middle"><input name="botao2" type="submit" class="Texto" id="botao2" onclick="return alterapassword();" value="Submeter"/></td>
		  </tr>
		  <tr>
            <td height="24" align="center"  valign="middle">&nbsp;</td>
		  </tr>
		  <tr>
            <td height="24" align="center"  valign="middle">
			<%If request.QueryString("RES")="OK" Then%>
			<p class="Texto_azul">A password foi alterada com sucesso.</p>
			<%end if%>&nbsp;
			</td>
		  </tr>
		  <! -- #include file="inc_ClienteFichaSiteEmailAdiccional.asp"-->
		  </table>
<!--------------------------->
	  </td>
  </tr>
 </table>
</form>
