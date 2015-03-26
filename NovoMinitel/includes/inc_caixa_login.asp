<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <!--DWLayoutTable-->
<form action="/includes/DO_login_run.asp" method="post" name="form_login">
  <tr>
	<td width="206" height="18" align="center" valign="middle" class="Texto_azul"><strong class="Texto_castanho">Numero de cliente </strong></td>
	</tr>
<tr>
  <td height="27" align="center" valign="top" class="Texto"><input name="no" onClick="javascript:limpa_n()" type="text" class="Texto" id="<%=txt.e36("no")%>" value="Numero" size="10" maxlength="6"  align="middle"/>
  </td>
	  </tr>
<tr>
  <td height="18" align="center" valign="middle" class="Texto_castanho"><strong>Utilizador</strong></td>
	  </tr>
<tr>
  <td height="27" align="center" valign="middle">
	  <input onClick="javascript:limpa_c()" name="colaborador" type="text" class="Texto" id="<%=txt.e36("colaborador")%>" value="Admin" size="20" maxlength="20" />
  </td>
	  </tr>
<tr>
  <td height="18" align="center" valign="middle" class="Texto_castanho"><strong>Password</strong></td>
	  </tr>
<tr>
  <td height="27" align="center" valign="middle" class="Texto_azul">
	  <input name="password" type="password" class="Texto" id="<%=txt.e36("password")%>" size="20" maxlength="20" />
  </td>
	  </tr>
<tr>
  <td height="26" align="center" valign="middle">
	  <input name="Submit" type="submit" class="Texto" value="Submeter" onClick="return validalogin()" />
  </td>
  </tr>
	<tr>
	  <td height="18" align="center" valign="middle" class="Texto_azul"><p><a href="/?OP=RECPASS">Recuperar Password</a></p></td>
	</tr>
    	<tr>
	  <td height="23" align="center" valign="middle" class="Texto_azul">&nbsp;</td>
	</tr>
</form>
</table>