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

<jsp:useBean id="objPagamentoHosted" scope="page" class="caixatec.safepay.testes_hosted.PagamentoHosted" />

<%@page import="java.text.*"%>
<%@page import="java.util.Hashtable"%>

<%
	// VARI�VEIS A AJUSTAR PELO CLIENTE
	String strCartaoSup = ""; // N� de cart�o de supervisor
	String strA001 = ""; // N� TPA
	String strCertificado = ""; // Caminho para o certificado
	String strCertificadoPassword = ""; // Password do certificado
	String strUrlMensagensForm3 = ""; // URL para as mensagens FORM3 (O URL para ambiente de testes � https://teste.mbnet.pt/servlet/pvtn. O URL para ambiente de produ��o � https://www.mbnet.pt/servlet/pvtn)
	String strUrlMensagens = ""; // URL para as restantes mensagens (O URL para ambiente de testes � https://teste.mbnet.pt/pvtn. O URL para ambiente de produ��o � https://www.mbnet.pt/pvtn)
	
	
	// CAMPOS RECEBIDOS PELO FORM ANTERIOR
	String strC007 = null; // Ref. pagamento
	String strA105 = null; // Moeda da Opera��o
	double dblA061 = 0;
	String strA061 = null; // Montante
	String strC003 = null; // PAN cliente
	String strC004 = null; // Dt. expira��o cart�o
	String strC005 = null; // C�d. Seguran�a
	String strC012 = null; // URL da p�gina de confirma��o da encomenda 
	String strC013 = null; // Elemento de seguran�a
	String strA030 = null; // C�digo da mensagem
	
	DecimalFormat df = new DecimalFormat("#.00");
 	DateFormat dfFormatInput = new SimpleDateFormat("yyyyMMddHHmmss");	
	String strResposta = null;
	Hashtable <String , String> hshtblResponseValues = null;
	boolean boolAuth = false;
	boolean boolPagamento = false;

	try{
		strC007 = request.getParameter("C007");
	}catch(Exception e){}
	
	try{
		strA105 = request.getParameter("A105");
	}catch(Exception e){}
	
	try{
		dblA061 = Double.parseDouble(request.getParameter("A061"));
	}catch(Exception e){}
	
	try{
		strC003 = request.getParameter("C003");
	}catch(Exception e){}
	
	try{
		strC004 = request.getParameter("C004");
	}catch(Exception e){}
	
	try{
		strC005 = request.getParameter("C005");
	}catch(Exception e){}
	
	try{
		strC012 = request.getParameter("C012");
	}catch(Exception e){}

	objPagamentoHosted.setStrNumCartao(strCartaoSup);
	objPagamentoHosted.setStrNumTpaVirtual(strA001);
	
	// Tratamento dos campos para posterior envio no post
	if(strA001 != null) strA001 = objPagamentoHosted.paddingString(strA001, 9, true, '0');
	if(strC007 != null) strC007 = objPagamentoHosted.paddingString(strC007, 15, true, '0');
	if(strA105 != null) strA105 = objPagamentoHosted.paddingString(strA105, 4, true, '0');
	if(dblA061 > 0) strA061 = objPagamentoHosted.paddingString("" + df.format(dblA061).replace(",", "."), 8, true, '0');
	if(strC003 != null) strC003 = objPagamentoHosted.paddingString(strC003, 16, true, '0');
	if(strC004 != null) strC004 = objPagamentoHosted.paddingString(strC004, 6, true, '0');
	if(strC005 != null) strC005 = objPagamentoHosted.paddingString(strC005, 3, true, '0');
	
	//////////////////////////////////////////////////////////////////
	// AUTORIZA��O DO PAGAMENTO //////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	strA030 = "H3D0"; // C�digo de Mensagem
	objPagamentoHosted.clearVars();
	objPagamentoHosted.setVar("A030", ((strA030 != null)?strA030.trim():""));
	objPagamentoHosted.setVar("A001", ((strA001 != null)?strA001.trim():""));
	objPagamentoHosted.setVar("C007", ((strC007 != null)?strC007.trim():""));
	objPagamentoHosted.setVar("A105", ((strA105 != null)?strA105.trim():""));
	objPagamentoHosted.setVar("A061", ((strA061 != null)?strA061.trim():""));
	objPagamentoHosted.setVar("C003", ((strC003 != null)?strC003.trim():""));
	objPagamentoHosted.setVar("C004", ((strC004 != null)?strC004.trim():""));
	objPagamentoHosted.setVar("C005", ((strC005 != null)?strC005.trim():""));
	objPagamentoHosted.setVar("C012", ((strC012 != null)?strC012.trim():""));
	strC013 = objPagamentoHosted.buildHashHMACSHA1();
	objPagamentoHosted.setVar("C013", ((strC013 != null)?strC013.trim():""));
	
	String strParamsFORM3 = 
		"A030=" + ((strA030 != null)?strA030:"") + 
		"&A001=" + ((strA001 != null)?strA001:"") +
		"&C007=" + ((strC007 != null)?strC007:"") +
		"&A105=" + ((strA105 != null)?strA105:"") +
		"&A061=" + ((strA061 != null)?strA061:"") +
		"&C003=" + ((strC003 != null)?strC003:"") +
		"&C004=" + ((strC004 != null)?strC004:"") +
		"&C005=" + ((strC005 != null)?strC005:"") +
		"&C012=" + ((strC012 != null)?strC012:"") +
		"&C013=" + ((strC013 != null)?strC013:"");

	objPagamentoHosted.setStrHttpsURL(strUrlMensagensForm3);
	objPagamentoHosted.setStrHttpsParams(strParamsFORM3);
	strResposta = objPagamentoHosted.doPostHttps(strCertificado, strCertificadoPassword, "POST");
	boolAuth = (strResposta != null && strResposta.indexOf("Error processing the transaction") == -1);
	
	if(boolAuth){
		//////////////////////////////////////////////////////////////////
		// CHECK DO PAGAMENTO ////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////
		strA030 = "M020";
		objPagamentoHosted.clearVars();
		objPagamentoHosted.setVar("A030", ((strA030 != null)?strA030.trim():""));
		objPagamentoHosted.setVar("A001", ((strA001 != null)?strA001.trim():""));
		objPagamentoHosted.setVar("C007", ((strC007 != null)?strC007.trim():""));
		strC013 = objPagamentoHosted.buildHashSHA1("M020");
		objPagamentoHosted.setVar("C013", ((strC013 != null)?strC013.trim():""));

		String strParamsM020 = 
			"A030=" + ((strA030 != null)?strA030:"") +
			"&A001=" + ((strA001 != null)?strA001:"") +
			"&C007=" + ((strC007 != null)?strC007:"") +
			"&C013=" + ((strC013 != null)?strC013:"");

		objPagamentoHosted.setStrHttpsURL(strUrlMensagens);
		objPagamentoHosted.setStrHttpsParams(strParamsM020);
		strResposta = objPagamentoHosted.doPostHttps(strCertificado, strCertificadoPassword, "POST");
		hshtblResponseValues = objPagamentoHosted.parseXmlToHashtable(strResposta);
		
		String strDtPagamento = hshtblResponseValues.get("A037").toString();
	
		//////////////////////////////////////////////////////////////////
		// PAGAMENTO /////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////
		strA030 = "M002";
		objPagamentoHosted.clearVars();
		objPagamentoHosted.setVar("A030", ((strA030 != null)?strA030.trim():""));
		objPagamentoHosted.setVar("A001", ((strA001 != null)?strA001.trim():""));
		objPagamentoHosted.setVar("C007", ((strC007 != null)?strC007.trim():""));
		strC013 = objPagamentoHosted.buildHashSHA1("M002");
		objPagamentoHosted.setVar("C013", ((strC013 != null)?strC013.trim():""));
		objPagamentoHosted.setVar("A061", ((strA061 != null)?strA061.trim():""));
		objPagamentoHosted.setVar("A105", ((strA105 != null)?strA105.trim():""));
		String strA037 = strDtPagamento;
		if(strA037 != null) strA037 = objPagamentoHosted.paddingString(strA037, 14, true, '0');
		objPagamentoHosted.setVar("A037", ((strA037 != null)?strA037.trim():""));
		
		String strParamsM002 = 
			"A030=" + ((strA030 != null)?strA030:"") +
			"&A001=" + ((strA001 != null)?strA001:"") +
			"&C007=" + ((strC007 != null)?strC007:"") +
			"&C013=" + ((strC013 != null)?strC013:"") +
			"&A061=" + ((strA061 != null)?strA061:"") +
			"&A105=" + ((strA105 != null)?strA105:"") +
			"&A037=" + ((strA037 != null)?strA037:"");
		
		objPagamentoHosted.setStrHttpsURL(strUrlMensagens);
		objPagamentoHosted.setStrHttpsParams(strParamsM002);
		strResposta = objPagamentoHosted.doPostHttps(strCertificado, strCertificadoPassword, "POST");
		hshtblResponseValues = objPagamentoHosted.parseXmlToHashtable(strResposta);
		
		String strRespCodMensagem = hshtblResponseValues.get("A030").toString();
		int intRespMensagem = -1;
		try{
			intRespMensagem = Integer.parseInt(hshtblResponseValues.get("A038").toString());
		}catch(Exception e){}
		
		boolPagamento = (strRespCodMensagem != null && strRespCodMensagem.equals("M102") && intRespMensagem == 0);
	}
%>

<script>
	location.replace('/demo_hosted.jsp?resp=<%=(boolAuth && boolPagamento)%>');
</script>