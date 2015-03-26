<link href="/includes/MINITEL.css" rel="stylesheet" type="text/css">
<table width="600" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita">
<%
MySQL="select distinct Letra from dbo.View_ClientesComercialDados where vendedoremail='" & Session("Comercial") & "' order by letra"


MySQL="select distinct Letra from dbo.View_ClientesComercialDados where vendedornumero='" & Session("vendedornumero") & "' order by letra"

'teste(MySQL)

Set Letras=db.query(cstr(MySQL))
ATxt=TXT.AbsTXT(Request.QueryString("Letra"))
Do While Not Letras.Eof
%>
<tr>
	<td align="center" bgcolor="#CCCCCC">
	<a class="Texto_azul" href="/?OP=LoginComercialOK&Letra=<%=Letras("Letra")%>">
		- = <%=Letras("Letra")%> = -				
	</a>
	</td>
</tr>
<%If Letras("Letra")=ATxt Then%>
<tr>
	<td>
		<table bgcolor="#E7E9FE" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" class="lista_produtos_direita" border="1" width="100%">
		<tr align="center" class="Texto_branco" bgcolor="#82B7F2">
			<td>ACT!</td>
			<td>Nº</td>
			<td>Nome</td>
			<td>NIF</td>
			<td>Telefone</td>
			<td>Fact.</td>
			<td>Deve.</td>
			<td>PASS</td>
		</tr>

		<%
		MySQL="select DividaCOR,divida,obs,dbo.isempty(password,'-=VAZIO=-') as password,NoCreditCOR,no,clstamp,eacmfact,dbo.isempty(url,'&nbsp;') as url,ncont,nome,telefone,email from dbo.View_ClientesComercialDados where vendedornumero='" & Session("vendedornumero") & "' and letra='" & ATxt & "' order by nome"



		Set Clientes=db.query(cstr(MySQL))
		Do While Not Clientes.Eof
		%>
		<tr align="left" class="Texto_azul" onMouseOver="this.style.backgroundColor = '#F3F3F3'" onMouseOut="this.style.backgroundColor = '#E7E9FE'">
		<%
			if Clientes("Password")<>"" Then
				CTXT="U=" & trim(Clientes("NO")) & "&P=" & Clientes("Password") & "&C=Admin"
				CTXT=txt.EncodeTXT36(cstr(CTXT))
				CTXT="http://" & Request.ServerVariables("SERVER_NAME") & "/Includes/Do_LinkDirecto_RUN.asp?X=" & CTXT
			End if
		%>
			<td align="center"><a href="/?OP=ACT&CLSTAMP=<%=Clientes("CLSTAMP")%>">>=<</a></td>
			<td align="center" <%=Clientes("NoCreditCOR")%>><a href="<%=CTXT%>"><%=Clientes("No")%></a></td>
			<td><a href="http://<%=Clientes("URL")%>" target="_blank"><%=left(Clientes("Nome"),25)%></a></td>
			<td align="center"><%=Clientes("NCont")%></td>
			<td align="center"><a href="mailto:<%=Clientes("Email")%>"><%=left(Clientes("Telefone"),18)%></a></td>
			<td align="Right"><%=Round(Clientes("eacmfact"),2)%></td>
			<td align="Right" <%=clientes("DividaCOR")%>><%=Round(Clientes("divida"),2)%></td>
			<td align="center"><a onclick="return confirm('Tem a certeza ?');" href="/?OP=PEDIRPASSWORD&CLSTAMP=<%=Clientes("ClStamp")%>"><%=Clientes("Password")%></a></td>
		</tr>
		<%
		Clientes.MoveNext:Loop
		Clientes.Close:Set Clientes=Nothing
		%>
		</table>
	</td>
</tr>	
<%End if%>

<%
Letras.MoveNext:Loop
Letras.Close:Set Letras=Nothing
%>
</table>