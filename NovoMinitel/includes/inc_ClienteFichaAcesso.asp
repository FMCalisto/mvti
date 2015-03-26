<%
	MySQL="Select * from WN_Clientes where no=" & Session("NO")
	Set Clientes=db.query(cstr(MySQL))
%>
<table width="95%" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
	<tr>
		<td>
<!--------------------------->
		<table width="100%" border="0" cellpadding="0" cellspacing="5" class="lista_produtos_direita">
		  <tr>
	          <td height="38" colspan="2" valign="middle" class="Titulo_laranja"><strong>Dados da Empresa</strong></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>Nome da empresa
                :</strong>
		  <span class="Texto"><%=Clientes("Nome")%></span></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>Contacto :</strong>
		  <span class="Texto"><%=Clientes("Contacto")%></span></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>N&uacute;mero
                de cliente :</strong>
		  <span class="Texto"><%=Clientes("NO")%></span></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>Condi&ccedil;&otilde;es de pagamento :</strong>
		  <span class="Texto"><%=Clientes("TPDesc")%></span></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>Morada :</strong>
		  <span class="Texto"><%=Clientes("Morada")%></span></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>Localidade :</strong>
		  <span class="Texto"><%=Clientes("Local")%></span></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>C&oacute;digo Postal  :</strong>
		  <span class="Texto"><%=Clientes("Codpost")%></span></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>Telefone :</strong>
		  <span class="Texto"><%=Clientes("Telefone")%></span></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>Telemovel :</strong>
		  <span class="Texto"><%=Clientes("Telemovel")%></span></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>FAX :</strong>
		  <span class="Texto"><%=Clientes("Fax")%></span></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>E-Mail :</strong>
		  <span class="Texto"><%=Clientes("Email")%></span></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>N&ordm; Contribuinte  :</strong>
		  <span class="Texto"><%=Clientes("NCont")%></span></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>Endere&ccedil;o
                web :</strong>
		  <span class="Texto"><%=Clientes("url")%></span></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>Volume de vendas
                acumulado :</strong>
		  <span class="Texto"><%=Clientes("eacmfact")%></span> &euro; </td>
		  </tr>
		  <tr>
          <td height="24" valign="middle" width="30%"><p class="Texto_castanho"><strong>Plafond de cr&eacute;dito
                :</strong>
		  <span class="Texto"><%=Clientes("eplafond")%></span> &euro; </td>
          <td height="24" valign="middle"><p class="Texto_castanho"><strong>Saldo  em
                aberto da conta corrente :</strong>
		  <span class="Texto"><%=Clientes("esaldo")%></span> &euro; </td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>Comercial atribuido
                :</strong>
		  <span class="Texto"><%=Clientes("VendedorNome")%></span></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>E-Mail do comercial
                atribuido :</strong>
		  <span class="Texto"><%=Clientes("VendedorEmail")%></span></td>
		  </tr>
		  <tr>
          <td height="24" colspan="2" valign="middle"><p class="Texto_castanho"><strong>Telefone do comercial
                atribuido :</strong>
		  <span class="Texto"><%=Clientes("VendedorTelefone")%></span></td>
		  </tr>
		  </table>
<!--------------------------->
	  </td>
  </tr>
 </table>
<%Clientes.Close:Set Clientes=Nothing%>