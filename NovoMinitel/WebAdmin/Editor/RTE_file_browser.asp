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

Response.AddHeader "pragma","cache"
Response.AddHeader "cache-control","public"
Response.CacheControl = "Public"

'Dim variables
Dim objFSO			'Holds the file system object
Dim objFSOfolder		'Holds the FSO file object
Dim objFSOsubFolder
Dim objFSOfile
Dim saryAllowedFileTypes	'Holds the allowd file types
Dim intExtensionLoopCounter	'Loop counter to check file extensions
Dim strFileName			'Holds the file name
Dim strFileType			'Holds the file type
Dim intFileSize			'Holds the file size
Dim strFileIcon			'Holds the icon for the file
Dim strFileExtension		'Holds the file extension
Dim intElementIDno		'Holds the element ID number
Dim strSubFolderName		'Holds the name of the subfolder
Dim strFolderPath		'Holds the path to the folder
Dim strSubFolderUp		'Hollds the path to the folder above
Dim strMode			'Holds the page mode

'Initialise variables
intElementIDno = 0
strSubFolderName = Request.QueryString("sub")
strMode = Request.QueryString("look")

'Get what we are looking for
'If this is the image dialog
If strMode = "img" Then

	'Get the image types allowed
	saryAllowedFileTypes = Split(Trim(strImageTypes), ";")
	
	'Get the file path
	strFolderPath = strImageUploadPath


'If this is the open file dialog
ElseIf  strMode = "open" Then
	
	'Get the file types allowed
	saryAllowedFileTypes = Split(Trim(strOpenFileTypes), ";")
	
	'Get the file path
	strFolderPath = strOpenFileFolderPath


'If this is the save file dialog
ElseIf  strMode = "save" Then
	
	'Get the file types allowed
	saryAllowedFileTypes = Split(Trim(strSaveFileTypes), ";")
	
	'Get the file path
	strFolderPath = strSaveFileFolderPath

'Else this is the file upload dialog
Else
	'Get the file types allowed
	saryAllowedFileTypes = Split(Trim(strFileTypes), ";")
	
	'Get the file path
	strFolderPath = strFileUploadPath
End If



'See if this is a subfolder being looked in
If strSubFolderName <> "" Then
	
	'Stip path tampering for security reasons
	strSubFolderName = Replace(strSubFolderName, "../", "", 1, -1, 1)
	strSubFolderName = Replace(strSubFolderName, "..\", "", 1, -1, 1)
	strSubFolderName = Replace(strSubFolderName, "./", "", 1, -1, 1)
	strSubFolderName = Replace(strSubFolderName, ".\", "", 1, -1, 1)
	
	'Get the complete folder path to the subfolder in the upload directory
	strFolderPath = strFolderPath &  strSubFolderName
	

	'Calculate one folder up path
	strSubFolderUp = Mid(strSubFolderName, 1, (Len(strSubFolderName) - Len(Mid(strSubFolderName, InstrRev(strSubFolderName, "\")))))
	
End If


'Create the file system object
Set objFSO = Server.CreateObject("Scripting.FileSystemObject")

'Create a folder object with the contents of the folder
Set objFSOfolder = objFSO.GetFolder(Server.MapPath(strFolderPath))



%>
<html>
<head>
<title>RTE File Browser</title>
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
	
//Function to get subfolder
function subFolder(sub){
	self.document.location.href = 'RTE_file_browser.asp?look=<% = Server.URLEncode(Request.QueryString("look")) %>&sub=<% = Replace(strSubFolderName, "\", "\\", 1, -1, 1) %>\\' + sub;
}

//Function to get subfolder
function upFolder(){
	self.document.location.href = 'RTE_file_browser.asp?look=<% = Server.URLEncode(Request.QueryString("look")) %>&sub=<% = Replace(strSubFolderUp, "\", "\\", 1, -1, 1) %>';
}

//Function to preview image
function upadatePreview(fileName){<%

'If this is an image use different code to preview image
If strMode = "img" Then
	
	Response.Write(vbCrLf & "	alert('" & strTxtPleaseWaitWhilePreviewLoaded & "');")
	'See if we are to use the full URL for this image
	If blnUseFullURLpath Then
		Response.Write(vbCrLf & "	self.parent.document.getElementById('prevWindow').contentWindow.document.getElementById('prevFile').src = '" & strFullURLpathToRTEfiles & Replace(strFolderPath, "\", "/", 1, -1, 1) & "/' + fileName;")
	Else
		Response.Write(vbCrLf & "	self.parent.document.getElementById('prevWindow').contentWindow.document.getElementById('prevFile').src = '" & Replace(strFolderPath, "\", "/", 1, -1, 1) & "/' + fileName;")
	End If

'Else this is a file so check the file type is a preview available
ElseIf NOT strMode = "save" Then
%>
	//Get the file extension to check
	var extension = fileName;
	extension = extension.slice(extension.lastIndexOf('.'), extension.length).toLowerCase();

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
		try {<%
	'See if we are to use the full URL for file
	If blnUseFullURLpath AND NOT strMode = "open" Then
		Response.Write(vbCrLf & "			self.parent.document.getElementById('prevWindow').contentWindow.location.href = '" & strFullURLpathToRTEfiles & Replace(strFolderPath, "\", "/", 1, -1, 1) & "/' + fileName;")
	Else
		Response.Write(vbCrLf & "			self.parent.document.getElementById('prevWindow').contentWindow.location.href = '" & Replace(strFolderPath, "\", "/", 1, -1, 1) & "/' + fileName;")
	End If		
		
		%>
		}catch(exception){
		}
	
	}else{
		self.parent.document.getElementById("prevWindow").contentWindow.location.href="RTE_popup_link_preview.asp?b=0";
	
	}<%
		
End If

'If this is open or save file dialog then update the file name
If strMode = "open" or strMode = "save" Then Response.Write(vbCrLf & "	self.parent.document.getElementById('fileName').value = fileName;")

'If not save then update the url field
If NOT strMode = "save" Then
	'See if we are to use the full URL
	If blnUseFullURLpath AND NOT strMode = "open" Then
		Response.Write(vbCrLf & "	self.parent.document.getElementById('URL').value = '" & strFullURLpathToRTEfiles & Replace(strFolderPath, "\", "/", 1, -1, 1) & "/' + fileName;")
	Else
		Response.Write(vbCrLf & "	self.parent.document.getElementById('URL').value = '" & Replace(strFolderPath, "\", "/", 1, -1, 1) & "/' + fileName;")
	End If	
End If
%>
	self.parent.document.getElementById('Submit').disabled=false;
}

//Function to hover file item
function overIcon(iconItem) {
	iconItem.style.backgroundColor='#CCCCCC';
}

//Function to moving off file item
function outIcon(iconItem) {
	iconItem.style.backgroundColor='#FFFFFF';
}
</script>

<style type="text/css">
<!--
.fileText {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #000000;
}
html,body { 
	border: 0px; 
}
-->
</style>
</head>
<body bgcolor="#FFFFFF" leftmargin="2" topmargin="2" marginwidth="2" marginheight="2" onLoad="self.parent.document.getElementById('path').value = '/<% = Replace(strFolderPath, "\", "/", 1, -1, 1) %>'">
<table width="100%"  border="0" cellspacing="0" cellpadding="3"><%


	

'Else show an icon for Parent Directory
If strSubFolderName <> "" Then
	intElementIDno = intElementIDno + 1
		
	Response.Write(vbCrLf & "  <tr onMouseover=""overIcon(this)"" onMouseout=""outIcon(this)"" OnDblClick=""upFolder()"" style=""cursor: default;"">" & _
		       vbCrLf & "    <td colspan=""3"" class=""fileText""><img src=""" & strRTEImagePath & "icon_up_folder.gif"" align=""absbottom"" title=""" & strTxtParentDirectory & """ border=""0"">" & strTxtParentDirectory & "</td>" & _
		       vbCrLf & "  </tr>")

End If

'Show any sub folders
For Each objFSOsubFolder In objFSOfolder.SubFolders
		
	intElementIDno = intElementIDno + 1
		
	Response.Write(vbCrLf & "  <tr onMouseover=""overIcon(this)"" onMouseout=""outIcon(this)"" OnDblClick=""subFolder(document.getElementById('ico" & intElementIDno & "').title)"" style=""cursor: default;"">" & _
		       vbCrLf & "    <td colspan=""3"" class=""fileText""><img src=""" & strRTEImagePath & "icon_folder.gif"" align=""absbottom"" id=""ico" & intElementIDno & """ title=""" & objFSOsubFolder.Name & """ border=""0"">"  & objFSOsubFolder.Name & "</td>" & _
	 	       vbCrLf & "  </tr>")
Next



'Loop through all the files in the folder
For Each objFSOfile in objFSOfolder.Files
		
	'Loop through to check if the file has an allowed extension
	For intExtensionLoopCounter = 0 To UBound(saryAllowedFileTypes)
		
		'If the extension is allowed show the file
		If LCase(objFSO.GetExtensionName(objFSOfile.Name)) = saryAllowedFileTypes(intExtensionLoopCounter) Then
			
			'Initilse the icon file with unknown file type
			strFileIcon = "icon_unknown.gif"
			intElementIDno = intElementIDno + 1
		
			'Read in details
			strFileName = objFSOfile.Name
			strFileType = objFSOfile.Type
			intFileSize = CInt(objFSOfile.Size / 1024)
			strFileExtension = LCase(objFSO.GetExtensionName(objFSOfile.Name))
			
			'Check the length of the file name is not to long
			If Len(strFileName) > 21 Then
				strFileName = Trim(Mid(strFileName, 1, 20)) & "..." & strFileExtension
			End If
			
			'Check the length of the file type is not to long
			If Len(strFileType) > 11 Then
				strFileType = Trim(Mid(strFileType, 1, 10)) & "..."
			End If
			
			'Get the icon for the file type
			Select Case strFileExtension
				Case "jpg"
					strFileIcon = "icon_jpg.gif"
				Case "jpeg"
					strFileIcon = "icon_jpg.gif"
				Case "gif"
					strFileIcon = "icon_gif.gif"
				Case "bmp"
					strFileIcon = "icon_bmp.gif"
				Case "png"
					strFileIcon = "icon_png.gif"
				Case "doc"
					strFileIcon = "icon_doc.gif"
				Case "htm"
					strFileIcon = "icon_htm.gif"
				Case "html"
					strFileIcon = "icon_htm.gif"
				Case "rtf"
					strFileIcon = "icon_doc.gif"
				Case "txt"
					strFileIcon = "icon_txt.gif"
				Case "text"
					strFileIcon = "icon_txt.gif"
				Case "zip"
					strFileIcon = "icon_zip.gif"
				Case "rar"
					strFileIcon = "icon_zip.gif"
				Case "tar"
					strFileIcon = "icon_zip.gif"
				Case "exe"
					strFileIcon = "icon_exe.gif"
			
			End Select
			
			
		
			Response.Write(vbCrLf & "  <tr onMouseover=""overIcon(this)"" onMouseout=""outIcon(this)"" OnClick=""upadatePreview(document.getElementById('ico" & intElementIDno & "').title)"" style=""cursor: default;"">" & _ 
			 	       vbCrLf & "    <td class=""fileText"" width=""58%""><img src=""" & strRTEImagePath & strFileIcon & """ align=""absbottom"" id=""ico" & intElementIDno & """ title=""" & objFSOfile.Name & """ border=""0"">" & strFileName & "</td>" & _
			 	       vbCrLf & "    <td class=""fileText"" width=""15%"">" & intFileSize & "Kb</td>" & _
			 	       vbCrLf & "    <td class=""fileText"" width=""27%"">" & strFileType & "</td>" & _
			 	       vbCrLf & "  </tr>")
		End If
	Next
		

Next

'Distroy objects
Set objFSOsubFolder = Nothing
Set objFSOfile = Nothing	
Set objFSOfolder = Nothing
Set objFSO = Nothing  
  
%>
</table>
</body>
</html>