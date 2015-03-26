<!--#include Virtual="/WebAdmin/Editor/functions/RTE_functions_common.asp" -->
<!--#include Virtual="/WebAdmin/Editor/RTE_configuration/RTE_setup.asp" -->
<%
'****************************************************************************************
'**  Copyright Notice
'**
'**  Web Wiz Guide - Web Wiz Rich Text Editor
'**  http://www.richtexteditor.org
'**
'**  Copyright 2002-2005 Bruce Corkhill All Rights Reserved.
'**
'**  This program is free software; you can modify (at your own risk) any part of it
'**  under the terms of the License that accompanies this software and use it both
'**  privately and commercially.
'**
'**  All copyright notices must remain in tacked in the scripts and the
'**  outputted HTML.
'**
'**  You may use parts of this program in your own private work, but you may NOT
'**  redistribute, repackage, or sell the whole or any part of this program even
'**  if it is modified or reverse engineered in whole or in part without express
'**  permission from the author.
'**
'**  You may not pass the whole or any part of this application off as your own work.
'**
'**  All links to Web Wiz Guide and powered by logo's must remain unchanged and in place
'**  and must remain visible when the pages are viewed unless permission is first granted
'**  by the copyright holder.
'**
'**  This program is distributed in the hope that it will be useful,
'**  but WITHOUT ANY WARRANTY; without even the implied warranty of
'**  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR ANY OTHER
'**  WARRANTIES WHETHER EXPRESSED OR IMPLIED.
'**
'**  You should have received a copy of the License along with this program;
'**  if not, write to:- Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom.
'**
'**
'**  No official support is available for this program but you may post support questions at: -
'**  http://www.webwizguide.info/forum
'**
'**  Support questions are NOT answered by e-mail ever!
'**
'**  For correspondence or non support questions contact: -
'**  info@webwizguide.info
'**
'**  or at: -
'**
'**  Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom
'**
'****************************************************************************************




'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write(vbCrLf & vbCrLf & "<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Application: Web Wiz Rich Text Editor ver. " & strRTEversion & "" & _
vbCrLf & "Author: Bruce Corkhill" & _
vbCrLf & "Info: http://www.richtexteditor.org" & _
vbCrLf & "Available FREE: http://www.richtexteditor.org" & _
vbCrLf & "Copyright: Bruce Corkhill ©2001-2005. All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->")
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******



'Load default CSS and Javascript
Response.Write(vbCrLf & vbCrLf & "<link href=""/WebAdmin/Editor/RTE_configuration/default_style.css"" rel=""stylesheet"" type=""text/css"" />")
Response.Write(vbCrLf & "<script language=""JavaScript"" src=""/WebAdmin/Editor/RTE_javascript_common.asp"" type=""text/javascript""></script>")


'If this is an RTE enabled web browser load in the RTE content
If RTEenabled() <> "false" Then
	
'	'Load in Javascript for RTE browsers
	Response.Write(vbCrLf & "<script language=""JavaScript"" src=""/WebAdmin/Editor/RTE_javascript.asp?textArea=" & Server.URLEncode(strTextAreaName) & """ type=""text/javascript""></script>")

	

'If this is not an RTE enabled web browser load in the NON-RTE content
Else

	'Load in Javascript for non-RTE browsers
	Response.Write(vbCrLf & "<script language=""JavaScript"" src=""/WebAdmin/Editor/non_RTE_javascript.asp?textArea=" & Server.URLEncode(strTextAreaName) & """ type=""text/javascript""></script>")

	'Display an message that the user is using the non-RTE editor
	Response.Write(vbCrLf & "<script language=""JavaScript"">")
	Response.Write(vbCrLf & "	alert('Your web browser is not Rich Text Enabled.\nYou are using the standard text box area.');")
	Response.Write(vbCrLf & "</script>")
End If

'Create Toolbar and Iframes
Response.Write(vbCrLf & "<script language=""JavaScript"">WebWizRTEtoolbar('" & strFormName & "');</script>")

%>