

<script language="vbscript" runat="server"> 
Function GetASPNetResources()    
    Dim returnString 
    Dim myXML 
    Dim SoapRequest 
    Dim SoapURL 

    Set SoapRequest = Server.CreateObject("MSXML2.XMLHTTP") 
    Set myXML =Server.CreateObject("MSXML.DOMDocument") 

    myXML.Async=False 
    SoapURL = "https://servicos.redunicre.pt/ServicosExternos/authorization/Authorization.asmx/Autorizacoes" 
    SoapRequest.Open "GET",SoapURL , False 
    SoapRequest.Send() 

    if Not myXML.load(SoapRequest.responseXML) then 'an Error loading XML 
        returnString = "" 
    Else    'parse the XML 

        Dim nodesURL 
        Dim nodesName 
        Dim nodesDateUpdated 
        Dim nodesDomain 
        Dim NumOfNodes 
        Dim ResourceList 
        Dim i 

        REM -- The XML Nodes are CASE SENSITIVVE! 
        Set nodesURL=myXML.documentElement.selectNodes("//URL") 
        Set nodesName=myXML.documentElement.selectNodes("//Name") 

        REM -- uncomment the following lines if we want to access the DataUpdated and the Domain Nodes 
        REM --Set nodesDateUpdated = myXML.documentElement.selectNodes("//DateUpdated") 
        REM --Set nodesDomain = myXML.documentElement.selectNodes("//Domain") 

        REM -- the number of nodes in the list 
        NumOfNodes = nodesURL.Length 
        ResourceList = "<font face=verdana size=2>Latest ASP.NET Resources</font><ul>" 

        For i = 0 to NumOfNodes -1 
            ResourceList = ResourceList & "<li><a href=" & nodesURL(i).text & "><font face=verdana size=2>" & nodesName(i).text & "</font></a></li>" 
        next 

        ResourceList =ResourceList & "</ul>" 
        
        returnString = ResourceList 
    
        Set nodesURL = Nothing 
        Set nodesName = Nothing 
    End If 
    
    Set SoapRequest = Nothing 
    Set myXML = Nothing 
    
    
    GetASPNetResources = returnString 
End Function 
</script> 
