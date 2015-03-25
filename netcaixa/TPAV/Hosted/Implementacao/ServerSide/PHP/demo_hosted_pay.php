<?php
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

	// VARI�VEIS A AJUSTAR PELO CLIENTE
	$cartaoSup = ""; // N� de cart�o de supervisor
	$A001 = ""; // N� TPA
	$certificado = ""; // Caminho para o certificado
	$certificadoPassword = ""; // Password do certificado
	$urlMensagensForm3 = ""; // URL para as mensagens FORM3 (O URL para ambiente de testes � https://teste.mbnet.pt/servlet/pvtn. O URL para ambiente de produ��o � https://www.mbnet.pt/servlet/pvtn)
	$urlMensagens = ""; // URL para as restantes mensagens (O URL para ambiente de testes � https://teste.mbnet.pt/pvtn. O URL para ambiente de produ��o � https://www.mbnet.pt/pvtn)
	
	
	// CAMPOS RECEBIDOS PELO FORM ANTERIOR
	$C007 = null; // Ref. pagamento
	$A105 = null; // Moeda da Opera��o
	$A061 = null; // Montante
	$C003 = null; // PAN cliente
	$C004 = null; // Dt. expira��o cart�o
	$C005 = null; // C�d. Seguran�a
	$C012 = null; // URL da p�gina de confirma��o da encomenda 
	$C013 = null; // Elemento de seguran�a
	$A030 = null; // C�digo da mensagem
	$hash_data = null;

	if(isset($_GET['C007'])) {
		$C007 = $_GET["C007"];
	}

	if(isset($_GET['A105'])) {
		$A105 = $_GET["A105"];
	}

	if(isset($_GET['A061'])) {
		$A061 = $_GET["A061"];
	}

	if(isset($_GET['C003'])) {
		$C003 = $_GET["C003"];
	}

	if(isset($_GET['C004'])) {
		$C004 = $_GET["C004"];
	}

	if(isset($_GET['C005'])) {
		$C005 = $_GET["C005"];
	}

	if(isset($_GET['C012'])) {
		$C012 = $_GET["C012"];
	}

	// Tratamento dos campos para posterior envio no post
	if($A001 != null) $A001 = str_pad($A001, 9, "0", STR_PAD_LEFT);
	if($C007 != null) $C007 = str_pad($C007, 15, "0", STR_PAD_LEFT);
	if($A105 != null) $A105 = str_pad($A105, 4, "0", STR_PAD_LEFT);
	if($A061 != null) $A061 = str_pad(number_format($A061, 2, '', ''), 8, "0", STR_PAD_LEFT);
	if($C003 != null) $C003 = str_pad($C003, 16, "0", STR_PAD_LEFT);
	if($C004 != null) $C004 = str_pad($C004, 6, "0", STR_PAD_LEFT);
	if($C005 != null) $C005 = str_pad($C005, 3, "0", STR_PAD_LEFT);

	//////////////////////////////////////////////////////////////////
	// AUTORIZA��O DO PAGAMENTO //////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	$A030 = "H3D0"; // C�digo de Mensagem
	$hash_msg = 
		(($A030 != null)?$A030:"") .
		(($A001 != null)?$A001:"") .
		(($C007 != null)?$C007:"") .
		(($A105 != null)?$A105:"") .
		(($A061 != null)?$A061:"") .
		(($C003 != null)?$C003:"") .
		(($C004 != null)?$C004:"") .
		(($C005 != null)?$C005:"") .
		(($C012 != null)?$C012:"");
	$C013 = strtoupper(hash_hmac('sha1', $hash_msg, $cartaoSup));

	if(isset($_GET['A061'])) {
		$A061 = $_GET["A061"];
	}
	
	$paramsFORM3 = 
		"?A030=" . (($A030 != null)?$A030:"") .  
		"&A001=" . (($A001 != null)?$A001:"") . 
		"&C007=" . (($C007 != null)?$C007:"") . 
		"&A105=" . (($A105 != null)?$A105:"") . 
		"&A061=" . (($A061 != null)?str_pad(number_format($A061, 2, '.', ''), 8, "0", STR_PAD_LEFT):"") . 
		"&C003=" . (($C003 != null)?$C003:"") . 
		"&C004=" . (($C004 != null)?$C004:"") . 
		"&C005=" . (($C005 != null)?$C005:"") . 
		"&C012=" . (($C012 != null)?$C012:"") . 
		"&C013=" . (($C013 != null)?$C013:"");

	$postFORM3 = curl_init();
	curl_setopt($postFORM3, CURLOPT_URL, $urlMensagensForm3 . $paramsFORM3);
	curl_setopt($postFORM3, CURLOPT_POST, 1);
	curl_setopt($postFORM3, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($postFORM3, CURLOPT_SSLCERT, $certificado);
	curl_setopt($postFORM3, CURLOPT_SSLCERTTYPE, "P12");
	curl_setopt($postFORM3, CURLOPT_SSLKEYPASSWD, $certificadoPassword); 
	$respostaFORM3 = curl_exec($postFORM3);
	curl_close($postFORM3);
	$boolAuth = ($respostaFORM3 != null && (strpos($respostaFORM3, "Error processing the transaction") === false) && (strpos($respostaFORM3, "tente novamente") === false));
		
	if($boolAuth === true){
		//////////////////////////////////////////////////////////////////
		// CHECK DO PAGAMENTO ////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////
		$A030 = "M020";
		$hash_msg = 
			(($A030 != null)?$A030:"") .
			(($A001 != null)?$A001:"");
		$C013 = strtoupper(sha1($hash_msg));
	
		$paramsM020 = 
			"?A030=" . (($A030 != null)?$A030:"") .
			"&A001=" . (($A001 != null)?$A001:"") .
			"&C007=" . (($C007 != null)?$C007:"") .
			"&C013=" . (($C013 != null)?$C013:"");
	
		$postM020 = curl_init();
		curl_setopt($postM020, CURLOPT_URL, $urlMensagens . $paramsM020);
		curl_setopt($postM020, CURLOPT_POST, 1);
		curl_setopt($postM020, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($postM020, CURLOPT_SSLCERT, $certificado);
		curl_setopt($postM020, CURLOPT_SSLCERTTYPE, "P12");
		curl_setopt($postM020, CURLOPT_SSLKEYPASSWD, $certificadoPassword); 

		$respostaM020 = curl_exec($postM020);
		$arrRespostaM020 = explode(' ', $respostaM020);
		$dtFORM3 = "";
		try{
			$dtFORM3 = $arrRespostaM020[66]; // Posi��o da data no array da resposta do FORM3
		}catch(Exception $e){}
		curl_close($postM020);

		//////////////////////////////////////////////////////////////////
		// PAGAMENTO /////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////
		$A030 = "M002";
		$hash_msg = 
			(($A030 != null)?$A030:"") .
			(($A001 != null)?$A001:"");
		$C013 = strtoupper(sha1($hash_msg));
		$A037 = (int)$dtFORM3;
		
		if(isset($_GET['A061'])) {
			$A061 = $_GET["A061"];
		}

		$paramsM002 = 
			"?A030=" . (($A030 != null)?$A030:"") .
			"&A001=" . (($A001 != null)?$A001:"") .
			"&C007=" . (($C007 != null)?$C007:"") .
			"&C013=" . (($C013 != null)?$C013:"") .
			"&A061=" . (($A061 != null)?str_pad(number_format($A061, 2, '.', ''), 8, "0", STR_PAD_LEFT):"") . 
			"&A105=" . (($A105 != null)?$A105:"") .
			"&A037=" . (($A037 != null)?$A037:"");

		$postM002 = curl_init();
		curl_setopt($postM002, CURLOPT_URL, $urlMensagens . $paramsM002);
		curl_setopt($postM002, CURLOPT_POST, 1);
		
		curl_setopt($postM002, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($postM002, CURLOPT_VERBOSE, 1);
		curl_setopt($postM002, CURLOPT_HEADER, 1);

		curl_setopt($postM002, CURLOPT_HTTPHEADER, array('Content-Type: application/x-www-form-urlencoded'));   
		curl_setopt($postM002, CURLOPT_SSLCERT, $certificado);
		curl_setopt($postM002, CURLOPT_SSLCERTTYPE, "P12");
		curl_setopt($postM002, CURLOPT_SSLKEYPASSWD, $certificadoPassword); 
		$respostaM002 = curl_exec($postM002);
		curl_close($postM002);
	}
?>

<script>
	location.replace('/demo_hosted.php?resp=<?php echo (($boolAuth === true)?"true":"false")?>');
</script>