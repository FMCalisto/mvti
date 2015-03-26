<%
	Option Explicit
	Dim TXT
	Set TXT = Server.CreateObject("Interface_min.TXT")
	Dim db
	Set db = Server.CreateObject("Interface_min.db")
	Dim MySQL : MySQL=""
	Dim Conteudo : Conteudo=False
	
    Dim Cat1QS : Cat1QS=0
	Dim Cat2QS : Cat2QS=0
	Dim Cat3QS : Cat3QS=0
	Dim FabricanteID : FabricanteID=0
	Dim ProdutoID : ProdutoID=""
	
	Dim item

	Dim ATxt : ATxt=""
	Dim BTxt : BTxt=""
	Dim CTxt : CTxt=""
	Dim DTxt : DTxt=""

	Dim AInt : AInt=0
	Dim BInt : BInt=0
	Dim DInt : DInt=0
	Dim EInt : EInt=0
	
	Dim ABoo : ABoo=False
	Dim BBoo : BBoo=False
	
	
	Dim ListaProdutos ' Usado na lista de produtos
	Dim Letras 'Usado na lista de clientes dos comerciais
	Dim Clientes 'Usado para listar clientes do comercial

	Dim OP

	Dim Indice(200) : Indice(0)=0
	Dim CIndice :CIndice =0
	Dim CampoDeOrdenacao : CampoDeOrdenacao=""
	Dim StringParaListaDeProdutos : StringParaListaDeProdutos=""

	session.lcid=1046 ' Formato portugues da data
	session.Timeout=1440
	Server.ScriptTimeout=1440

	
	' FICA APENAS PARA REFERENCIA Р SUA EXITENCIA
	'Session("TXT")=""
	'Session("INT")=0

	'Todas estas variaveis de sessao sao activadas em Do_login_Run.ASP
	if not isnumeric(Session("no")) Then Session("no")=0
	'Session("no")=cint(Session("no"))
	
	'Session("Admin")=0
	'Session("colaborador")=trim(request.Form("colaborador"))
	'Session("vendedornumero")=db.Query(cstr(mysql))("vendedornumero")
	'Session("ClienteON")=True
	'Session("ComercialON")=True
    'Session("ProcessoCompra")=True 'Serve para controlar o processo de compra e navegaчуo. 'Session("Comercial")=right(trim(request.Form("colaborador")),len(trim(request.Form("colaborador")))-1)
	'Session("QueryString")="" 'Para poder voltar atras qdo navega no carrinho de compras
	' Session("MySQL") 'USADA NA LISTA de Produtos para Excel
	' session("Clientes_ColaboradoresID")=0 'Guardo o ID do colaborador 
%>