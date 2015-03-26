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

//text area name
var textArea = '<% = strTextAreaName %>';

//Have the propmt box turned on by default
var promptOn = true;


//initialise area
function initialiseWebWizRTE(){
	//make toolbar the same size
	document.getElementById('toolbar').width = parseInt(document.getElementById(textArea).offsetWidth) + 2 + 'px';
}

//Create toolbar
function WebWizRTEtoolbar(formName){

	document.writeln('<table id="toolbar" width="680" border="0" cellspacing="0" cellpadding="1" bgcolor="<% = strRTEToolbarColour %>">');
	document.writeln(' <tr>');
	document.writeln('  <td>');
	<!--#include Virtual="/WebAdmin/Editor/includes/non_RTE_toolbar_inc.asp" -->
	document.writeln('  </td>');
	document.writeln(' </tr>');
	document.writeln('</table>');

}

//Function to turn on or off the prompt box
function PromptMode(selectMode){
	if (selectMode.options[selectMode.selectedIndex].value == 0){
		promptOn = false;
	}
	else{
		promptOn = true;
	}
}

//function to clear area
function clearWebWizRTE(){
 	if (window.confirm('<% = strResetWarningEditorConfirm %>')){
	 	document.getElementById(textArea).value='';
	}
}

// Function to add the code for bold italic centre and underline, to the message
function AddMessageCode(code, promptText, InsertText){

	if (code != ''){
		if (promptOn == true){
			insertCode = prompt(promptText + '\n<' + code + '>xxx</' + code + '>', InsertText);
				if ((insertCode != null) && (insertCode != '')){
					document.getElementById(textArea).value += '<' + code + '>' + insertCode + '</' + code + '>';
				}
		}
		else{
			document.getElementById(textArea).value += '<' + code + '></' + code + '>';
		}
	}
				
	document.getElementById(textArea).focus();
}

// Function to add the font colours, sizes, type to the message
function FontCode(code, endCode) {

	if (code != ''){
		if (promptOn == true){
			insertCode = prompt('<% = strTxtEnterTextYouWouldLikeIn %> ' + code + '\n<' + code + '>xxx</font>', '');
				if ((insertCode != null) && (insertCode != '')){
					document.getElementById(textArea).value += '<' + code + '>' + insertCode + '</font>';
				}
		}
		else{
			document.getElementById(textArea).value += '<' + code + '></font>';
		}
	}	
	document.getElementById(textArea).focus();
}



//Function to add the URL, indent, list, and Email code to the message
function AddCode(code){

	//For the URL code
	if ((code != '') && (code == 'URL')){
		if (promptOn == true){
			insertText = prompt('<% = strTxtEnterHyperlinkText %>', '');
				
				if ((insertText != null) && (insertText != '') && (code == 'URL')){
					insertCode = prompt('<% = strTxtEnterHeperlinkURL %>', 'http://');
						
						if ((insertCode != null) && (insertCode != '') && (insertCode != 'http://')){					
							document.getElementById(textArea).value += '<a href="' + insertCode + '">' + insertText + '</a>';
						}
				}
		}
		else {
			document.getElementById(textArea).value += '<a href=""></a>';
		}
	}
	
	
	//For the email code
	if ((code != '') && (code == 'EMAIL')){
		if (promptOn == true){
			insertText = prompt('<% = strTxtEnterEmailText %>', '');
				
				if ((insertText != null) && (insertText != '')){
					insertCode = prompt('<% = strTxtEnterEmailMailto %>', '');
						
						if ((insertCode != null) && (insertCode != '')){					
						document.getElementById(textArea).value += '<a href="mailto:' + insertCode + '">' + insertText + '</a>';
					}
				}
		}
		else {
			document.getElementById(textArea).value += '<a href="mailto:"></a>';
		}
	}
	
	//For the image code
	if ((code != '') && (code == 'IMG')){
		if (promptOn == true){	
			insertCode = prompt('<% = strTxtEnterImageURL %>', 'http://');
						
				if ((insertCode != null) && (insertCode != '')){					
				document.getElementById(textArea).value += '<img src="' + insertCode + '" />';
			}			
		}
		else {
			document.getElementById("message").value += '<img src="" />';
		}
	}
	
	//For the list code
	if ((code != '') && (code == 'LIST')){
		if (promptOn == true){
			listType = prompt('<% = strTxtEnterTypeOfList %> \n<% = strTxtEnterEnter %> \'1\' <% = strTxtEnterNumOrBlankList %>', '');
			
			while ((listType != null) && (listType != '') && (listType != '1')) {
				listType = prompt('<% = strTxtEnterListError %> \'1\' <% = strTxtEnterNumOrBlankList %>','');               
			}
			
			if (listType != null){			
				var listItem = '1';
				var insertCode = '';
				
				while ((listItem != '') && (listItem != null)) {
					listItem = prompt('<% = strEnterLeaveBlankForEndList %>',''); 
					if (listItem != '') {             
						insertCode += '<li>' + listItem + '</li>'; 
					}                   
				} 
				
				if (listType == '') {
					document.getElementById(textArea).value += '<ul>' + insertCode + '</ul>';
				} else {
					document.getElementById(textArea).value += '<ol>' + insertCode + '</ol>';
				} 
				
			}
		}
		else{
			document.getElementById(textArea).value += '<ul><li> </li><li> </li><li> </li></ul>';
		}			
	}
	
	
	//For the indent
	if ((code != '') && (code == 'INDENT')){
						
			document.getElementById(textArea).value += '      ';				
	}
				
	document.getElementById(textArea).focus();
}