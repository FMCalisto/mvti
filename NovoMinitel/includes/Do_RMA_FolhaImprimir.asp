<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE virtual="/includes/inc_variaveis_globais.asp"-->
<%

Dim ObjCBarras
Set ObjCBarras = Server.CreateObject("Interface_barras.TXT")

ATXT="0"
db.QueryExec(cstr("execute Hit_WN_EventosMENU Do_RMA_FolhaImprimir"))
if clng(request.QueryString("ID"))>0 and clng(request.QueryString("NO"))>0 Then
	if request.QueryString("XEK")<>txt.EncodeTXT36(cstr(cint(request.QueryString("ID"))*10000+clng(request.QueryString("NO")))) Then ATXT="1"
Else
	ATXT="1"
End if

If ATXT="1" Then response.Redirect("/?OP=LOGOUT")


MySQL="SELECT rmaid,TipoDocumento,no,nome,Morada,local,codpost,isnull([NoPAT],0) as NoPat FROM [WebSiteMINITEL].[dbo].[WN_RMA] where rmaid=" & request.QueryString("ID") & " and no=" & request.QueryString("NO")
Set Clientes=db.query(cstr(MySQL))
If clientes.eof Then response.Redirect("/?OP=LOGOUT")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Folha para impressão.</title>
<link href="Minitel.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style3 {font-size: 20px}
-->
</style>
</head>
<body>
<table width="800" border="0" cellspacing="2" cellpadding="2" align="center">
  <tr>
    <td width="50%" valign="top"><p class="Cat2"><span class="style3"><strong>Remetente :</strong><br />
      <%=Clientes("Nome")%><br />
    <%=Clientes("Morada")%><br />
    <%=Clientes("Local")%><br />
    <%=Clientes("CodPost")%></span></p>    </td>
    <td width="50%">&nbsp;</td>
  </tr>
  <tr valign="bottom">
    <td valign="bottom">
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<table width="100%" border="0" cellpadding="2" cellspacing="2">
			<tr valign="middle">
				<td width="16%" class="Titulo_laranja">NCL :</td>
				<td width="84%"><img src="/images/cbarras/<%=ObjCBarras.Cbarras(Request.ServerVariables("APPL_PHYSICAL_PATH") + "\images\Cbarras",cstr( Clientes("NO") ))%>"></td>
			</tr>
			<tr valign="middle">
				<td class="Titulo_laranja"><span class="Titulo_laranja">RMA</span> :</td>
				<td><img src="/images/cbarras/<%=ObjCBarras.Cbarras(Request.ServerVariables("APPL_PHYSICAL_PATH") + "\images\Cbarras",cstr( Clientes("RMAID") ))%>"></td>
			</tr>
			<tr valign="middle">
				<td class="Titulo_laranja">PAT :</td>
				<td><img src="/images/cbarras/<%=ObjCBarras.Cbarras(Request.ServerVariables("APPL_PHYSICAL_PATH") + "\images\Cbarras",cstr( Clientes("NoPat") ))%>"></td>
			</tr>
			<tr valign="middle">
				<td class="Titulo_laranja">DOC :</td>
				<td><%=Clientes("TipoDocumento")%></td>
			</tr>
	  </table>
    ------------<br />
    <%=now()%> <br /> <%=txt.EncodeTXT36(cstr(now()))%></span></span></td>
    <td  valign="top">
      <p class="Cat2">&nbsp;</p>
      <p class="Cat2">&nbsp;</p>
      <p class="Cat2"><span class="style3"><strong>Destinat&aacute;rio :</strong><br />
        MINITEL<br />
        Departamento de RMA <br />
        Tv. Legua da P&oacute;voa 1A <br />
        1250-136 Lisboa</span></p></td>
  </tr>
  <tr>
    <td valign="top" colspan="2"><br /><br /><br /><div align="center">---------------------------------------------------------------------------------------------------------------</div><br /><br /></td>
  </tr>
  <tr>
    <td valign="top" colspan="2" align="left">Coloque na caixa, de forma visivel os dados acima impressos.</td>
  </tr>
</table>
<%
response.Flush()
Clientes.Close
Set Clientes=Nothing
Set ObjCBarras=Nothing
%>
<script language="javascript">
	window.print();
</script>
</body>
</html>
