 
 
<html>
 
    <head><link rel="alternate" type="text/xml" href="/servicosru/GlobalInfo.asmx?disco" />
 
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
	GlobalInfo Web Service
</title></head>
 
  <body>
 
    <div id="content">
 
      <p class="heading1">GlobalInfo</p><br>
 
      
 
      
 
      <span>
          <p class="intro">Click <a href="GlobalInfo.asmx">here</a> for a complete list of operations.</p>
          <h2>ListFuncs</h2>
          <p class="intro"></p>
 
          <h3>Test</h3>
          
          To test the operation using the HTTP POST protocol, click the 'Invoke' button.
 
 
 
                      <form target="_blank" action='https://servicos.redunicre.pt/servicosru/GlobalInfo.asmx/ListFuncs' method="POST">                      
                        
                          <table cellspacing="0" cellpadding="4" frame="box" bordercolor="#dcdcdc" rules="none" style="border-collapse: collapse;">
                          <tr>
	<td class="frmHeader" background="#dcdcdc" style="border-right: 2px solid white;">Parameter</td>
	<td class="frmHeader" background="#dcdcdc">Value</td>
</tr>
 
                        
                          <tr>
                            <td class="frmText" style="color: #000000; font-weight: normal;">sessId:</td>
                            <td><input class="frmInput" type="text" size="50" name="sessId"></td>
                          </tr>
                        
                          <tr>
                            <td class="frmText" style="color: #000000; font-weight: normal;">userName:</td>
                            <td><input class="frmInput" type="text" size="50" name="userName"></td>
                          </tr>
                        
                          <tr>
                            <td class="frmText" style="color: #000000; font-weight: normal;">passwd:</td>
                            <td><input class="frmInput" type="text" size="50" name="passwd"></td>
                          </tr>
                        
                        <tr>
                          <td></td>
                          <td align="right"> <input type="submit" value="Invoke" class="button"></td>
                        </tr>
                        </table>
                      
 
                    </form>
                  <span>
              <h3>SOAP 1.1</h3>
              <p>The following is a sample SOAP 1.1 request and response.  The <font class=value>placeholders</font> shown need to be replaced with actual values.</p>
 
              <pre>POST /servicosru/GlobalInfo.asmx HTTP/1.1
Host: servicos.redunicre.pt
Content-Type: text/xml; charset=utf-8
Content-Length: <font class=value>length</font>
SOAPAction: "http://www.redunicre.pt/ListFuncs"
 
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"&gt;
  &lt;soap:Body&gt;
    &lt;ListFuncs xmlns="http://www.redunicre.pt/"&gt;
      &lt;sessId&gt;<font class=value>string</font>&lt;/sessId&gt;
      &lt;userName&gt;<font class=value>minitel</font>&lt;/userName&gt;
      &lt;passwd&gt;<font class=value>11081975</font>&lt;/passwd&gt;
    &lt;/ListFuncs&gt;
  &lt;/soap:Body&gt;
&lt;/soap:Envelope&gt;</pre>
 
              <pre>HTTP/1.1 200 OK
Content-Type: text/xml; charset=utf-8
Content-Length: <font class=value>length</font>
 
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"&gt;
  &lt;soap:Body&gt;
    &lt;ListFuncsResponse xmlns="http://www.redunicre.pt/"&gt;
      &lt;ListFuncsResult&gt;
        &lt;Func xmlns="Redunicre.WebServices"&gt;
          &lt;ClassFunc&gt;
            &lt;Estabelecimento&gt;<font class=value>string</font>&lt;/Estabelecimento&gt;
            &lt;Funcionalidade_Id&gt;<font class=value>int</font>&lt;/Funcionalidade_Id&gt;
            &lt;Descricao&gt;<font class=value>string</font>&lt;/Descricao&gt;
          &lt;/ClassFunc&gt;
          &lt;ClassFunc&gt;
            &lt;Estabelecimento&gt;<font class=value>string</font>&lt;/Estabelecimento&gt;
            &lt;Funcionalidade_Id&gt;<font class=value>int</font>&lt;/Funcionalidade_Id&gt;
            &lt;Descricao&gt;<font class=value>string</font>&lt;/Descricao&gt;
          &lt;/ClassFunc&gt;
        &lt;/Func&gt;
        &lt;codRet xmlns="Redunicre.WebServices"&gt;<font class=value>int</font>&lt;/codRet&gt;
      &lt;/ListFuncsResult&gt;
    &lt;/ListFuncsResponse&gt;
  &lt;/soap:Body&gt;
&lt;/soap:Envelope&gt;</pre>
          </span>
 
          <span>
              <h3>SOAP 1.2</h3>
              <p>The following is a sample SOAP 1.2 request and response.  The <font class=value>placeholders</font> shown need to be replaced with actual values.</p>
 
              <pre>POST /servicosru/GlobalInfo.asmx HTTP/1.1
Host: servicos.redunicre.pt
Content-Type: application/soap+xml; charset=utf-8
Content-Length: <font class=value>length</font>
 
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope"&gt;
  &lt;soap12:Body&gt;
    &lt;ListFuncs xmlns="http://www.redunicre.pt/"&gt;
      &lt;sessId&gt;<font class=value>string</font>&lt;/sessId&gt;
      &lt;userName&gt;<font class=value>string</font>&lt;/userName&gt;
      &lt;passwd&gt;<font class=value>string</font>&lt;/passwd&gt;
    &lt;/ListFuncs&gt;
  &lt;/soap12:Body&gt;
&lt;/soap12:Envelope&gt;</pre>
 
              <pre>HTTP/1.1 200 OK
Content-Type: application/soap+xml; charset=utf-8
Content-Length: <font class=value>length</font>
 
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope"&gt;
  &lt;soap12:Body&gt;
    &lt;ListFuncsResponse xmlns="http://www.redunicre.pt/"&gt;
      &lt;ListFuncsResult&gt;
        &lt;Func xmlns="Redunicre.WebServices"&gt;
          &lt;ClassFunc&gt;
            &lt;Estabelecimento&gt;<font class=value>string</font>&lt;/Estabelecimento&gt;
            &lt;Funcionalidade_Id&gt;<font class=value>int</font>&lt;/Funcionalidade_Id&gt;
            &lt;Descricao&gt;<font class=value>string</font>&lt;/Descricao&gt;
          &lt;/ClassFunc&gt;
          &lt;ClassFunc&gt;
            &lt;Estabelecimento&gt;<font class=value>string</font>&lt;/Estabelecimento&gt;
            &lt;Funcionalidade_Id&gt;<font class=value>int</font>&lt;/Funcionalidade_Id&gt;
            &lt;Descricao&gt;<font class=value>string</font>&lt;/Descricao&gt;
          &lt;/ClassFunc&gt;
        &lt;/Func&gt;
        &lt;codRet xmlns="Redunicre.WebServices"&gt;<font class=value>int</font>&lt;/codRet&gt;
      &lt;/ListFuncsResult&gt;
    &lt;/ListFuncsResponse&gt;
  &lt;/soap12:Body&gt;
&lt;/soap12:Envelope&gt;</pre>
          </span>
 
          
 
          <span>
              <h3>HTTP POST</h3>
              <p>The following is a sample HTTP POST request and response.  The <font class=value>placeholders</font> shown need to be replaced with actual values.</p>
 
              <pre>POST /servicosru/GlobalInfo.asmx/ListFuncs HTTP/1.1
Host: servicos.redunicre.pt
Content-Type: application/x-www-form-urlencoded
Content-Length: <font class=value>length</font>
 
<font class=key>sessId</font>=<font class=value>string</font>&amp;<font class=key>userName</font>=<font class=value>string</font>&amp;<font class=key>passwd</font>=<font class=value>string</font></pre>
 
              <pre>HTTP/1.1 200 OK
Content-Type: text/xml; charset=utf-8
Content-Length: <font class=value>length</font>
 
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;ClassListFuncs xmlns="http://www.redunicre.pt/"&gt;
  &lt;Func xmlns="Redunicre.WebServices"&gt;
    &lt;ClassFunc&gt;
      &lt;Estabelecimento&gt;<font class=value>string</font>&lt;/Estabelecimento&gt;
      &lt;Funcionalidade_Id&gt;<font class=value>int</font>&lt;/Funcionalidade_Id&gt;
      &lt;Descricao&gt;<font class=value>string</font>&lt;/Descricao&gt;
    &lt;/ClassFunc&gt;
    &lt;ClassFunc&gt;
      &lt;Estabelecimento&gt;<font class=value>string</font>&lt;/Estabelecimento&gt;
      &lt;Funcionalidade_Id&gt;<font class=value>int</font>&lt;/Funcionalidade_Id&gt;
      &lt;Descricao&gt;<font class=value>string</font>&lt;/Descricao&gt;
    &lt;/ClassFunc&gt;
  &lt;/Func&gt;
  &lt;codRet xmlns="Redunicre.WebServices"&gt;<font class=value>int</font>&lt;/codRet&gt;
&lt;/ClassListFuncs&gt;</pre>
          </span>
 
      </span>
      
 
    
    
      
 
      
 
    
  </body>
</html>

