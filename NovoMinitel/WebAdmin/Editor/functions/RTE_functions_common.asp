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






'********************************************
'***  Rich Text Compatible Browser type *****
'********************************************

Private Function RTEenabled()

	Dim strUserAgent	'Holds info on the users browser

	'Get the users HTTP user agent (web browser)
	strUserAgent = Request.ServerVariables("HTTP_USER_AGENT")


	'*************************************
	'***** Windows Internet Explorer *****
	'*************************************
	
	'See if the user agent is IE on Winows and not Opera trying to look like IE
	If InStr(1, strUserAgent, "MSIE", 1) > 0 AND InStr(1, strUserAgent, "Win", 1) > 0 AND InStr(1, strUserAgent, "Opera", 1) = 0 Then

		'Now we know this is Windows IE we need to see if the version number is 5.5
		If Trim(Mid(strUserAgent, inStr(1, strUserAgent, "MSIE", 1)+5, 3)) = "5.5" OR Trim(Mid(strUserAgent, inStr(1, strUserAgent, "MSIE", 1)+5, 3)) = "5,5" Then

			RTEenabled = "winIE"
		
		'Now we know this is Windows IE we need to see if the version number is 6 or above
		ElseIf CInt(Trim(Mid(strUserAgent, CInt(inStr(1, strUserAgent, "MSIE", 1)+5), 1))) >= 6 Then

			RTEenabled = "winIE"

		'Else the IE version is below 5 so return na
		Else

			RTEenabled = "false"
		End If
		
		
	'****************************
	'***** Mozilla Firebird *****
	'****************************
	
	'See if this is a version of Mozilla Firebird that supports Rich Text Editing under it's Midas API
	ElseIf inStr(1, strUserAgent, "Firebird", 1) Then
		
		'Now we know this is Mozilla Firebird we need to see if the version 0.6.1 or above; relase date is above 2003/07/28
		If CLng(Trim(Mid(strUserAgent, CInt(inStr(1, strUserAgent, "Gecko/", 1)+6), 8))) >= 20030728 Then

			RTEenabled = "Gecko"

		'Else the Mozilla Firebird version is below 1.5 so return false
		Else

			RTEenabled = "false"
		End If
	
	
	'**********************************************
	'***** Mozilla Firefox/Seamonkey/Netscape *****
	'**********************************************
	
	'See if this is a version of Mozilla/Netscape that supports Rich Text Editing under it's Midas API
	ElseIf inStr(1, strUserAgent, "Gecko", 1) > 0 AND inStr(1, strUserAgent, "Firebird", 1) = 0 AND isNumeric(Trim(Mid(strUserAgent, CInt(inStr(1, strUserAgent, "Gecko/", 1)+6), 8))) Then
		
		'Now we know this is Mozilla/Netscape we need to see if the version number is above 1.3 or above; relase date is above 2003/03/12
		If CLng(Trim(Mid(strUserAgent, CInt(inStr(1, strUserAgent, "Gecko/", 1)+6), 8))) => 20030312 Then

			RTEenabled = "Gecko"

		'Else the Mozilla version is below 1.3 or below 7.1 of Netscape so return false
		Else

			RTEenabled = "false"
		End If
	
	
	
	'***********************************
	'***** Non RTE Enabled Browser *****
	'***********************************
	
	'Else this is a browser that does not support Rich Text Editing
	Else
		'RTEenabled - false
		RTEenabled = "false"
	End If
	'RTEenabled = "false"
End Function





'******************************************
'***  	   Random Hex Generator        ****
'******************************************

Private Function hexValue(ByVal intHexLength)

	Dim intLoopCounter
	Dim strHexValue

	'Randomise the system timer
	Randomize Timer()

	'Generate a hex value
	For intLoopCounter = 1 to intHexLength

		'Genreate a radom decimal value form 0 to 15
		intHexLength = CInt(Rnd * 1000) Mod 16

		'Turn the number into a hex value
		Select Case intHexLength
			Case 1
				strHexValue = "1"
			Case 2
				strHexValue = "2"
			Case 3
				strHexValue = "3"
			Case 4
				strHexValue = "4"
			Case 5
				strHexValue = "5"
			Case 6
				strHexValue = "6"
			Case 7
				strHexValue = "7"
			Case 8
				strHexValue = "8"
			Case 9
				strHexValue = "9"
			Case 10
				strHexValue = "A"
			Case 11
				strHexValue = "B"
			Case 12
				strHexValue = "C"
			Case 13
				strHexValue = "D"
			Case 14
				strHexValue = "E"
			Case 15
				strHexValue = "F"
			Case Else
				strHexValue = "Z"
		End Select

		'Place the hex value into the return string
		hexValue = hexValue & strHexValue
	Next
End Function




'******************************************
'***  	   Unsafe character Strip      ****
'******************************************

'Function to strip non alphanumeric characters email addresses
Private Function characterStrip(ByVal strTextInput)

	'Dimension variable
	Dim intLoopCounter 	'Holds the loop counter
	
	'Loop through the ASCII characters
	For intLoopCounter = 0 to 31
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0) 
	Next
	
	'Loop through the ASCII characters
	For intLoopCounter = 33 to 37
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0) 
	Next
	
	'Loop through the ASCII characters
	For intLoopCounter = 39 to 44
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0) 
	Next
	
	'Loop through the ASCII characters
	For intLoopCounter = 58 to 65
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0) 
	Next
	
	'Loop through the ASCII characters numeric characters
	For intLoopCounter = 91 to 94
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0) 
	Next
	
	'Loop through the extended ASCII characters
	For intLoopCounter = 123 to 125
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0) 
	Next
	
	'Loop through the extended ASCII characters
	For intLoopCounter = 127 to 255
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0) 
	Next
	
	'Strip individul ASCII characters left out from above
	strTextInput = Replace(strTextInput, CHR(59), "", 1, -1, 0)
	strTextInput = Replace(strTextInput, CHR(60), "", 1, -1, 0)
	strTextInput = Replace(strTextInput, CHR(62), "", 1, -1, 0)
	strTextInput = Replace(strTextInput, CHR(96), "", 1, -1, 0)
	
	
	'Return the string
	characterStrip = strTextInput
	
End Function
%>