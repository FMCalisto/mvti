<%
' Do not edit below this line
' ---------------------------------------
sub subGetSharedVueContent()
  on error resume next
  dim objXmlHttpSV, strURL
  set objXmlHttpSV = Server.CreateObject("Msxml2.ServerXMLHTTP")
  objXmlHttpSV.setTimeouts 30000, 180000, 60000, 60000
  strURL = "http://vmware.sharedvue.net/sharedvue/pull/?svhost=" & request.servervariables("server_name") & request.servervariables("script_name")
  if (len(request.querystring) > 0) then
    strURL = strURL & escape("?" & request.querystring)
  end if 
  objXmlHttpSV.open "GET", strURL, False
  objXmlHttpSV.send
  if (objXmlHttpSV.status = 200) then
    response.write objXmlHttpSV.responseText
  else
    response.write vbcrlf & "<!-- SharedVue Output: " & objXmlHttpSV.status & " -- " & objXmlHttpSV.statusText & " -->" & vbcrlf
  end if
  set objXmlHttpSV = Nothing
end sub ' subGetSharedVueContent
call subGetSharedVueContent()
%>