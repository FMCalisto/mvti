<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Inscrição no seminário...</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.titulo {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 24px;
	font-style: normal;
	font-weight: bold;
	color: #333;
}
.header {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: #FFFFFF;
	background-color: #000;
}
.texto {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #666;
}
.label {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: #FFF;
	background-color: #666;
	font-size: 12px;
}
-->
</style>
</head>
<body>
<%
'*********************************************************************************************
Function Header(Texto,Colunas)
	%>
	<tr>
		<td colspan="<%=Colunas%>" align="center" class="header"><b><%=Texto%></b></td>
	</tr>
	<%
End function
'*********************************************************************************************
function label(texto,variavel,tamanho)
	if texto<>"" Then response.Write(texto & " : ")
	%>
	<input type="text" name="<%=variavel%>" value="" size="<%=tamanho%>">
	<%
End function
'*********************************************************************************************
function check(texto,variavel,valor)
	%>
	<input type="checkbox" name="<%=variavel%>" value="<%=valor%>">
	<%
	if texto<>"" Then response.Write(texto)
End function
'*********************************************************************************************
%>
<table width="100%" border="0">
<tr>
<td align="center" class="titulo"><img src="http://www.minitel.pt/formularios/eventos/banners_formularios/banner_negocios_moveis.jpg" width="1387" height="186" alt=""/></td>
 </tr>
  </table>
  <br>
</div>
<form action="SeminarioRun.asp" method="post">
  <div align="center">
    <table WIDTH="100%" height="181" BORDER="1" cellpadding="5" CELLSPACING="0" bordercolor="#cccccc" bordercolorlight="#cccccc" bordercolordark="#cccccc" bgcolor="#cccccc">
      <tr>
        <td colspan="2" class="header"><div align="center"><%=Header("Dados pessoais",2)%></div></td></tr>
      <tr>
        <td width="99%" bgcolor="#E9E6E6" class="label"><%=label("Empresa","Empresa","40")%></td>
        
      <tr>
          <td bgcolor="#E9E6E6" class="label"><%=label("Nome","Nome","40")%></td>
      </tr>
      <tr>
        <td bgcolor="#E9E6E6" class="label"><%=label("Número de telefone","Telefone","13")%></td>
      </tr>
      <tr>
        <td height="31" colspan="2" bgcolor="#E9E6E6" class="label"><%=label("E-Mail","Email","40")%></td>
      <tr> </tr>  
      <tr>  <td bgcolor="#CCCCCC" class="label">&nbsp;
        <input type="hidden" name="endpoints" value="0"></td>
	</tr>
	</table>
  <p align="center" class="texto"><br><input type='submit' value='Submeter inscrição'></p>
    	<input type="hidden" name="Extra0" value="SiteMinitel">
	<input type="hidden" name="Titulo" value="Webinar_Negocios_Moveis.">
</form>
</body>
</html>
