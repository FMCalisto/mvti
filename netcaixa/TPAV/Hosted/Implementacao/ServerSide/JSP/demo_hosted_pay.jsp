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

<jsp:useBean id="objPagamentoHosted" scope="page" class="caixatec.safepay.testes_hosted.PagamentoHosted" />

<%@page import="java.text.*"%>
<%@page import="java.util.Hashtable"%>

<%
	// VARIÁVEIS A AJUSTAR PELO CLIENTE
	String strCartaoSup = ""; // Nº de cartão de supervisor
	String strA001 = ""; // Nº TPA
	String strCertificado = ""; // Caminho para o certificado
	String strCertificadoPassword = ""; // Password do certificado
	String strUrlMensagensForm3 = ""; // URL para as mensagens FORM3 (O URL para ambiente de testes é https://teste.mbnet.pt/servlet/pvtn. O URL para ambiente de produção é https://www.mbnet.pt/servlet/pvtn)
	String strUrlMensagens = ""; // URL para as restantes mensagens (O URL para ambiente de testes é https://teste.mbnet.pt/pvtn. O URL para ambiente de produção é https://www.mbnet.pt/pvtn)
	
	
	// CAMPOS RECEBIDOS PELO FORM ANTERIOR
	String strC007 = null; // Ref. pagamento
	String strA105 = null; // Moeda da Operação
	double dblA061 = 0;
	String strA061 = null; // Montante
	String strC003 = null; // PAN cliente
	String strC004 = null; // Dt. expiração cartão
	String strC005 = null; // Cód. Segurança
	String strC012 = null; // URL da página de confirmação da encomenda 
	String strC013 = null; // Elemento de segurança
	String strA030 = null; // Código da mensagem
	
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
	// AUTORIZAÇÃO DO PAGAMENTO //////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	strA030 = "H3D0"; // Código de Mensagem
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