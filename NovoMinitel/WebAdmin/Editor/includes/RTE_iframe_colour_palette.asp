<%
'****************************************************************************************
'**  Copyright Notice
'**
'**  Web Wiz Guide - Web Wiz Rich Text Editor
'**  http://www.richtexteditor.org
'**
'**  Copyright 2002-2005 Bruce Corkhill	All Rights Reserved.
'**
'**  This program is free software; you	can modify (at your own	risk) any part of it
'**  under the terms of	the License that accompanies this software and use it both
'**  privately and commercially.
'**
'**  All copyright notices must	remain in tacked in the	scripts	and the
'**  outputted HTML.
'**
'**  You may use parts of this program in your own private work, but you may NOT
'**  redistribute, repackage, or sell the whole	or any part of this program even
'**  if	it is modified or reverse engineered in	whole or in part without express
'**  permission	from the author.
'**
'**  You may not pass the whole	or any part of this application	off as your own	work.
'**
'**  All links to Web Wiz Guide	and powered by logo's must remain unchanged and	in place
'**  and must remain visible when the pages are	viewed unless permission is first granted
'**  by	the copyright holder.
'**
'**  This program is distributed in the	hope that it will be useful,
'**  but WITHOUT ANY WARRANTY; without even the	implied	warranty of
'**  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR ANY OTHER
'**  WARRANTIES	WHETHER	EXPRESSED OR IMPLIED.
'**
'**  You should	have received a	copy of	the License along with this program;
'**  if	not, write to:-	Web Wiz	Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom.
'**
'**
'**  No	official support is available for this program but you may post	support	questions at: -
'**  http://www.webwizguide.info/forum
'**
'**  Support questions are NOT answered	by e-mail ever!
'**
'**  For correspondence	or non support questions contact: -
'**  info@webwizguide.info
'**
'**  or	at: -
'**
'**  Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom
'**
'****************************************************************************************

Response.AddHeader "pragma","cache"
Response.AddHeader "cache-control","public"
Response.CacheControl =	"Public"

%>
<html>
<head>
<title>RTE Colour Pallete</title>
<%
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write("<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Application: Web Wiz Rich Text Editor" & _
vbCrLf & "Author: Bruce Corkhill" & _
vbCrLf & "Info: http://www.richtexteditor.org" & _
vbCrLf & "Available FREE: http://www.richtexteditor.org" & _
vbCrLf & "Copyright: Bruce Corkhill ©2001-2005. All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->")
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>
<script	language="javascript">
function InitColorPalette() {
	var tag	= document.getElementsByTagName('td');
	for (var i=0; i	< tag.length; i++) {
		tag[i].onmouseover = over;
		tag[i].onmouseout = out;
		tag[i].onclick = mouseClick;
	}
}

function over()	{
	if (this.id.length == 7){
		this.style.border='1px solid #FFFFFF';
	}
	document.getElementById("colPreview").style.backgroundColor = this.id;
	document.getElementById("hexColValue").value = this.id;
}

function out() {
	if (this.id.length == 7){
		this.style.border='1px solid #000000';
	}
}

function mouseClick() {
	self.parent.initialiseCommand(this.id);
}
</script>
<style type="text/css">
img {height: 1px; width: 1px;}
td { border: 1px solid;	color: #000000;	height:	11px; width: 11px;}
.grTd {	border:	1px solid; color: #CCCCCC;}
input {	border:	0px; background-color: #CCCCCC;	font-family: Verdana, Arial, Helvetica,	sans-serif; font-size: 11px; color: #000000;}
</style>
</head>
<body bgcolor="#CCCCCC"	leftmargin="1" topmargin="1" marginwidth="1" marginheight="1" onLoad="InitColorPalette()">
<table width="100%" border="0" cellpadding="0" cellspacing="2" bordercolor="#CCCCCC" bgcolor="#CCCCCC" style="none;">
 <tr>
  <td class="grTd"><div	style="background-color: #000000; padding: 1; height: 15px; width: 40px"><div id="colPreview" style="height: 100%; width: 100%"></div></div></td>
  <td class="grTd"><input type="text" id="hexColValue" value=""	size="10" style="cursor: default" /></td>
 </tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" bordercolor="#000000"	bgcolor="#000000" width="100%" height="84%">
 <tr><td id="#000000" bgcolor="#000000"><img></td><td id="#000000" bgcolor="#000000"><img></td><td id="#000000"	bgcolor="#000000"><img></td><td	id="#000000"	bgcolor="#000000"><img></td><td id="#003300" bgcolor="#003300"><img></td><td id="#006600" bgcolor="#006600"><img></td><td id="#009900"	bgcolor="#009900"><img></td><td	id="#00CC00"	bgcolor="#00CC00"><img></td><td id="#00FF00" bgcolor="#00FF00"><img></td><td id="#330000" bgcolor="#330000"><img></td><td id="#333300" bgcolor="#333300"><img></td><td id="#336600"	bgcolor="#336600"><img></td><td id="#339900" bgcolor="#339900"><img></td><td id="#33CC00" bgcolor="#33CC00"><img></td><td id="#33FF00"	bgcolor="#33FF00"><img></td><td	id="#660000"	bgcolor="#660000"><img></td><td id="#663300" bgcolor="#663300"><img></td><td id="#666600" bgcolor="#666600"><img></td><td id="#669900" bgcolor="#669900"><img></td><td id="#66CC00"	bgcolor="#66CC00"><img></td><td id="#66FF00" bgcolor="#66FF00"><img></td></tr>
 <tr><td id="#000000" bgcolor="#000000"><img></td><td id="#333333" bgcolor="#333333"><img></td><td id="#000000"	bgcolor="#000000"><img></td><td	id="#000033"	bgcolor="#000033"><img></td><td	id="#003333" bgcolor="#003333"><img></td><td id="#006633" bgcolor="#006633"><img></td><td id="#009933" bgcolor="#009933"><img></td><td id="#00CC33"	bgcolor="#00CC33"><img></td><td	id="#00FF33" bgcolor="#00FF33"><img></td><td id="#330033" bgcolor="#330033"><img></td><td id="#333333" bgcolor="#333333"><img></td><td id="#336633"	bgcolor="#336633"><img></td><td	id="#339933" bgcolor="#339933"><img></td><td id="#33CC33" bgcolor="#33CC33"><img></td><td id="#33FF33" bgcolor="#33FF33"><img></td><td id="#660033"	bgcolor="#660033"><img></td><td	id="#663333" bgcolor="#663333"><img></td><td id="#666633" bgcolor="#666633"><img></td><td id="#669933" bgcolor="#669933"><img></td><td id="#66CC33"	bgcolor="#66CC33"><img></td><td	id="#66FF33" bgcolor="#66FF33"><img></td></tr>
 <tr><td id="#000000" bgcolor="#000000"><img></td><td id="#666666" bgcolor="#666666"><img></td><td id="#000000"	bgcolor="#000000"><img></td><td	id="#000066"	bgcolor="#000066"><img></td><td	id="#003366" bgcolor="#003366"><img></td><td id="#006666" bgcolor="#006666"><img></td><td id="#009966" bgcolor="#009966"><img></td><td id="#00CC66"	bgcolor="#00CC66"><img></td><td	id="#00FF66" bgcolor="#00FF66"><img></td><td id="#330066" bgcolor="#330066"><img></td><td id="#333366" bgcolor="#333366"><img></td><td id="#336666"	bgcolor="#336666"><img></td><td	id="#339966" bgcolor="#339966"><img></td><td id="#33CC66" bgcolor="#33CC66"><img></td><td id="#33FF66" bgcolor="#33FF66"><img></td><td id="#660066"	bgcolor="#660066"><img></td><td	id="#663366" bgcolor="#663366"><img></td><td id="#666666" bgcolor="#666666"><img></td><td id="#669966" bgcolor="#669966"><img></td><td id="#66CC66"	bgcolor="#66CC66"><img></td><td	id="#66FF66" bgcolor="#66FF66"><img></td></tr>
 <tr><td id="#000000" bgcolor="#000000"><img></td><td id="#999999" bgcolor="#999999"><img></td><td id="#000000"	bgcolor="#000000"><img></td><td	id="#000099"	bgcolor="#000099"><img></td><td	id="#003399" bgcolor="#003399"><img></td><td id="#006699" bgcolor="#006699"><img></td><td id="#009999" bgcolor="#009999"><img></td><td id="#00CC99"	bgcolor="#00CC99"><img></td><td	id="#00FF99" bgcolor="#00FF99"><img></td><td id="#330099" bgcolor="#330099"><img></td><td id="#333399" bgcolor="#333399"><img></td><td id="#336699"	bgcolor="#336699"><img></td><td	id="#339999" bgcolor="#339999"><img></td><td id="#33CC99" bgcolor="#33CC99"><img></td><td id="#33FF99" bgcolor="#33FF99"><img></td><td id="#660099"	bgcolor="#660099"><img></td><td	id="#663399" bgcolor="#663399"><img></td><td id="#666699" bgcolor="#666699"><img></td><td id="#669999" bgcolor="#669999"><img></td><td id="#66CC99"	bgcolor="#66CC99"><img></td><td	id="#66FF99" bgcolor="#66FF99"><img></td></tr>
 <tr><td id="#000000" bgcolor="#000000"><img></td><td id="#CCCCCC" bgcolor="#CCCCCC"><img></td><td id="#000000"	bgcolor="#000000"><img></td><td	id="#0000CC"	bgcolor="#0000CC"><img></td><td	id="#0033CC" bgcolor="#0033CC"><img></td><td id="#0066CC" bgcolor="#0066CC"><img></td><td id="#0099CC" bgcolor="#0099CC"><img></td><td id="#00CCCC"	bgcolor="#00CCCC"><img></td><td	id="#00FFCC" bgcolor="#00FFCC"><img></td><td id="#3300CC" bgcolor="#3300CC"><img></td><td id="#3333CC" bgcolor="#3333CC"><img></td><td id="#3366CC"	bgcolor="#3366CC"><img></td><td	id="#3399CC" bgcolor="#3399CC"><img></td><td id="#33CCCC" bgcolor="#33CCCC"><img></td><td id="#33FFCC" bgcolor="#33FFCC"><img></td><td id="#6600CC"	bgcolor="#6600CC"><img></td><td	id="#6633CC" bgcolor="#6633CC"><img></td><td id="#6666CC" bgcolor="#6666CC"><img></td><td id="#6699CC" bgcolor="#6699CC"><img></td><td id="#66CCCC"	bgcolor="#66CCCC"><img></td><td	id="#66FFCC" bgcolor="#66FFCC"><img></td></tr>
 <tr><td id="#000000" bgcolor="#000000"><img></td><td id="#FFFFFF" bgcolor="#FFFFFF"><img></td><td id="#000000"	bgcolor="#000000"><img></td><td	id="#0000FF"	bgcolor="#0000FF"><img></td><td	id="#0033FF" bgcolor="#0033FF"><img></td><td id="#0066FF" bgcolor="#0066FF"><img></td><td id="#0099FF" bgcolor="#0099FF"><img></td><td id="#00CCFF"	bgcolor="#00CCFF"><img></td><td	id="#00FFFF" bgcolor="#00FFFF"><img></td><td id="#3300FF" bgcolor="#3300FF"><img></td><td id="#3333FF" bgcolor="#3333FF"><img></td><td id="#3366FF"	bgcolor="#3366FF"><img></td><td	id="#3399FF" bgcolor="#3399FF"><img></td><td id="#33CCFF" bgcolor="#33CCFF"><img></td><td id="#33FFFF" bgcolor="#33FFFF"><img></td><td id="#6600FF"	bgcolor="#6600FF"><img></td><td	id="#6633FF" bgcolor="#6633FF"><img></td><td id="#6666FF" bgcolor="#6666FF"><img></td><td id="#6699FF" bgcolor="#6699FF"><img></td><td id="#66CCFF"	bgcolor="#66CCFF"><img></td><td	id="#66FFFF" bgcolor="#66FFFF"><img></td></tr>
 <tr><td id="#000000" bgcolor="#000000"><img></td><td id="#FF0000" bgcolor="#FF0000"><img></td><td id="#000000"	bgcolor="#000000"><img></td><td	id="#990000"	bgcolor="#990000"><img></td><td	id="#993300" bgcolor="#993300"><img></td><td id="#996600" bgcolor="#996600"><img></td><td id="#999900" bgcolor="#999900"><img></td><td id="#99CC00"	bgcolor="#99CC00"><img></td><td	id="#99FF00" bgcolor="#99FF00"><img></td><td id="#CC0000" bgcolor="#CC0000"><img></td><td id="#CC3300" bgcolor="#CC3300"><img></td><td id="#CC6600"	bgcolor="#CC6600"><img></td><td	id="#CC9900" bgcolor="#CC9900"><img></td><td id="#CCCC00" bgcolor="#CCCC00"><img></td><td id="#CCFF00" bgcolor="#CCFF00"><img></td><td id="#FF0000"	bgcolor="#FF0000"><img></td><td	id="#FF3300" bgcolor="#FF3300"><img></td><td id="#FF6600" bgcolor="#FF6600"><img></td><td id="#FF9900" bgcolor="#FF9900"><img></td><td id="#FFCC00"	bgcolor="#FFCC00"><img></td><td	id="#FFFF00" bgcolor="#FFFF00"><img></td></tr>
 <tr><td id="#000000" bgcolor="#000000"><img></td><td id="#00FF00" bgcolor="#00FF00"><img></td><td id="#000000"	bgcolor="#000000"><img></td><td	id="#990033"	bgcolor="#990033"><img></td><td	id="#993333" bgcolor="#993333"><img></td><td id="#996633" bgcolor="#996633"><img></td><td id="#999933" bgcolor="#999933"><img></td><td id="#99CC33"	bgcolor="#99CC33"><img></td><td	id="#99FF33" bgcolor="#99FF33"><img></td><td id="#CC0033" bgcolor="#CC0033"><img></td><td id="#CC3333" bgcolor="#CC3333"><img></td><td id="#CC6633"	bgcolor="#CC6633"><img></td><td	id="#CC9933" bgcolor="#CC9933"><img></td><td id="#CCCC33" bgcolor="#CCCC33"><img></td><td id="#CCFF33" bgcolor="#CCFF33"><img></td><td id="#FF0033"	bgcolor="#FF0033"><img></td><td	id="#FF3333" bgcolor="#FF3333"><img></td><td id="#FF6633" bgcolor="#FF6633"><img></td><td id="#FF9933" bgcolor="#FF9933"><img></td><td id="#FFCC33"	bgcolor="#FFCC33"><img></td><td	id="#FFFF33" bgcolor="#FFFF33"><img></td></tr>
 <tr><td id="#000000" bgcolor="#000000"><img></td><td id="#0000FF" bgcolor="#0000FF"><img></td><td id="#000000"	bgcolor="#000000"><img></td><td	id="#990066"	bgcolor="#990066"><img></td><td	id="#993366" bgcolor="#993366"><img></td><td id="#996666" bgcolor="#996666"><img></td><td id="#999966" bgcolor="#999966"><img></td><td id="#99CC66"	bgcolor="#99CC66"><img></td><td	id="#99FF66" bgcolor="#99FF66"><img></td><td id="#CC0066" bgcolor="#CC0066"><img></td><td id="#CC3366" bgcolor="#CC3366"><img></td><td id="#CC6666"	bgcolor="#CC6666"><img></td><td	id="#CC9966" bgcolor="#CC9966"><img></td><td id="#CCCC66" bgcolor="#CCCC66"><img></td><td id="#CCFF66" bgcolor="#CCFF66"><img></td><td id="#FF0066"	bgcolor="#FF0066"><img></td><td	id="#FF3366" bgcolor="#FF3366"><img></td><td id="#FF6666" bgcolor="#FF6666"><img></td><td id="#FF9966" bgcolor="#FF9966"><img></td><td id="#FFCC66"	bgcolor="#FFCC66"><img></td><td	id="#FFFF66" bgcolor="#FFFF66"><img></td></tr>
 <tr><td id="#000000" bgcolor="#000000"><img></td><td id="#FFFF00" bgcolor="#FFFF00"><img></td><td id="#000000"	bgcolor="#000000"><img></td><td	id="#990099"	bgcolor="#990099"><img></td><td	id="#993399" bgcolor="#993399"><img></td><td id="#996699" bgcolor="#996699"><img></td><td id="#999999" bgcolor="#999999"><img></td><td id="#99CC99"	bgcolor="#99CC99"><img></td><td	id="#99FF99" bgcolor="#99FF99"><img></td><td id="#CC0099" bgcolor="#CC0099"><img></td><td id="#CC3399" bgcolor="#CC3399"><img></td><td id="#CC6699"	bgcolor="#CC6699"><img></td><td	id="#CC9999" bgcolor="#CC9999"><img></td><td id="#CCCC99" bgcolor="#CCCC99"><img></td><td id="#CCFF99" bgcolor="#CCFF99"><img></td><td id="#FF0099"	bgcolor="#FF0099"><img></td><td	id="#FF3399" bgcolor="#FF3399"><img></td><td id="#FF6699" bgcolor="#FF6699"><img></td><td id="#FF9999" bgcolor="#FF9999"><img></td><td id="#FFCC99"	bgcolor="#FFCC99"><img></td><td	id="#FFFF99" bgcolor="#FFFF99"><img></td></tr>
 <tr><td id="#000000" bgcolor="#000000"><img></td><td id="#00FFFF" bgcolor="#00FFFF"><img></td><td id="#000000"	bgcolor="#000000"><img></td><td	id="#9900CC"	bgcolor="#9900CC"><img></td><td	id="#9933CC" bgcolor="#9933CC"><img></td><td id="#9966CC" bgcolor="#9966CC"><img></td><td id="#9999CC" bgcolor="#9999CC"><img></td><td id="#99CCCC"	bgcolor="#99CCCC"><img></td><td	id="#99FFCC" bgcolor="#99FFCC"><img></td><td id="#CC00CC" bgcolor="#CC00CC"><img></td><td id="#CC33CC" bgcolor="#CC33CC"><img></td><td id="#CC66CC"	bgcolor="#CC66CC"><img></td><td	id="#CC99CC" bgcolor="#CC99CC"><img></td><td id="#CCCCCC" bgcolor="#CCCCCC"><img></td><td id="#CCFFCC" bgcolor="#CCFFCC"><img></td><td id="#FF00CC"	bgcolor="#FF00CC"><img></td><td	id="#FF33CC" bgcolor="#FF33CC"><img></td><td id="#FF66CC" bgcolor="#FF66CC"><img></td><td id="#FF99CC" bgcolor="#FF99CC"><img></td><td id="#FFCCCC"	bgcolor="#FFCCCC"><img></td><td	id="#FFFFCC" bgcolor="#FFFFCC"><img></td></tr>
 <tr><td id="#000000" bgcolor="#000000"><img></td><td id="#FF00FF" bgcolor="#FF00FF"><img></td><td id="#000000"	bgcolor="#000000"><img></td><td	id="#9900FF"	bgcolor="#9900FF"><img></td><td	id="#9933FF" bgcolor="#9933FF"><img></td><td id="#9966FF" bgcolor="#9966FF"><img></td><td id="#9999FF" bgcolor="#9999FF"><img></td><td id="#99CCFF"	bgcolor="#99CCFF"><img></td><td	id="#99FFFF" bgcolor="#99FFFF"><img></td><td id="#CC00FF" bgcolor="#CC00FF"><img></td><td id="#CC33FF" bgcolor="#CC33FF"><img></td><td id="#CC66FF"	bgcolor="#CC66FF"><img></td><td	id="#CC99FF" bgcolor="#CC99FF"><img></td><td id="#CCCCFF" bgcolor="#CCCCFF"><img></td><td id="#CCFFFF" bgcolor="#CCFFFF"><img></td><td id="#FF00FF"	bgcolor="#FF00FF"><img></td><td	id="#FF33FF" bgcolor="#FF33FF"><img></td><td id="#FF66FF" bgcolor="#FF66FF"><img></td><td id="#FF99FF" bgcolor="#FF99FF"><img></td><td id="#FFCCFF"	bgcolor="#FFCCFF"><img></td><td	id="#FFFFFF" bgcolor="#FFFFFF"><img></td></tr>
</table>
</body>
</html>