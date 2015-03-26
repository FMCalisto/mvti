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
Dim lngRows
Dim lngCols
Dim lngWidth
Dim strWidthValue
Dim strAlign
Dim lngBorder
Dim lngPad
Dim lngSpace
Dim lngRowsLoopCounter
Dim lngColsLoopCounter

'Intalise varibales
lngWidth = 100
lngCols = 1
lngWidth = 1


'If this a post back read in the form elements
If isNumeric(Request.Form("rows")) AND isNumeric(Request.Form("cols")) AND Request.Form("postBack") Then
	
	'Get form elements
	If isNumeric(Request.Form("rows")) Then lngRows = CLng(Request.Form("rows"))
	If isNumeric(Request.Form("cols")) Then lngCols = CLng(Request.Form("cols"))
	If isNumeric(Request.Form("width")) Then lngWidth = CLng(Request.Form("width"))
	strWidthValue = Request.Form("range")
	strAlign = Request.Form("align")
	If isNumeric(Request.Form("border")) Then lngBorder = CLng(Request.Form("border"))
	If isNumeric(Request.Form("pad")) Then lngPad = CLng(Request.Form("pad"))
	If isNumeric(Request.Form("space")) Then lngSpace = CLng(Request.Form("space"))	
End If


%>	
<html>
<head>
<title>Table Properties</title>
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


'If this a post back write javascript
If isNumeric(Request.Form("rows")) AND isNumeric(Request.Form("cols")) AND Request.Form("postBack") Then
	
	'If this is Gecko based browser link to JS code for Gecko
	If RTEenabled = "Gecko" Then Response.Write(vbCrLf & "<script language=""JavaScript"" src=""RTE_javascript_gecko.asp"" type=""text/javascript""></script>")
	
	
	Response.Write(vbCrLf & "<script  language=""JavaScript"">")

%>	
    	   	
    	editor = window.opener.document.getElementById('WebWizRTE');
    	
    	rows = <% = lngRows %>;
    	cols = <% = lngCols %>;
   
    	if ((rows > 0) && (cols > 0)) {
      
	      	table = editor.contentWindow.document.createElement("table");
	      	
	      	table.setAttribute("border", "<% = lngBorder %>");
	      	table.setAttribute("cellpadding", "<% = lngPad %>");
	      	table.setAttribute("cellspacing", "<% = lngSpace %>");
	      	table.setAttribute("align", "<% = strAlign %>");
	      	table.setAttribute("width", "<% = lngWidth & strWidthValue %>");
	      
	      	tbody = editor.contentWindow.document.createElement("tbody");
      
      		for (var rowNo=0; rowNo < rows; rowNo++) {
        
        		tr = editor.contentWindow.document.createElement("tr");
        
        		for (var colNo=0; colNo < cols; colNo++) {
          
		          	td = editor.contentWindow.document.createElement("td");
		          	tr.appendChild(td);<%      
      
      		'If this is Mozilla then we need to place a <br> tag in the table cells
      		If RTEenabled = "Gecko" Then %>
		          	br = editor.contentWindow.document.createElement("br");
		          	td.appendChild(br);<%
		End If
		
		%>        
        		}
        
        	tbody.appendChild(tr);
      		}
      
      		table.appendChild(tbody);<%      
      
      		'If this is Mozilla then we need to call insertElementPosition to find where to place the table
      		If RTEenabled = "Gecko" Then 
			
			Response.Write(vbCrLf & vbCrLf & "	try{" & _
						vbCrLf & "		insertElementPosition(editor.contentWindow, table);" & _
						vbCrLf & "	}catch(exception){" & _
						vbCrLf & "		alert('" & strTxtErrorInsertingObject & "');" & _
						vbCrLf & "		editor.contentWindow.focus();" & _
						vbCrLf & "	}")
		
		'Else this is IE so it's simpler to place in the table
		Else
			Response.Write(vbCrLf & vbCrLf & "	try{" & _
					vbCrLf & "		editor.contentWindow.focus();" & _
					vbCrLf & "		editor.contentWindow.document.selection.createRange().pasteHTML(table.outerHTML);" & _
					vbCrLf & "	}catch(exception){" & _
					vbCrLf & "		alert('" & strTxtErrorInsertingObject & "');" & _
					vbCrLf & "		editor.contentWindow.focus();" & _
					vbCrLf & "	}")
		End If
      
      	%>
      		
      		editor.contentWindow.focus();
      		window.close();
	}
	
<%	
	
	
	Response.Write("</script>")

End If

%>
<link href="/WebAdmin/Editor/RTE_configuration/default_style.css" rel="stylesheet" type="text/css" />
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" OnLoad="self.focus();">
<table width="100%"  border="0" cellpadding="3" cellspacing="0" bgcolor="<% = strRTEpopupTopRowColour %>">
<form method="post">
  <tr>
    <td bgcolor="<% = strRTEpopupTopRowColour %>" class="heading"><% = strTxtTableProperties %></td>
  </tr>
  <tr>
    <td bgcolor="<% = strRTEpopupCentreRowColour %>"><table width="100%" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr>
          <td colspan="2">
            <table width="100%" border="0" cellspacing="0" cellpadding="2">
              <tr>
                <td width="28%" align="right" class="text"><% = strTxtRows %>:</td>
                <td width="4%"><input name="rows" type="text" id="rows" value="2" size="2" maxlength="2" autocomplete="off" /></td>
                <td width="23%" align="right">&nbsp;</td>
                <td width="45%">&nbsp;</td>
              </tr>
              <tr>
                <td align="right" class="text"><% = strTxtColumns %>:</td>
                <td><input name="cols" type="text" id="cols" value="2" size="2" maxlength="2" autocomplete="off" /></td>
                <td align="right" class="text"><% = strTxtWidth %>:</td>
                <td><input name="width" type="text" id="width" value="100" size="3" maxlength="3" autocomplete="off" />
                    <select name="range" id="range">
                      <option value="%" selected>%</option>
                      <option><% = strTxtpixels %></option>
                    </select>
                </td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="50%">
            <table width="100%" border="0" cellspacing="0" cellpadding="2">
              <tr>
                <td class="text"><% = strTxtLayout %></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="right" class="text"><% = strTxtAlignment %>:</td>
                <td><select size="1" name="align" id="align">
                    <option value="" selected>Default</option>
                    <option value="left">Left</option>
                    <option value="center">Center</option>
                    <option value="right">Right</option>
                </select></td>
              </tr>
              <tr>
                <td align="right" class="text"><% = strTxtBorder %>
                  :</td>
                <td><input name="border" type="text" id="border" value="1" size="2" maxlength="2" autocomplete="off" /></td>
              </tr>
          </table></td>
          <td width="50%">
            <table width="100%" border="0" cellspacing="0" cellpadding="2">
              <tr>
                <td class="text"><% = strTxtSpacing %></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td width="50%" align="right" class="text"><% = strTxtCellPad %>
                  :</td>
                <td width="50%"><input name="pad" type="text" id="pad" value="1" size="2" maxlength="2" autocomplete="off" /></td>
              </tr>
              <tr>
                <td align="right" class="text"><% = strTxtCellSpace %>
                  :</td>
                <td>
                  <input name="space" type="text" id="space" value="1" size="2" maxlength="2" autocomplete="off" /></td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td align="right" bgcolor="<% = strRTEpopupBottomRowColour %>"><input type="hidden" name="postBack" value="true">
      <input type="submit" name="Submit" value="     <% = strTxtOK %>     ">&nbsp;<input type="button" name="cancel" value=" <% = strTxtCancel %> " onClick="window.close()">
<br /><br />
</td>
  </tr>
  </form>
</table>
</body>
</html>
