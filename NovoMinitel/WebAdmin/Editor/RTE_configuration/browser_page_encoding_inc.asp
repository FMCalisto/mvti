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



'Uncomment the character set you require 
'(uncomment means remove the (') single quote from infront of the line)

'Western European ISO
Const strPageEncoding = "iso-8859-1"

'Unicode UTF-8
'Const strPageEncoding = "utf-8"

'Arabic ISO
'Const strPageEncoding = "iso-8859-6"

'Arabic Windows
'Const strPageEncoding = "windows-1256"

'Baltic Windows
'Const strPageEncoding = "windows-1257"

'Central European DOS
'Const strPageEncoding = "ibm852"

'Central European ISO
'Const strPageEncoding = "iso-8859-2"

'Central European Windows
'Const strPageEncoding = "windows-1250"

'Chinese Simplified
'Const strPageEncoding = "gb2312"

'Chinese Simplified
'Const strPageEncoding = "hz-gb-2312"

'Chinese Traditional
'Const strPageEncoding = "big5"

'Cyrillic ISO
'Const strPageEncoding = "iso-8859-5"

'Cyrillic KOI8-R
'Const strPageEncoding = "koi8-r"

'Cyrillic KOI8-U
'Const strPageEncoding = "koi8-ru"

'Cyrillic Windows
'Const strPageEncoding = "windows-1251"

'Greek ISO
'Const strPageEncoding = "iso-8859-7"

'Greek Windows
'Const strPageEncoding = "windows-1253"

'Hebrew ISO-Logical
'Const strPageEncoding = "iso-8859-8-i"

'Hebrew ISO-Visual
'Const strPageEncoding = "iso-8859-8"

'Hebrew Windows
'Const strPageEncoding = "windows-1255"

'Japanese EUC
'Const strPageEncoding = "euc-jp"

'Japanese Shift-JIS
'Const strPageEncoding = "shift-jis"

'Korean
'Const strPageEncoding = "euc-kr"

'Thai Windows
'Const strPageEncoding = "windows-874"

'Turkish ISO
'Const strPageEncoding = "iso-8859-9"

'Vietnamese
'Const strPageEncoding = "windows-1258"

'Write the page encoding meta tage
Response.Write("<meta http-equiv=""Content-Type"" content=""text/html; charset=" & strPageEncoding & """>")

%>