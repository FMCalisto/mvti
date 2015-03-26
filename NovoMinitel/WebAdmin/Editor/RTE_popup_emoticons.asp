<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include Virtual="/WebAdmin/Editor/RTE_configuration/RTE_setup.asp" -->
<!--#include Virtual="/WebAdmin/Editor/RTE_configuration/RTE_skin_file.asp" -->
<!--#include Virtual="/WebAdmin/Editor/functions/RTE_functions_common.asp" -->
<!--#include Virtual="/WebAdmin/Editor/language_files/RTE_language_file_inc.asp" -->
<!--#include Virtual="/WebAdmin/Editor/includes/emoticons_inc.asp" -->
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


Response.Buffer = True


'If emoticons are enabled
If blnEmoticonPopUp Then

	'Declare variables
	Dim intIndexPosition		'Holds the idex poistion in the emiticon array
	Dim intNumberOfOuterLoops	'Holds the outer loop number for rows
	Dim intLoop			'Holds the loop index position
	Dim intInnerLoop		'Holds the inner loop number for columns
%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2002-2005 Bruce Corkhill" />
<title>Emoticon</title>
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
If RTEenabled = "Gecko" Then Response.Write(vbCrLf & "<script language=""JavaScript"" src=""/WebAdmin/Editor/RTE_javascript_gecko.asp"" type=""text/javascript""></script>")

%>
		
<script language="JavaScript">
<%

	Response.Write(vbCrLf & "//Function to add emoticon")
	Response.Write(vbCrLf & "function AddEmoticon(iconItem){")
	
	Response.Write(vbCrLf & vbCrLf & "	editor = window.opener.document.getElementById('WebWizRTE');")
		
	'Tell that we are an image
	Response.Write(vbCrLf & vbCrLf & "	img = editor.contentWindow.document.createElement('img');")
			
	'Set image attributes
	If  blnUseFullURLpath = true Then
		Response.Write(vbCrLf & vbCrLf & "	img.setAttribute('src', '" & strFullURLpathToRTEfiles & "' + iconItem.id);")
	Else
		Response.Write(vbCrLf & vbCrLf & "	img.setAttribute('src', iconItem.id);")
	End If
	Response.Write(vbCrLf & "	img.setAttribute('border', '0');")
	Response.Write(vbCrLf & "	img.setAttribute('alt', iconItem.title);")
	Response.Write(vbCrLf & "	img.setAttribute('align', 'absmiddle');")
			 
	      
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
		
	Response.Write(vbCrLf & "}")
		


%>

//Function to hover emoticon
function overIcon(iconItem) {
	
	iconItem.style.backgroundColor='<% = strRTEpopupButtonHighlight %>';
	document.getElementById("emotImage").src = iconItem.id;
	document.getElementById("emotName").value = iconItem.title;
}


//Function to moving off emoticon
function outIcon(iconItem) {
	
	iconItem.style.backgroundColor='<% = strRTEpopupButtonColour %>';
	document.getElementById("emotImage").src = '<% = strRTEImagePath %>blank.gif';
	document.getElementById("emotName").value = '';
}
</script>
<style type="text/css">
input.display {
	border: 0px;
	background-color: <% = strRTEpopupCentreRowColour %>; 	
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #000000;
	text-align: center;
}
</style>
<link href="/WebAdmin/Editor/RTE_configuration/default_style.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#FFFFFF" text="#000000" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0" OnLoad="self.focus();">
<table width="100%"  border="0" cellpadding="3" cellspacing="0" bgcolor="<% = strRTEpopupTopRowColour %>">
  <form method="post" name="frmImageInsrt">
    <tr>
      <td colspan="2" bgcolor="<% = strRTEpopupTopRowColour %>" class="heading"><% = strTxtEmoticons %></td>
    </tr>
    <tr>
      <td width="80%" bgcolor="<% = strRTEpopupCentreRowColour %>">
      <table width="100%" border="0" cellspacing="1" cellpadding="0"><%

	'Intilise the index position (we are starting at 1 instead of position 0 in the array for simpler calculations)
	intIndexPosition = 1
	
	'Calcultae the number of outer loops to do
	intNumberOfOuterLoops = UBound(saryEmoticons) / 7
	
	'If there is a remainder add 1 to the number of loops
	If UBound(saryEmoticons) MOD 7 > 0 Then intNumberOfOuterLoops = intNumberOfOuterLoops + 1
	
	'Loop throgh th list of emoticons
	For intLoop = 1 to intNumberOfOuterLoops
	      
	
		Response.Write(vbCrLf & "	<tr>")
	
		'Loop throgh th list of emoticons
		For intInnerLoop = 1 to 7  
		
			'If there is nothing to display show an empty box
			If intIndexPosition > UBound(saryEmoticons) Then 
				Response.Write(vbCrLf & "          <td width=""45"" height=""45"" bgcolor=""" & strRTEpopupButtonColour & """>&nbsp;</td>") 
	
			'Else show the emoticon
			Else 
				Response.Write(vbCrLf & "          <td width=""45"" height=""45"" bgcolor=""" & strRTEpopupButtonColour & """ id=""" & saryEmoticons(intIndexPosition,3) & """ title=""" & saryEmoticons(intIndexPosition,1) & """  onMouseover=""overIcon(this)"" onMouseout=""outIcon(this)"" OnClick=""AddEmoticon(this)"" align=""center"" style=""cursor: default;""><img src=""" & saryEmoticons(intIndexPosition,3) & """ border=""0"" alt=""" & saryEmoticons(intIndexPosition,1) & """ align=""absmiddle""></td>")
	              	End If
	              
	              'Minus one form the index position
	              intIndexPosition = intIndexPosition + 1 
		Next    
		        
		Response.Write(vbCrLf & "	</tr>")
		
	Next             
%></table>
      </td>
      <td width="20%" align="center" valign="top" bgcolor="<% = strRTEpopupCentreRowColour %>"><table width="45" height="45" border="0" cellpadding="0" cellspacing="1">
        <tr>
          <td bgcolor="<% = strRTEpopupButtonColour %>" align="center"><img src="<% = strRTEImagePath %>blank.gif" name="emotImage" align="absmiddle" id="emotImage"></td>
        </tr>
      </table>
        <input name="emotName" type="text" class="display" id="emotName" value="" size="9"></td>
    </tr>
    <tr>
    <td bgcolor="<% = strRTEpopupBottomRowColour %>">&nbsp;<%

	'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
	If blnAbout Then
		Response.Write("<span class=""text"" style=""font-size:10px"">Powered by <a href=""http://www.richtexteditor.org"" target=""_blank"" style=""font-size:10px"">Web Wiz Rich Text Editor</a> version " & strRTEversion & "</span>")
	End If 
	'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******      
      
      %></td>
      <td align="right" bgcolor="<% = strRTEpopupBottomRowColour %>"><input type="button" name="cancel" value=" <% = strTxtCancel %> " onClick="window.close()">         
      </td></tr>
  </form>
</table>
</body>
</html>
<%

End If

%>