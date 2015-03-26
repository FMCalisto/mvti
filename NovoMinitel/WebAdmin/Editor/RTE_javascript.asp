<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include Virtual="/WebAdmin/Editor/RTE_configuration/RTE_setup.asp" -->
<!--#include Virtual="/WebAdmin/Editor/RTE_configuration/RTE_skin_file.asp" -->
<!--#include Virtual="/WebAdmin/Editor/language_files/RTE_language_file_inc.asp" -->
<!--#include Virtual="/WebAdmin/Editor/functions/RTE_functions_common.asp" -->
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

Dim strTextAreaName

strTextAreaName = Request.QueryString("textArea")



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

var colour;
var htmlOn;
var textAreaName = '<% = strTextAreaName %>';

<%



'***********************************************
'***   JavaScript initialising RTE editor  *****
'***********************************************
%>
//initialise RTE editor
function initialiseWebWizRTE(){

	var textArea = document.getElementById(textAreaName);
	var textAreaWidth = parseInt(textArea.offsetWidth);
	var textAreaHeight = parseInt(textArea.offsetHeight);

	//hide textarea
	textArea.style.display = 'none';

	//create the iframe
	var iframe = document.createElement('iframe');
	//Rui Fernandes
	iframe.setAttribute('id', 'WebWizRTE');
	textArea.parentNode.insertBefore(iframe, textArea);

	//style iframe
	iframe.style.width = textAreaWidth + 'px';
	iframe.style.height = textAreaHeight + 'px';
	iframe.style.border = '#A5ACB2 1px solid';

	//make toolbar the same size
	document.getElementById('toolbar').width = textAreaWidth + 2 + 'px';

	var editor = document.getElementById('WebWizRTE').contentWindow.document;

	//create iframe page content
	var iframeContent;
	iframeContent  = '<html>\n';
	iframeContent += '<head>\n';
	iframeContent += '<link href="/WebAdmin/Editor/RTE_configuration/default_style.css" rel="stylesheet" type="text/css" />\n';
	iframeContent += '<style>html,body{border:0px;background-color:<% = strRTEbackgroundColour %>;}\ntd{border:1px dotted #CCCCCC;}\n</style>\n';
	iframeContent += '</head>\n';
	iframeContent += '<body leftmargin="1" topmargin="1" marginwidth="1" marginheight="1" class="RTEtextarea">\n';
	iframeContent += textArea.value;
	iframeContent += '</body>\n';
	iframeContent += '</html>';

	editor.open();
	editor.write(iframeContent);
	editor.close();

	function initIframe(){
<%

'IE uses contentEditable instead of designMode to prevent runtime errors in IE6.0.26 to IE6.0.28
'IE uses proprietary attachEvent instead of following the W3C Events module and using addEventListener
'IE SUCKS!!
If RTEenabled = "winIE" Then

%>		
		editor.attachEvent('onkeypress', editorEvents);
		editor.attachEvent('onmousedown', editorEvents);
		document.attachEvent('onmousedown', hideIframes);
		editor.body.contentEditable = true;
<%

'Gekco needs designMode enabled AFTER we listen for events using addEventListener
Else
%>		editor.addEventListener('keypress', editorEvents, true);
		editor.addEventListener('mousedown', editorEvents, true);
		document.addEventListener('mousedown', hideIframes, true);
		editor.designMode = 'on';
<%
End If

%>	}
	setTimeout(initIframe, 300);
	
	//get present onsubmit events
	if (typeof textArea.form.onsubmit == 'function'){
		textArea.form.originalOnSubmit = [];
		textArea.form.originalOnSubmit.push(textArea.form.onsubmit);
	}
	
	//get textrea value from RTE and run any original onSubmit events
	textArea.form.onsubmit = function(){
		textArea.value = editor.body.innerHTML;
		for (i in this.originalOnSubmit){
			return this.originalOnSubmit[i]();
		}
	}
	
	//resetting the form
	textArea.form.onreset = function(){
		if (window.confirm('<% = strResetWarningFormConfirm %>')){
	 		editor.body.innerHTML = '';
	 		return true;
	 	}
	return false;
	}

	//unload event so we don't loose the data
	window.onunload = function(){
		textArea.value = editor.body.innerHTML;
	}
}
<%






'**********************************************
'***   JavaScript create RTE toolbar	  *****
'**********************************************
%>
//Create RTE toolbar
function WebWizRTEtoolbar(formName){
<%
	'Open Iframes

	'Colour Palette iframe
	If blnTextColour OR blnTextBackgroundColour Then
		Response.Write(vbCrLf & "	document.writeln('<iframe width=""260"" height=""165"" id=""colourPalette"" src=""/WebAdmin/Editor/includes/RTE_iframe_colour_palette.asp"" style=""visibility:hidden; position: absolute; left: 0px; top: 0px;"" frameborder=""0"" scrolling=""no""></iframe>');")
	End If

	'Format font Select iframe
	If blnFontStyle Then
		Response.Write(vbCrLf & "	document.writeln('<iframe width=""240"" height=""30"" id=""formatFont"" src=""/WebAdmin/Editor/includes/RTE_iframe_select_format.asp"" style=""visibility:hidden; position: absolute; left: 0px; top: 0px; border: 1px solid #000000;"" frameborder=""0"" scrolling=""no""></iframe>');")
	End If

	'Font Select iframe
	If blnFontType Then
		Response.Write(vbCrLf & "	document.writeln('<iframe width=""130"" height=""30"" id=""fontSelect"" src=""/WebAdmin/Editor/includes/RTE_iframe_select_font.asp"" style=""visibility:hidden; position: absolute; left: 0px; top: 0px; border: 1px solid #000000;"" frameborder=""0"" scrolling=""no""></iframe>');")
	End If

	'Font Size iframe
	If blnFontSize Then
		Response.Write(vbCrLf & "	document.writeln('<iframe width=""66"" height=""30"" id=""textSize"" src=""/WebAdmin/Editor/includes/RTE_iframe_select_size.asp"" style=""visibility:hidden; position: absolute; left: 0px; top: 0px; border: 1px solid #000000;"" frameborder=""0"" scrolling=""no""></iframe>');")
	End If

%>
	document.writeln('<table id="toolbar" width="680" border="0" cellspacing="0" cellpadding="1" bgcolor="<% = strRTEToolbarColour %>">');
	document.writeln(' <tr>');
	document.writeln('  <td>');
	<!--#include Virtual="/WebAdmin/Editor/includes/RTE_toolbar_inc.asp" -->
	document.writeln('  </td>');
	document.writeln(' </tr>');
	document.writeln('</table>');
}
<%







'***********************************************
'*** JavaScript for main editor buttons	   *****
'***********************************************
%>
//Function to format text in the text box
function FormatText(command, option){<%


'If this is the Gecko engine then uncomment the following line if you don't wish to use CSS
If RTEenabled = "Gecko" AND blnUseCSS = false Then Response.Write("	document.getElementById('WebWizRTE').contentWindow.document.execCommand(""useCSS"", false, option);")

%>

	var editor = document.getElementById('WebWizRTE');

	//Show iframes
	if ((command == 'forecolor') || (command == 'backcolor') || (command == 'hilitecolor') || (command == 'fontname') || (command == 'formatblock') || (command == 'fontsize')){
		parent.command = command;
		buttonElement = document.getElementById(command);
		switch (command){
			case 'fontname': iframeWin = 'fontSelect'; break;
			case 'formatblock': iframeWin = 'formatFont'; break;
			case 'fontsize': iframeWin = 'textSize'; break;
			default: iframeWin = 'colourPalette';
		}
		editor.contentWindow.focus()
		document.getElementById(iframeWin).style.left = getOffsetLeft(buttonElement) + 'px';
		document.getElementById(iframeWin).style.top = (getOffsetTop(buttonElement) + buttonElement.offsetHeight) + 'px';

		if (document.getElementById(iframeWin).style.visibility=='visible'){
			hideIframes();
		}else{
			hideIframes();
			document.getElementById(iframeWin).style.visibility='visible';
		}

		var selectedRange = editor.contentWindow.document.selection;
		if (selectedRange != null){
			range = selectedRange.createRange();
		}
	}<%



'If this is the Gecko then check the users preferences are set to cut, copy, or paste
If RTEenabled = "Gecko" Then

%>
	//Cut, copy, paste for Gecko
	else if ((command == 'cut') || (command == 'copy') || (command == 'paste')){
		try{
			editor.contentWindow.focus();
	  		editor.contentWindow.document.execCommand(command, false, option);
		}catch(exception){
			switch(command){
				case 'cut': keyboard = 'x'; break;
				case 'copy': keyboard = 'c'; break;
				case 'paste': keyboard = 'v'; break;
			}
			alert('<% = strTxtYourBrowserSettingsDoNotPermit %> \'' + command + '\' <% = strTxtPleaseUseKeybordsShortcut %> \(<% = strTxtWindowsUsers %> Ctrl + ' + keyboard + ', <% = strTxtMacUsers %> Apple + ' + keyboard + '\)')
		}

	}<%
End If



'If the advanced hyperlink is not enabled then display a basic hyperlink function
If blnAdvAdddHyperlink = false Then

%>
	else if (command == 'createLink'){

<%

	'Mozilla and IE use different methods to get the selected text
	If RTEenabled = "Gecko" Then
		Response.Write("		var selectedRange = editor.contentWindow.window.getSelection().toString();")
	Else
		Response.Write("		var selectedRange = editor.contentWindow.document.selection.createRange().text; ")
	End If
%>
		if (selectedRange != null && selectedRange != ''){
			//place http infront if not already in selected range
			if (selectedRange.substring(0,4) != 'http'){
				selectedRange = 'http://' + selectedRange
			}

			insertLink = prompt('<% = strTxtEnterHeperlinkURL %>', selectedRange);

			if ((insertLink != null) && (insertLink != '')){
				editor.contentWindow.focus();
				editor.contentWindow.document.execCommand('CreateLink', false, insertLink);
			}
		}else{
			alert('<% = strTxtSelectTextToTurnIntoHyperlink %>')
		}
	}<%

End If


'Else none of the other command need extra code so run the command as a bsic execCommand in the editor
%>
	else{
	  	editor.contentWindow.focus();
	  	editor.contentWindow.document.execCommand(command, false, option);
	}
	editor.contentWindow.focus();
}
<%

'***********************************************************************************






'************************************************************************
'*** 	JavaScript for initialise commands (iframe colours etc.)    *****
'************************************************************************
%>
//Function to initialise commands
function initialiseCommand(selection){
	var editor = document.getElementById('WebWizRTE')
<%
'If this is IE then use the following
If RTEenabled = "winIE" Then

	%>
	//retrieve selected range
	var selectedRange = editor.contentWindow.document.selection;
	if (selectedRange!=null){
		selectedRange = selectedRange.createRange();
		selectedRange = range;
		selectedRange.select();
	}<%
End If
%>
	editor.contentWindow.document.execCommand(parent.command, false, selection);
	editor.contentWindow.focus();
	hideIframes();
}
<%





'*****************************************************
'*** 	JavaScript for switching to HTML view    *****
'*****************************************************
If blnHTMLView Then
%>
//Function to switch to HTML view
function HTMLview(){
	var editor = document.getElementById('WebWizRTE');
	<%

	'If this is IE then use the following
	If RTEenabled = "winIE" Then

	%>
	//WYSIWYG view
	if (htmlOn == true){
		var html = editor.contentWindow.document.body.innerText;
		editor.contentWindow.document.body.innerHTML = html;
		document.getElementById('ToolBar1').style.visibility='visible';
		document.getElementById('ToolBar2').style.visibility='visible';
		htmlOn = false;

	//HTML view
	}else{
		var html = editor.contentWindow.document.body.innerHTML;
		editor.contentWindow.document.body.innerText = html;
    		document.getElementById('ToolBar1').style.visibility='hidden';
    		document.getElementById('ToolBar2').style.visibility='hidden';
    		htmlOn = true;
    	}<%


	'Else for Midas
	Else

	%>
	//WYSIWYG view
	if (htmlOn == true){
		var html = editor.contentWindow.document.body.ownerDocument.createRange();
		html.selectNodeContents(editor.contentWindow.document.body);
		editor.contentWindow.document.body.innerHTML = html.toString();
		document.getElementById('ToolBar1').style.visibility='visible';
		document.getElementById('ToolBar2').style.visibility='visible';
		htmlOn = false;

	//HTML view
	}else{
		var html = document.createTextNode(editor.contentWindow.document.body.innerHTML);
    		editor.contentWindow.document.body.innerHTML = '';
    		editor.contentWindow.document.body.appendChild(html);
    		document.getElementById('ToolBar1').style.visibility='hidden';
    		document.getElementById('ToolBar2').style.visibility='hidden';
    		htmlOn = true;
    	}<%

	End If
%>
	editor.contentWindow.focus();
}
<%
End If





'***********************************************
'*** 	JavaScript for print content    *****
'***********************************************
If blnPrint Then
%>
//Function to print editor content
function printEditor(){
<%
	'If this is Gekco then print method is different to IE
	If RTEenabled = "Gecko" Then
		Response.Write("	document.getElementById('WebWizRTE').contentWindow.print();")
	Else
		Response.Write("	document.getElementById('WebWizRTE').contentWindow.document.execCommand('Print');")
	End If
%>
}
<%
End If





'***********************************************
'*** 	JavaScript for clear button       *****
'***********************************************
'If new doc is enabled then include the following function
If blnNew Then
%>
//Function to clear editor content
function clearWebWizRTE(){
	 if (window.confirm('<% = strResetWarningEditorConfirm %>')){
	 	document.getElementById('WebWizRTE').contentWindow.document.body.innerHTML='';
	 	document.getElementById('WebWizRTE').contentWindow.focus();
	 }
}
<%
End If




'***********************************************
'*** 	JavaScript for iframes position    *****
'***********************************************
%>
//Iframe top offset
function getOffsetTop(elm){
	var mOffsetTop = elm.offsetTop;
	var mOffsetParent = elm.offsetParent;
	while(mOffsetParent){
		mOffsetTop += mOffsetParent.offsetTop;
		mOffsetParent = mOffsetParent.offsetParent;
	}
	return mOffsetTop;
}

//Iframe left offset
function getOffsetLeft(elm){
	var mOffsetLeft = elm.offsetLeft;
	var mOffsetParent = elm.offsetParent;
	while(mOffsetParent){
		mOffsetLeft += mOffsetParent.offsetLeft;
		mOffsetParent = mOffsetParent.offsetParent;
	}
	return mOffsetLeft;
}
<%




'***********************************************
'*** 	JavaScript for iframe hidding 	   *****
'***********************************************

Response.Write("//Function to hide iframes" & _
      vbCrLf & "function hideIframes(){")

If blnTextColour OR blnTextBackgroundColour OR blnFontStyle OR blnFontType OR blnFontSize Then

	'Colour Palette iframe
	If blnTextColour OR blnTextBackgroundColour Then

		Response.Write(vbCrLf & "	if (document.getElementById('colourPalette').style.visibility=='visible'){document.getElementById('colourPalette').style.visibility='hidden';}")
	End If

	'Format font Select iframe
	If blnFontStyle Then
		Response.Write(vbCrLf & "	if (document.getElementById('formatFont').style.visibility=='visible'){document.getElementById('formatFont').style.visibility='hidden';}")
	End If

	'Font Select iframe
	If blnFontType Then
		Response.Write(vbCrLf & "	if (document.getElementById('fontSelect').style.visibility=='visible'){document.getElementById('fontSelect').style.visibility='hidden';}")
	End If

	'Font Size iframe
	If blnFontSize Then
		Response.Write(vbCrLf & "	if (document.getElementById('textSize').style.visibility=='visible'){document.getElementById('textSize').style.visibility='hidden';}")
	End If
End If

Response.Write(vbCrLf & "}")




'***********************************************
'***  JavaScript for spell check detection *****
'***********************************************

'If spell checking is enabled load the following function
If blnSpellCheck Then
%>

//Function to perform spell check
function checkspell(){<%

'If IE
If RTEenabled = "winIE" Then

	%>
	try{
		var tmpis = new ActiveXObject('ieSpell.ieSpellExtension');
		tmpis.CheckAllLinkedDocuments(document);
	}
	catch(exception){
		if(exception.number==-2146827859){
			if (confirm('<% = strTxtIeSpellNotDetected %>')){
				window.open('http://www.iespell.com/download.php','DownLoad', '');
			}
		}
		else
			alert('Error Loading ieSpell: Exception ' + exception.number);
	}<%

'Else if this is Gecko browser load different JS
ElseIf RTEenabled = "Gecko" Then

	%>
	if (confirm('<% = strTxtSpellBoundNotDetected %>')){
		window.open('http://spellbound.sourceforge.net/install','DownLoad', '');
	}<%

End If
%>
}<%

End If




'***********************************************
'***   	   Editor Keybord/Mouse Events 	   *****
'***********************************************
%>
//Run Editor Events
function editorEvents(evt){
	var keyCode = evt.keyCode ? evt.keyCode : evt.charCode;
	var keyCodeChar = String.fromCharCode(keyCode).toLowerCase();
<%

'Put in some keybord shortcuts Gecko doesn't have when in RTE mode (IE already has these built in)
If RTEenabled = "Gecko" Then

%>
  	//Keyboard shortcuts
  	if (evt.type=='keypress' && evt.ctrlKey){
  		var kbShortcut;
  		switch (keyCodeChar){
			case 'b': kbShortcut = 'bold'; break;
			case 'i': kbShortcut = 'italic'; break;
			case 'u': kbShortcut = 'underline'; break;
			case 's': kbShortcut = 'strikethrough'; break;
			case 'i': kbShortcut = 'italic'; break;
		}
		if (kbShortcut){
			FormatText(kbShortcut, '');
			evt.preventDefault();
			evt.stopPropagation();
		}
	}
<%
End If


'Prevent double line spacing in IE (IE SUCKS!!!)
'If this is IE then detect if ENTER key is prssed then replace <p> with <div>

'I would replace <p> with <br>, but this then courses problems within tables, ordered lists, and 
'other elements so <div> is used as it creates the same one line effect but without the problems
If RTEenabled = "winIE" AND blnNoIEdblLine Then

%>
	//run if enter key is pressed
	if (evt.type=='keypress' && keyCode==13){
		var editor = document.getElementById('WebWizRTE');
		var selectedRange = editor.contentWindow.document.selection.createRange();
		var parentElement = selectedRange.parentElement();
		var tagName = parentElement.tagName;

		while((/^(a|abbr|acronym|b|bdo|big|cite|code|dfn|em|font|i|kbd|label|q|s|samp|select|small|span|strike|strong|sub|sup|textarea|tt|u|var)$/i.test(tagName)) && (tagName!='HTML')){
			parentElement = parentElement.parentElement;
			tagName = parentElement.tagName;
		}

		//Insert <div> instead of <p>
		if (parentElement.tagName == 'P'||parentElement.tagName=='BODY'||parentElement.tagName=='HTML'||parentElement.tagName=='TD'||parentElement.tagName=='THEAD'||parentElement.tagName=='TFOOT'){
			selectedRange.pasteHTML('<div>');
			selectedRange.select();
			return false;
		}
	}<%
End If

%>
	hideIframes();
	return true;
}