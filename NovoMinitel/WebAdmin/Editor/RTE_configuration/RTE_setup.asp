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

Dim blnAbout

'Initiliase variables
Const strRTEversion = "3.0"
blnAbout = true
blnAbout = false


'The following enables and disables functions of the Rich Text Editor
'Enable and dsiable basic functions of the editor change the following to true of false
'***************************************************************************
Const blnNew = true
Const blnBold = true
Const blnUnderline = true
Const blnItalic = true
Const blnFontStyle = true
Const blnFontType = true
Const blnFontSize = true
Const blnTextColour = true
Const blnTextBackgroundColour = true
Const blnCut = true
Const blnCopy = true
Const blnPaste = true
Const blnWordPaste = true
Const blnUndo = true
Const blnRedo = true
Const blnLeftJustify = true
Const blnCentre = true
Const blnRightJustify = true
Const blnFullJustify = true
Const blnOrderList = true
Const blnUnOrderList = true
Const blnOutdent = true
Const blnIndent = true
Const blnAddHyperlink = true
Const blnAddImage = true
Const blnInsertTable = true
Const blnEmoticonPopUp = False
Const blnSpecialCharacters = true
Const blnPrint = true
Const blnStrikeThrough = true
Const blnSubscript = true
Const blnSuperscript = true
Const blnHorizontalRule = true
Const blnPreview = true
'***************************************************************************


'Advanced controls
'***************************************************************************
Const blnAdvAdddHyperlink = true 'Advanced hyperlink control
Const blnAdvAddImage = true 	'Advanced image control requires File System Object (FSO)
Const blnHTMLView = true	'Allows the user to view the HTML code, you may need to dsiable this for extra security
Const blnSpellCheck = true	'Requires IEspell for Ineternet Explorer or SpellBound for Mozilla
Const blnUseCSS = false		'Enable CSS (Cascading Style Sheets) in Mozilla
Const blnNoIEdblLine = true	'Prevent IE's standard double line spacing when the 'ENTER' key is pressed
'***************************************************************************



'Open and save configuration
'***************************************************************************
'For security reasons you shouldn't allow users to open/save server side scripting files with .asp, .php, etc. extensions as these could be used to execute malicious code on the server
'Saved files, for security, are only saved in the root folder you set below and not sub folders

Const blnOpenFile = true 'Open server file in editor (ie. open and HTML page in editor), requires File System Object (FSO)
Const strOpenFileFolderPath = "my_documents"
Const strOpenFileTypes = "htm;html" 'Separate file types with ;

Const blnSave = true 'Save editor contents to server, requires File System Object (FSO)
Const strSaveFileFolderPath = "my_documents\my_files"
Const strSaveFileTypes = "htm;html" 'Separate file types with ;
Const blnOverWriteFiles = false 'Set this to true only if you wish the user to overwrite saved files
'***************************************************************************



'Upload component (uncomment the upload component you require)
'***************************************************************************
'Select an upload component from the list below if you wish to use image upload and file attachement features
'The upoload component you select MUST be installed on the web server

Const strUploadComponent = "AspUpload"	'Persits AspUpload - http://www.aspupload.com
'Const strUploadComponent = "Dundas"	'Dundas Upload - http://www.dundas.com 
'Const strUploadComponent = "fileUp"	'SA FileUp - http://www.softartisans.com
'Const strUploadComponent = "aspSmart"	'aspSmartUpload - http://www.aspsmart.com
'Const strUploadComponent = "AspSimple"	'AspSimpleUpload - http://www.asphelp.com
'***************************************************************************

'Upload component configuration
'***************************************************************************
'For security reasons you shouldn't allow users to upload files that could be used to execute malicious code on the server
'Uploaded files and images, for security, are only saved in the root folder you set below and not sub folders

'File Attachments
Const blnAttachments = False 'Attach files to the editor contenets
Const strFileUploadPath = "my_documents\my_files"
Const strFileTypes = "zip;rar;doc;pdf;txt;rtf;htm;html;gif;jpg;png" 'Separate file types with ;
Const intMaxFileSize = 500 'Most components will only support up to 2000KB (size in KB)

'Image uploads
Const blnImageUpload = true 'Upload images to the editor
'blnAdvAddImage (advanced image insert popup), also needs to be enabled to upload images as it uses the same pop up window 
Const strImageUploadPath = "my_documents\my_pictures"
Const strImageTypes = "jpeg;jpg;gif;png" 'Separate file types with ;
Const intMaxImageSize = 25 'Most components will only support up to 2000KB (size in KB)
'***************************************************************************



'Using full URL path for images and links
'***************************************************************************
'If you are submitting the RTE content to a file outside of the RTE folder you may find that some of the relative
'paths for things like images stored on the server are incorrect (ie. href="my_documents/myPicture.jpg")
'The following can be used to change those relative server paths to full URL's so that if the submitted content is 
'displayed on a page out side of the RTE files the paths to images etc. still work

Const blnUseFullURLpath = false
Const strFullURLpathToRTEfiles = "/WebAdmin/Editor/" 'Type in the full URL to the RTE folder eg. "http://www.myweb.com/RTE/"

'***************************************************************************
%>