<!-- INICIO : inc_gera_TMenus.asp -->
<style type="text/css">
<!--
a:link {
	color: #666666;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #666666;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
.style1 {
	color: #FFFFFF;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
}
.style2 {color: #FFFFFF}
-->
</style>
<table width="150" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="150" height="20" align="center" valign="middle" bgcolor="#0066CC" class="titulos style1"><a href="/WebAdmin">Back Office</a></td>
  </tr>
  <tr>
    <td height="20" align="center" valign="middle" bgcolor="#66CC33" class="titulos style2">Produtos</td>
  </tr>
  <tr>
    <td height="20" align="center" valign="middle" bgcolor="#CCCCCC" class="titulos"><a href="Lista_produtos.asp">Listar Produtos</a></td>
  </tr>



  <tr>
    <td height="20" align="center" valign="middle" bgcolor="#CCCCCC" class="titulos"><a href="Lista_RMA.Asp">Recepção RMA</a></td>
  </tr>


  <tr>
    <td height="20" align="center" valign="middle" bgcolor="#CCCCCC" class="titulos"><a href="Lista_DESCONTOS.Asp">Descontos !</a></td>
  </tr>


<%if session("Admin")=1 Then%>
  <tr>
    <td height="20" align="center" valign="middle" bgcolor="#CCCCCC" class="titulos"><a href="Onde_Comprar.asp">Onde Comprar</a></td>
  </tr>
<%end if%>
  <tr>
    <td height="20" align="center" valign="middle" bgcolor="#CCCCCC" class="titulos"><a href="/index.asp">-=SAIR=-</a></td>
  </tr>
</table>
