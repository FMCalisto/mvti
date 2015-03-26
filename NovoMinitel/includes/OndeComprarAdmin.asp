<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE virtual="/includes/inc_variaveis_globais.asp"-->
<!--#INCLUDE virtual="/includes/inc_FuncoesCRT.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="/includes/MINITEL.css" rel="stylesheet" type="text/css">
<title>Administração de Revendedores por MARCA</title>
</head>
<body>
<%mysql="SELECT TOP (100) PERCENT F.FabricanteID, F.Fabricante,'/images/Logotipos/' + RTRIM(F.Fabricante) + '.gif' AS MarcaIMG FROM WN_Clientes_OndeComprar RIGHT OUTER JOIN WN_Fabricante AS F ON WN_Clientes_OndeComprar.FabricanteID = F.FabricanteID WHERE (WN_Clientes_OndeComprar.FabricanteID IS NULL) ORDER BY F.Fabricante"
set ListaProdutos=db.query(cstr(MySQL))
%>
<table border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita" align="center">
<tr class="Texto_branco" align="center" bgcolor="#81B9D1">
	<td colspan="2">- = Marcas sem representação = -&nbsp;</td>
</tr>
<%if not ListaProdutos.eof then
	Do while not ListaProdutos.eof
	%>
	<tr>
		<td align="left" class="Texto_azul">&nbsp;<%=ListaProdutos("Fabricante")%></td>
		<td align="center"><img src="<%=ListaProdutos("MarcaIMG")%>" title="<%=ListaProdutos("Fabricante")%>" border="0"/></td>
	</tr>
	<%ListaProdutos.MoveNext:Loop:ListaProdutos.Close:Set ListaProdutos=Nothing%>
<%else%>
	<tr>
		<td align="center" colspan="2">Sem registos</td>
	</tr>
<%end if%>
</table>
<br /><br />
<%mysql="SELECT DISTINCT TOP (100) PERCENT WN_Clientes.zona FROM WN_Clientes LEFT OUTER JOIN WN_Clientes_OndeComprar ON WN_Clientes.zona = WN_Clientes_OndeComprar.zona WHERE (WN_Clientes_OndeComprar.zona IS NULL) AND (WN_Clientes.zona <> '') ORDER BY WN_Clientes.zona"
set ListaProdutos=db.query(cstr(MySQL))
%>
<table border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita" align="center">
<tr class="Texto_branco" align="center" bgcolor="#81B9D1">
	<td colspan="2">- = Zonas S/Clientes = -&nbsp;</td>
</tr>
<%if not ListaProdutos.eof then
	Do while not ListaProdutos.eof
	%>
	<tr>
		<td align="left" class="Texto_azul">&nbsp;<a href="/Includes/OndeComprarAdmin.Asp?LZonas=<%=ListaProdutos("zona")%>"><%=ListaProdutos("zona")%></a></td>
	</tr>
	<%ListaProdutos.MoveNext:Loop:ListaProdutos.Close:Set ListaProdutos=Nothing%>
<%else%>
	<tr>
		<td align="center">Sem registos</td>
	</tr>
<%end if%>
</table>
<br />
<%If request.QueryString("LZonas")<>"" Then%>
<%
MySQL="SELECT clstamp,nome,zona,Fabricante,FabricanteID FROM WN_Clientes CROSS JOIN WN_Fabricante WHERE (WN_Clientes.zona = '" & Request.QueryString("LZonas") & "') ORDER BY nome, Fabricante"
Set Clientes=db.query(cstr(MySQL))
if not Clientes.Eof Then
%>
<form action="inc_OndeComprarAdminRUN.asp" method="post">
		<table border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita" align="center">
			<tr class="Texto_branco" align="center" bgcolor="#81B9D1">
				<td colspan="3" align="center">Estão na Zona de <%=Request.QueryString("LZonas")%></td>
			</tr>
			<%
				Do While not Clientes.Eof
				%>
				<tr>
					<td class="Cat2">&nbsp;<%=clientes("nome")%>&nbsp;</td>
					<td class="Cat2">&nbsp;<%=clientes("Fabricante")%>&nbsp;</td>
					<td align="center"><input type="checkbox" name="Dados" value="<%=trim(clientes("clstamp"))%>;<%=clientes("FabricanteID")%>"/></td>
				</tr>
			<%Clientes.MoveNext:Loop:Clientes.Close%>
			<tr class="Texto_branco" align="center" bgcolor="#81B9D1">
				<td colspan="3"><input class="Texto_azul" type="submit" value="Submeter alterações" /></td>
			</tr>
			</table>
	<input type="hidden" name="LZonas" value="<%=Request.QueryString("LZonas")%>" />
</form>
<%
End if
Set Clientes=Nothing
End if%>
<br />
<%
AInt=0:If request.QueryString("FabricanteID")<>"" Then AInt=Cint(request.QueryString("FabricanteID"))
ATxt="":If request.QueryString("Zona")<>"" Then ATxt=txt.abstxt(request.QueryString("Zona")) else ATxt="' or ''='"
%>
<table border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita" align="center" width="100%">
	<tr class="Texto_branco" align="center" bgcolor="#81B9D1">
		<td colspan="2">- = Analise de vendedores por marca = -&nbsp;</td>
	</tr>
	<form action="ondecompraradmin.asp" method="get">
	<tr>
		<td colspan="2" align="center" class="Texto_azul">
		<table width="40%" class="Texto">
			<tr>
				<td>Marca : <%=txt.ComboBox_FxJAVA("","FabricanteID",request.QueryString("FabricanteID"),cstr("SELECT TOP (100) PERCENT FabricanteID as DataOutID, Fabricante DataOutTXT FROM dbo.WN_Fabricante ORDER BY Fabricante"))%></td>
				<td>Zona : <%=txt.ComboBox_FxJAVA("","Zona",request.QueryString("Zona"),cstr("select distinct Zona DataOutTXT,Zona DataOutID  from WN_Clientes order by 1"))%></td>
				<td><input type="image" src="/images/bussola_on.gif" onClick="this.form.submit();" /></td>
			</tr>
		</table>
		</td>
	</tr>
	</form>
	<form method="post" action="inc_OndeComprarAdminRUN.asp" lang="pt">
	<tr valign="top">
		<td width="50%">
			<table border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita" align="center" width="100%">
			<tr class="Texto_branco" align="center" bgcolor="#81B9D1">
				<td colspan="3" align="center">Representam</td>
			</tr>
			<%
			If AInt<>0 then
				MySQL="SELECT distinct [clstamp],[nome],zona FROM [WebSiteMINITEL].[dbo].[WN_Clientes_OndeComprar] where (fabricanteid=" & Aint & ") and (zona='" & ATxt & "') order by zona,nome"
			'response.Write(MySQL)
			Set Clientes=db.query(cstr(MySQL))
				Do While not Clientes.Eof
				%>
				<tr>
					<td class="Cat2">&nbsp;<%=clientes("nome")%></td>
					<td class="Cat2">&nbsp;<%=clientes("Zona")%></td>
					<td align="center"><input type="checkbox" name="CLSTAMP" value="<%=trim(clientes("clstamp"))%>"/></td>
				</tr>
				<%
				Clientes.MoveNext:Loop:Clientes.Close:Set Clientes=Nothing
			End if
			%>
			</table>
		</td>
		<td width="50%">
			<table border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita" align="center"  width="100%">
			<tr class="Texto_branco" align="center" bgcolor="#81B9D1">
				<td colspan="3" align="center">Não Representam</td>
			</tr>
			<%
			If AInt<>0 then
				MySQL="SELECT distinct [clstamp],[nome],zona FROM [WebSiteMINITEL].[dbo].[WN_Clientes_OndeComprar] where (fabricanteid<>" & Aint & ") and (zona='" & ATxt & "') and (clstamp not in (select clstamp from WN_Clientes_OndeComprar where fabricanteid=" & Aint & ")) order by zona,nome"
			'response.Write(MySQL)
			Set Clientes=db.query(cstr(MySQL))
				Do While not Clientes.Eof
				%>
				<tr>
					<td class="Cat2">&nbsp;<%=clientes("nome")%></td>
					<td class="Cat2">&nbsp;<%=clientes("Zona")%></td>
					<td align="center"><input type="checkbox" name="CLSTAMP" value="<%=trim(clientes("clstamp"))%>"/></td>
				</tr>
				<%
				Clientes.MoveNext:Loop:Clientes.Close:Set Clientes=Nothing
			End if
			%>
			</table>
		</td>
	</tr>
	<tr class="Texto_branco" align="center" bgcolor="#81B9D1">
		<td colspan="2"><input class="Texto_azul" type="submit" value="Submeter alterações" /></td>
	</tr>
	<input type="hidden" name="FabricanteID" value="<%=AInt%>" />
	<%if instr(ATxt," or ")<>0 Then ATxt=""%>
	<input type="hidden" name="Zona" value="<%=ATxt%>" />
	</form>
</table>
</body>
</html>
