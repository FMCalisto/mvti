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

'***********************************
'****	non-RTE Toolbar 1	****
'***********************************


'File toolbar
'------------
If blnNew Then 
	Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
	Response.Write("<img src=""" & strRTEImagePath & "post_button_new.gif"" align=""absmiddle"" title=""" & strTxtNewBlankDoc & """ onClick=""clearWebWizRTE()"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
	Response.Write("');")
End If


'Preview, print, spell toolbar
'------------
If blnPreview Then 
	Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
	'Button Pop up Preview
	Response.Write("<img src=""" & strRTEImagePath & "post_button_preview.gif"" align=""absmiddle"" border=""0"" title=""" & strTxtPreview & """ onClick=""document.getElementById(\'pre\').value=document.getElementById(textArea).value; OpenPreviewWindow(document.' + formName + ');"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
	Response.Write("<input type=""hidden"" name=""pre"" id=""pre"" value="""">")
	Response.Write("');")
End If


'insert toolbar
'------------
If blnAdvAdddHyperlink OR blnAddHyperlink Or blnAttachments OR blnAdvAddImage OR blnAddImage OR blnImageUpload Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
'If hyperlink is enabled
If blnAdvAdddHyperlink OR blnAddHyperlink Then 
	Response.Write("<img src=""" & strRTEImagePath & "post_button_hyperlink.gif"" align=""absmiddle"" border=""0"" onClick=""AddCode(\'URL\')"" title=""" & strTxtAddHyperlink & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
	Response.Write("<img src=""" & strRTEImagePath & "post_button_email.gif"" align=""absmiddle"" border=""0"" onClick=""AddCode(\'EMAIL\')"" title=""" & strTxtAddEmailLink & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
End If
If blnAttachments Then Response.Write("<img src=""" & strRTEImagePath & "post_button_file_upload.gif"" align=""absmiddle"" onClick=""winOpener(\'non_RTE_upload_files.asp?textArea=\'+textArea,\'files\',0,1,400,163)"" title=""" & strTxtFileUpload & """ border=""0"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
'images
If blnAdvAddImage OR blnAddImage Then Response.Write("<img src=""" & strRTEImagePath & "post_button_image.gif"" align=""absmiddle"" border=""0"" onClick=""AddCode(\'IMG\')"" title=""" & strTxtAddImage & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
'If image uploading is allowed have an image upload button
If blnImageUpload Then Response.Write("<img src=""" & strRTEImagePath & "post_button_image_upload.gif"" align=""absmiddle"" border=""0"" onClick=""winOpener(\'non_RTE_upload_images.asp?textArea=\'+textArea,\'images\',0,1,400,150)"" title=""" & strTxtImageUpload & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnAdvAdddHyperlink OR blnAddHyperlink Or blnAttachments OR blnAdvAddImage OR blnAddImage OR blnImageUpload Then Response.Write("');")


'List type and indent toolbar
'------------
If blnOrderList OR blnUnOrderList OR blnOutdent OR blnIndent Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
If blnOrderList OR blnUnOrderList Then Response.Write("<img src=""" & strRTEImagePath & "post_button_or_list.gif"" align=""absmiddle"" border=""0"" onClick=""AddCode(\'LIST\', \'\')"" title=""" & strTxtList & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnOutdent Then Response.Write("<img src=""" & strRTEImagePath & "post_button_outdent.gif"" align=""absmiddle"" onClick=""FormatText(\'Outdent\', \'\')"" title=""" & strTxtOutdent & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnIndent Then Response.Write("<img src=""" & strRTEImagePath & "post_button_indent.gif"" align=""absmiddle"" border=""0"" onClick=""AddCode(\'INDENT\', \'\')"" title=""" & strTxtIndent & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">") 
If blnOrderList OR blnUnOrderList OR blnOutdent OR blnIndent Then Response.Write("');")


Response.Write(vbCrLf & "	document.writeln('<br />');")




'***********************************
'****	non-RTE Toolbar 2	****
'***********************************

		
'Toolbar buttons


'Font type toolbar
'------------
If blnFontStyle OR blnFontType OR blnFontSize OR blnTextColour Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
'Font Type
If blnFontType  Then Response.Write(" <select name=""selectFont"" onChange=""FontCode(selectFont.options[selectFont.selectedIndex].value, \'FONT\');selectFont.options[0].selected = true;""><option selected>" & strTxtFontTypes & "</option><option value=\'font=""Arial""\'>Arial</option><option value=\'font=""Courier""\'>Courier New</option><option value=\'font=""Times""\'>Times</option><option value=\'font=""Verdana""\'>Verdana</option></select>")
'Font Size
If blnFontSize  Then Response.Write(" <select name=""selectSize"" onChange=""FontCode(selectSize.options[selectSize.selectedIndex].value, \'SIZE\');selectSize.options[0].selected = true;""><option selected>" & strTxtFontSizes & "</option><option value=\'font size=""1""\'>1</option><option value=\'font size=""2""\'>2</option><option value=\'font size=""3""\'>3</option><option value=\'font size=""4""\'>4</option><option value=\'font size=""5""\'>5</option><option value=\'font size=""6""\'>6</option></select>")
'Font colour
If blnTextColour Then Response.Write(" <select name=""selectColour"" onChange=""FontCode(selectColour.options[selectColour.selectedIndex].value, \'COLOR\');selectColour.options[0].selected = true;""><option value=""0"" selected>" & strTxtFontColour & "</option><option value=\'font color=""black""\'>" & strTxtBlack & "</option><option value=\'font color=""white""\'>" & strTxtWhite & "</option><option value=\'font color=""blue""\'>" & strTxtBlue & "</option><option value=\'font color=""red""\'>" & strTxtRed & "</option><option value=\'font color=""green""\'>" & strTxtGreen & "</option><option value=\'font color=""yellow""\'>" & strTxtYellow & "</option><option value=\'font color=""orange""\'>" & strTxtOrange & "</option><option value=\'font color=""brown""\'>" & strTxtBrown & "</option><option value=\'font color=""magenta""\'>" & strTxtMagenta & "</option><option value=\'font color=""cyan""\'>" & strTxtCyan & "</option><option value=\'font color=""lime green""\'>" & strTxtLimeGreen & "</option></select>")
If blnFontStyle OR blnFontType OR blnFontSize OR blnTextColour Then Response.Write("');")


'Font style toolbar
'------------
If blnBold OR blnItalic OR blnUnderline Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
If blnBold Then Response.Write("<img src=""" & strRTEImagePath & "post_button_bold.gif"" align=""absmiddle"" title=""" & strTxtBold & """ onClick=""AddMessageCode(\'B\',\'" & strTxtEnterBoldText & "\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnItalic Then Response.Write("<img src=""" & strRTEImagePath & "post_button_italic.gif""  align=""absmiddle"" title=""" & strTxtItalic & """ onClick=""AddMessageCode(\'I\',\'" & strTxtEnterItalicText & "\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnUnderline Then Response.Write("<img src=""" & strRTEImagePath & "post_button_underline.gif"" align=""absmiddle"" title=""" & strTxtUnderline & """ onClick=""AddMessageCode(\'U\',\'" & strTxtEnterUnderlineText & "\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")            
If blnBold OR blnItalic OR blnUnderline Then Response.Write("');")


'Font block format toolbar
'------------
If blnCentre Then 
	Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
	Response.Write("<img src=""" & strRTEImagePath & "post_button_centre.gif"" align=""absmiddle"" border=""0"" onClick=""AddMessageCode(\'center\',\'" & strTxtEnterCentredText & "\', \'\')"" title=""" & strTxtCentrejustify & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">") 
	Response.Write("');")
End If


'About toolbar
'------------
If blnAbout Then 
	Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
	Response.Write("<img src=""" & strRTEImagePath & "post_button_about.gif"" align=""absmiddle"" border=""0"" onClick=""winOpener(\'RTE_popup_about.asp\',\'about\',0,0,400,187)"" title=""" & strTxtAboutRichTextEditor & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
	Response.Write("');")
End If

'Mode
Response.Write(vbCrLf & "	document.writeln('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name=""selectMode"" onChange=""PromptMode(this)""><option value=""1"" selected>" & strTxtPrompt & " " & strTxtMode & "</option><option value=""0"">" & strTxtBasic & " " & strTxtMode & "</option></select>');")
%>