 
 <!-- #include file="i_soapcall.asp" --> 
<html>
 
<head><link rel="alternate" type="text/xml" href="/ServicosExternos/authorization/Authorization.asmx?disco" />
 
    <style type="text/css">
    
		BODY { color: #000000; background-color: white; font-family: Verdana; margin-left: 0px; margin-top: 0px; }
		#content { margin-left: 30px; font-size: .70em; padding-bottom: 2em; }
		A:link { color: #336699; font-weight: bold; text-decoration: underline; }
		A:visited { color: #6699cc; font-weight: bold; text-decoration: underline; }
		A:active { color: #336699; font-weight: bold; text-decoration: underline; }
		A:hover { color: cc3300; font-weight: bold; text-decoration: underline; }
		P { color: #000000; margin-top: 0px; margin-bottom: 12px; font-family: Verdana; }
		pre { background-color: #e5e5cc; padding: 5px; font-family: Courier New; font-size: x-small; margin-top: -5px; border: 1px #f0f0e0 solid; }
		td { color: #000000; font-family: Verdana; font-size: .7em; }
		h2 { font-size: 1.5em; font-weight: bold; margin-top: 25px; margin-bottom: 10px; border-top: 1px solid #003366; margin-left: -15px; color: #003366; }
		h3 { font-size: 1.1em; color: #000000; margin-left: -15px; margin-top: 10px; margin-bottom: 10px; }
		ul { margin-top: 10px; margin-left: 20px; }
		ol { margin-top: 10px; margin-left: 20px; }
		li { margin-top: 10px; color: #000000; }
		font.value { color: darkblue; font: bold; }
		font.key { color: darkgreen; font: bold; }
		font.error { color: darkred; font: bold; }
		.heading1 { color: #ffffff; font-family: Tahoma; font-size: 26px; font-weight: normal; background-color: #003366; margin-top: 0px; margin-bottom: 0px; margin-left: -30px; padding-top: 10px; padding-bottom: 3px; padding-left: 15px; width: 105%; }
		.button { background-color: #dcdcdc; font-family: Verdana; font-size: 1em; border-top: #cccccc 1px solid; border-bottom: #666666 1px solid; border-left: #cccccc 1px solid; border-right: #666666 1px solid; }
		.frmheader { color: #000000; background: #dcdcdc; font-family: Verdana; font-size: .7em; font-weight: normal; border-bottom: 1px solid #dcdcdc; padding-top: 2px; padding-bottom: 2px; }
		.frmtext { font-family: Verdana; font-size: .7em; margin-top: 8px; margin-bottom: 0px; margin-left: 32px; }
		.frmInput { font-family: Verdana; font-size: 1em; }
		.intro { margin-left: -15px; }
           
    </style>
 
    <title>
	Authorization Web Service
</title></head>
 
  <body>
  <span>
          <h2> Pagamentos</h2>
          <p class="intro"></p>
<form target="_blank" action='https://servicos.redunicre.pt/ServicosExternos/ServicosExternos.asmx/Movimentos_Transaccoes' method="POST">                      
                        
                          <table cellspacing="0" cellpadding="4" frame="box" bordercolor="#dcdcdc" rules="none" style="border-collapse: collapse;">
                          <tr>
	<td class="frmHeader" background="#dcdcdc" style="border-right: 2px solid white;">Parametros</td>
	<td class="frmHeader" background="#dcdcdc">Valores</td>
</tr>
 
                        
                          <tr>
                            <td class="frmText" style="color: #000000; font-weight: normal;">estabelecimento:</td>
                            <td><input class="frmInput" type="text" size="50" name="Estabelecimento"></td>
                          </tr>
                        
                          <tr>
                            <td class="frmText" style="color: #000000; font-weight: normal;">terminal:</td>
                            <td><input class="frmInput" type="password" size="12" name="NumeroTerminal"></td>
                          </tr>
                        
                          <tr>
                            <td class="frmText" style="color: #000000; font-weight: normal;">numerocartao:</td>
                            <td><input class="frmInput" type="text" size="50" name="NumeroCartao"></td>
                          </tr>
                        
                          <tr>
                            <td class="frmText" style="color: #000000; font-weight: normal;">validade:</td>
                            <td><input class="frmInput" type="text" size="50" name="Validade"></td>
                          </tr>
                        
                          <tr>
                            <td class="frmText" style="color: #000000; font-weight: normal;">pin:</td>
                            <td><input class="frmInput" type="text" size="50" name="PIN"></td>
                          </tr>
                        
                          <tr>
                            <td class="frmText" style="color: #000000; font-weight: normal;">valor inteiro:</td>
                            <td><input class="frmInput" type="text" size="50" name="Valor_int"></td>
                          </tr>
                        
                          <tr>
                            <td class="frmText" style="color: #000000; font-weight: normal;">valo decimal:</td>
                            <td><input class="frmInput" type="password" size="4" name="Valor_dec 2"></td>
                          </tr>
                        
                          <tr>
                            <td class="frmText" style="color: #000000; font-weight: normal;">factura:</td>
                            <td><input class="frmInput" type="text" size="50" name="Factura"></td>
                          </tr>
                            <td class="frmText" style="color: #000000; font-weight: normal;">Prazo pagamento:</td>
                            <td><input class="frmInput" type="text" size="50" name="PrazoPagamento_int"></td>
                          </tr>
                        
                        <tr>
                          <td></td>
                          <td align="right"> <input type="submit" value="Pagar" class="button"></td>
                        </tr>
                        </table>
                      
 
              </form>
            <span>
            <h3>&nbsp;</h3>
    </span></span>
      
 
    
    
      
 
      
 
    
  </body>
</html>

