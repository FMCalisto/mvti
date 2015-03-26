<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include Virtual="/WebAdmin/Editor/RTE_configuration/RTE_setup.asp" -->
<!--#include Virtual="/WebAdmin/Editor/RTE_configuration/RTE_skin_file.asp" -->
<!--#include Virtual="/WebAdmin/Editor/functions/RTE_functions_common.asp" -->
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
Dim objFSO			'Holds the file system object
Dim tsObject			'Holds the text stream object
Dim strFilePath			'Holds the file path
Dim saryAllowedFileTypes	'Holds the allowed file types
Dim intExtensionLoopCounter	'Holds the extension loop counter
Dim strFileName			'Holds the file name
Dim strFileExtension		'Holds the file extension
Dim strFileTitle		'Holds the file title
Dim blnFileExtensionOK		'Set to true if file extension is OK
Dim strEditorContents		'Holds the contents of the editor
Dim strFileContents 		'Holds the file contents to save
Dim strNewFileName		'Holds the new filename as it may need to be changed
Dim blnNewFileName		'set to rtrue if the fimename is changed
Dim strSavePageEncoding		'Holds the code page


'if save is on run the file
If blnSave Then
	
	'Get the file types allowed
	saryAllowedFileTypes = Split(Trim(strSaveFileTypes), ";")
	
	'Get the save file path
	strFilePath = strSaveFileFolderPath
	
	'Change \ for /
	strFilePath = Replace(strFilePath, "\", "/'", 1, -1, 1)

	
	
	'If this is a postback save the file
	If Request.Form("postback") Then
		
		blnFileExtensionOK = false
		blnNewFileName = false
		
		'Read in the form details
		strFileName = Trim(Request.Form("fileName"))
		strFileExtension = Trim(Request.Form("ext"))
		strFileTitle = Trim(Request.Form("title"))
		strEditorContents = Request.Form("WebWizRTE")
		strSavePageEncoding = Trim(Request.Form("DOCTYPE"))
		
		'Check the file extension is OK
		'Loop through and display allowed extensions
		For intExtensionLoopCounter = 0 To UBound(saryAllowedFileTypes)
			If strFileExtension = "." & saryAllowedFileTypes(intExtensionLoopCounter) Then blnFileExtensionOK = true
		Next
		
		'If the file extension is not allowed set the file type to text
		If blnFileExtensionOK = false Then strFileExtension = ".txt"
		
		'Check there is a title
		If strFileTitle = "" Then strFileTitle = "Untitled Document"
		
		'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
		If blnAbout Then
			strFileTitle = strFileTitle & " - Saved from Web Wiz Rich Text Editor ver. " & strRTEversion
		End If 
		'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
		
		'Build file contents
		strFileContents = "<!doctype html public ""-//W3C//DTD HTML 4.0 Transitional//EN"">" & _
		vbCrLf & "<html>" & _
		vbCrLf & "<head>" & _
		vbCrLf & "<title>" & strFileTitle & "</title>" & _
		vbCrLf & strSavePageEncoding & _
		vbCrLf & "<meta http-equiv=""GENERATOR"" content=""Web Wiz Rich Text Editor " & strRTEversion & """>" & _
		vbCrLf & "</head>" & _
		vbCrLf & "<body>" & _
		vbCrLf & strEditorContents & _
		vbCrLf & "</body>" & _
		vbCrLf & "</html>"
		
		
		'Save the file
		
		'Initilse the files name
		strNewFileName =  strFileName
		
		'Check the file name is OK
		
		'Remove dodgy characters that may course problems
		strNewFileName = characterStrip(strNewFileName)
	
		'If there is no file name left make one
		If strNewFileName = "" Then strNewFileName = "New Document"
		
		'Loop through and remove any extra extensions in the file name
		For intExtensionLoopCounter = 0 To UBound(saryAllowedFileTypes)
			strNewFileName = Replace(strNewFileName, "." & saryAllowedFileTypes(intExtensionLoopCounter), "", 1, -1, 0)
		Next
		
		'Add the extension onto the file name	
		strNewFileName = strNewFileName & strFileExtension
		
		
		
		
	
		'Create the file system object
		Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
		
		'If you can not overwrite files check to make sure the file does not exsist, if it does rename the file
		If blnOverWriteFiles = false Then
			'Check to make sure the file does not already exist
			Do While objFSO.FileExists(Server.MapPath(strSaveFileFolderPath) & "\" & strNewFileName)
	
				'Create a new file name for file if it already exsist
				strNewFileName = hexValue(3) & "_" & strNewFileName
			Loop
		End If
		
		
		'Create a new file
		Set tsObject = objFSO.CreateTextFile(Server.MapPath(strSaveFileFolderPath) & "\" & strNewFileName)
	
		'Write to the new file
		tsObject.Write strFileContents
		
		
		'Clean up
		Set objFSO = Nothing
		Set tsObject = Nothing
		
		
		'See if the file name is changed
		If strFileName & strFileExtension <> strNewFileName Then blnNewFileName = true
	End If
	

%>
<html>
<head>
<title>Save File</title>
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
<script language="javascript">
function initialise(){
	document.getElementById('WebWizRTE').value=window.opener.document.getElementById('WebWizRTE').contentWindow.document.body.innerHTML;
	document.getElementById('Submit').disabled = true;
	self.focus();
}
</script>
<style type="text/css">
input.display {
	border: 0px;
	background-color: <% = strRTEpopupCentreRowColour %>;
}
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" OnLoad="initialise();">
<table width="100%"  border="0" cellpadding="3" cellspacing="0" bgcolor="<% = strRTEpopupTopRowColour %>">
<form method="post" action="RTE_popup_save_file.asp" name="frmSave">
    <tr>
      <td colspan="2" width="57%" bgcolor="<% = strRTEpopupTopRowColour %>" class="heading"><% = strTxtSave %></td>
    </tr>
    <tr>
      <td colspan="2" bgcolor="<% = strRTEpopupCentreRowColour %>"><table width="100%" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr>
          <td width="47%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="2">
            <tr>
              <td width="48%" class="text"><% = strTxtPath %>:<input name="path" type="text" id="path" size="35" value="/<% = strFilePath %>" readonly="readonly" class="display"></td>
              </tr>
            <tr>
              <td class="text"><% = strTxtFileName %>:<iframe src="RTE_file_browser.asp?look=save" id="fileWindow" width="98%" height="180px" style="border: #A5ACB2 1px solid;backgroundColor: #FFFFFF;"></iframe></td>
              </tr>
          </table></td>
          <td width="53%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="2">
            <tr>
              <td align="right" class="text">&nbsp;</td>
              <td class="text">&nbsp;</td>
            </tr>
            <tr>
              <td align="right" class="text">&nbsp;</td>
              <td class="text">&nbsp;</td>
            </tr>
            <tr>
              <td width="27%" align="right" class="text"><% = strTxtFileName %>:</td>
              <td width="73%" class="text"><input name="fileName" type="text" id="fileName" size="20" onChange="document.getElementById('Submit').disabled=false;" onkeypress="document.getElementById('Submit').disabled=false;">
                <select name="ext" id="ext"><%

	'Loop through and display allowed extensions
	For intExtensionLoopCounter = 0 To UBound(saryAllowedFileTypes)
	
		Response.Write("<option value=""." & saryAllowedFileTypes(intExtensionLoopCounter) & """>." & saryAllowedFileTypes(intExtensionLoopCounter) & "</option>")
	Next
	
	%>
                </select>
</td>
            </tr>
            <tr>
              <td align="right" class="text"><% = strTxtTitle %>:</td>
              <td valign="top" class="text"><input name="title" type="text" id="title" size="30"></td>
            </tr>
            <tr>
              <td align="right" class="text"> DOCTYPE: </td>
              <td valign="top" class="text"><input name="DOCTYPE" type="text" id="DOCTYPE" value="&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=iso-8859-1&quot;&gt;" size="30"></td>
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
      <td align="right" bgcolor="<% = strRTEpopupBottomRowColour %>">
          <input name="WebWizRTE" type="hidden" id="WebWizRTE">
          <input name="postback" type="hidden" id="postback" value="true">
          <input type="submit" name="Submit" id="Submit" value="   <% = strTxtSave %>   ">&nbsp;<input type="button" name="cancel" value=" <% = strTxtCancel %> " onClick="window.close()">
      <br /><br /></td>
    </tr>
</form>
</table>
</body>
</html><%

'If the file has been saved display a message
If Request.Form("postback") Then
	Response.Write("<script language=""JavaScript"">")
	If blnNewFileName Then
	 	Response.Write("	alert('" & strTxtFileAlreadyExistsRenamedAs & " \'" & strNewFileName & "\'.');")
	Else
		Response.Write("	alert('" & strTxtTheFile & " \'" & strNewFileName & "\' " & strTxtHasBeenSaved & ".');")
	End If
	      
	Response.Write(vbCrLf & "	window.close();" & vbCrLf & "</script>")

End If



End If

%>