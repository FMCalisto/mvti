<%
'**************************************************************************************************
'**************************************************************************************************
Function teste(valor)
	response.Write("<b>Valor teste : </b>" & valor)
	response.Flush()
End Function
'**************************************************************************************************
'Isto só funciona desde o meu pc
Function EnviaEmail(MailNome,MailTo,CCNome,CCto,Subject,Body)
Dim oSMTP  
  On Error Resume Next
  Set oSMTP = Server.CreateObject("OSSMTP.SMTPSession")

	oSMTP.Server = "vds-837639.amen-pro.com"
	oSMTP.AuthenticationType=2
	oSMTP.username="newsletter@vds-837639.amen-pro.com"
	oSMTP.Password="x8-4ZM"
	oSMTP.Port = 25
	oSmtp.CodePage = 850
    oSmtp.Charset = "iso-8859-1"
	oSMTP.Importance=2
	oSMTP.MailFrom = "WebMaster Minitel <webmaster@minitel.pt>"

    oSMTP.SendTo = MailNome + " " + MailTo
	oSMTP.CC="WebMaster Minitel <webmaster@minitel.pt>"
    oSMTP.MessageSubject = Subject
    oSMTP.MessageText = Body
    oSMTP.RaiseError = True 'raise SMTP errors
    oSMTP.SendEmail
  If Err.Number <> 0 Then
    	EnviaEmail=Err.Number & ": " & Err.Description
  Else 
	   EnviaEmail=""
  End If 
End Function
'**************************************************************************************************
Function File2String(NomeFx)
Dim FS
Dim t
	set fs=Server.CreateObject("Scripting.FileSystemObject") 
	set t=fs.OpenTextFile(NomeFx,1,false)
	File2String=t.ReadAll
	t.close
End Function
'**************************************************************************************************
'**************************************************************************************************
'**************************************************************************************************
'**************************************************************************************************
'**************************************************************************************************
'**************************************************************************************************
%>