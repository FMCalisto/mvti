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
'**  Support questions are NOT answered by email ever!
'**
'**  For correspondence or non support questions contact: -
'**  info@webwizguide.info
'**
'**  or at: -
'**
'**  Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom
'**
'****************************************************************************************



Const strTxtTextFormat = "Text Format"
Const strTxtMode = "Mode"
Const strTxtPrompt = "Prompt"
Const strTxtBasic = "Basic"
Const strTxtAddEmailLink = "Add Email Link"
Const strTxtList = "List"
Const strTxtCentre = "Centre"

Const strTxtEnterBoldText = "Enter text you want formatted in Bold"
Const strTxtEnterItalicText = "Enter text you want formatted in Italic"
Const strTxtEnterUnderlineText = "Enter text you want Underlined"
Const strTxtEnterCentredText = "Enter text you want Centred"
Const strTxtEnterHyperlinkText = "Enter the on screen display text for the Hyperlink"
Const strTxtEnterHeperlinkURL = "Enter the URL address to create Hyperlink to"
Const strTxtEnterEmailText = "Enter the on screen display text for the email address"
Const strTxtEnterEmailMailto = "Enter the email address to link to"
Const strTxtEnterImageURL = "Enter the web address of the image"
Const strTxtEnterTypeOfList = "Type of list"
Const strTxtEnterEnter = "Enter"
Const strTxtEnterNumOrBlankList = "for numbered or leave blank for bulleted"
Const strTxtEnterListError = "ERROR! Please enter"
Const strEnterLeaveBlankForEndList = "List item Leave blank to end list"
Const strTxtErrorInsertingObject = "Error inserting object in current location."


Const strTxtFontStyle = "Format"
Const strTxtFontTypes = "Font"
Const strTxtFontSizes ="Size"
Const strTxtEmoticons = "Emoticons"
Const strTxtFontSize = "Font Size"


Const strTxtFontColours ="Font Colours"
Const strTxtBlack = "Black"
Const strTxtWhite = "White"
Const strTxtBlue = "Blue"
Const strTxtRed = "Red"
Const strTxtGreen = "Green"
Const strTxtYellow = "Yellow"
Const strTxtOrange = "Orange"
Const strTxtBrown = "Brown"
Const strTxtMagenta = "Magenta"
Const strTxtCyan = "Cyan"
Const strTxtLimeGreen = "Lime Green"



Const strTxtCut = "Cut"
Const strTxtCopy = "Copy"
Const strTxtPaste = "Paste"
Const strTxtBold = "Bold"
Const strTxtItalic = "Italic"
Const strTxtUnderline = "Underline"
Const strTxtLeftJustify = "Left Justify"
Const strTxtCentrejustify = "Centre Justify"
Const strTxtRightJustify = "Right Justify"
Const strTxtJustify = "Justify"
Const strTxtUnorderedList = "Unordered List"
Const strTxtOutdent = "Outdent"
Const strTxtIndent = "Indent"
Const strTxtAddHyperlink = "Insert Hyperlink"
Const strTxtAddImage = "Insert Image"
Const strTxtJavaScriptEnabled = "JavaScript must be enabled on your web browser in order to use this Rich Text Editor!"
Const strTxtFontColour = "Colour"
Const strTxtstrTxtOrderedList = "Ordered List"
Const strTxtTextColour = "Text Colour"
Const strTxtBackgroundColour = "Background Colour"
Const strTxtUndo = "Undo"
Const strTxtRedo = "Redo"
Const strTxtstrSpellCheck = "Spell Check"
Const strTxtToggleHTMLView = "Toggle HTML View"
Const strTxtAboutRichTextEditor = "About Rich Text Editor"
Const strTxtInsertTable = "Insert Table"
Const strTxtSpecialCharacters = "Special Characters"
Const strTxtPrint = "Print"
Const strTxtImage = "Image"
Const strTxtStrikeThrough = "Strike Through"
Const strTxtSubscript = "Subscript"
Const strTxtSuperscript = "Superscript"
Const strTxtHorizontalRule = "Horizontal Rule"


Const strTxtIeSpellNotDetected = "You need \'ieSpell\' spelling checker installed to use this feature. \nClick OK to go to the \'ieSpell\' download page."
Const strTxtSpellBoundNotDetected = "You need \'SpellBound 0.7.0+\' spelling checker installed to use this feature. \nClick OK to go to the \'SpellBound\' download page."




Const strTxtOK = "OK"
Const strTxtCancel = "Cancel"


Const strTxtImageUpload = "Image Upload"
Const strTxtFileUpload = "File Upload"
Const strTxtUpload = "Upload"
Const strTxtPath = "Path"
Const strTxtFileName = "File Name"
Const strTxtFileURL = "File URL"

Const strTxtParentDirectory = "Parent Directory"

Const strTxtImagesMustBeOfTheType = "Images must be of the type"
Const strTxtAndHaveMaximumFileSizeOf = "and have a maximum file size of"
Const strTxtImageOfTheWrongFileType = "The image uploaded is of the wrong file type"
Const strTxtImageFileSizeToLarge = "The image file size is to large at"
Const strTxtMaximumFileSizeMustBe = "Maximum file size must be"
Const strTxtErrorUploadingImage = "Error uploading image!!"
Const strTxtNoImageToUpload = "Please use the \'Browse...\' button to select an image to upload."

Const strTxtFile = "File"
Const strTxtFilesMustBeOfTheType = "Files must be of the type"
Const strTxtFileOfTheWrongFileType = "The file uploaded is of the wrong file type"
Const strTxtFileSizeToLarge = "The file size is to large at"
Const strTxtErrorUploadingFile = "Error uploading file!!"
Const strTxtNoFileToUpload = "Please use the \'Browse...\' button to select a file to upload."


Const strTxtPleaseWaitWhileFileIsUploaded = "Please be patient while the file is being uploaded to the server."
Const strTxtPleaseWaitWhileImageIsUploaded = "Please be patient while the image is being uploaded to the server."



Const strTxtCloseWindow = "Close Window"


Const strTxtPreview = "Preview"
Const strTxtThereIsNothingToPreview = "There is nothing to preview"

Const strResetFormConfirm = "Are you sure you want to reset the form?"
Const strResetWarningFormConfirm = "WARNING: All form data will be lost!!"
Const strResetWarningEditorConfirm = "WARNING: All editor data will be lost!!"


Const strTxtSubmitForm = "Submit Form"
Const strTxtResetForm = "Reset Form"

Const strTxtDisplayMessage = "Display Message"
Const strTxtThereIsNothingToShow = "There is no message to display"


Const strTxtTableProperties = "Table Properties"

Const strTxtImageProperties = "Image Properties"

Const strTxtImageURL = "Image&nbsp;URL"
Const strTxtAlternativeText = "Alt Text"
Const strTxtLayout = "Layout"
Const strTxtAlignment = "Alignment"
Const strTxtBorder = "Border"
Const strTxtSpacing = "Spacing"
Const strTxtHorizontal = "Horizontal"
Const strTxtVertical = "Vertical"

Const strTxtRows = "Rows"
Const strTxtColumns = "Columns"
Const strTxtWidth = "Width"
Const strTxtpixels = "pixels"
Const strTxtCellPad = "Cell Pad"
Const strTxtCellSpace = "Cell Space"

Const strTxtHeight = "Height"


Const strTxtSelectTextToTurnIntoHyperlink = "Please select some text to turn into a hyperlink."

Const strTxtYourBrowserSettingsDoNotPermit = "Your browser settings do not permit the editor to invoke"
Const strTxtPleaseUseKeybordsShortcut = "operations. \nPlease use the keyboard shortcut "
Const strTxtWindowsUsers = "Windows users: "
Const strTxtMacUsers = "Mac users: "


Const strTxtHyperlinkProperties = "Hyperlink Properties"
Const strTxtNoPreviewAvailableForLink = "No Preview Available"
Const strTxtAddress = "Address"
Const strTxtLinkType = "Link Type"
Const strTxtTitle = "Title"
Const strTxtWindow = "Window"
Const strTxtEmail = "Email"
Const strTxtSubject = "Subject"
Const strTxtPleaseWaitWhilePreviewLoaded = "Please be patient while the preview is loaded...."
Const strTxtErrorLoadingPreview = "Error loading preview.\nPlease check the path and name are correct."


Const strTxAttachFileProperties = "Attach File Properties"

Const strTxtNewBlankDoc = "New Blank Document"
Const strTxtOpen = "Open"
Const strTxtSave = "Save"

Const strTxtFileAlreadyExistsRenamedAs = "Either a file of the same name already existed or there was a problem with the file name entered.\nThe file has been saved as"
Const strTxtTheFile = "The file"
Const strTxtHasBeenSaved = "has been saved"


Const strTxtPasteFromWord = "Paste From Word"
Const strTxtPasteFromWordDialog = "This will clean up documents pasted from Word. Please paste inside the following box using the keyboard (Windows users: Ctrl + 'v', MAC users: Apple + 'v') and hit 'OK'."
%>