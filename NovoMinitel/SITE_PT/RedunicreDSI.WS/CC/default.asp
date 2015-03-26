 <?xml version="1.0" encoding="UTF-8"?>   
  <wsdl:definitions targetNamespace="http://localhost:8080/axis/Servico.jws"    
       xmlns="http://schemas.xmlsoap.org/wsdl/"    
       xmlns:apachesoap="http://xml.apache.org/xml-soap"    
       xmlns:impl="http://localhost:8080/axis/Servico.jws"    
       xmlns:intf="http://localhost:8080/axis/Servico.jws"    
       xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"    
       xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"    
       xmlns:wsdlsoap="http://schemas.xmlsoap.org/wsdl/soap/"    
       xmlns:xsd="http://www.w3.org/2001/XMLSchema">   
    <wsdl:message name="somaRequest">   
     <wsdl:part name="valor1" type="xsd:int"/>   
     <wsdl:part name="valor2" type="xsd:int"/>   
   </wsdl:message>   
   <wsdl:message name="somaResponse">   
     <wsdl:part name="somaReturn" type="xsd:int"/>   
   </wsdl:message>   
   <wsdl:portType name="Servico">   
     <wsdl:operation name="soma" parameterOrder="valor1 valor2">   
       <wsdl:input message="impl:somaRequest" name="somaRequest"/>   
       <wsdl:output message="impl:somaResponse" name="somaResponse"/>   
     </wsdl:operation>   
   </wsdl:portType>   
   <wsdl:binding name="ServicoSoapBinding" type="impl:Servico">   
     <wsdlsoap:binding style="rpc" transport="http://schemas.xmlsoap.org/soap/http"/>   
     <wsdl:operation name="soma">   
       <wsdlsoap:operation soapAction=""/>   
       <wsdl:input name="somaRequest">   
         <wsdlsoap:body encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"    
             namespace="http://DefaultNamespace" use="encoded"/>   
       </wsdl:input>   
       <wsdl:output name="somaResponse">   
         <wsdlsoap:body encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"    
             namespace="http://localhost:8080/axis/Servico.jws" use="encoded"/>   
       </wsdl:output>   
     </wsdl:operation>   
   </wsdl:binding>   
   <wsdl:service name="ServicoService">   
     <wsdl:port binding="impl:ServicoSoapBinding" name="Servico">   
       <wsdlsoap:address location="http://localhost:8080/axis/Servico.jws"/>   
     </wsdl:port>   
   </wsdl:service>   
 </wsdl:definitions>   
