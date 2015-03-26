<%
If Session("ConOpen")="OK" Then
    Set RS=Nothing
	ConnObj.close
	Set ConnObj=Nothing
	Session("ConOpen")=""
	Set Session("ConOpen")=nothing
End if
%>