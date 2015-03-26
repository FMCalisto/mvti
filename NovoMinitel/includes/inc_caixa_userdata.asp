<%
Set Clientes=db.query(cstr("Select * from WN_Clientes where no=" & Session("no")))
%>
<table width="100%" border="0" cellpadding="4" cellspacing="0" bgcolor="#F4F4F4">
  <!--DWLayoutTable-->
  <tr>
	<td height="22" colspan="2" align="center" valign="middle" bgcolor="#C92B5B">
	<p class="Titulo_branco"><img src="../images/carro3.gif" width="14" height="14" />O seu carro de compras!</p></td>
	  </tr>
  <tr height="42">
		<td valign="middle" class="Texto_castanho" width="40%"><%AInt=db.query(cstr("select isnull(Sum(quantidade),0) as total from View_Clientes_CarrinhoTemp where no=" & session("no")))("total")%>
		<strong>Itens : <%=AInt%><br />
  	  Total : <%=FormatNumber(csng(db.query(cstr("select isnull(stotal,0) as Total from View_Clientes_CarrinhoTemp RIGHT OUTER JOIN (SELECT  " & session("no") & " AS X) AS a ON a.X = dbo.View_Clientes_CarrinhoTemp.No"))("total")),2)%>&nbsp;&euro;<br />
</strong></td>
		<td align="Center" valign="middle" class="Texto_Top1">
			<%If cint(AInt)>0 Then%>
			<strong class="Texto_azul"><a href="/includes/DO_Carros_step1.asp">
				<img border="0" src="../images/minisites.gif" width="9" height="9" /> Visualizar Carro
				<br />
				<img border="0" src="../images/minisites.gif" width="9" height="9" /> Finalizar Compra 
			</a></strong>
			<%Else%>
				Vazio
			<%End if%>
	    </td>
	  </tr>
  <tr>
	<td height="22" colspan="2" align="center" valign="middle" bgcolor="#87AFAF"><p class="Titulo_branco">Dados do seu comercial.</p></td>
	  </tr>
  <tr>
	<td height="61" colspan="2" valign="middle" class="Titulo_laranja"><div align="center" class="Texto_castanho"><%=Clientes("VendedorNome")%><br />
	  Telef : <%=Clientes("VendedorTelefone")%><br />
	  e-mail: <a href="mailto:<%=Clientes("VendedorEmail")%>"><%=Clientes("VendedorEmail")%></a></div></td>
	  </tr>
</table>
<%Clientes.Close:Set Clientes=Nothing%>