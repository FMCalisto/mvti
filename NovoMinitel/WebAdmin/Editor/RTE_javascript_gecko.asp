<% @ Language=VBScript %>
<% Option Explicit %>
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



'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write(vbCrLf & "<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Application: Web Wiz Rich Text Editor " & _
vbCrLf & "Author: Bruce Corkhill" & _
vbCrLf & "Info: http://www.richtexteditor.org" & _
vbCrLf & "Available FREE: http://www.richtexteditor.org" & _
vbCrLf & "Copyright: Bruce Corkhill ©2001-2005. All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->")
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******


'*************************************************
'*** JavaScript inserting element in Mozilla *****
'*************************************************

	%>
//Function to insert element in required position
function insertElementPosition(docWindow, insertElement){

      	var area = docWindow.getSelection();
      	var range = area.getRangeAt(0);
      	var editorPosition = range.startContainer;
      	var pos = range.startOffset;

      	area.removeAllRanges();
      	range.deleteContents();
      	range = document.createRange();

	if (editorPosition.nodeType==3 && insertElement.nodeType==3) {
	        	editorPosition.insertData(pos, insertElement.nodeValue);
	        	range.setEnd(editorPosition, pos + insertElement.length);
	        	range.setStart(editorPosition, pos + insertElement.length);

	}else{
	        	var afterElement;
	        	if (editorPosition.nodeType==3){

	          		var textElement = editorPosition;
	          		var text = textElement.nodeValue;
	          		var textBefore = text.substr(0,pos);
	          		var textAfter = text.substr(pos);
	          		var beforeNode = document.createTextNode(textBefore);
	          		var afterElement = document.createTextNode(textAfter);

				editorPosition = textElement.parentNode;
	          		editorPosition.insertBefore(afterElement, textElement);
	          		editorPosition.insertBefore(insertElement, afterElement);
	          		editorPosition.insertBefore(beforeNode, insertElement);
	          		editorPosition.removeChild(textElement);
	        	}else{
	          		afterElement = editorPosition.childNodes[pos];
	          		editorPosition.insertBefore(insertElement, afterElement);
	        	}
	        	range.setEnd(afterElement, 0);
	        	try{range.setStart(afterElement, 0);}catch(exception){}

      	}
      	area.removeAllRanges();
      	area.addRange(range);
}