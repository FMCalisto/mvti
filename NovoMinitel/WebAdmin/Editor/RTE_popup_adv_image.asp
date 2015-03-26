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
Dim strImageURL
Dim strImageAltText
Dim strAlign
Dim intBorder
Dim lngHorizontal
Dim lngVerical
Dim intWidth
Dim intHeight
Dim strErrorMessage	'Holds the error emssage if the file is not uploaded
Dim lngErrorFileSize	'Holds the file size if the file is not saved because it is to large
Dim blnExtensionOK	'Set to false if the extension of the file is not allowed
Dim strMessageBoxType	'Holds the type of message box used RTE or basic
Dim strImageName	'Holds the file name
Dim saryFileUploadTypes	'Holds the array of file to upload
Dim blnInsertImage



'Intiliase variables
blnExtensionOK = True
blnInsertImage = false



'If this is a post back then upload the image (use querysting as it is a multipart/form-data form)
If Request.QueryString("PB") = "Y" AND blnImageUpload Then
	
	'Get the image types to upload
	saryFileUploadTypes = Split(Trim(strImageTypes), ";")
	
	'Call upoload file function
	strImageName = fileUpload(strImageUploadPath, saryFileUploadTypes, intMaxImageSize, strUploadComponent, lngErrorFileSize, blnExtensionOK)



'If this a normal form post back to insert an image read in the form elements
ElseIf Request.Form("URL") <> "http://" AND Request.Form("URL") <> "" AND Request.Form("postBack") Then
	
	'Initilise variable
	intBorder = 0
	
	'Get form elements
	strImageURL = Request.Form("URL")
	strImageAltText = Request.Form("Alt")
	strAlign = Request.Form("align")
	If isNumeric(Request.Form("intBorder")) Then intBorder = Request.Form("border")
	If isNumeric(Request.Form("hoz")) Then lngHorizontal = CLng(Request.Form("hoz"))
	If isNumeric(Request.Form("vert")) Then lngVerical = CLng(Request.Form("vert"))
	If isNumeric(Request.Form("width")) Then intWidth = CLng(Request.Form("width"))
	If isNumeric(Request.Form("height")) Then intHeight = CLng(Request.Form("height"))
	
	'Escape characters that will course a crash
	strImageURL = Replace(strImageURL, "'", "\'", 1, -1, 1)
	strImageURL = Replace(strImageURL, """", "\""", 1, -1, 1)
	strImageAltText = Replace(strImageAltText, "'", "\'", 1, -1, 1)
	strImageAltText = Replace(strImageAltText, """", "\""", 1, -1, 1)
	
	blnInsertImage = true
End If

'Change \ for /
strImageName = Replace(strImageName, "\", "/", 1, -1, 1)
%>
<html>
<head>
<title>Image Properties</title>
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

'If an image has been uploaded update the form
If lngErrorFileSize = 0 AND blnExtensionOK = True AND strImageName <> "" Then
	
	'See if we are to use the full URL for file
	If blnUseFullURLpath Then
		Response.Write(vbCrLf & "	document.getElementById('URL').value = '" & strFullURLpathToRTEfiles & Replace(strImageUploadPath, "\", "/", 1, -1, 1)  & "/" & strImageName & "'")
		Response.Write(vbCrLf & "	document.getElementById('prevWindow').contentWindow.document.getElementById('prevFile').src = '" & strFullURLpathToRTEfiles & Replace(strImageUploadPath, "\", "/", 1, -1, 1)  & "/" & strImageName & "'")
	Else
		Response.Write(vbCrLf & "	document.getElementById('URL').value = '" & Replace(strImageUploadPath, "\", "/", 1, -1, 1)  & "/" & strImageName & "'")
		Response.Write(vbCrLf & "	document.getElementById('prevWindow').contentWindow.document.getElementById('prevFile').src = '" & Replace(strImageUploadPath, "\", "/", 1, -1, 1)  & "/" & strImageName & "'")
	End If
	Response.Write(vbCrLf & "	document.getElementById('Submit').disabled = false;")

'Else no image has been uploaded so just initilise the form
Else
	Response.Write(vbCrLf & "	document.getElementById('URL').value = 'http://'")
	Response.Write(vbCrLf & "	document.getElementById('Submit').disabled = true;")
End If
%>
}

<%
'If this a post back write javascript
If blnInsertImage Then
	
	Response.Write(vbCrLf & vbCrLf & "	editor = window.opener.document.getElementById('WebWizRTE');")
	
	'Tell that we are an image
	Response.Write(vbCrLf & vbCrLf & "	img = editor.contentWindow.document.createElement('img');")
	
	'Set image attributes
	Response.Write(vbCrLf & vbCrLf & "	img.setAttribute('src', '" & strImageURL & "');")
	Response.Write(vbCrLf & "	img.setAttribute('border', '" & intBorder & "');")
	If strImageAltText <> "" Then Response.Write(vbCrLf & "	img.setAttribute('alt', '" & strImageAltText & "');")
	If lngHorizontal <> "" Then Response.Write(vbCrLf & "	img.setAttribute('hspace', '" & lngHorizontal & "');")
	If intWidth <> "" Then Response.Write(vbCrLf & "	img.setAttribute('width', '" & intWidth & "');")
	If intHeight <> "" Then Response.Write(vbCrLf & "	img.setAttribute('height', '" & intHeight & "');")
	If lngVerical <> "" Then Response.Write(vbCrLf & "	img.setAttribute('vspace', '" & lngVerical & "');")
	If strAlign <> "" Then Response.Write(vbCrLf & "	img.setAttribute('align', '" & strAlign & "');")
	 
     
     		'If this is Mozilla then we need to call insertElementPosition to find where to place the image
     		If RTEenabled = "Gecko" Then 
		
		Response.Write(vbCrLf & vbCrLf & "	try{" & _
					vbCrLf & "		insertElementPosition(editor.contentWindow, img);" & _
					vbCrLf & "	}catch(exception){" & _
					vbCrLf & "		alert('" & strTxtErrorInsertingObject & "');" & _
					vbCrLf & "		editor.contentWindow.focus();" & _
					vbCrLf & "	}")
	
	'Else this is IE so placing the image is simpler
	Else
		Response.Write(vbCrLf & vbCrLf & "	try{" & _
					vbCrLf & "		editor.contentWindow.focus();" & _
					vbCrLf & "		editor.contentWindow.document.selection.createRange().pasteHTML(img.outerHTML);" & _
					vbCrLf & "	}catch(exception){" & _
					vbCrLf & "		alert('" & strTxtErrorInsertingObject & "');" & _
					vbCrLf & "		editor.contentWindow.focus();" & _
					vbCrLf & "	}")
	End If
		
	'Set focus
	Response.Write(vbCrLf & vbCrLf & "	editor.contentWindow.focus();")
		
	'Close window
	Response.Write(vbCrLf & "	window.close();")
End If

%>

//Function to preview image
function getImage(URL){
	alert("<% = strTxtPleaseWaitWhilePreviewLoaded %>")
	document.getElementById("prevWindow").contentWindow.document.getElementById("prevFile").src = URL
}

//Function to change image properties
function changeImage(){
	document.getElementById("prevWindow").contentWindow.document.getElementById("prevFile").alt = document.getElementById('Alt').value
	document.getElementById("prevWindow").contentWindow.document.getElementById("prevFile").align = document.getElementById('align').value
	document.getElementById("prevWindow").contentWindow.document.getElementById("prevFile").border = document.getElementById('border').value
	document.getElementById("prevWindow").contentWindow.document.getElementById("prevFile").hspace = document.getElementById('hoz').value
	document.getElementById("prevWindow").contentWindow.document.getElementById("prevFile").vspace = document.getElementById('vert').value
	//Check a value for width and hieght is set or image will be deleted
	if (document.getElementById('width').value!=''){
		document.getElementById("prevWindow").contentWindow.document.getElementById("prevFile").width = document.getElementById('width').value
	}
	if (document.getElementById('height').value!=''){
		document.getElementById("prevWindow").contentWindow.document.getElementById("prevFile").height = document.getElementById('height').value
	}
}

<%
'If image upload is enabled then have the following function
If blnImageUpload Then	
%>
//Function to check upload file is selected
function checkFile(){
	if (document.getElementById('file').value==''){
	
		alert('<% = strTxtErrorUploadingImage %>\n<% = strTxtNoImageToUpload %>')
		return false;
	}else{
		alert('<% = strTxtPleaseWaitWhileImageIsUploaded %>');
		return true;
	}
}<%
End If
%>
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
      <td colspan="2" bgcolor="<% = strRTEpopupTopRowColour %>" class="heading"><% = strTxtImageProperties %></td>
    </tr>
    <tr>
      <td colspan="2" bgcolor="<% = strRTEpopupCentreRowColour %>"><table width="100%" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr>
          <td width="38%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="2">
            <tr>
              <td width="88%" class="text"><% = strTxtPath %>: <input name="path" type="text" id="path" size="39" value="/<% = strImageUploadPath %>" readonly="readonly" class="display"></td>
            </tr>
            <%
            
'If image upload is enabled then display an image upload form
If blnImageUpload Then

%>
            <tr>
              <td class="text"><% = strTxtFileName %>:<iframe src="RTE_file_browser.asp?look=img" id="fileWindow" width="98%" height="180px" style="border: #A5ACB2 1px solid;backgroundColor: #FFFFFF;"></iframe></td>
            </tr>
            <form method="post" action="RTE_popup_adv_image.asp?PB=Y" name="frmUpload" enctype="multipart/form-data" onsubmit="return checkFile();" >
             <tr>
              <td class="text"><% = strTxtImageUpload %></td>
            </tr>
            <tr>
              <td class="smText"><% Response.Write(strTxtImagesMustBeOfTheType & ", " & Replace(strImageTypes, ";", ", ", 1, -1, 1) & ", " & strTxtAndHaveMaximumFileSizeOf & " " & intMaxImageSize & "KB")  %></td>
            </tr>
            <tr>
              <td><input id="file" name="file" type="file" size="35" /></td>
            </tr>
            <tr>
              <td>
              	<input name="upload" type="submit" id="upload" value="Upload">
              </td>
            </tr>
           </form><%
           
'Else file uploading is disabled so show a larger file browser window
Else

%>
	    <tr>
              <td class="text"><% = strTxtFileName %>:<iframe src="RTE_file_browser.asp?look=img" id="fileWindow" width="98%" height="278px" style="border: #A5ACB2 1px solid;backgroundColor: #FFFFFF;"></iframe></td>
            </tr>
<%
End If

%>
          </table></td>
          <td width="58%" valign="top">
          <form method="post" action="RTE_popup_adv_image.asp" name="frmImageInsrt">
            <table width="100%" border="0" cellspacing="0" cellpadding="2">
              <tr>
                <td width="25%" align="right" class="text"><% = strTxtImageURL %>:</td>
                <td colspan="5"><input name="URL" type="text" id="URL" value="" size="38" onChange="document.getElementById('Submit').disabled=false;" onkeypress="document.getElementById('Submit').disabled=false;">
                  <input name="preview" type="button" id="preview" value="<% = strTxtPreview %>" onClick="getImage(document.getElementById('URL').value)">
                </td>
              </tr>
              <tr>
                <td align="right" class="text"><% = strTxtAlternativeText %>:</td>
                <td colspan="5"><input name="Alt" type="text" id="Alt" size="38" onBlur="changeImage()"></td>
              </tr>
              <tr>
                <td align="right" class="text"><% = strTxtWidth %>:</td>
                <td width="4%"><input name="width" type="text" id="width" size="3" maxlength="3" onkeyup="changeImage()" autocomplete="off" /></td>
                <td width="22%" align="right" class="text"><% = strTxtHorizontal %>:</td>
                <td width="6%"><input name="hoz" type="text" id="hoz" size="3" maxlength="3" onkeyup="changeImage()" autocomplete="off" /></td>
                <td width="20%" align="right" class="text"><% = strTxtAlignment %>:</td>
                <td width="30%"><select size="1" name="align" id="align" onChange="changeImage()">
                  <option value="" selected >Default</option>
                  <option value="left">Left</option>
                  <option value="right">Right</option>
                  <option value="texttop">Texttop</option>
                  <option value="absmiddle">Absmiddle</option>
                  <option value="baseline">Baseline</option>
                  <option value="absbottom">Absbottom</option>
                  <option value="bottom">Bottom</option>
                  <option value="middle">Middle</option>
                  <option value="top">Top</option>
                </select></td>
              </tr>
              <tr>
                <td align="right" class="text"><% = strTxtHeight %>:</td>
                <td><input name="height" type="text" id="height" size="3" maxlength="3" onkeyup="changeImage()" autocomplete="off" /></td>
                <td align="right" class="text"><% = strTxtVertical %>:</td>
                <td><input name="vert" type="text" id="vert" size="3" maxlength="3" onkeyup="changeImage()" autocomplete="off" /></td>
                <td align="right" class="text"><% = strTxtBorder %>:</td>
                <td><input name="border" type="text" id="border" size="3" maxlength="2" onKeyUp="changeImage()" autocomplete="off" /></td>
              </tr>
              <tr>
                <td align="right" valign="top" class="text"><% = strTxtPreview %>:</td>
                <td colspan="5"><iframe src="RTE_popup_image_preview.asp" id="prevWindow" width="98%" height="215px" style="border: #A5ACB2 1px solid;backgroundColor: #FFFFFF;"></iframe></td>
                </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td width="38%" valign="top" bgcolor="<% = strRTEpopupBottomRowColour %>">&nbsp;<%

'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
If blnAbout Then
	Response.Write("<span class=""text"" style=""font-size:10px"">Powered by <a href=""http://www.richtexteditor.org"" target=""_blank"" style=""font-size:10px"">Web Wiz Rich Text Editor</a> version " & strRTEversion & "</span>")
End If 
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******      
      
      %></td>
      <td width="24%" align="right" bgcolor="<% = strRTEpopupBottomRowColour %>">        <input type="hidden" name="postBack" value="true">
        <input type="submit" name="Submit" id="Submit" value="     <% = strTxtOK %>     ">&nbsp;<input type="button" name="cancel" value=" <% = strTxtCancel %> " onClick="window.close()"></td>
    </tr>
</table>
</body>
</html>
<%
'If the file upload has failed becuase of the wrong extension display an error message
If blnExtensionOK = False Then
	Response.Write("<script language=""JavaScript"">")
	Response.Write("alert('" & strTxtErrorUploadingImage & ".\n" &strTxtImageOfTheWrongFileType & ".\n" & strTxtImagesMustBeOfTheType & ", "  &  Replace(strImageTypes, ";", ", ", 1, -1, 1) & "');")
	Response.Write("</script>")

'Else if the file upload has failed becuase the size is to large display an error message
ElseIf lngErrorFileSize <> 0 Then
	Response.Write("<script language=""JavaScript"">")
	Response.Write("alert('" & strTxtErrorUploadingImage & ".\n" & strTxtImageFileSizeToLarge & " " & lngErrorFileSize & "KB.\n" & strTxtMaximumFileSizeMustBe & " " & intMaxImageSize & "KB');")
	Response.Write("</script>")
End If
%>