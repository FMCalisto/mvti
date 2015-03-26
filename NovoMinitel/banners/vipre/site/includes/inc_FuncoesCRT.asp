<!--------------------------------------------------------------------------------->
<%
Function Moeda(Valor)
	If csng(Valor)<=0 Then
		Moeda="Contactar"
	Else
		Moeda=formatnumber(Valor,2) & " � "
	End if
End function
%>
<!--------------------------------------------------------------------------------->
<%
Function ListaFichaProduto(produtoid,designacao,FABRICANTEID,fabricante,imagem,preco,subcat0,subcat1,subcat2,Referencia,ImagemStock_ProdutoLista)
Preco=Moeda(preco)
Dim Cats
Cats=""
If subcat0<>"" Then Cats=Cats & "&Cat1QS=" & subcat0
If subcat1<>"" Then Cats=Cats & "&Cat2QS=" & subcat1
If subcat2<>"" Then Cats=Cats & "&Cat3QS=" & subcat2
%>
<table width="440" border="0" cellpadding="0" cellspacing="0" height="60" style="border-bottom-style: dotted;border-bottom-width: 1px;border-bottom-color: #CCCCCC;" align="center">
        <tr>
		  <td width="58" rowspan="3" align="center" valign="middle"><a href="<%=txt.href("?OP=FICHADEPRODUTO&ProdutoID=" & produtoid & Cats)%>"><%=Imagem%></a></td>
          <td height="23" colspan="3" valign="middle" align="left"><%=ImagemStock_ProdutoLista%>&nbsp;<a class="Texto_azul" href="<%=txt.href("?OP=FICHADEPRODUTO&ProdutoID=" & produtoid & Cats)%>"><strong><%=Designacao%></strong></a></td>
        </tr>
        <tr class="Texto" valign="middle">
          <td width="138" height="27" align="left"><strong>Marca :</strong> <a title="Filtrar por marca."href="<%=txt.href("?OP=ListaProdutos&FABRICANTEID=" & FABRICANTEID)%>"><%=Fabricante%></a></td>
          <td width="164" align="center" class="Texto"><strong>Refer&ecirc;ncia : </strong><a class="Texto_azul" href="<%=txt.href("?OP=FICHADEPRODUTO&ProdutoID=" & produtoid & Cats)%>"><%=Referencia%></a></td>
          <td width="80" class="Titulo_laranja" align="right">
		  <%If Session ("ClienteON") AND BBoo Then%>
		  <a href="/?OP=Comprar&StStamp=<%=produtoid%>" title="Adicionar" class="Titulo_laranja">
			<%=preco%><img src="/images/carro5.gif" border="0"/></a>
		  <%Else%>
			<%=preco%>
		  <%End if%>&nbsp;&nbsp;
		  </td>
        </tr>
</table>
<%End Function%>
<!--------------------------------------------------------------------------------->
<%Function ListaFichaCliente(clstamp,nome,morada,ProdutoID)%>
<table width="440" border="0" cellpadding="0" cellspacing="0" height="60" style="border-bottom-style: dotted;border-bottom-width: 1px;border-bottom-color: #CCCCCC;" align="center">
  <!--DWLayoutTable-->
        <tr class="Texto" valign="middle">
          <td width="380" height="30" align="left" valign="middle">Nome : <span class="Texto_castanho"><%=nome%></span></td>
          <td width="57" align="center" valign="middle"><a href="javascript:openpopup('/includes/PedirOrcamento.asp?CLStamp=<%=clstamp%>&ProdutoID=<%=ProdutoID%>')"><img src="/images/mail.gif" alt="Ver mais detalhes" border="0"/><br />Pedir Or�amento</a></td>
        </tr>
</table>
<%End Function%>
<!--------------------------------------------------------------------------------->
<%Function Estatisticas (Titulo,Classe,MinhaString)
Set ListaProdutos=db.query(cstr(MinhaString))
Dim Cats
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EFEFE9" height="25">
<tr height="25">
	<td class="Texto_branco" align="center" bgcolor="#C92B5B"><strong><%=Titulo%></strong></td>
</tr>
<%Do While Not ListaProdutos.EOF
Cats=""
If ListaProdutos("CAT_ID1")<>"" Then Cats=Cats & "&Cat1QS=" & ListaProdutos("CAT_ID1")
If ListaProdutos("CAT_ID2")<>"" Then Cats=Cats & "&Cat2QS=" & ListaProdutos("CAT_ID2")
If ListaProdutos("CAT_ID3")<>"" Then Cats=Cats & "&Cat3QS=" & ListaProdutos("CAT_ID3")
%>
<tr>
	<td align="left" height="20">
		<a class="<%=Classe%>" title="<%=Trim(ListaProdutos("Design"))%>" href="<%=txt.href("?OP=FICHADEPRODUTO&ProdutoID=" & trim(ListaProdutos("StStamp")) & Cats)%>">> <%=left(trim(ListaProdutos("Design")),20)%>...</a>
	</td>	
</tr>
<%ListaProdutos.MoveNext:Loop%>
</table>
<%ListaProdutos.Close:Set ListaProdutos=Nothing%>
<%End Function%>
<!--------------------------------------------------------------------------------->
<%Function Ordenacoes
Dim Filtro : Filtro=""
Dim FiltroIN : FiltroIN=""
Dim CampoOutID : CampoOutID=""
Dim CampoTXT : CampoTXT=""
Dim Titulo : Titulo=""
Dim Passagem : Passagem=""
Dim Filtro_Stock : Filtro_Stock=""
Dim FiltroStock : FiltroStock=0

'Qdo � filtrado por stock tenho de tambem aplicar esta comdi��o �s COMBO
FiltroStock=cint(txt.QSV("STOCK",request.QueryString,1))
If FiltroStock<>-1 Then
	Filtro_Stock=" inner join WN_ListaProdutos on E.fabricanteID=WN_ListaProdutos.fabricanteID and Filtro_Stock=" & FiltroStock
End if

Filtro="-1"

Filtro=UCASE(txt.qsv("FABRICANTEID",request.QueryString,1))
if Filtro<>"-1" Then
	REM � porque entrou FABRICANTEID
	Titulo="Categoria :&nbsp;" REM aparece sempre a combobox oposta !
	CampoOutID="e.CAT_ID1"
	CampoTXT="e.CAT1"
	Passagem="CATEGORIA"
	FiltroIN=replace(ATXT,"Cat_ID1",txt.qsv("Filtro",request.QueryString,1))

		If Filtro_Stock<>"" Then
			FiltroIN=replace(FiltroIN,"Fabricante","WN_ListaProdutos.Fabricante")
		Else
			FiltroIN=replace(FiltroIN,"Fabricante","e.Fabricante")
		End if



	MySQL="select distinct " & CampoTXT & " as DataOutTXT," & CampoOutID & " as DataOutID From WN_Fabricantes_E_Categorias AS E "& Filtro_Stock & " where 1=1 " & FiltroIN & " order by 1"
End if

if Filtro="-1" Then
	Filtro=UCASE(txt.qsv("CAT1QS",request.QueryString,1)) 
	if Filtro<>"-1"  Then 
		'teste("CAT1")
		REM � porque entrou CATEGORIA1
		Titulo="Fabricante :&nbsp;" REM aparece sempre a combobox oposta !
		CampoOutID="e.FABRICANTEID"
		CampoTXT="e.FABRICANTE"
		Passagem="FABRICANTE"
		FiltroIN=replace(ATXT,"FabricanteID",txt.qsv("Filtro",request.QueryString,1))
		If Filtro_Stock<>"" Then
			FiltroIN=replace(FiltroIN,"Cat_","WN_ListaProdutos.Cat_")
		Else
			FiltroIN=replace(FiltroIN,"Cat_","e.Cat_")
		End if


		MySQL="select distinct " & CampoTXT & " as DataOutTXT," & CampoOutID & " as DataOutID From WN_Fabricantes_E_Categorias as E " & Filtro_Stock & " where 1=1 " & FiltroIN & " order by 1"
	End if
	
	'teste("1:" & MySQL)

End if

if Filtro="-1" Then
	Filtro=UCASE(txt.qsv("TEXTO",request.QueryString,1))
	if Filtro<>"-1"  Then 
		REM Entrou pelas pessquisa de texto
		Titulo="Fabricante :&nbsp;" REM aparece a combobox do fabricante
		Passagem="PESQUISATEXTO"
		MySQL="select distinct  e.Fabricante as DataOutTXT, e.FabricanteID as DataOutID From WN_Fabricantes_E_Categorias As E inner join WN_ListaProdutos on e.FabricanteID=WN_ListaProdutos.FabricanteID And (ref like '%" & Filtro & "%' or design like '%" & Filtro & "%')" 
		
		REM FALTA AQUI O FILTRO DO STOCK
		If FiltroStock<>-1 Then
			MySQL=MySQL & " and Filtro_Stock=" & FiltroStock
		End if
		
	End if
'	Teste("3:" & MySQL)
End if
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" height="60" style="border-bottom-style: dotted;border-bottom-width: 1px;border-bottom-color: #CCCCCC;">
	<form name="form1" method="get" action="/index.asp">
	<tr>
		<%BTxT=txt.qsv("OP",request.querystring,1)
		If BTxT<>"-1" Then%>
			<input type="hidden" name="<%=txt.e36("OP")%>" value="<%=BTxT%>" />
		<%End if%>

		<%BTxT=txt.qsv("Texto",request.querystring,1)
		If BTxT<>"-1" Then%>
			<input type="hidden" name="<%=txt.e36("Texto")%>" value="<%=BTxT%>" />
		<%End if%>

		<%BTxT=txt.qsv("Cat3QS",request.querystring,1)
		If BTxT<>"-1" Then%>
			<input type="hidden" name="<%=txt.e36("Cat3QS")%>" value="<%=BTxT%>" />
		<%End if%>

		<%BTxT=txt.qsv("Cat2QS",request.querystring,1)
		If BTxT<>"-1" Then%>
			<input type="hidden" name="<%=txt.e36("Cat2QS")%>" value="<%=BTxT%>" />
		<%End if%>
		
		<%BTxT=txt.qsv("Cat1QS",request.querystring,1)
		If BTxT<>"-1" Then%>
			<input type="hidden" name="<%=txt.e36("Cat1QS")%>" value="<%=BTxT%>" />
		<%End if%>

		<%BTxT=txt.qsv("FABRICANTEID",request.querystring,1)
		If BTxT<>"-1" Then%>
			<input type="hidden" name="<%=txt.e36("FABRICANTEID")%>" value="<%=BTxT%>" />
		<%End if%>

		<%If Passagem<>"" Then%>
			<input type="hidden" name="<%=txt.e36("Passagem")%>" value="<%=txt.e36(cstr(Passagem))%>" />
		<%End if%>

		<td class="Texto" width="50%"  align="right"><div class="Titulo_laranja">Ordena��o&nbsp;:&nbsp;
		<%=txt.combobox(txt.e36("Ordem"),txt.qsv("ordem",request.QueryString,1),"select * From WN_Ax_ComboOrdenacao order by DataOutTXT",1)%>
		</div>
		</td>
		<td class="Texto" width="50%" align="center">
		<div class="Titulo_laranja"><%=Titulo%>
		<%
			REM a PARTE DOS INDICE n�o pode ser aqui processada. SORTx tem de ser removido
			AInt=instr(MySQL,CampoDeOrdenacao) 'Encontro o campo de ordernacao na string
			If AInt<>0 Then
				Bint=instr(Aint,MySQL," ") 'procuro o proximo espa�o em branco
				MySQL=Left(MySQL,AInt-1) & " 2=2 " & Mid(MySQL,Bint+1,len(MYSQL))
			End if

			REM a PARTE DOS INDICE n�o pode ser aqui processada. Filtro_Stock tem de ser removido
			AInt=instr(MySQL,"Filtro_Stock") 'Encontro o campo de 'Filtro_Stock'
			If AInt<>0 Then
				Bint=instr(Aint,MySQL," ") 'procuro o proximo espa�o em branco
				MySQL=Left(MySQL,AInt-1) & " 2=2 " & Mid(MySQL,Bint+1,len(MYSQL))
			End if
		
		%>
		<%=txt.combobox(txt.e36("FILTRO"),txt.qsv("FILTRO",request.querystring,1),cstr(MySQL),1)%>
		</div>
		</td>
	</tr>
	<%if session("ClienteON") or Session("ComercialON") Then%>
	<tr valign="middle">
		<td class="Texto" width="50%" align="right"><div class="Titulo_laranja">Stocks&nbsp;:&nbsp;
		<%=txt.combobox(txt.e36("Stock"),txt.qsv("Stock",request.QueryString,1),"select * From WN_Ax_ComboStock order by DataOutTXT",1)%>
		</div>
		</td>
		<td width="50%" align="center" class="Texto_azul">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr class="Texto_azul" valign="middle">
				<td align="right" width="33%">
				<a href="/includes/ExcelListaProdutos.asp" target="_blank">
				<img border="0" src="../images/b_exportar_excel.gif" alt="Exportar lista de produtos para Excel" /></a></td>
				<td align="left">
					<a href="/includes/ExcelListaProdutos.asp" target="_blank">&nbsp;Exportar para excel</a>&nbsp;<a href="/includes/ExcelListaProdutosMailing.asp" target="_blank">.</a></td>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#E4E4E4">
				<tr class="Texto_azul" valign="middle" align="center">
					<td><img src="/images/stock_carro_on.gif" />&nbsp;Stock Disponivel</td>
					<td><img src="/images/stock_carro_breve.gif" />&nbsp;Brevemente diponivel - Contacte seu comercial.</td>
					<td><img src="/images/stock_carro_off.gif" />&nbsp;Sem Stock</td>
				</tr>
			</table>
		</td>
	</tr>
	<%End if%>
	</form>
</table>
<%End Function%>
<!--------------------------------------------------------------------------------->
<%Function CarroCompras%>
<table width="150" border="0" cellpadding="0" cellspacing="0" bgcolor="#F4F4F4">
  <tr>
    <td height="25" colspan="2" align="center" valign="middle" bgcolor="#C2C2A7">
		<img src="../images/carro4.gif" width="14" height="14" />
		<span class="Titulo_branco">Carro de Compras</span>
	</td>
  </tr>
  <tr>
    <td width="13" height="66">&nbsp;</td>
    <td width="137" valign="top" class="Texto_castanho">
	<strong> <br /><%AInt=cint(db.query(cstr("select isnull(Sum(quantidade),0) as total from View_Clientes_CarrinhoTemp where no=" & session("no")))("total"))%>
      Itens : <%=Aint%> <br />
  	  Total : <%=formatnumber(csng(db.query(cstr("select isnull(stotal,0) as Total from View_Clientes_CarrinhoTemp RIGHT OUTER JOIN (SELECT  " & session("no") & " AS X) AS a ON a.X = dbo.View_Clientes_CarrinhoTemp.No"))("total")),2)%>&nbsp;&euro;<br />
    </strong></td>
  </tr>
  <tr>
    <td height="29" colspan="2" valign="top" align="Center" class="Texto_Top1">
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
    <td height="8" colspan="2"></td>
  </tr>
  <tr>
    <td height="26" colspan="2" align="center" valign="middle">
	<img src="../images/telefone.gif" width="14" height="14" />
	<span class="Texto_castanho"><strong><%=db.query(cstr("select VendedorTelefone as total from WN_Clientes where no=" & session("no")))("total")%></strong></span></td>
  </tr>
  <tr>
    <td height="8" colspan="2"></td>
  </tr>
</table>
<%End Function%>
<!--------------------------------------------------------------------------------->
<%Function Bloco_Estatisticas%>
<table width="100%" cellpadding="0" cellspacing="0">
	<%if Session("ClienteON") Then%> 
		<tr><td><%=CarroCompras%></td></tr>
	<%End if%>
	<tr><td><%=Estatisticas("Mais vendidos (30 dias)","Texto_Top1","Select * from WN_STAT_Top10Vendas")%></td></tr>
	<tr><td><%=Estatisticas("Mais recentes","Texto_Top1","Select * from WN_STAT_Top10Novos")%></td></tr>
	<tr><td><%=Estatisticas("Mais procurados","Texto_Top1","Select * from WN_STAT_Top10Hits")%></td></tr>
</table>
<%End Function%>
<!--------------------------------------------------------------------------------->
<%
Function CalculaIndices(Campo, Top , Condicao , OrderBy ) 
Dim Valor : Valor = -1 'For�o a entrada no ciclo
Dim LocalMySQL : LocalMySQL="" 
 
    CINDICE = 1
	Indice(CINDICE)=-1
    Do While cint(Valor)<>0
	    LocalMySQL = "select isnull(max(" & Campo & "),0) as MAXIMO from "
        LocalMySQL = LocalMySQL & " (Select top " & Top & " " & Campo & " from WN_ListaProdutos Where 1=1 " & Condicao & " and " & Campo & ">" & CInt(Valor) & " " & OrderBy & ") a"
      
'	  	Teste(LocalMySQL)
	  
	    Valor = db.query(cstr(LocalMySQL))("Maximo")
		
		CINDICE=CINDICE+1
		Indice(CINDICE)=valor

	Loop
	CINDICE=CINDICE-2 'Retiro penultimo que aponta para o maior do final da lista e o ultimo que aponta para 0
End Function
%>
<!--------------------------------------------------------------------------------->
<%
Function ObtemIndices
Dim R : R=0
Dim CorteActual : CorteActual=cint(request.QueryString("Corte"))
Dim Texto : Texto=""
Dim QString : QString=cstr(request.QueryString)

	'Vou retirar da QString as variaveis para posteriormente as voltar a juntar
	QString=txt.RetiraQString("INDICE",cstr(request.QueryString))
	QString=txt.RetiraQString("CORTE",cstr(QString))
	
	iF CIndice>1 Then
		For r=1 to CINDICE
			if CorteActual<>r Then
				Texto=Texto & "<a href=?"& QString &"&INDICE=" & Indice(R) & "&CORTE=" & R & ">" & R &"</a>&nbsp; |&nbsp;&nbsp;"
			else
				Texto=Texto & "<span class=""titulo_laranja"">" & R &"</span>&nbsp;&nbsp;|&nbsp;&nbsp;"
			end if
		Next
		'No final retiro a ultima barrinha verfical
		If len(texto)>len("&nbsp;&nbsp;|") Then Texto=left(texto,len(texto)-len("&nbsp;&nbsp;|"))
	End if
	ObtemIndices=Texto
End Function
%>
<!--------------------------------------------------------------------------------->
<%
Function EnviaEmail(MailTo,CCto,BCCto,Subject,BodyTXT,BodyHTML)
Dim oSMTP  
  On Error Resume Next
  Set oSMTP = Server.CreateObject("OSSMTP.SMTPSession")

	'oSMTP.Server = "auth.ptasp.com"
	'oSMTP.AuthenticationType=2
	'oSMTP.username="alertas@minitel.pt"
	'oSMTP.Password="1aigola?5.frmpan"
	'oSMTP.Port = 465
	
	oSMTP.Server = "vds-837639.amen-pro.com"
	oSMTP.AuthenticationType=2
	oSMTP.Username="newsletter@vds-837639.amen-pro.com"
	oSMTP.Password="x8-4ZM"
	oSMTP.Port = 25
	
	'oSMTP.Server = "192.168.0.5"
	'oSMTP.AuthenticationType=0
	'oSMTP.username="it@minitel.pt"
	'oSMTP.Password="MinT2o11"
	'oSMTP.Port = 25
	'oSMTP.MailFrom = "it@minitel.pt"
	
	oSmtp.CodePage = 850
    oSmtp.Charset = "iso-8859-1"
	oSMTP.Importance=2
	'oSMTP.MailFrom = "WebMaster MINITEL <webmaster@minitel.pt>"
	oSMTP.MailFrom = "WebMaster MINITEL <webmaster@minitel.pt>"
  
    oSMTP.SendTo = MailTo
	If CCto<>"" Then
		oSMTP.CC="Revenda Minitel <revenda@minitel.pt> , "  & CCto
	Else
		oSMTP.CC="Revenda Minitel <revenda@minitel.pt>"
	End if
	
	oSMTP.BCC=BCCto
    oSMTP.MessageSubject = Subject
    if trim(BodyTXT) Then oSMTP.MessageText = BodyTXT
    if trim(BodyHTML) Then oSMTP.MessageHTML = BodyHTML
    oSMTP.RaiseError = True 'raise SMTP errors
    oSMTP.SendEmail
  If Err.Number <> 0 Then
    	EnviaEmail=Err.Number & ": " & Err.Description
  Else 
	   EnviaEmail=""
  End If 
	Set oSMTP = Nothing
End Function
%>
<!--------------------------------------------------------------------------------->
<%
Function EnviaEmail2(MailTo,CCto,BCCto,Subject,BodyTXT,BodyHTML)
Dim oSMTP  
  On Error Resume Next
  Set oSMTP = Server.CreateObject("OSSMTP.SMTPSession")

	oSMTP.Server = "auth.ptasp.com"
	oSMTP.AuthenticationType=2
	oSMTP.username="alertas@minitel.pt"
	oSMTP.Password="1aigola?5.frmpan"
	oSMTP.Port = 465
	oSmtp.CodePage = 850
    oSmtp.Charset = "iso-8859-1"
	oSMTP.Importance=2
	oSMTP.MailFrom = "WebMaster MINITEL <webmaster@minitel.pt>"
  
    oSMTP.SendTo = MailTo
	If CCto<>"" Then
		oSMTP.CC="Revenda Minitel <revenda@minitel.pt> , "  & CCto
	Else
		oSMTP.CC="Revenda Minitel <revenda@minitel.pt>"
	End if
	
	oSMTP.BCC=BCCto
    oSMTP.MessageSubject = Subject
    if trim(BodyTXT) Then oSMTP.MessageText = BodyTXT
    if trim(BodyHTML) Then oSMTP.MessageHTML = BodyHTML
    oSMTP.RaiseError = True 'raise SMTP errors
    oSMTP.SendEmail
  If Err.Number <> 0 Then
    	EnviaEmail=Err.Number & ": " & Err.Description
  Else 
	   EnviaEmail=""
  End If 
	Set oSMTP = Nothing

End Function
%>
<!--------------------------------------------------------------------------------->
<%
Function File2String(NomeFx)
Dim FS
Dim t
	set fs=Server.CreateObject("Scripting.FileSystemObject") 
	set t=fs.OpenTextFile(NomeFx,1,false)
	File2String=t.ReadAll
	t.close
End Function
%>
<!--------------------------------------------------------------------------------->
<%
Function ExisteFicheiro(NomeFX)
Dim objFSO
		Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
		ExisteFicheiro=objFSO.FileExists("D:\Websites" & NomeFX)
'		ExisteFicheiro=objFSO.FileExists(server.MapPath(NomeFX))
Set objFSO=nothing
End Function
%>
<!--------------------------------------------------------------------------------->
<%
Function Teste(Texto)
	response.Write("<br/><strong><font color=""#FF0000"">TESTE :</FONT>" & Texto & "</strong><br/>")
	response.Flush()
End Function
%>
<!--------------------------------------------------------------------------------->
<%
Function URLDecode(sConvert)
    Dim aSplit
    Dim sOutput
    Dim I
    If IsNull(sConvert) Then
       URLDecode = ""
       Exit Function
    End If
	
    ' convert all pluses to spaces
    sOutput = REPLACE(sConvert, "+", " ")
	
    ' next convert %hexdigits to the character
    aSplit = Split(sOutput, "%")
	
    If IsArray(aSplit) Then
      sOutput = aSplit(0)
      For I = 0 to UBound(aSplit) - 1
        sOutput = sOutput & _
          Chr("&H" & Left(aSplit(i + 1), 2)) &_
          Right(aSplit(i + 1), Len(aSplit(i + 1)) - 2)
      Next
    End If
	
    URLDecode = sOutput
End Function
%>
<!--------------------------------------------------------------------------------->
<% 
Function Get_ClienteColaboradorPodeFazer(NomeDoCampo)
Get_ClienteColaboradorPodeFazer=True

If session("Clientes_ColaboradoresID")=-1 or session("Clientes_ColaboradoresID")="" Then
	Get_ClienteColaboradorPodeFazer=True
Else
	Dim MySQL
	MySQL="select " + trim(NomeDoCampo) + " as SAIDA FROM [WebSiteMINITEL].[dbo].[WN_Clientes_Colaboradores] where Clientes_ColaboradoresID=" & Session("Clientes_ColaboradoresID")
	Get_ClienteColaboradorPodeFazer=db.query(cstr(MySQL))("SAIDA")
End if
End Function
%>
<!--------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------->
