<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include Virtual="/WebAdmin/Editor/RTE_configuration/RTE_setup.asp" -->
<!--#include Virtual="/WebAdmin/Editor/RTE_configuration/RTE_skin_file.asp" -->
<!--#include Virtual="/WebAdmin/Editor/functions/RTE_functions_common.asp" -->
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


'Dimension veriables
Dim strLinkType
Dim strHyperlinkType
Dim strHyperlink
Dim strTitle
Dim strWindow
Dim strEmail
Dim strSubject



'If this a post back read in the form elements
If Request.Form("URL") <> "" OR Request.Form("email") <> "" AND Request.Form("postBack") Then
	
	'Get form elements
	strLinkType = Request.Form("selType")
	strHyperlinkType = Request.Form("linkChoice")
	strHyperlink = Request.Form("URL")
	strTitle = Request.Form("Title")
	strWindow = Request.Form("Window")
	strEmail = Request.Form("email")
	strSubject = Request.Form("subject")
	
	'If the http:// part is repeated in the URL then strip it:-
	strHyperlink = Replace(strHyperlink, strHyperlinkType, "", 1, -1, 1)
	
	'Escape characters that will course a crash
	strHyperlink = Replace(strHyperlink, "'", "\'", 1, -1, 1)
	strHyperlink = Replace(strHyperlink, """", "\""", 1, -1, 1)
	strTitle = Replace(strTitle, "'", "\'", 1, -1, 1)
	strTitle = Replace(strTitle, """", "\""", 1, -1, 1)
	strWindow = Replace(strWindow, "'", "\'", 1, -1, 1)
	strWindow = Replace(strWindow, """", "\""", 1, -1, 1)
	strEmail = Replace(strEmail, "'", "\'", 1, -1, 1)
	strEmail = Replace(strEmail, """", "\""", 1, -1, 1)
	strSubject = Replace(strSubject, "'", "\'", 1, -1, 1)
	strSubject = Replace(strSubject, """", "\""", 1, -1, 1)
	
	
	'If this is an email mailto then set the email type to mailto:
	If strLinkType = "email" Then 
		strHyperlinkType = "mailto:"
		strHyperlink = strEmail
	End If
End If

%>
<html>
<head>
<title>Hyperlink Properties</title>
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
<%

'If this a post back write javascript
If Request.Form("URL") <> "" OR Request.Form("email") <> "" AND Request.Form("postBack") Then
		
	
	'*********************************************
	'***  	JavaScript for Mozilla & IE	 *****
	'*********************************************
	
	Response.Write(vbCrLf & "editor = window.opener.document.getElementById('WebWizRTE');")
	
	'Mozilla and IE use different methods to get the selected text (if any)
	If RTEenabled = "Gecko" Then 
		Response.Write(vbCrLf & vbCrLf & "var selectedRange = editor.contentWindow.window.getSelection();")
	Else	
		Response.Write(vbCrLf & vbCrLf & "var selectedRange = editor.contentWindow.document.selection.createRange();")
	End If	
	


	'If there is a selected area, turn it into a hyperlink
	Response.Write(vbCrLf & vbCrLf & "if (selectedRange != null && selectedRange")
	If RTEenabled = "winIE" Then Response.Write(".text")
	Response.Write(" != ''){")

	'Create hyperlink
	Response.Write(vbCrLf & "	editor.contentWindow.window.document.execCommand('CreateLink', false, '" & strHyperlinkType & strHyperlink & "')")
		
	'Set attributes if required
	If (strLinkType = "link" AND (strTitle <> "" OR strWindow <> "")) OR (strLinkType = "email" AND strSubject <> "") Then
		
		'Set hyperlink attributes
		Response.Write(vbCrLf & vbCrLf & "	var hyperlink = editor.contentWindow.window.document.getElementsByTagName('a');" & _
			       vbCrLf & "	for (var i=0; i < hyperlink.length; i++){" & _
			       vbCrLf & "		if (hyperlink[i].getAttribute('href').search('" & strHyperlinkType & strHyperlink & "') != -1){")
		
		'Set title, window, subject if required	       
		If strLinkType = "link" AND strTitle <> "" Then Response.Write(vbCrLf & "			hyperlink[i].setAttribute('title','" & strTitle & "');")
		If strLinkType = "link" AND strWindow <> "" Then Response.Write(vbCrLf & "			hyperlink[i].setAttribute('target','" & strWindow & "');")
		If strLinkType = "email" AND strSubject <> "" Then Response.Write(vbCrLf & "			hyperlink[i].setAttribute('subject','" & strSubject & "');")
			       
		Response.Write(vbCrLf & "		}" & _
			       vbCrLf & "	}")
	End If
	
	
	
	'Else no selected area so use the hyperlink text as the displayed text
	Response.Write(vbCrLf & "}else{")
	
	'Tell that we are maiing a hyperlink 'a'
	Response.Write(vbCrLf & vbCrLf & "	hyperlink = editor.contentWindow.document.createElement('a');")
	
	Response.Write(vbCrLf & vbCrLf & "	hyperlink.setAttribute('href', '" & strHyperlinkType & strHyperlink & "');")
	If strLinkType = "link" AND strTitle <> "" Then Response.Write(vbCrLf & "	hyperlink.setAttribute('title', '" & strTitle & "');")
	If strLinkType = "link" AND strWindow <> "" Then Response.Write(vbCrLf & "	hyperlink.setAttribute('target', '" & strWindow & "');")
	If strLinkType = "email" AND strSubject <> "" Then Response.Write(vbCrLf & "	hyperlink.setAttribute('subject', '" & strSubject & "');")
	
	'Use the text eentered for the link to be a child of the a tag so that it is the screen display
	Response.Write(vbCrLf & "	hyperlink.appendChild(editor.contentWindow.document.createTextNode('" & strHyperlinkType & strHyperlink & "'));")
	
	'If this is Mozilla then we need to call insertElementPosition to find where to place the image
     	If RTEenabled = "Gecko" Then 
		
	Response.Write(vbCrLf & vbCrLf & "	try{" & _
				vbCrLf & "		insertElementPosition(editor.contentWindow, hyperlink);" & _
				vbCrLf & "	}catch(exception){" & _
				vbCrLf & "		alert('" & strTxtErrorInsertingObject & "');" & _
				vbCrLf & "		editor.contentWindow.focus();" & _
				vbCrLf & "	}")
	
	'Else this is IE so placing the link is simpler
	Else
		Response.Write(vbCrLf & vbCrLf & "	try{" & _
					vbCrLf & "		editor.contentWindow.focus();" & _
					vbCrLf & "		editor.contentWindow.document.selection.createRange().pasteHTML(hyperlink.outerHTML);" & _
					vbCrLf & "	}catch(exception){" & _
					vbCrLf & "		alert('" & strTxtErrorInsertingObject & "');" & _
					vbCrLf & "		editor.contentWindow.focus();" & _
					vbCrLf & "	}")
	End If
	
	Response.Write(vbCrLf & "}")
	


	
	'Set focus
	Response.Write(vbCrLf & vbCrLf & "editor.contentWindow.focus();")
	
	'Close window
	Response.Write(vbCrLf & "window.close();")	
End If



%>

function initialise(){
<%

	'Mozilla and IE use different methods to get the selected text
	If RTEenabled = "Gecko" Then
		Response.Write("	var selectedRange = window.opener.document.getElementById('WebWizRTE').contentWindow.window.getSelection().toString();")
	Else
		Response.Write("	var selectedRange = window.opener.document.getElementById('WebWizRTE').contentWindow.document.selection.createRange().text; ")
	End If
%>
	//Use editor selected range to fill text boxes
	if (selectedRange != undefined){
		document.getElementById('URL').value = selectedRange
		document.getElementById('email').value = selectedRange
	}
	if (document.getElementById('URL').value==''){
		document.getElementById('Submit').disabled=true;
	}
	
	self.focus();
}


//Function to preview URL
function showPreview(linkSelection){
	if (linkSelection.options[linkSelection.selectedIndex].value=="http://" || linkSelection.options[linkSelection.selectedIndex].value=="https://"){
		alert("<% = strTxtPleaseWaitWhilePreviewLoaded %>");
		try {
			document.getElementById("previewLink").contentWindow.location.href =(linkSelection.options[linkSelection.selectedIndex].value + document.getElementById("URL").value);
		}catch(exception){
		}
	
	}else{
		document.getElementById("previewLink").contentWindow.location.href="RTE_popup_link_preview.asp?b=0";
	
	}
}

//Disable preview button for some links
function disablePreview(linkSelection){
	if (linkSelection.options[linkSelection.selectedIndex].value=="http://" || linkSelection.options[linkSelection.selectedIndex].value=="https://"){
		document.getElementById("preview").disabled=false;
		document.getElementById("previewLink").contentWindow.location.href="RTE_popup_link_preview.asp";
		
	}else{
		document.getElementById("preview").disabled=true;
		document.getElementById("previewLink").contentWindow.location.href="RTE_popup_link_preview.asp?b=0";
	}
}

//Function swap link type
function swapLinkType(selType){
	if (selType.value == "email"){
		document.getElementById("hyperlink").style.display="none";
    		document.getElementById("mailLink").style.display="block";<%
    		
'If this is Gekco based browser the element needs to be set to visable
If RTEenabled = "Gecko" Then Response.Write(vbCrLf & "		document.getElementById(""mailLink"").style.visibility=""visable"";") 		
    		%>
    		
	}else{
		document.getElementById("mailLink").style.display="none";
		document.getElementById("hyperlink").style.display="block";<%
		
'If this is Gekco based browser the element needs to be set to visable
If RTEenabled = "Gecko" Then Response.Write(vbCrLf & "		document.getElementById(""hyperlink"").style.visibility=""visable"";") 		
    		%>
	}
}



</script>
<link href="/WebAdmin/Editor/RTE_configuration/default_style.css" rel="stylesheet" type="text/css" />
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" OnLoad="initialise();">
<table width="100%"  border="0" cellpadding="3" cellspacing="0" bgcolor="<% = strRTEpopupTopRowColour %>">
  <form method="post" name="frmLinkInsrt">
    <tr>
      <td colspan="2" bgcolor="<% = strRTEpopupTopRowColour %>" class="heading"><% = strTxtHyperlinkProperties %></td>
    </tr>
    <tr>
      <td colspan="2" bgcolor="<% = strRTEpopupCentreRowColour %>"><table width="100%" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr>
          <td><table width="100%" border="0" cellpadding="2" cellspacing="0">
            <tr>
              <td width="20%" align="right" class="text"><% = strTxtLinkType %>:</td>
              <td width="80%"><select name="selType" id="selType" onChange="swapLinkType(this)">
                  <option value="link" selected>Hyperlink</option>
                  <option value="email">Email</option>
              </select></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="240">            
          <span id="hyperlink">
            <table width="100%" border="0" cellpadding="2" cellspacing="0">
              <tr>
                <td width="20%" align="right" class="text"><% = strTxtAddress %>:</td>
                <td width="80%">
                 <select name="linkChoice" id="linkChoice" onChange="disablePreview(this)">
                   <option value="http://" selected>http://</option>
                   <option value="https://">https://</option>
                   <option value="ftp://">ftp://</option>
                   <option value="file://">file://</option>
                   <option value="news://">news://</option>
                   <option value="telnet://">telnet://</option>
                 </select>
                  <input name="URL" type="text" id="URL" size="27" onchange="document.getElementById('Submit').disabled=false;" onkeypress="document.getElementById('Submit').disabled=false;">
                <input name="preview" type="button" id="preview" value="<% = strTxtPreview %>" onClick="showPreview(document.getElementById('linkChoice'))">
                </td>
              </tr>
              <tr>
                <td align="right" class="text"><% = strTxtTitle %>:</td>
                <td><input name="Title" type="text" id="Title" size="40" maxlength="40"></td>
              </tr>
              <tr>
                <td align="right" class="text"><% = strTxtWindow %>:</td>
                <td><select name="windowSel" id="windowSel" onChange="document.getElementById('Window').value=this.options[this.selectedIndex].value">
                  <option value="" selected>Default</option>
                  <option value="_blank">New Window</option>
                  <option value="_self">Same Window</option>
                  <option value="_parent">Parent Window</option>
                  <option value="_top">Top Window</option>
                </select>
                  <input name="Window" type="text" id="Window" size="12" maxlength="15"></td>
              </tr>
              <tr>
                <td align="right" valign="top" class="text"><% = strTxtPreview %>:</td>
                <td><iframe src="RTE_popup_link_preview.asp" id="previewLink" width="98%" height="150px" style="border: #A5ACB2 1px solid;backgroundColor: #FFFFFF;"></iframe></td>
              </tr>
          </table>
           </span>
           <span id="mailLink" style="display:none">
            <table width="100%" border="0" cellpadding="2" cellspacing="0">
              <tr>
                <td align="right" class="text"><% = strTxtEmail %>:</td>
                <td><input name="email" type="text" id="email" size="40" onfocus="document.forms.frmLinkInsrt.Submit.disabled=false;"></td>
              </tr>
              <tr>
                <td width="20%" align="right" class="text"><% = strTxtSubject %>:</td>
                <td width="80%"><input name="subject" type="text" id="subject" size="40" maxlength="50"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;<br /><br /><br /><br /><br /><br /><br /><br /></td>
              </tr>
            </table>
           </span>            </td>
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
      <td align="right" bgcolor="<% = strRTEpopupBottomRowColour %>" nowrap="nowrap" valign="top"><input type="hidden" name="postBack" value="true"><input type="submit" id="Submit" name="Submit" value="     <% = strTxtOK %>     ">&nbsp;<input type="button" name="cancel" value=" <% = strTxtCancel %> " onClick="window.close()"></td>
    </tr>
  </form>
</table>
</body>
</html>
