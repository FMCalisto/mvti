POST https://servicos.redunicre.pt/servicosru/GlobalInfo.asmx HTTP/1.1
Host: servicos.redunicre.pt
Content-Type: text/xml; charset=utf-8
Content-Length: length
SOAPAction: "http://www.redunicre.pt/ListFuncs"
 
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <ListFuncs xmlns="http://www.redunicre.pt/">
      <sessId>string</sessId>
      <userName>minitel</userName>
      <passwd>11081975</passwd>
    </ListFuncs>
  </soap:Body>
</soap:Envelope>

HTTP/1.1 200 OK
Content-Type: text/xml; charset=utf-8
Content-Length: length
 
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <ListFuncsResponse xmlns="http://www.redunicre.pt/">
      <ListFuncsResult>
        <Func xmlns="Redunicre.WebServices">
          <ClassFunc>
            <Estabelecimento>string</Estabelecimento>
            <Funcionalidade_Id>int</Funcionalidade_Id>
            <Descricao>string</Descricao>
          </ClassFunc>
          <ClassFunc>
            <Estabelecimento>string</Estabelecimento>
            <Funcionalidade_Id>int</Funcionalidade_Id>
            <Descricao>string</Descricao>
          </ClassFunc>
        </Func>
        <codRet xmlns="Redunicre.WebServices">int</codRet>
      </ListFuncsResult>
    </ListFuncsResponse>
  </soap:Body>
</soap:Envelope>