<%
if session("ComercialON") and session("ClienteON") Then
	'Apaga apenas a sessão do cliente... mantem o comercial activo
	session("NO")=0
	session("ClienteON")=False
Else
	Session.Abandon()
End if
response.Redirect("/")
%>