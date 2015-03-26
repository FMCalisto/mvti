<%
Set Clientes=db.query(cstr("Select * from WN_Clientes where no=" & Session("no")))
%>
<table width="100%" border="0" cellpadding="4" cellspacing="0" bgcolor="#F4F4F4">
  <!--DWLayoutTable-->
  <tr>
	<td height="22" align="center" valign="middle" bgcolor="#87AFAF"><p class="Titulo_branco">Dados do seu comercial.</p></td>
	  </tr>
  <tr>
	<td height="61" valign="middle" class="Titulo_laranja"><div align="center" class="Texto_castanho"><%=Clientes("VendedorNome")%><br />
	    <br />
	    Telef : <%=Clientes("VendedorTelefone")%><br />
	    <br />
	    e-mail: <a href="mailto:<%=Clientes("VendedorEmail")%>"><%=Clientes("VendedorEmail")%></a></div></td>
	  </tr>
  <tr>
	<td height="22" align="center" valign="middle" bgcolor="#87AFAF"><p class="Titulo_branco">Qualquer questão não hesite em contactar-nos.</p></td>
	  </tr>
  <tr>
</table>
<%Clientes.Close:Set Clientes=Nothing%>