<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include Virtual="/WebAdmin/Editor/RTE_configuration/RTE_setup.asp" -->
<!--#include Virtual="/WebAdmin/Editor/RTE_configuration/RTE_skin_file.asp" -->
<!--#include Virtual="/WebAdmin/Editor/language_files/RTE_language_file_inc.asp" -->
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


'Set the response buffer to true as we maybe redirecting
Response.Buffer = True


Dim strPreviewTextarea 			'Holds the Users Message


'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"

'Read in the message to be previewed
strPreviewTextarea = Request.Form("pre")



'If there is nothing to preview then say so
If strPreviewTextarea = "" OR IsNull(strPreviewTextarea) OR (InStr(1, strPreviewTextarea, "<br>", 1) AND Len(strPreviewTextarea) = 8) Then
	strPreviewTextarea = "<br /><br /><div align=""center"">" & strTxtThereIsNothingToPreview & "</div><br /><br />"
End If

%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2002-2005 Bruce Corkhill" />
<title>Preview</title>
<HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
<!--#include Virtual="/WebAdmin/Editor/RTE_configuration/browser_page_encoding_inc.asp" -->

<%
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write(vbCrLf & "<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Application: Web Wiz Rich Text Editor ver. " & strRTEversion & "" & _
vbCrLf & "Author: Bruce Corkhill" & _
vbCrLf & "Info: http://www.richtexteditor.org" & _
vbCrLf & "Available FREE: http://www.richtexteditor.org" & _
vbCrLf & "Copyright: Bruce Corkhill ©2001-2005. All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->")
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>

<link href="/WebAdmin/Editor/RTE_configuration/default_style.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#FFFFFF" text="#000000" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0" OnLoad="self.focus();">
<table width="100%"  border="0" cellpadding="3" cellspacing="0" bgcolor="<% = strRTEpopupTopRowColour %>">
    <tr>
      <td bgcolor="<% = strRTEpopupTopRowColour %>" class="heading"><% = strTxtPreview %></td>
    </tr>
    <tr>
      <td align="center" bgcolor="<% = strRTEpopupCentreRowColour %>"><br />
        <table width="98%" border="0" cellspacing="0" cellpadding="1" bgcolor="#000000" align="center">
          <tr>
            <td>
              <table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#FFFFFF" height="250">
                <tr>
                  <td class="RTEtextarea" valign="top">
                    <!--// /* Message body -->
                    <% = strPreviewTextarea %>
                    <!-- Message body ''"" */ //-->
                  </td>
                </tr>
            </table></td>
          </tr>
        </table>
      <br>      </td>
    </tr>
    <tr>
      <td align="center" bgcolor="<% = strRTEpopupBottomRowColour %>">
        <input type="button" name="ok" onclick="javascript:window.close();" value="     <% = strTxtCloseWindow %>     ">
        <br>
        <br>
        <% 
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
If blnAbout Then
	Response.Write("<span class=""text"" style=""font-size:10px"">Powered by <a href=""http://www.richtexteditor.org"" target=""_blank"" style=""font-size:10px"">Web Wiz Rich Text Editor</a> version " & strRTEversion & "</span>")
	Response.Write("<br /><span class=""text"" style=""font-size:10px"">Copyright &copy;2002-2005 <a href=""http://www.webwizguide.info"" target=""_blank"" style=""font-size:10px"">Web Wiz Guide</a></span>")
End If 
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>
      <br><br>
      </td>
    </tr>
</table>
</body>
</html>