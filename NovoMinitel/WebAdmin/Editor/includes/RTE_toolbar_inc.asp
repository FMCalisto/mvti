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


'***************************
'****	RTE Toolbar 1	****
'***************************

'File toolbar
'------------
If blnNew OR blnOpenFile OR blnSave Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
If blnNew Then Response.Write("<img src=""" & strRTEImagePath & "post_button_new.gif"" align=""absmiddle"" title=""" & strTxtNewBlankDoc & """ onClick=""clearWebWizRTE()"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
'Button Pop up for open file
If blnOpenFile Then Response.Write("<img src=""" & strRTEImagePath & "post_button_open.gif"" align=""absmiddle"" border=""0"" title=""" & strTxtOpen & """ onClick=""winOpener(\'RTE_popup_open_file.asp\',\'open\',0,0,600,328)"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
'Button Pop up for save file
If blnSave Then Response.Write("<img src=""" & strRTEImagePath & "post_button_save.gif"" align=""absmiddle"" border=""0"" title=""" & strTxtSave & """ onClick=""winOpener(\'RTE_popup_save_file.asp\',\'save\',0,0,600,290)"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnNew OR blnOpenFile OR blnSave Then Response.Write("');")



'Preview, print, spell toolbar
'------------
If blnPrint OR blnPreview OR blnSpellCheck OR blnHTMLView Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
If blnPrint Then Response.Write("<img src=""" & strRTEImagePath & "post_button_print.gif"" align=""absmiddle"" border=""0"" title=""" & strTxtPrint & """ onClick=""printEditor()"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
'Button Pop up Preview
If blnPreview Then Response.Write("<img src=""" & strRTEImagePath & "post_button_preview.gif"" align=""absmiddle"" border=""0"" title=""" & strTxtPreview & """ onClick=""document.getElementById(\'pre\').value = document.getElementById(\'WebWizRTE\').contentWindow.document.body.innerHTML; OpenPreviewWindow(document.' + formName + ');"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnPreview Then Response.Write("<input type=""hidden"" name=""pre"" id=""pre"" value="""">")
'Spell check button
If blnSpellCheck Then Response.Write("<img src=""" & strRTEImagePath & "post_button_spell_check.gif"" align=""absmiddle"" border=""0"" onClick=""checkspell()"" title=""" & strTxtstrSpellCheck & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"" id=""spellboundSC"">")
If blnHTMLView Then Response.Write("<img src=""" & strRTEImagePath & "post_button_html.gif"" align=""absmiddle"" border=""0"" title=""" & strTxtToggleHTMLView & """ onClick=""HTMLview()"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnPrint OR blnPreview OR blnSpellCheck OR blnHTMLView Then Response.Write("');")


'The span tag needs to be put in to hide the other options in HTML view
Response.Write(vbCrLf & "	document.writeln('<span id=""ToolBar1"">');")



'cut, copy, paste toolbar
'------------
If blnCut OR blnCopy OR blnPaste OR blnWordPaste Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
If blnCut Then Response.Write("<img src=""" & strRTEImagePath & "post_button_cut.gif"" align=""absmiddle"" onClick=""FormatText(\'cut\')"" title=""" & strTxtCut & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnCopy Then Response.Write("<img src=""" & strRTEImagePath & "post_button_copy.gif"" align=""absmiddle"" onClick=""FormatText(\'copy\')"" title=""" & strTxtCopy & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnPaste Then Response.Write("<img src=""" & strRTEImagePath & "post_button_paste.gif"" align=""absmiddle"" onClick=""FormatText(\'paste\')"" title=""" & strTxtPaste & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnWordPaste Then Response.Write("<img src=""" & strRTEImagePath & "post_button_word.gif"" align=""absmiddle"" onClick=""winOpener(\'RTE_popup_word_paste.asp\',\'save\',0,0,600,290)"" title=""" & strTxtPasteFromWord & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnCut OR blnCopy OR blnPaste OR blnWordPaste Then Response.Write("');")



'undo redo toolbar
'------------
If blnUndo OR blnRedo Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
If blnUndo Then Response.Write("<img src=""" & strRTEImagePath & "post_button_undo.gif"" align=""absmiddle"" onClick=""FormatText(\'undo\')"" title=""" & strTxtUndo & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnRedo Then Response.Write("<img src=""" & strRTEImagePath & "post_button_redo.gif"" align=""absmiddle"" onClick=""FormatText(\'redo\')"" title=""" & strTxtRedo & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnUndo OR blnRedo Then Response.Write("');")



'insert toolbar
'------------
If blnAdvAdddHyperlink OR blnAddHyperlink Or blnAttachments OR blnAdvAddImage OR blnAddImage OR blnInsertTable OR blnSpecialCharacters Or blnEmoticonPopUp Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
'If advanced hyperlink is enabled have a popup link
If blnAdvAdddHyperlink Then
	Response.Write("<img src=""" & strRTEImagePath & "post_button_hyperlink.gif"" align=""absmiddle"" border=""0"" onClick=""winOpener(\'RTE_popup_link.asp\',\'link\',0,0,490,332)"" title=""" & strTxtAddHyperlink & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
'Else have the basic hperlink adding feature
ElseIf blnAddHyperlink Then
	Response.Write("<img src=""" & strRTEImagePath & "post_button_hyperlink.gif"" align=""absmiddle"" border=""0"" onClick=""FormatText(\'createLink\')"" title=""" & strTxtAddHyperlink & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
End If
If blnAttachments Then Response.Write("   <img src=""" & strRTEImagePath & "post_button_file_upload.gif"" align=""absmiddle"" onClick=""winOpener(\'RTE_popup_file_atch.asp\',\'files\',0,0,775,403)"" title=""" & strTxtFileUpload & """ border=""0"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
'Popup window for images
If blnAdvAddImage Then
	Response.Write("<img src=""" & strRTEImagePath & "post_button_image.gif"" align=""absmiddle"" border=""0"" onClick=""winOpener(\'RTE_popup_adv_image.asp\',\'insertImg\',0,0,775,395)"" title=""" & strTxtAddImage & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
ElseIf blnAddImage Then
	Response.Write("<img src=""" & strRTEImagePath & "post_button_image.gif"" align=""absmiddle"" border=""0"" onClick=""winOpener(\'RTE_popup_image.asp\',\'insertImg\',0,0,550,360)"" title=""" & strTxtAddImage & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
End If
'Popup window for tables
If blnInsertTable Then Response.Write("<img src=""" & strRTEImagePath & "post_insert_table.gif"" align=""absmiddle"" border=""0"" onClick=""winOpener(\'RTE_popup_table.asp\',\'insertTable\',0,0,400,198)"" title=""" & strTxtInsertTable & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
'Popup window for Special Characters
If blnSpecialCharacters Then Response.Write("<img src=""" & strRTEImagePath & "post_button_sp_char.gif"" align=""absmiddle"" border=""0"" onClick=""winOpener(\'RTE_popup_special_characters.asp\',\'insertTable\',0,0,550,295)"" title=""" & strTxtSpecialCharacters & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
'Button Pop up for emoticons
If blnEmoticonPopUp Then Response.Write("<img src=""" & strRTEImagePath & "post_button_smiley.gif"" align=""absmiddle"" border=""0"" onClick=""winOpener(\'RTE_popup_emoticons.asp\',\'emot\',0,0,450,340)"" title=""" & strTxtEmoticons & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnAdvAdddHyperlink OR blnAddHyperlink Or blnAttachments OR blnAdvAddImage OR blnAddImage OR blnInsertTable OR blnSpecialCharacters Or blnEmoticonPopUp Then Response.Write("');")



'List type and indent toolbar
'------------
If blnOrderList OR blnUnOrderList OR blnOutdent OR blnIndent Or blnHorizontalRule Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
If blnOrderList Then Response.Write("<img src=""" & strRTEImagePath & "post_button_or_list.gif"" align=""absmiddle"" border=""0"" onClick=""FormatText(\'InsertOrderedList\', \'\')"" title=""" & strTxtstrTxtOrderedList & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnUnOrderList Then Response.Write("<img src=""" & strRTEImagePath & "post_button_list.gif"" align=""absmiddle"" border=""0"" onClick=""FormatText(\'InsertUnorderedList\', \'\')"" title=""" & strTxtUnorderedList & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnOutdent Then Response.Write("<img src=""" & strRTEImagePath & "post_button_outdent.gif"" align=""absmiddle"" onClick=""FormatText(\'Outdent\', \'\')"" title=""" & strTxtOutdent & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnIndent Then Response.Write("<img src=""" & strRTEImagePath & "post_button_indent.gif"" align=""absmiddle"" border=""0"" onClick=""FormatText(\'indent\', \'\')"" title=""" & strTxtIndent & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnHorizontalRule Then Response.Write("<img src=""" & strRTEImagePath & "post_button_h_rule.gif"" align=""absmiddle"" title=""" & strTxtHorizontalRule & """ onClick=""FormatText(\'inserthorizontalrule\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnOrderList OR blnUnOrderList OR blnOutdent OR blnIndent Or blnHorizontalRule Then Response.Write("');")


Response.Write(vbCrLf & "	document.writeln('</span><br />');")




'***************************
'****	RTE Toolbar 2	****
'***************************

Response.Write(vbCrLf & "	document.writeln('<span id=""ToolBar2"">');")


'Toolbar buttons


'Font type toolbar
'------------
If blnFontStyle OR blnFontType OR blnFontSize Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
'Font Style
If blnFontStyle Then Response.Write("<img id=""formatblock"" src=""" & strRTEImagePath & "post_button_format.gif"" align=""absmiddle"" border=""0"" title=""" & strTxtFontStyle & """ onClick=""FormatText(\'formatblock\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
'Font Type
If blnFontType  Then Response.Write("<img id=""fontname"" src=""" & strRTEImagePath & "post_button_font.gif"" align=""absmiddle"" border=""0"" title=""" & strTxtFontTypes & """ onClick=""FormatText(\'fontname\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
'Font Size
If blnFontSize  Then Response.Write("<img id=""fontsize"" src=""" & strRTEImagePath & "post_button_size.gif"" align=""absmiddle"" border=""0"" title=""" & strTxtFontSizes & """ onClick=""FormatText(\'fontsize\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnFontStyle OR blnFontType OR blnFontSize Then Response.Write("');")



'Font style toolbar
'------------
If blnBold OR blnItalic OR blnUnderline Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
If blnBold Then Response.Write("<img src=""" & strRTEImagePath & "post_button_bold.gif"" align=""absmiddle"" title=""" & strTxtBold & """ onClick=""FormatText(\'bold\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnItalic Then Response.Write("<img src=""" & strRTEImagePath & "post_button_italic.gif""  align=""absmiddle"" title=""" & strTxtItalic & """ onClick=""FormatText(\'italic\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnUnderline Then Response.Write("<img src=""" & strRTEImagePath & "post_button_underline.gif"" align=""absmiddle"" title=""" & strTxtUnderline & """ onClick=""FormatText(\'underline\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnBold OR blnItalic OR blnUnderline Then Response.Write("');")



'Stikethrough, super/sub script toolbar
'------------
If blnStrikeThrough OR blnSubscript OR blnSuperscript Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
If blnStrikeThrough Then Response.Write("<img src=""" & strRTEImagePath & "post_button_strike.gif"" align=""absmiddle"" title=""" & strTxtStrikeThrough & """ onClick=""FormatText(\'strikethrough\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnSubscript Then Response.Write("<img src=""" & strRTEImagePath & "post_button_subscript.gif"" align=""absmiddle"" title=""" & strTxtSubscript & """ onClick=""FormatText(\'subscript\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnSuperscript Then Response.Write("<img src=""" & strRTEImagePath & "post_button_superscript.gif"" align=""absmiddle"" title=""" & strTxtSuperscript & """ onClick=""FormatText(\'superscript\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnStrikeThrough OR blnSubscript OR blnSuperscript Then Response.Write("');")



'Font block format toolbar
'------------
If blnLeftJustify OR blnCentre OR blnRightJustify OR blnFullJustify Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
If blnLeftJustify Then Response.Write("<img src=""" & strRTEImagePath & "post_button_left_just.gif"" align=""absmiddle"" onClick=""FormatText(\'justifyleft\', \'\')"" title=""" & strTxtLeftJustify & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnCentre Then Response.Write("<img src=""" & strRTEImagePath & "post_button_centre.gif"" align=""absmiddle"" border=""0"" onClick=""FormatText(\'justifycenter\', \'\')"" title=""" & strTxtCentrejustify & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnRightJustify Then Response.Write("<img src=""" & strRTEImagePath & "post_button_right_just.gif"" align=""absmiddle"" onClick=""FormatText(\'justifyright\', \'\')"" title=""" & strTxtRightJustify & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnFullJustify Then Response.Write("<img src=""" & strRTEImagePath & "post_button_justify.gif"" align=""absmiddle"" onClick=""FormatText(\'justifyfull\', \'\')"" title=""" & strTxtJustify & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnLeftJustify OR blnCentre OR blnRightJustify OR blnFullJustify Then Response.Write("');")



'Text colour toolbar
'------------
If blnTextColour OR blnTextBackgroundColour Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
If blnTextColour Then Response.Write("<img id=""forecolor"" src=""" & strRTEImagePath & "post_button_colour_pallete.gif"" align=""absmiddle"" border=""0"" title=""" & strTxtTextColour & """ onClick=""FormatText(\'forecolor\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If RTEenabled = "winIE" AND blnTextBackgroundColour Then Response.Write("<img id=""backcolor"" src=""" & strRTEImagePath & "post_button_fill.gif"" align=""absmiddle"" border=""0"" title=""" & strTxtBackgroundColour & """ onClick=""FormatText(\'backcolor\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If RTEenabled = "Gecko" AND blnTextBackgroundColour Then Response.Write("<img id=""hilitecolor"" src=""" & strRTEImagePath & "post_button_fill.gif"" align=""absmiddle"" border=""0"" title=""" & strTxtBackgroundColour & """ onClick=""FormatText(\'hilitecolor\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
If blnTextColour OR blnTextBackgroundColour Then Response.Write("');")

Response.Write(vbCrLf & "	document.writeln('</span>');")


'About toolbar
'------------
If blnAbout Then
	Response.Write(vbCrLf & "	document.writeln('<img src=""" & strRTEImagePath & "toolbar_separator.gif"" align=""absmiddle"">")
	Response.Write("<img src=""" & strRTEImagePath & "post_button_about.gif"" align=""absmiddle"" border=""0"" onClick=""winOpener(\'RTE_popup_about.asp\',\'about\',0,0,400,187)"" title=""" & strTxtAboutRichTextEditor & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"">")
	Response.Write("');")
End If
%>