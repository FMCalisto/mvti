<%
/**
 * 
 * Author Caixatec
 * Version 1.0 - 2013/09
 *    
 * Copyright Caixatec 
 * 
 * Este código foi desenvolvido pela (...) Caixatec - Tecnologias de Comunicação SA (http://www.caixatec.pt), sendo sua propriedade.
 * A sua finalidade foi a de explorar a implementação técnica da solução TPAV Hosted da netcaixa Online (http://www.netcaixa.pt) e criar um template 
 * que possa servir de base de trabalho aos clientes Netcaixa.
 * 
 * A Caixatec autoriza o uso gratuito deste código, sem exclusividade, o qual pode ser modificado para que se adeqúe à necessidade de integração deste sistema
 * de pagamento num determinado site. Quando utilizado, esta nota deve estar presente indicando a proveniência do código original, sendo acrescentada uma 
 * adenda a especificar resumidamente as modificações eventualmente realizadas.
 * 
 * A Caixatec não garante a correcta execução deste código, devendo o mesmo ser testado exaustivamente a fim de prevenir possíveis falhas ou discrepâncias de 
 * conformidade com requisitos SIBS, nomeadamente decorrentes de alterações técnicas do sistema e/ou procedimentos de pagamento.
 * 
 * A Caixatec declina quaisquer responsabilidades relativamente a anomalias, incorrecções ou prejuízos que decorram do uso deste código.
 * 
 * Para esclarecimentos técnicos contactar netcaixa@caixatec.pt
*/
%>
 
<%
	// Variáveis necessárias para efectuar o pagamento
	int intA105 = 9782; // Moeda da Operação
	String strC012 = ""; // URL da página de confirmação da encomenda

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
			Compra hosted (Versão JSP)
		</h2>
		
		<form id="formPag" name="formPag" method="get" style="margin:0px;" action="/demo_hosted_pay.jsp">
			<input type="hidden" id="A105" name="A105" value="<%=intA105%>">
			<input type="hidden" id="C012" name="C012" value="<%=strC012%>">
			
			<div style="float:left; width:250px;">
				Referência de pagamento
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
				Nº Cartão
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
					<b>Operação realizada com sucesso!</b>
				</div>
			<%}else if(strResposta != null && strResposta.equals("false")){ %>
				<br/>
				<div style="color:red;">
					<b>Operação não realizada!</b>
				</div>
			<%} %>
		</form>
	</body>
</html>