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


'Set the response buffer to true as we maybe redirecting
Response.Buffer = True

%>
<html>
<head>
<title>Paste from Word</title>
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
//function to initialise paste textarea
function initialise(){

	//create iframe page content
	var editor = document.getElementById('pasteWin').contentWindow.document;
	var iframeContent;
	iframeContent  = '<html>\n';
	iframeContent += '<head>\n';
	iframeContent += '<style> html,body{border:0px;background-color:#FFFFFF;}</style>\n';
	iframeContent += '</head>\n';
	iframeContent += '<body leftmargin="1" topmargin="1" marginwidth="1" marginheight="1">\n';
	iframeContent += '</body>\n';
	iframeContent += '</html>';

	editor.open();
	editor.write(iframeContent);
	editor.close();

	function initIframe() {
		editor.designMode = 'on';
	};
	setTimeout(initIframe, 100);
	self.focus(); 
}


//Get pasted word document
function pasteWordDoc(){

	//Read in the word doc
	pastedDoc = document.getElementById('pasteWin').contentWindow.document.body.innerHTML;
	
	//Run through Word Tidy function
	pastedDoc = WWRTEwordTidy(pastedDoc);
	
	if (pastedDoc.indexOf('<br>') > -1 && pastedDoc.length == 8) pastedDoc = '';
	
	//Place in main editor
	editor = window.opener.document.getElementById('WebWizRTE');	
<%
'If this is Mozilla then we need to call insertElementPosition to find where to place the doc
If RTEenabled = "Gecko" Then 
%>     		
     	docHTML = editor.contentWindow.document.createElement('wordTidy');
     	docHTML.innerHTML = pastedDoc;
	try{
		insertElementPosition(editor.contentWindow, docHTML);
	}catch(exception){
		alert('<% = strTxtErrorInsertingObject %>');
		editor.contentWindow.focus();
	}
<%	
'Else this is IE so placing the doc is simpler
Else
%>
	try{
		editor.contentWindow.focus();
		editor.contentWindow.document.selection.createRange().pasteHTML(pastedDoc);
	}catch(exception){
		alert('<% = strTxtErrorInsertingObject %>');
		editor.contentWindow.focus();
	}
<%
	End If
%>	
	editor.contentWindow.focus();
	window.close();
}


//Clean word HTML using WordTidy(TM) Technology
function WWRTEwordTidy(doc){

	//Delete all SPAN tags
	doc = doc.replace(/<\/?SPAN[^>]*>/gi, '')
	
	//Delete all FONT tags
	.replace(/<\/?FONT[^>]*>/gi, '')
	
	//Delete Class attributes
	.replace(/<(\w[^>]*) class=([^ |>]*)([^>]*)/gi, '<$1$3')
	
	//Delete Style attributes
	.replace(/<(\w[^>]*) style='([^']*)'([^>]*)/gi, '<$1$3')

	//Delete Lang attributes
	.replace(/<(\w[^>]*) lang=([^ |>]*)([^>]*)/gi, '<$1$3')
	
	//Delete XML elements and declarations
	.replace(/<\\?\?xml[^>]*>/gi, '')
	
	//Delete Tags with XML namespace declarations: <o:p></o:p>
	.replace(/<\/?\w+:[^>]*>/gi, '')
	
	//Delete the &nbsp;
	.replace(/&nbsp;/, ' ')
	
	//Delete the MARGIN: 0cm 0cm 0pt; IE puts in when pasting from Word
	.replace(/MARGIN: 0cm 0cm 0pt;/gi, '')
	
	//Clean up tags
	.replace(/<B [^>]*>/gi,'<b>')
	.replace(/<I [^>]*>/gi,'<i>')
	.replace(/<LI [^>]*>/gi,'<li>')
	.replace(/<UL [^>]*>/gi,'<ul>')
	
	//Replace outdated tags
	.replace(/<B>/gi,'<strong>')
	.replace(/<\/B>/gi,'</strong>')
	.replace(/<I>/gi,'<em>')
	.replace(/<\/I>/gi,'</em>')
	
	//Delete empty tags
	.replace(/<strong><\/strong>/gi,'')
	.replace(/<strong> <\/strong>/gi,'')
	.replace(/<em><\/em>/gi,'')
	.replace(/<em> <\/em>/gi,'')
	
	//Replace <P> with <DIV>
	.replace(/<P/gi, '<div')
	.replace(/<\/P>/gi, '</div>');
	
	return doc;
}
</script>
<link href="/WebAdmin/Editor/RTE_configuration/default_style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
input.display {
	border: 0px;
	background-color: <% = strRTEpopupCentreRowColour %>;
}
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" OnLoad="initialise()">
<table width="100%"  border="0" cellpadding="3" cellspacing="0" bgcolor="<% = strRTEpopupTopRowColour %>">
    <tr>
      <td colspan="2" width="57%" bgcolor="<% = strRTEpopupTopRowColour %>" class="heading"><% = strTxtPasteFromWord %></td>
    </tr>
    <tr>
      <td colspan="2" bgcolor="<% = strRTEpopupCentreRowColour %>"><table width="100%" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr>
          <td width="58%" valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="2">
              <tr>
                <td width="51%" class="text"><% = strTxtPasteFromWordDialog %></td>
              </tr>
              <tr>
                <td class="text"><iframe id="pasteWin" width="100%" height="180px" style="border: #A5ACB2 1px solid;backgroundColor: #FFFFFF;"></iframe></td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
    <td bgcolor="<% = strRTEpopupBottomRowColour %>" valign="top">&nbsp;<%

'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
If blnAbout Then
	Response.Write("<span class=""text"" style=""font-size:10px"">Powered by <a href=""http://www.richtexteditor.org"" target=""_blank"" style=""font-size:10px"">Web Wiz Rich Text Editor</a> version " & strRTEversion & "</span>")
End If 
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******      
      
      %></td>
      <td align="right" bgcolor="<% = strRTEpopupBottomRowColour %>">
          <input type="button" name="Submit" id="Submit" value="   <% = strTxtOK %>   " onClick="pasteWordDoc()">&nbsp;<input type="button" name="cancel" value=" <% = strTxtCancel %> " onClick="window.close()">
        <br /><br /></td>
    </tr>
</table>
</body>
</html>