<!-- INICIO : FuncoesCOMBO.asp -->
<%
'***********************************************************************
Function ComboBOX(Nome,ValorIN)
Dim TxTOut
Dim MySQL
Dim Aux
Dim AuxWhere
Dim AuxWhereLingua
Dim AuxWhereLinguaRevenda
	ValorIN=trim(ValorIN)

	'Pode vir algum parametro associado, logo tenho de o tirar
	If Instr(ValorIn,"&")<>0 Then
		Aux=ValorIn
		ValorIn=Left(ValorIn,Instr(ValorIn,"&")-1)
	End if

	AuxWhere= " and 1=1 "
	If request.QueryString("Marca")<>"" Then
		AuxWhere=AuxWhere & " and marca='" & request.QueryString("Marca") & "'"
	End if

	'Nao se pode colocar este filtro, se nao a lista de categorias, depois de selecciona, nao lista as outras disponiveis.s
	'If request.QueryString("SubCategoria")<>"" Then
	'	AuxWhere=AuxWhere & " and Categoria='" & request.QueryString("Categoria") & "' and marca='" & request.QueryString("Marca") & "'"
	'	teste("Aqui")
	'End if


	If Session("Lingua")="1" Then
		AuxWhereLingua=" and Tipo='P'"
		AuxWhereLinguaRevenda=" and Tipo='R'"
	Else
		If Session("Lingua")="2" Then
			AuxWhereLingua=" and Tipo='E'"
			AuxWhereLinguaRevenda=" and Tipo='RE'"
		End if
	End if	

	Nome=Ucase(nome)
	select case nome
		case "MARCA"
			MySQL="select distinct Marca As DataOUT from WN_CategoriasT Where Marca<>'' " & AuxWhereLingua & " order by 1;"
		case "CATEGORIA"
			MySQL="select distinct Categoria As DataOUT from WN_CategoriasT where Categoria<>''" & AuxWhere & AuxWhereLingua & " order by 1;"
		case "SUBCATEGORIA"
			MySQL="select distinct SubCategoria  As DataOUT from WN_CategoriasT where SubCategoria<>''" & AuxWhere & AuxWhereLingua & " order by 1;"
		case "PLATAFORMA"
			MySQL="select distinct Plataforma  As DataOUT from WN_CategoriasT where Plataforma<>''"  & AuxWhere & " order by 1;"
		Case "NOVIDADE"
			MySQL="select distinct Wn_ListaProdutosT.Marca As DataOUT from novidades inner join Wn_ListaProdutosT on Wn_ListaProdutosT.referencia=Novidades.referencia and Wn_ListaProdutosT.tipo=Novidades.tipo where activa=1 and Novidades.Referencia<>'' and Novidades.Tipo='" & Session("Tipo") & "' order by 1;"
		Case "ARTIGOS"
			MySQL="select distinct st.usr1 As DataOUT from ArtigosImprensa inner join st on st.ref=referencia where activa=1 and Referencia<>'' " & AuxWhereLingua & " order by 1;"
		Case "ZONA"
			Aux=Mid(Aux,Instr(Aux,"&")+1,Len(Aux))
			MySQL="select distinct Zona as DataOUT From Web_ListaForncedoresZONA Where Marca='" & Aux & "'" & AuxWhereLinguaRevenda & " order by 1;"
	end select

	RS.open MySQL,ConnObj,1
	
	TxtOut=TxtOut+"<select name="""& Nome & """ onchange=""this.form.submit();"" class=""ComboBOX"">"

if ValorIn="" Then
	If Session("Lingua")=1 Then
		TxtOut=TxtOut+"<option value="""">Escolher...</option>"
	Else
		If Session("Lingua")=2 Then
			TxtOut=TxtOut+"<option value="""">Escoger...</option>"
		End if
	End if
Else
	TxtOut=TxtOut+"<option value=""" & ValorIn & """ selected>" & ValorIn & "</option>"

	If Session("Lingua")=1 Then
		TxtOut=TxtOut+"<option value="""">-=VAZIO=-</option>"
	Else
		If Session("Lingua")=2 Then
				TxtOut=TxtOut+"<option value="""">-=VACIO=-</option>"
		End if
	End if

End if

	Do While not rs.eof
		if Trim(ucase(rs("DataOUT"))) <> ucase(ValorIN) Then
			TxtOut=TxtOut+"<option value=""" & trim(rs("DataOUT")) & """>" & trim(rs("DataOUT")) & "</option>"
		end if
		rs.movenext		
	Loop
	TxtOut=TxtOut+"</select>"
	
	rs.close

ComboBOX=TxtOut
Set TxtOut=Nothing
End Function
'***********************************************************************
%>
<!-- FIM : FuncoesCOMBO.asp -->
