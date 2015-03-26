<%
Dim Logos(200,3)
MySQL="SELECT DISTINCT TOP (100) PERCENT '/images/Logotipos/' + RTRIM(F.Fabricante) + '.gif' AS MarcaIMG, RTRIM(F.Fabricante) AS Fabricante, F.FabricanteID, ISNULL(dbo.WN_Clientes_OndeComprar.FabricanteID, 0) AS RepresentaMarca FROM dbo.WN_Fabricante AS F LEFT OUTER JOIN dbo.WN_Clientes_OndeComprar ON F.FabricanteID = dbo.WN_Clientes_OndeComprar.FabricanteID AND dbo.WN_Clientes_OndeComprar.clstamp = '" & txt.abstxt(request.QueryString("ClStamp")) & "' ORDER BY RepresentaMarca,Fabricante"
Set Clientes=db.query(cstr(MySQL))
AInt=0
EInt=0
Do While not Clientes.EOF
AInt=AInt+1
Logos(AInt,0)=trim(clientes("MarcaIMG"))
Logos(AInt,1)=trim(clientes("Fabricante"))
Logos(AInt,2)=cint(clientes("RepresentaMarca"))
Logos(AInt,3)=cint(clientes("FabricanteID"))
Clientes.MoveNext
Loop
Clientes.Close:Set Clientes=Nothing	
%>
<table border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="lista_produtos_direita" align="center">
<tr class="Texto_branco" align="center" bgcolor="#81B9D1">
	<td colspan="10">- = Marcas comercializadas = -</td>
</tr>
<%
For BInt=1 To Cint(Aint/9)%>
<tr align="center" valign="middle" height="55">
	<%For DInt=1 to 10%>
	<%EInt=EInt+1
		IF cint(Logos(EInt,2))<>0 Then
			ATxt="#10FF00" 'VERDE
		Else
			ATxt="#F5D5D1" 'Vermelho
		End if	
		%>
		<td bgcolor="<%=ATxt%>" width="55">
			<%If Logos(EInt,0)<>"" Then%>
				<%if Session("Admin")=1 Then%>
					<a href="/includes/inc_clientes_MarcasOndeComprarRUN.asp?FabricanteID=<%=Logos(EInt,3)%>&CLSTAMP=<%=txt.abstxt(request.QueryString("ClStamp"))%>">
						<img src="<%=Logos(EInt,0)%>" title="<%=Logos(EInt,1)%>" border="0"/>
					</a>				
				<%else%>
					<img src="<%=Logos(EInt,0)%>" title="<%=Logos(EInt,1)%>" border="0"/>
				<%end if%>
			<%else%>
				&nbsp;
			<%End if%>
		</td>
	<%Next%>
</tr>
<%Next%>
<tr class="Texto_branco" align="center" bgcolor="#81B9D1">
	<td colspan="10">Lista Marcas por Zonas</td>
</tr>
</table>