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



'Dimension veriables
Dim strOpenFilePath

'Get the open file path
strOpenFilePath = strOpenFileFolderPath

'Change \ for /
strOpenFilePath = Replace(strOpenFilePath, "\", "/'", 1, -1, 1)
%>
<html>
<head>
<title>Open File</title>
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

<script language="JavaScript">
//function to open the file
function getFile(){
	var file = document.getElementById('loader').contentWindow.document.body.innerHTML.toString();
	if (file != ''){
		window.opener.document.getElementById('WebWizRTE').contentWindow.document.body.innerHTML = file;
		window.close();
	}
}

function openFile(){
	if (document.getElementById('URL').value != ''){
 		document.getElementById('loader').contentWindow.document.location.href = document.getElementById('URL').value
	}
}
</script>
<link href="/WebAdmin/Editor/RTE_configuration/default_style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
input.display {
	border: 0px;
	background-color: <% = strRTEpopupCentreRowColour %>;
}
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" OnLoad="self.focus(); document.getElementById('Submit').disabled = true;">
<table width="100%"  border="0" cellpadding="3" cellspacing="0" bgcolor="<% = strRTEpopupTopRowColour %>">
    <tr>
      <td colspan="2" width="57%" bgcolor="<% = strRTEpopupTopRowColour %>" class="heading"><% = strTxtOpen %></td>
    </tr>
    <tr>
      <td colspan="2" bgcolor="<% = strRTEpopupCentreRowColour %>"><table width="100%" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr>
          <td width="58%" valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="2">
              <tr>
                <td width="51%" class="text"><% = strTxtPath %>:<input name="path" type="text" id="path" size="35" value="/<% = strOpenFilePath %>" readonly="readonly" class="display" onChange="document.getElementById('Submit').disabled = false;"></td>
                <td width="49%" class="text"><% = strTxtFileName %>:<input name="fileName" type="text" id="fileName" size="25" readonly="readonly" class="display">
                  <input name="URL" type="hidden" id="URL">
                </td>
              </tr>
              <tr>
                <td class="text"><% = strTxtFileName %>:<iframe src="RTE_file_browser.asp?look=open" id="fileWindow" width="98%" height="215px" style="border: #A5ACB2 1px solid;backgroundColor: #FFFFFF;"></iframe></td>
                <td class="text"><% = strTxtPreview %>:<iframe src="RTE_popup_link_preview.asp" id="prevWindow" width="98%" height="215px" style="border: #A5ACB2 1px solid;backgroundColor: #FFFFFF;"></iframe></td>
                </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
    <td bgcolor="<% = strRTEpopupBottomRowColour %>" valign="top">&nbsp;<%

'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
If blnAbout Then
	Response.Write("<span class=""text"" style=""font-size:10px"">Powered by <a href=""http://www.richtexteditor.org"" target=""_blank"" style=""font-size:10px"">Web Wiz Rich Text Editor</a> version " & strRTEversion & "</span>")
End If 
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******      
      
      %></td>
      <td align="right" bgcolor="<% = strRTEpopupBottomRowColour %>"><iframe src="" id="loader" width="0px" height="0px" style="visibility:hidden; position: absolute; left: 0px; top: 0px;" onLoad="getFile();"></iframe>
          <input type="button" name="Submit" id="Submit" value="   <% = strTxtOpen %>   " onClick="openFile()">&nbsp;<input type="button" name="cancel" value=" <% = strTxtCancel %> " onClick="window.close()">
        <br /><br /></td>
    </tr>
</table>
</body>
</html>