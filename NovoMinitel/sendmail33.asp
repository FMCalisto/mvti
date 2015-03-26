<!--#INCLUDE virtual="/includes/inc_FuncoesCRT.asp"-->
<html>
<body>
<form name="form1" method="post" action="sendmail33.asp">
  <p>FROM : 
    <input name="FromAdd" type="text" id="FromAdd" value="rui.fernandes@minitel.pt" size="40">
Nome : 
<input name="FromNome" type="text" id="FromNome" value="Rui Fernandes" size="40"> 
</p>
  <p>
    To : 
      <input name="toadd" type="text" id="toadd" value="rui_oliveira@hotmail.com" size="40">
Nome : 
<input name="tonome" type="text" id="tonome" value="Rui Oliveira" size="40">
</p>
  <p>Assunto : 
    <input name="assunto" type="text" id="assunto" value="Um assunto" size="40">
  </p>
  <p>&nbsp;  </p>
  <p>Body<br>
    <textarea name="Body" cols="30" rows="10" id="Body">Texto (body)
	<%=Now()%>
    </textarea>
  </p>
  <p>Body HTML<br>
    <textarea name="Bodyhtml" cols="30" rows="10" id="Body">
		<html><body>
		<b><%=Now()%></b>
		</body></html>
    </textarea>
  </p>
  <p>
    <input type="submit" name="Submit" value="Submit">
</p>
</form>

<%
Function EnviaEmail(MailFrom,NomeFrom,MailTo,NomeTo,Subject,BodyTXT,BodyHTML)
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
  oSMTP.SendTo = NomeTo & " <" & MailTo & ">"
  oSMTP.MessageSubject = Subject

    if trim(BodyTXT)<>"" Then oSMTP.MessageText = BodyTXT
    if trim(BodyHTML)<>"" Then oSMTP.MessageHTML = BodyHTML
    oSMTP.RaiseError = True 'raise SMTP errors
    oSMTP.SendEmail
  If Err.Number <> 0 Then
    	EnviaEmail=Err.Number & ": " & Err.Description
  Else 
	   EnviaEmail=""
  End If 
End Function
if request.form("Submit")="Submit" Then 
	response.Write(EnviaEmail(request.Form("FromAdd"),request.Form("FromNome"),request.Form("toadd"),request.Form("tonome"),request.Form("assunto"),request.Form("BodyTXT"),request.Form("BodyHTML")))
End if
%>
</body>
</html>
