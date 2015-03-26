<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include Virtual="/WebAdmin/Editor/RTE_configuration/RTE_setup.asp" -->
<!--#include Virtual="/WebAdmin/Editor/RTE_configuration/RTE_skin_file.asp" -->
<!--#include Virtual="/WebAdmin/Editor/functions/RTE_functions_common.asp" -->
<!--#include Virtual="/WebAdmin/Editor/language_files/RTE_language_file_inc.asp" -->
<!--#include Virtual="/WebAdmin/Editor/functions/functions_upload.asp" -->
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


'Set the timeout of the page
Server.ScriptTimeout =  1000

'Set the response buffer to true as we maybe redirecting
Response.Buffer = True



'Dimension veriables
Dim strHyperlink
Dim strTitle
Dim strWindow
Dim strErrorMessage	'Holds the error emssage if the file is not uploaded
Dim lngErrorFileSize	'Holds the file size if the file is not saved because it is to large
Dim blnExtensionOK	'Set to false if the extension of the file is not allowed
Dim strMessageBoxType	'Holds the type of message box used RTE or basic
Dim strFileName		'Holds the file name
Dim saryFileUploadTypes	'Holds the array of file to upload
Dim blnAttachFile
Dim strAttachFilePath



'Intiliase variables
blnExtensionOK = True
blnAttachFile = false
strAttachFilePath = strFileUploadPath



'If this is a post back then upload the file (use querysting as it is a multipart/form-data form)
If Request.QueryString("PB") = "Y" AND blnAttachments Then
	
	''Get the allow file types
	saryFileUploadTypes = Split(Trim(strFileTypes), ";")

	'Call upoload file function
	strFileName = fileUpload(strFileUploadPath, saryFileUploadTypes, intMaxFileSize, strUploadComponent, lngErrorFileSize, blnExtensionOK)



'If this a normal form post back to insert attach the file and read in the form elements
ElseIf Request.Form("URL") <> "http://" AND Request.Form("URL") <> "" AND Request.Form("postBack") Then
	
	
	'Get form elements
	strHyperlink = Request.Form("URL")
	strTitle = Request.Form("Title")
	strWindow = Request.Form("Window")
	
	'Escape characters that will course a crash
	strHyperlink = Replace(strHyperlink, "'", "\'", 1, -1, 1)
	strHyperlink = Replace(strHyperlink, """", "\""", 1, -1, 1)
	strTitle = Replace(strTitle, "'", "\'", 1, -1, 1)
	strTitle = Replace(strTitle, """", "\""", 1, -1, 1)
	strWindow = Replace(strWindow, "'", "\'", 1, -1, 1)
	strWindow = Replace(strWindow, """", "\""", 1, -1, 1)	
	
	blnAttachFile = true
End If

'Change \ for /
strAttachFilePath = Replace(strAttachFilePath, "\", "/", 1, -1, 1)
%>
<html>
<head>
<title>Attach File Properties</title>
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


'If this is Gecko based browser link to JS code for Gecko
If RTEenabled = "Gecko" Then Response.Write(vbCrLf & "<script language=""JavaScript"" src=""RTE_javascript_gecko.asp"" type=""text/javascript""></script>")
	
%>
<script language="JavaScript">

//Function intilise page
function initilzeElements(){
<%

'If an file has been uploaded update the form
If lngErrorFileSize = 0 AND blnExtensionOK = True AND strFileName <> "" Then
	
	'See if we are to use the full URL for file
	If blnUseFullURLpath Then
		Response.Write(vbCrLf & "	document.getElementById('URL').value = '" & strFullURLpathToRTEfiles & Replace(strAttachFilePath, "\", "/", 1, -1, 1)  & "/" & strFileName & "'")
		Response.Write(vbCrLf & "	showPreview('" & strFullURLpathToRTEfiles & Replace(strAttachFilePath, "\", "/", 1, -1, 1)  & "/" & strFileName & "');")
	Else
		Response.Write(vbCrLf & "	document.getElementById('URL').value = '" & Replace(strAttachFilePath, "\", "/", 1, -1, 1)  & "/" & strFileName & "'")
		Response.Write(vbCrLf & "	showPreview('" & Replace(strAttachFilePath, "\", "/", 1, -1, 1)  & "/" & strFileName & "');")
	End If
	Response.Write(vbCrLf & "	document.getElementById('Submit').disabled = false;")

'Else no file has been uploaded so just initilise the form
Else
	Response.Write(vbCrLf & "	document.getElementById('URL').value = 'http://'")
	Response.Write(vbCrLf & "	document.getElementById('Submit').disabled = true;")
End If
%>
}

<%
'If this a post back write javascript
If blnAttachFile Then
	
	'*********************************************
	'***  	JavaScript for Mozilla & IE	 *****
	'*********************************************
	
	Response.Write(vbCrLf & "	editor = window.opener.document.getElementById('WebWizRTE');")
	
	'Mozilla and IE use different methods to get the selected text (if any)
	If RTEenabled = "Gecko" Then 
		Response.Write(vbCrLf & vbCrLf & "	var selectedRange = editor.contentWindow.window.getSelection();")
	Else	
		Response.Write(vbCrLf & vbCrLf & "	var selectedRange = editor.contentWindow.document.selection.createRange();")
	End If	
	
	
	
	
	'If there is a selected area, turn it into a hyperlink
	Response.Write(vbCrLf & vbCrLf & "if (selectedRange != null && selectedRange")
	If RTEenabled = "winIE" Then Response.Write(".text")
	Response.Write(" != ''){")

	'Create hyperlink
	Response.Write(vbCrLf & "	editor.contentWindow.window.document.execCommand('CreateLink', false, '" & strHyperlink & "')")
		
	'Set attributes if required
	If strTitle <> "" OR strWindow <> "" Then
		
		'Set hyperlink attributes
		Response.Write(vbCrLf & vbCrLf & "	var hyperlink = editor.contentWindow.window.document.getElementsByTagName('a');" & _
			       vbCrLf & "	for (var i=0; i < hyperlink.length; i++){" & _
			       vbCrLf & "		if (hyperlink[i].getAttribute('href').search('" & strHyperlink & "') != -1){")
		
		'Set title, or window if required	       
		If strTitle <> "" Then Response.Write(vbCrLf & "			hyperlink[i].setAttribute('title','" & strTitle & "');")
		If strWindow <> "" Then Response.Write(vbCrLf & "			hyperlink[i].setAttribute('target','" & strWindow & "');")
			       
		Response.Write(vbCrLf & "		}" & _
			       vbCrLf & "	}")
	End If
	
	
	
	'Else no selected area so use the hyperlink text as the displayed text
	Response.Write(vbCrLf & "}else{")
	
	
	'Tell that we are maiing a hyperlink 'a'
	Response.Write(vbCrLf & vbCrLf & "	link = editor.contentWindow.document.createElement('a');")
	
	
	Response.Write(vbCrLf & vbCrLf & "	link.setAttribute('href', '" & strHyperlink & "');")
	If strTitle <> "" Then Response.Write(vbCrLf & "	link.setAttribute('title', '" & strTitle & "');")
	If strWindow <> "" Then Response.Write(vbCrLf & "	link.setAttribute('target', '" & strWindow & "');")
	
	'Use the selected text range make this the displayed text otherwise use the link as the displayed text
	Response.Write(vbCrLf & vbCrLf & "	link.appendChild(editor.contentWindow.document.createTextNode('" & strHyperlink & "'));")
	
     	'If this is Mozilla then we need to call insertElementPosition to find where to place the file
     	If RTEenabled = "Gecko" Then 
		
		Response.Write(vbCrLf & vbCrLf & "	try{" & _
					vbCrLf & "		insertElementPosition(editor.contentWindow, link);" & _
					vbCrLf & "	}catch(exception){" & _
					vbCrLf & "		alert('" & strTxtErrorInsertingObject & "');" & _
					vbCrLf & "		editor.contentWindow.focus();" & _
					vbCrLf & "	}")
	
	'Else this is IE so placing the file is simpler
	Else
		Response.Write(vbCrLf & vbCrLf & "	try{" & _
					vbCrLf & "		editor.contentWindow.focus();" & _
					vbCrLf & "		editor.contentWindow.document.selection.createRange().pasteHTML(link.outerHTML);" & _
					vbCrLf & "	}catch(exception){" & _
					vbCrLf & "		alert('" & strTxtErrorInsertingObject & "');" & _
					vbCrLf & "		editor.contentWindow.focus();" & _
					vbCrLf & "	}")
	End If
	
	Response.Write(vbCrLf & "}")
	
	'Set focus
	Response.Write(vbCrLf & vbCrLf & "	editor.contentWindow.focus();")
	
	'Close window
	Response.Write(vbCrLf & "	window.close();")
End If

%>

//Function to preview URL
function showPreview(attached){

	//Get the file extension to check
	var extension = attached;
	extension.toLowerCase();
	extension = extension.slice(extension.lastIndexOf('.'), extension.length);
	
	//Display file if of the correct type
	if (extension==".txt" 
	 || extension==".text" 
	 || extension==".htm" 
	 || extension==".html" 
	 || extension==".gif" 
	 || extension==".jpg" 
	 || extension==".jpeg" 
	 || extension==".png" 
	 || extension==".bmp"){
		alert("<% = strTxtPleaseWaitWhilePreviewLoaded %>");
		try {
			document.getElementById("prevWindow").contentWindow.location.href = attached;
		}catch(exception){
		}
	
	}else{
		document.getElementById("prevWindow").contentWindow.location.href="RTE_popup_link_preview.asp?b=0";
	
	}
}

//Function to check upload file is selected
function checkFile(){
	if (document.getElementById('file').value==''){
	
		alert('<% = strTxtErrorUploadingFile %>\n<% = strTxtNoFileToUpload %>')
		return false;
	}else{
		alert('<% = strTxtPleaseWaitWhileFileIsUploaded %>');
		return true;
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
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" OnLoad="self.focus(); initilzeElements();">
<table width="100%"  border="0" cellpadding="3" cellspacing="0" bgcolor="<% = strRTEpopupTopRowColour %>">
    <tr>
      <td colspan="2" width="63%" bgcolor="<% = strRTEpopupTopRowColour %>" class="heading"><% = strTxAttachFileProperties %></td>
    </tr>
    <tr>
      <td colspan="2" bgcolor="<% = strRTEpopupCentreRowColour %>"><table width="100%" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr>
          <td width="42%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="2">
            <tr>
              <td width="88%" class="text"><% = strTxtPath %>: <input name="path" type="text" id="path" size="40" value="/<% = strAttachFilePath %>" readonly="readonly" class="display"></td>
            </tr>
            <tr>
              <td class="text"><% = strTxtFileName %>:<iframe src="RTE_file_browser.asp" id="fileWindow" width="98%" height="180px" style="border: #A5ACB2 1px solid;backgroundColor: #FFFFFF;"></iframe></td>
            </tr>
            <form method="post" action="RTE_popup_file_atch.asp?PB=Y" name="frmUpload" enctype="multipart/form-data" onsubmit="return checkFile();" >
             <tr>
              <td class="text"><% = strTxtFileUpload %></td>
            </tr>
            <tr>
              <td class="smText"><% Response.Write(strTxtFilesMustBeOfTheType & ", " & Replace(strFileTypes, ";", ", ", 1, -1, 1) & ", " & strTxtAndHaveMaximumFileSizeOf & " " & intMaxFileSize & "KB") %></td>
            </tr>
            <tr>
              <td><input id="file" name="file" type="file" size="35" /></td>
            </tr>
            <tr>
              <td>
              	<input name="upload" type="submit" id="upload" value="Upload">
              </td>
            </tr>
           </form>
          </table></td>
          <td width="58%" valign="top">
          <form method="post" action="RTE_popup_file_atch.asp" name="frmImageInsrt">
            <table width="100%" border="0" cellspacing="0" cellpadding="2">
              <tr>
                <td width="19%" align="right" class="text"><% = strTxtFileURL %>:</td>
                <td width="81%" colspan="5"><input name="URL" type="text" id="URL" value="" size="40" onChange="document.getElementById('Submit').disabled=false;" onkeypress="document.getElementById('Submit').disabled=false;">
                  <input name="preview" type="button" id="preview" value="<% = strTxtPreview %>" onClick="showPreview(document.getElementById('URL').value)">
                </td>
                <tr>
                <td align="right" class="text"><% = strTxtTitle %>:</td>
                <td><input name="Title" type="text" id="Title" size="40" maxlength="40"></td>
              </tr>
              <tr>
                <td align="right" class="text"><% = strTxtWindow %>:</td>
                <td><select name="windowSel" id="windowSel" onChange="document.getElementById('Window').value=this.options[this.selectedIndex].value">
                  <option value="" selected>Default</option>
                  <option value="_blank">New Window</option>
                  <option value="_self">Same Window</option>
                  <option value="_parent">Parent Window</option>
                  <option value="_top">Top Window</option>
                </select>
                  <input name="Window" type="text" id="Window" size="12" maxlength="15"></td>
              </tr>
              </tr>
                <td align="right" valign="top" class="text"><% = strTxtPreview %>:</td>
                <td colspan="5"><iframe src="RTE_popup_link_preview.asp" id="prevWindow" width="98%" height="220px" style="border: #A5ACB2 1px solid;backgroundColor: #FFFFFF;"></iframe></td>
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
      <td align="right" bgcolor="<% = strRTEpopupBottomRowColour %>"><input type="hidden" name="postBack" value="true">
          <input type="submit" name="Submit" id="Submit" value="     <% = strTxtOK %>     ">&nbsp;<input type="button" name="cancel" value=" <% = strTxtCancel %> " onClick="window.close()">
        </form></td>
    </tr>

</table>
</body>
</html>
<%
'If the file upload has failed becuase of the wrong extension display an error message
If blnExtensionOK = False Then
	Response.Write("<script language=""JavaScript"">")
	Response.Write("alert('" & strTxtErrorUploadingFile & ".\n" &strTxtFileOfTheWrongFileType & ".\n" & strTxtFilesMustBeOfTheType & ", "  &  Replace(strFileTypes, ";", ", ", 1, -1, 1) & "');")
	Response.Write("</script>")

'Else if the file upload has failed becuase the size is to large display an error message
ElseIf lngErrorFileSize <> 0 Then
	Response.Write("<script language=""JavaScript"">")
	Response.Write("alert('" & strTxtErrorUploadingFile & ".\n" & strTxtFileSizeToLarge & " " & lngErrorFileSize & "KB.\n" & strTxtMaximumFileSizeMustBe & " " & intMaxFileSize & "KB');")
	Response.Write("</script>")
End If
%>