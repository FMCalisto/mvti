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



'******************************************
'***	   File Upload Function        ****
'******************************************

'Function to upload a file
Private Function fileUpload(ByVal strFileUploadPath, ByVal saryFileUploadTypes, ByVal intMaxFileSize, ByVal strUploadComponent, ByRef lngErrorFileSize, ByRef blnExtensionOK)

	'Dimension variables
	Dim objUpload		'Uplaod component
	Dim strNewFileName	'Holds the file name
	Dim strOriginalFileName	'Holds the original file name for those components that need to save the file first
	Dim objFSO		'Holds the file system object
	Dim file		'Holds the FSO file object
	


	'******************************************
	'***	     Upload components         ****
	'******************************************

	'Select which upload component to use
	Select Case strUploadComponent
	

		'******************************************
		'***     Persits AspUpload component   ****
		'******************************************

		'Persits AspUpload upload component - tested with version 3.0
		Case "AspUpload"

			'Create upload object
			Set objUpload = Server.CreateObject("Persits.Upload.1")

			With objUpload


				'make sure files arn't over written
				.OverwriteFiles = False

				'We need to save the file before we can find out anything about it
				'** Save virtual is used as saving to memory is often disabled by the web host **
				.SaveVirtual strFileUploadPath

				'Get the file name
				strNewFileName = .Files(1).ExtractFileName

				'Replace spaces with underscores
				strNewFileName = Replace(strNewFileName, " ", "_", 1, -1, 1)

				'Remove brackets that aspUpload may put in when renaming a file
				strNewFileName = Replace(strNewFileName, "(", "", 1, -1, 1)
				strNewFileName = Replace(strNewFileName, ")", "", 1, -1, 1)

				'Check the file size is not above the max allowed size, this is done using a function not the compoent to stop an exception error
				lngErrorFileSize = fileSize(.Files(1).Size, intMaxFileSize)

				'Loop through all the allowed extensions and see if the file has one
				blnExtensionOK = fileExtension(strNewFileName, saryFileUploadTypes)

				'If the file is OK save it to disk
				If lngErrorFileSize = 0 AND blnExtensionOK = True Then

					'** AspUpload does have a function to stop files form being over written but this can allow the forum open to malicious code **
					'** so instead if the file exists create an acceptable new name for the file **
					'Check to make sure the file does not already exist
					Do While .FileExists(Server.MapPath(strFileUploadPath) & "\" & strNewFileName)

						'Create a new file name for the file if it already exsist
						strNewFileName = hexValue(3) & "_" & strNewFileName
					Loop
					

					'Save the file to disk with new file name
					'** Copy virtual is used as save as is often disabled by the web host **
					.Files(1).CopyVirtual strFileUploadPath & "/" & strNewFileName

					'As a new copy of the file is saved we need to get rid of the old copy
					.Files(1).Delete

					'Pass the filename back
					fileUpload = strNewFileName


				'Else if it is not OK delete the uploaded file
				Else
					.Files(1).Delete

				End If

			End With

			'Clean up
			Set objUpload = Nothing




		'******************************************
		'***         Dundas Upload component   ****
		'******************************************

		'Dundas upload component free from http://www.dundas.com - tested with version 2.0
		Case "Dundas"

			'Create upload object
			Set objUpload = Server.CreateObject("Dundas.Upload")

			With objUpload

				'Make sure we are using a virtual directory for script
				.UseVirtualDir = True

				'Make sure the file names are not unique at this time
				.UseUniqueNames = False

				'Save the file first to memory
				.SaveToMemory()

				'Get the file name, the path mehod will be empty as we are saving to memory so use the original file path of the users system to get the name
				strNewFileName = .GetFileName(.Files(0).OriginalPath)

				'Replace spaces with underscores
				strNewFileName = Replace(strNewFileName, " ", "_", 1, -1, 1)

				'Check the file size is not above the max allowed size, this is done using a function not the compoent to stop an exception error
				lngErrorFileSize = fileSize(.Files(0).Size, intMaxFileSize)

				'Loop through all the allowed extensions and see if the file has one
				blnExtensionOK = fileExtension(strNewFileName, saryFileUploadTypes)

				'If the file is OK save it to disk
				If lngErrorFileSize = 0 AND blnExtensionOK = True Then

					'** DunDas Upload does have a function create unique file names but this can allow thf orum open to malicious code **
					'** so instead if the file exists create an acceptable new name for the file **
					'Check to make sure the file does not already exist
					Do While .FileExists(strFileUploadPath & "\" & strNewFileName)

						'Create a new file name for file if it already exsist
						strNewFileName = hexValue(3) & "_" & strNewFileName
					Loop
					
					
					'Save the file to disk
					.Files(0).SaveAs strFileUploadPath & "/" & strNewFileName

					'Pass the filename back
					fileUpload = strNewFileName
				End If
			End With

			'Clean up
			Set objUpload = Nothing




		'******************************************
		'***  SoftArtisans FileUp component    ****
		'******************************************

		'SA FileUp upload component - tested with version 4
		Case "fileUp"

			'Dimension variables
			Dim objSAFileManager	'Holds the file mangare object to check to see if the file already exists

			'Create upload object
			Set objUpload = Server.CreateObject("SoftArtisans.FileUp")

			With objUpload

				'Over write files or an exception will occur if it already exists
				.OverWriteFiles = True

				'Set the upload path
				.Path = Server.MapPath(strFileUploadPath)

				'Get the file name, the path mehod will be empty as we are saving to memory so use the original file path of the users system to get the name
				strNewFileName = Mid(.UserFilename, InstrRev(.UserFilename, "\") + 1)

				'Replace spaces with underscores
				strNewFileName = Replace(strNewFileName, " ", "_", 1, -1, 1)

				'Check the file size is not above the max allowed size, this is done using a function not the compoent to stop an exception error
				lngErrorFileSize = fileSize(.TotalBytes, intMaxFileSize)

				'Loop through all the allowed extensions and see if the file has one
				blnExtensionOK = fileExtension(strNewFileName, saryFileUploadTypes)

				'If the file is OK save it to disk
				If lngErrorFileSize = 0 AND blnExtensionOK = True Then

					'Create a file manager object to get file access to check if the file already exists
					Set objSAFileManager = Server.CreateObject("SoftArtisans.FileManager")

					'Check to make sure the file does not already exist
					Do While objSAFileManager.FileExists(Server.MapPath(strFileUploadPath) & "\" & strNewFileName)

						'Create a new file name for file if it already exsist
						strNewFileName = hexValue(3) & "_" & strNewFileName
					Loop
					
					
					'Clean up
					Set objSAFileManager = Nothing

					'Save the file to disk
					.SaveAs strNewFileName

					'Pass the filename back
					fileUpload = strNewFileName
				End If

			End With

			'Clean up
			Set objUpload = Nothing




		'******************************************
		'***  	AspSmartUpload component       ****
		'******************************************

		'AspSmartUpload upload component free from http://www.aspsmart.com
		Case "aspSmart"

			'Create upload object
			Set objUpload = Server.CreateObject("aspSmartUpload.SmartUpload")

			With objUpload

				'Make sure we are using a virtual directory for script
				.DenyPhysicalPath = True

				'Save the file first to memory
				.Upload

				'Get the file name, the path mehod will be empty as we are saving to memory so use the original file path of the users system to get the name
				strNewFileName = .Files(1).Filename

				'Replace spaces with underscores
				strNewFileName = Replace(strNewFileName, " ", "_", 1, -1, 1)

				'Check the file size is not above the max allowed size
				lngErrorFileSize = fileSize(.Files(1).Size, intMaxFileSize)

				'Loop through all the allowed extensions and see if the file has one
				blnExtensionOK = fileExtension(strNewFileName, saryFileUploadTypes)

				'If the file is OK save it to disk
				If lngErrorFileSize = 0 AND blnExtensionOK = True Then

					'Create a new file name for file as using a random genrated hex code, and hope it doesn't already exist as there is noway with this component of finding if the file already exists
					strNewFileName = hexValue(5) & "_" & strNewFileName
					
					
					'Save the file to disk
					.Files(1).SaveAs strFileUploadPath & "/" & strNewFileName

					'Pass the filename back
					fileUpload = strNewFileName
				End If

			End With

			'Clean up
			Set objUpload = Nothing



		'******************************************
		'***     AspSimpleUpload component     ****
		'******************************************

		'ASPSimpleUpload component
		Case "AspSimple"


			'Create upload object
			Set objUpload = Server.CreateObject("ASPSimpleUpload.Upload")

			With objUpload

				'Get the file name
				strOriginalFileName = .ExtractFileName(.Form("file"))

				'Save the amended file name
				strNewFileName = "TMP" & hexValue(7) & "_" & strOriginalFileName

				'Save the file to disk first so we can check it
				Call .SaveToWeb ("file", strFileUploadPath & "/" & strNewFileName)


				'Create the file system object
				Set objFSO = Server.CreateObject("Scripting.FileSystemObject")

				'Create a file object with the file details
				Set file = objFSO.GetFile(Server.MapPath(strFileUploadPath) & "\" & strNewFileName)

				'Check the file size is not above the max allowed size, this is done using a function not the compoent to stop an exception error
				lngErrorFileSize = fileSize(file.Size, intMaxFileSize)


				'Place the original file name back in the new filename variable
				strNewFileName = strOriginalFileName

				'Replace spaces with underscores
				strNewFileName = Replace(strNewFileName, " ", "_", 1, -1, 1)


				'Loop through all the allowed extensions and see if the file has one
				blnExtensionOK = fileExtension(strNewFileName, saryFileUploadTypes)


				'If the file is OK save it to disk
				If lngErrorFileSize = 0 AND blnExtensionOK = True Then

					'Check to make sure the file does not already exist
					Do While objFSO.FileExists(Server.MapPath(strFileUploadPath) & "\" & strNewFileName)

						'Create a new file name for file if it already exsist
						strNewFileName = hexValue(3) & "_" & strNewFileName
					Loop
					
					'Save the file to disk
					Call .SaveToWeb("file", strFileUploadPath & "/" & strNewFileName)

					'Delete the original file
					file.Delete

					'Pass the filename back
					fileUpload = strNewFileName
				End If

			End With

			'Clean up
			Set file = Nothing
			Set objFSO = Nothing
			Set objUpload = Nothing

	End Select

End Function





'******************************************
'***	Check file size function       ****
'******************************************
Function fileSize(ByVal lngFileSize, ByVal intMaxFileSize)

	'If the file size is to large place the present file size in then return the file size
	If CLng(lngFileSize / 1024) > intMaxFileSize Then

		fileSize = CLng(lngFileSize / 1024)

	'Else set the return value to 0
	Else
		fileSize = 0
	End If

End Function





'******************************************
'***	Check file ext. function       ****
'******************************************
Function fileExtension(ByVal strFileName, ByVal saryFileUploadTypes)

	'Dimension varibles
	Dim intExtensionLoopCounter

	'Intilaise return value
	fileExtension = False

	'Loop through all the allowed extensions and see if the file has one
	For intExtensionLoopCounter = 0 To UBound(saryFileUploadTypes)

		If LCase(Right(strFileName, Len(saryFileUploadTypes(intExtensionLoopCounter)))) = LCase(saryFileUploadTypes(intExtensionLoopCounter)) Then fileExtension = True
	Next

End Function
%>