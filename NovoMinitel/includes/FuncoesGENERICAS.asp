<!--Inicio : FuncoesGenericas.asp-->
<%
'***************************************************************************************
Function RandomBanner(caminho,ext)
Randomize
Dim lista(100)
Dim I : I=0

	 ext=ucase(ext)
     dim fs, folder, item

     set fs = CreateObject("Scripting.FileSystemObject")
     set folder = fs.GetFolder(Server.MapPath(caminho))

	REM Capturo a lista de ficheiros para um array
	
     for each item in folder.Files
	 	if ucase(right(item.path,4))=ext Then
			i=i+1
			lista(i)=right(item.path,len(item.path)-InStrRev(item.path,"\",-1,1)) 
	   	End if
     next

	REM Vou escolher um random elemento da lista
	I=int((i*rnd)+1)
	RandomBanner=caminho+lista(I)
	Set fs=nothing
	Set folder=nothing
end function
'*********************************************************************************************
Function DataEUA(ValorIN)
	if isdate(ValorIN) Then	
		'DataEUA=month(ValorIN) & "/" & day(ValorIN) & "/" & year(ValorIN) 
		DataEUA=year(ValorIN) & "-" & month(ValorIN) & "-" & day(ValorIN) & " 00:00:00.000"
	else
		DataEUA=""
	end if
End Function
'***************************************************************************************
Function SetasOrdenacao(ID,ID_IN,Sentido)
Dim TXMenu(2,2)
Dim r

TXMenu(1,1)="Ordenação ascendente"
TXMenu(2,1)="Ordenação descendente"

TXMenu(1,2)="Ordenacion ascendiente"
TXMenu(2,2)="Ordenacion descendiente"


Dim SetaUP : SetaUP=""
Dim SetaDOWN : SetaDOWN=""
Dim QString : QString=""

if cstr(ID)=ID_IN Then
	If Sentido="UP" then
		SetaUP="/Images/ascedente_on.gif"
		SetaDOWN="/Images/descendente_off.gif"
	End IF
	If Sentido="DOWN" then
		SetaUP="/Images/ascedente_off.gif"
		SetaDOWN="/Images/descendente_on.gif"
	End IF
Else
	SetaUP="/Images/ascedente_off.gif"
	SetaDOWN="/Images/descendente_off.gif"
End if

'Tenho de Reconstruir a querystring

if Request.QueryString("Filtros")<>"" Then
	QString=QString & "&Filtros=" & Request.QueryString("Filtros")
End if

if Request.QueryString("Dir")<>"" Then
	'QString=QString & "&Dir=" & Request.QueryString("Dir")
End if


if Request.QueryString("Val")<>"" Then
	'QString=QString & "&Val=" & Request.QueryString("Val")
End if


if Request.QueryString("MARCA")<>"" Then
	QString=QString & "&MARCA=" & Request.QueryString("MARCA")
End if

if Request.QueryString("CATEGORIA")<>"" Then
	QString=QString & "&CATEGORIA=" & Request.QueryString("CATEGORIA")
End if

if Request.QueryString("REF")<>"" Then
	QString=QString & "&REF=" & Request.QueryString("REF")
	QString=QString & "&Origem=" & Request.QueryString("Origem")
End if
%>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<a href="?Sentido=UP&ID=<%=ID&QString%>">
					<img src="<%=SetaUP%>" border="0" title="<%=TXMenu(1,Session("Lingua"))%>">
				</a>
			</td>
			<td>
				<a href="?Sentido=DOWN&ID=<%=ID&QString%>">
					<img src="<%=SetaDown%>" border="0" title="<%=TXMenu(2,Session("Lingua"))%>">
				</a>
			</td>
		</tr>
	</table>
<%
End Function
'***************************************************************************************
Function IsLocal
	IsLocal=instr(request.ServerVariables("REMOTE_ADDR"),"192.168.0")>0
End Function
'***************************************************************************************
Function Teste(ValorIn)
	If IsLocal Then
		response.Write(ValorIN & "<br>")
	End if
End Function
'***************************************************************************************
Function DesenhaActivo(Condicao)
If Condicao Then
	%><img src="/Images/access.gif" border="0"><%
Else
	%><img src="Images/block.gif" border="0"><%
End if
End Function
'***************************************************************************************
Function GetImage(NomeImagem)
Dim Caminho
	If Session("Lingua")=1 Then
		Caminho="/Images/"
	Else
		If Session("Lingua")=2 Then
			Caminho="/ImagesE/"
		Else
			Caminho="/Images/"
		End if
	End if
	GetImage=Caminho & NomeImagem
End Function
'***************************************************************************************
Function AlinhaPalavra(ValorIn,Tamanho,Direccao)
Dim R : R=0
Dim TextoOut : TextoOut=""

	ValorIN=Trim(ValorIN)

	If Len(ValorIn)>=Tamanho Then
		TextoOut=ValorIn
	Else
		For R=1 to Tamanho-Len(ValorIn)
			TextoOut=TextoOut & " "
		Next 'r
		If Ucase(Direccao)="L" Then TextoOut=ValorIN & TextoOut
		If Ucase(Direccao)="R" Then TextoOut=TextoOut & ValorIN
	End if
	AlinhaPalavra=TextoOut
End Function
'***************************************************************************************
Function AntiSpy
	If Session("Activo")<>1 and Session("Activo")<>100 Then Response.Redirect("/includes/LoginOut.asp")
End Function
'**************************************************************************************
'Verifica se um Determinado Ficheiro exite em Disco e retorna True/False 
'Rui Fernandes 11 de Fevereiro 2005
Function ExisteFicheiro(NomeFX)
Dim objFSO
		Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
		'ExisteFicheiro=objFSO.FileExists("x:\RuiFernandes\Meus Documentos\NovoSite\" & NomeFX)
		ExisteFicheiro=objFSO.FileExists("D:\Websites" & NomeFX)
Set objFSO=nothing
End Function
'**************************************************************************************
'Escreve um linha com os dados do cliente incluido os icons que mostram ou nao se tem dados
'Rui Fernandes 11 de Fevereiro 2005
Function DadosDoCliente(Nome,Localidade,Telefone,Fax,URL,Email)

'Variaveis que guardarao o nome da imagem a aparecer, caso exista ou informacao para o item
Dim ITelefone
Dim IFax
Dim IUrl
Dim IEmail 

Nome=Trim(Nome)
Localidade=Trim(Localidade)

Telefone="Telefone : " & Trim(Telefone)
if Telefone<>"" Then 
	ITelefone="<img border=""0"" src=""" & GetImage("telefone.jpg") & """ title=""" & Telefone & """>"
Else
	ITelefone="<img border=""0"" src=""" & GetImage("telefone_off.jpg") & """ title=""?"">"
End if

Fax="FAX : " & Trim(Fax)
if Fax<>"" Then 
	IFax="<img border=""0"" src=""" & GetImage("fax.jpg") & """ title=""" & FAX & """>"
Else 
	IFax="<img border=""0"" src=""" & GetImage("fax_off.jpg") & """ title=""?"">"
End if

URL=Trim(URL)
if URL<>"" Then 
	IUrl="<a href=""Http://" & Url & """ target=""_new""><img border=""0"" src=""" & GetImage("url.jpg") & """></a>"
Else 
	IUrl="<img border=""0"" src=""" & GetImage("url_off.jpg") & """ title=""?"">"
End if

Email=Trim(Email)
if Email<>"" Then 
	IEmail="<a href=""mailto:" & Email & """ target=""_self""><img border=""0"" src=""" & GetImage("email.jpg") & """></a>"
Else 
	IEmail="<img border=""0"" src=""" & GetImage("email_off.jpg") & """ title=""?"">"
End if
%>
<tr align="center" valign="middle" class="texto_corrente">
	<td align="left"><%=Nome%></td>
	<td><%=Localidade%></td>
	<td><%=ITelefone%></td>
	<td><%=IFax%></td>
	<td><%=IUrl%></td>
	<td><%=IEmail%></td>
</tr>
<%
End Function
'**************************************************************************************
'Grava as paginas que estão a ser vistas, que marcas são consultadas, quando, etc
'Rui Fernandes 15 de Fevereiro 2005
Function GravaEvento(Pagina)
  if instr(request.ServerVariables("REMOTE_ADDR"),"192.168")=0 Then 
  if instr(request.ServerVariables("REMOTE_ADDR"),"213.58.110.102")=0 Then 
	MySQL="RegistoEventosSite;"
	Dim Origem
	if session("Lingua")=1 Then
		Origem="P"
	Else
	 if session("Lingua")=2 Then
		Origem="E"
	 end if
	End if 
		
	MySQL="INSERT INTO [WebMinitel].[dbo].[RegistoEventosSite] (Evento,Marca,Categoria,Referencia,CodigoCliente,Origem) VALUES"
	MySQL=MySQL & " ('"& Trim(Pagina) &"','"& trim(Request.QueryString("Marca")) &"','"& trim(Request.QueryString("Categoria")) &"','"& trim(Request.QueryString("Ref")) &"','"& Session("Login") &"','"& Origem  &"');"
	
	Call ExecutaMySQL(MySQL)
 End if
 End if
End Function
'***************************************************************************************
Function ExecutaMySQL(MySQL)
Dim LocalRS
 teste(MySQL)
 Set LocalRS=Server.CreateObject("ADODB.Recordset")
 	LocalRS.open (MySQL),ConnObj,3,3
 Set LocalRS=Nothing
End Function
'***************************************************************************************
Function GravaLogIn(Nome_ID)
   Call ExecutaMySQL("insert into UtilizadoresLogs (Nome,IPAddress) Values ('" & Nome_ID &  "','" & Request.ServerVariables("REMOTE_ADDR") &  "')")
End Function
'***************************************************************************************
Function ActualizaUltimaEntradaColaborador(iID)
	Call ExecutaMySQL("Update ClienteColaboradores Set UltimaEntrada=Getdate() from ClienteColaboradores where ClienteColaboradoresID=" & iID) 
	Call ExecutaMySQL("Update ClienteColaboradores Set NEntradas=NEntradas+1 from ClienteColaboradores where ClienteColaboradoresID=" & iID)
End Function
'***************************************************************************************
Function Existe(ValorIN)
	If IsNull(ValorIN) Then 
		If Session("Lingua")=1 Then
			Existe="<B>Não definido</B>"
		Else
			Existe="<B>No definido</B>"
		End if
	Else
		If trim(ValorIN)="" Then
			If Session("Lingua")=1 Then
				Existe="<B>Não definido</B>"
			Else
				Existe="<B>No definido</B>"
			End if
		Else
			Existe=ValorIN
		End If
	End if
End Function
'***************************************************************************************
Function Vazio(ValorIN)
	Vazio=trim(ValorIN)=""
End Function
'***************************************************************************************
'Isto só funciona desde SRVWEB
Function EnviaEmail_DESACTIVADA(MailNome,MailTo,CCNome,CCto,BCCTo,Subject,Body)
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


  oSMTP.SendTo = MailNome + " " + MailTo

  oSMTP.MessageSubject = Subject
  oSMTP.MessageText = Body
  
  oSMTP.CC = CCNome + " " + CCto

  if BCCTo="FINANCEIRO" Then
			'Mailer.AddBCC "Silvia Ramos","silvia.ramos@minitel.pt"
			'Mailer.AddBCC "Cristina Melo","Cristina.Melo@minitel.pt"
			'Mailer.AddBCC "Carlos Marques","carlos.marques@minitel.pt"
			'Mailer.AddBCC "Carla Henriques","carla.henriques@minitel.pt"
			oSMTP.BCC "Financeiro <alertas.encomendas@minitel.pt>"
  End if
 
  
  oSMTP.RaiseError = True 'raise SMTP errors
  oSMTP.SendEmail
  If Err.Number <> 0 Then
    	EnviaEmail=Err.Number & ": " & Err.Description
  Else 
	   EnviaEmail=""
  End If 
End Function
'***************************************************************************************
'Altera a password do utilizador na base de dados
Function MudaPass(ICodCliente,IPass,Tipo)
Dim MySQl
Dim LocalRS
	Set LocalRS=Server.CreateObject("ADODB.Recordset")
	If Tipo<>"COLABORADOR"  Then
			MySQL ="SELECT * FROM Utilizadores WHERE (Nome='" & ICodCliente & "');"
			LocalRS.open mysql,connobj,3,3
			if not (LocalRS.eof) Then
				LocalRS("Password")=IPass
				LocalRS("DataAlteracao")=Now()
				LocalRS.update
			Else
				LocalRS.Addnew
				LocalRS("Nome")=ICodCliente
				LocalRS("Password")=IPass
				LocalRS("DataAlteracao")=Now()
				LocalRS("Tipo")=trim(Tipo)
				LocalRS.update
			End if
			LocalRS.close
	Else
			Call ExecutaMySQL ("Update ClienteColaboradores Set ColaboradorPassword='" & IPass & "' FROM ClienteColaboradores WHERE (ClienteColaboradoresID='" & ICodCliente & "');")
	End if
	set LocalRS=nothing
End Function
'***************************************************************************************
Function AbsTXT(ValorIN)
	If IsNull(ValorIN) Then
		AbsTXT="" 
	Else
		AbsTXT=ucase(trim(ValorIN))
	End if
End Function
'***************************************************************************************
Function Passo(Nivel)
%>
	<p align="center">
<table width="100%" cellpadding="0" cellspacing="0">
		<tr align="center">
			<td><img src="<%=GetImage("passo_" & Nivel & ".jpg" )%>" border="0" alt="Passo <%=Nivel%>"></td>
		</tr>
</table>
	</p>
<%
End Function
'***************************************************************************************
Function CarrinhoRevenda(Referencia,Marca,Categoria,Titulo,Imagem,Preco,QQCarrinho)
%>
	<table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#F0F0F0">
		<tr>
			<td colspan="2" align="center" valign="middle" colpan="2" class="titulos1"><p title="<%=Titulo%>"><%response.write(left(Titulo,30)) : if len(Titulo)>30 Then response.write("...")%></p></td>
		</tr>
		<tr>
			<td rowspan="2" align="center"><a class="link" href="ProdutoFicha.asp?Ref=<%=Referencia%>&Marca=<%=Marca%>&Categoria=<%=Categoria%>" target="_self"><img src="<%=Imagem%>" width="70" height="70" border="0"></a></td>
			<td align="center"><a class="link" href="ProdutoFicha.asp?Ref=<%=Referencia%>&Marca=<%=Marca%>&Categoria=<%=Categoria%>" target="_self"><%=Referencia%></a></td>
		</tr>
		<tr>
			<%
			  Dim IImagem
			  if QQCarrinho=0 Then 
				QQCarrinho=""
				IImagem=GetImage("Carro5.gif")
				Texto="Colocar no carrinho"
			  Else
				IImagem=GetImage("Carro_actualizar.gif")
				Texto="Actualizar valor"
			  End if
			%>
			<form action="/includes/CarrinhoProdutoAdd.asp" method="post">
			<td  width="50%" align="center" valign="middle" bgcolor="<%=cor%>">
					<p class="titulos1"><%=FormatNumber(Preco,2) & "€"%><br>
					<input name="Quantidade" size="2" maxlength="2" class="ComboBOX" align="middle" value="<%=QQCarrinho%>">
					<input type="image" src="<%=IImagem%>" onClick="FormRef.Submit" alt="<%=Texto%>">
					<input type="hidden" name="Referencia" value="<%=Referencia%>">
					<input type="hidden" name="link" value="">
					<input type="hidden" name="origem" value="/Index.asp">
					</p>
			</td>
			</form>
		</tr>
	</table>
	<%
End Function
'***************************************************************************************
Function GetReversePassword(ValorIN)
Dim R : R=0
Dim TextoOut : TextoOut=""
Dim Letra : Letra=""
Dim OLetra : OLetra=0
	For r=1 to Len(ValorIN)
		Letra=Mid(ValorIN,r,1)
		OLetra=asc(Letra)+169
		TextoOut=TextoOut & OLetra 
	Next
	GetReversePassword=TextoOut 
End Function
'***************************************************************************************
Function GetOutLoginLink (UserName,PassWord)
	if Trim(PassWord)<>"" Then
		if session("Lingua")=1 Then
			GetOutLoginLink="http://www.minitel.pt/LoginRunDirect.asp?UserName=" & UserName & "&UserPass=" & GetReversePassword(abstxt(PassWord))
		Else
			GetOutLoginLink="http://www.minitel.es/LoginRunDirect.asp?UserName=" & UserName & "&UserPass=" & GetReversePassword(abstxt(PassWord))
		End if
	Else
		GetOutLoginLink=""
	End if
End Function
'***************************************************************************************
Function Titulo(Numero)
Dim TextoOut(30)

	If Session("Lingua")=1 Then
				TextoOut(01)="MINITEL Lda."
				TextoOut(02)="MINITEL Lda. - Apoio a clientes"
				TextoOut(03)="MINITEL Lda. - Artigos de Imprensa"
				TextoOut(04)="MINITEL Lda. - Assitencia Técnica"
				TextoOut(05)="MINITEL Lda. - Carrinho de Compras"
				TextoOut(06)="MINITEL Lda. - Encomendas Pendentes"
				TextoOut(07)="MINITEL Lda. - Eventos"
				TextoOut(08)="MINITEL Lda. - International Visitors"
				TextoOut(09)="MINITEL Lda. - Solicitar Palavra-passe"
				TextoOut(10)="MINITEL Lda. - Meus Dados..."
				TextoOut(11)="MINITEL Lda. - Alteração de Palavra-passe"
				TextoOut(12)="MINITEL Lda. - Novidades"
				TextoOut(13)="MINITEL Lda. - Onde comprar"
				TextoOut(14)="MINITEL Lda. - Ficha do produto"
				TextoOut(15)="MINITEL Lda. - Lista de produtos"
				TextoOut(16)="MINITEL Lda. - Promoções"
				TextoOut(17)="MINITEL Lda. - Solicitar Palavra-passe"
				TextoOut(18)="MINITEL Lda. - Ultimos Documentos"
				TextoOut(19)="MINITEL Lda. - Quem somos"
				TextoOut(20)="MINITEL Lda. - Colaborador (Meus dados...)"
				Titulo=TextoOut(Numero)
		Else
		If Session("Lingua")=2 Then
				TextoOut(01)="MINITEL España"
				TextoOut(02)="MINITEL España - Apoyo a clientes"
				TextoOut(03)="MINITEL España - Artículos en Prensa"
				TextoOut(04)="MINITEL España - Asistencia Técnica"
				TextoOut(05)="MINITEL España - Cesto de Compra"
				TextoOut(06)="MINITEL España - Pedidos pendientes"
				TextoOut(07)="MINITEL España - Eventos"
				TextoOut(08)="MINITEL España - Visitantes Internacionales"
				TextoOut(09)="MINITEL España - Solicitar password"
				TextoOut(10)="MINITEL España - Mis Datos ..."
				TextoOut(11)="MINITEL España - Alteración de la password"
				TextoOut(12)="MINITEL España - Novedades"
				TextoOut(13)="MINITEL España - Donde Comprar"
				TextoOut(14)="MINITEL España - Ficha de productos"
				TextoOut(15)="MINITEL España - Lista de Productos"
				TextoOut(16)="MINITEL España - Promociones"
				TextoOut(17)="MINITEL España - Solicitar password"
				TextoOut(18)="MINITEL España - Últimos Documentos"
				TextoOut(19)="MINITEL España - Quienes somos"
				TextoOut(20)="MINITEL España - Mis datos"
				Titulo=TextoOut(Numero)
		End if
	End if
End Function
'***************************************************************************************
Function DataTuga (ValorIN)
Dim Dia
Dim Mes
Dim TMes(12,2)
Dim Ano

	TMes(01,1)="Janeiro"
	TMes(02,1)="Fevereiro"
	TMes(03,1)="Março"
	TMes(04,1)="Abril"
	TMes(05,1)="Maio"
	TMes(06,1)="Junho"
	TMes(07,1)="Julho"
	TMes(08,1)="Agosto"
	TMes(09,1)="Setembro"
	TMes(10,1)="Outubro"
	TMes(11,1)="Novembro"
	TMes(12,1)="Dezembro"

	TMes(01,2)="Enero"
	TMes(02,2)="Febrero"
	TMes(03,2)="Marzo"
	TMes(04,2)="Abril"
	TMes(05,2)="Mayo"
	TMes(06,2)="Junio"
	TMes(07,2)="Julio"
	TMes(08,2)="Agosto"
	TMes(09,2)="Setembro"
	TMes(10,2)="Octubre"
	TMes(11,2)="Noviembre"
	TMes(12,2)="Diciembre"

	Dia=Day(ValorIN)
	Mes=TMes(Month(ValorIN),Session("Lingua"))
	Ano=Year(ValorIN)
	
	DataTuga=Dia & " de " & Mes & " de " & Ano
	
End Function
'*********************************************************************************************
function label(texto,variavel,tamanho)
	if texto<>"" Then response.Write(texto & " : ")
	%>
	<input type="text" name="<%=variavel%>" value="" size="<%=tamanho%>">
	<%
End function
'*********************************************************************************************
Function input(texto,variavel,valor,tamanho)
	valor=trim(valor)
	if texto<>"" Then response.Write("<span class=""Texto_Corrente"">"& texto & "</span>")
	%>
	<input class="ComboBOX" type="text" name="<%=variavel%>" value="<%=valor%>" size="<%=tamanho+3%>" maxlength="<%=tamanho%>">
	<%
End Function
'*********************************************************************************************
Function check(texto,variavel,valor,ValorIN)
	%>
	<input type="checkbox" name="<%=variavel%>" value="<%=valor%>" <%if ValorIN=Valor Then response.Write("checked")%>>
	<%
	if texto<>"" Then response.Write("<span class=""Texto_Corrente"">"& texto & "</span>")
End Function
'*********************************************************************************************
Function radio(texto,variavel,valor)
Dim X
	if valor then x="checked" else X=""
	%>
	<input type="radio" name="<%=variavel%>" value="<%=valor%>" <%=X%>>
	<%
	if texto<>"" Then response.Write("<span class=""Texto_Corrente"">"& texto & "</span>")
End Function
'*********************************************************************************************
Function radio2(texto,variavel,valor,valorin)
Dim X
	if valor=valorin then x="checked" else X=""
	%>
	<input type="radio" name="<%=variavel%>" value="<%=valorin%>" <%=X%>>
	<%
	if texto<>"" Then response.Write("<span class=""Texto_Corrente"">"& texto & "</span>")
End Function
'*********************************************************************************************
Function ComboBOXSite (Texto,ValorIN)
ValorIN=ucase(trim(ValorIN))
	%>
		<%=Texto%><select name="SITE" class="ComboBOX">
		<option value="P" <%if ValorIN="P" Then response.Write("selected")%>>P</option>
		<option value="E" <%if ValorIN="E" Then response.Write("selected")%>>E</option>
		</select>
	<%
End Function
'*********************************************************************************************
Function CBoolean(Valor)
	If Ucase(Cstr(Valor))="TRUE" Then
		CBoolean=1
	Else
		If Ucase(Cstr(Valor))="FALSE" Then 
			CBoolean=0
		Else
			CBoolean=0
		end if		
	End if
End Function
'*********************************************************************************************
Function ComboBOXRef(Texto,RefIn,Site)
Dim MySQL
Dim LocalRS

	Set LocalRS=Server.CreateObject("ADODB.Recordset")
	
	RefIn=Trim(ucase(RefIn))
	If Site<>"TODOS" Then
		MySQL="select referencia from WN_ListaProdutosT where tipo='" & Site & "' order by 1"
	Else
		MySQL="select Distinct referencia from WN_ListaProdutosT order by 1"
	End if
	
	LocalRS.Open MySQL,ConnObj,1,1
	%>
		<span class="Texto_Corrente"><%=Texto%></span><select name="Referencia" class="ComboBOX">
		<%
		Do While not LocalRS.Eof
		%>
			<option value="<%=trim(LocalRS("referencia"))%>" <%if RefIn=ucase(trim(LocalRS("referencia"))) Then response.Write("selected")%>><%=trim(LocalRS("referencia"))%></option>
		<%
			LocalRS.MoveNext
		Loop%>
		</select>
	<%
	LocalRS.Close
	Set LocalRS=Nothing
End Function
'*********************************************************************************************
Function Filtros(ValorIN)
Dim XMenu(4,2)
   XMenu(1,1)="Todos"
   XMenu(2,1)="Com Stock"
   XMenu(3,1)="Sem Stock"
   XMenu(4,1)="Brevemente"



   XMenu(1,2)="Todos"
   XMenu(2,2)="Com Stock"
   XMenu(3,2)="Sin Stock"
   XMenu(4,2)="Brevemente"



Dim Sel : Sel=""

If IsNumeric(ValorIN) Then 
	ValorIN=Cint(ValorIN)
Else
	ValorIN=1
End if


%>
<form action="" method="GET" name="FormFiltro">
<table width="650" cellpadding="0" cellspacing="0" class="Letra_Menu">
<tr align="center">
	<td>Listar :
		<select name="Filtros" onchange="this.form.submit();" class="ComboBOX">
		<%For r=1 to 4
			If R=ValorIn Then 
				Sel="Selected"
			Else
				Sel=""
			End if
		%>
			<option value="<%=R%>" <%=Sel%>><%=XMenu(R,Session("Lingua"))%></option>
		<%Next %>
		</select>
	</td>
</tr>
</table>
<%if Request.QueryString("MARCA")<>"" Then%>
	<input type="hidden" name="MARCA" value="<%=Request.QueryString("MARCA")%>">
<%End if%>

<%if Request.QueryString("CATEGORIA")<>"" Then%>
	<input type="hidden" name="CATEGORIA" value="<%=Request.QueryString("CATEGORIA")%>">
<%End if%>

<%if Request.QueryString("REF")<>"" Then%>
	<input type="hidden" name="REF" value="<%=Request.QueryString("REF")%>">
	<input type="hidden" name="Origem" value="<%=Request.QueryString("Origem")%>">
<%End if%>
</form>
<%	
End Function
'*********************************************************************************************
'2006.01.05
Function ColaboradorPode(ColaboradorID,Opcao)
Dim LocalRS
 if ColaboradorID="" and Session("Login")<>"" Then 
 	ColaboradorPode=True
 Else
	 Set LocalRS=Server.CreateObject("ADODB.Recordset")
	 LocalRS.Open ("select Saida=case " & Opcao & " when 1 Then 'TRUE' else 'FALSE' end from ClienteColaboradores where ClienteColaboradoresID=" & ColaboradorID & " and activo=1"),ConnObj,1,1
		ColaboradorPode=False
		If Not LocalRS.eof Then
			ColaboradorPode=LocalRS("Saida")="TRUE"
		End if
	 LocalRS.Close
 End if
End Function
'*********************************************************************************************
'2006.01.04
Function SimNao(ValorIn)
		valorIn=UCASE(ValorIn)
		if valorin="1" Then
			SimNao=" SIM "
		else
			SimNao=" NÃO "
		End if
End Function
'*********************************************************************************************
Function DataIngles (iData)
	DataIngles=month(iData) & "/" & day(iData) & "/" & year(iData)
End Function
%>
<!--Fim : FuncoesGenericas.asp-->
