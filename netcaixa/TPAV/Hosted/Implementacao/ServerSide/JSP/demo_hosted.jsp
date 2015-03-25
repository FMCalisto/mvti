<%
/**
 * 
 * Author Caixatec
 * Version 1.0 - 2013/09
 *    
 * Copyright Caixatec 
 * 
 * Este c�digo foi desenvolvido pela (...) Caixatec - Tecnologias de Comunica��o SA (http://www.caixatec.pt), sendo sua propriedade.
 * A sua finalidade foi a de explorar a implementa��o t�cnica da solu��o TPAV Hosted da netcaixa Online (http://www.netcaixa.pt) e criar um template 
 * que possa servir de base de trabalho aos clientes Netcaixa.
 * 
 * A Caixatec autoriza o uso gratuito deste c�digo, sem exclusividade, o qual pode ser modificado para que se adeq�e � necessidade de integra��o deste sistema
 * de pagamento num determinado site. Quando utilizado, esta nota deve estar presente indicando a proveni�ncia do c�digo original, sendo acrescentada uma 
 * adenda a especificar resumidamente as modifica��es eventualmente realizadas.
 * 
 * A Caixatec n�o garante a correcta execu��o deste c�digo, devendo o mesmo ser testado exaustivamente a fim de prevenir poss�veis falhas ou discrep�ncias de 
 * conformidade com requisitos SIBS, nomeadamente decorrentes de altera��es t�cnicas do sistema e/ou procedimentos de pagamento.
 * 
 * A Caixatec declina quaisquer responsabilidades relativamente a anomalias, incorrec��es ou preju�zos que decorram do uso deste c�digo.
 * 
 * Para esclarecimentos t�cnicos contactar netcaixa@caixatec.pt
*/
%>
 
<%
	// Vari�veis necess�rias para efectuar o pagamento
	int intA105 = 9782; // Moeda da Opera��o
	String strC012 = ""; // URL da p�gina de confirma��o da encomenda

	String strResposta = null; 
	try{
		strResposta = request.getParameter("resp");
	}catch(Exception e){}
%>

<html>
	<head>
		<title>Hosted</title>
	</head>
	
	<body>
		<h2>
			Compra hosted (Vers�o JSP)
		</h2>
		
		<form id="formPag" name="formPag" method="get" style="margin:0px;" action="/demo_hosted_pay.jsp">
			<input type="hidden" id="A105" name="A105" value="<%=intA105%>">
			<input type="hidden" id="C012" name="C012" value="<%=strC012%>">
			
			<div style="float:left; width:250px;">
				Refer�ncia de pagamento
			</div>
			<div style="float:left;">
				<input type="text" id="C007" name="C007" value="">
			</div>
			<br clear="all"/><br/>
			
			<div style="float:left; width:250px;">
				Montante
			</div>
			<div style="float:left;">
				<input type="text" id="A061" name="A061" value="">
			</div>
			<br clear="all"/><br/>
			
			<div style="float:left; width:250px;">
				N� Cart�o
			</div>
			<div style="float:left;">
				<input type="text" id="C003" name="C003" value="">
			</div>
			<br clear="all"/><br/>
			
			<div style="float:left; width:250px;">
				Validade
			</div>
			<div style="float:left;">
				<input type="text" id="C004" name="C004" value="">
			</div>
			<br clear="all"/><br/>
			
			<div style="float:left; width:250px;">
				CVV
			</div>
			<div style="float:left;">
				<input type="text" id="C005" name="C005" value="">
			</div>
			<br clear="all"/><br/>
			
			<div style="padding-left: 330px;">
				<input type="submit" value="Submit">
			</div>
			
			<%if(strResposta != null && strResposta.equals("true")){ %>
				<br/>
				<div style="color:green;">
					<b>Opera��o realizada com sucesso!</b>
				</div>
			<%}else if(strResposta != null && strResposta.equals("false")){ %>
				<br/>
				<div style="color:red;">
					<b>Opera��o n�o realizada!</b>
				</div>
			<%} %>
		</form>
	</body>
</html>