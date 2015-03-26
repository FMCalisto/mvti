<%
'****************************************************************************************
'**  Copyright Notice    
'**
'**  Web Wiz Guide - Web Wiz Forums
'**                                                              
'**  Copyright 2001-2005 Bruce Corkhill All Rights Reserved.                                
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


'Dimension variables
Dim saryEmoticons(36,3)	 'If you add more emoticons increase the first number to the number of emoticons you have in the array below


saryEmoticons(1,1) = "Smile"			'Emoticon Name
saryEmoticons(1,2) = "[:)]"			'Forum code
saryEmoticons(1,3) = "images/smiley1.gif"	'URL/path to smiley

saryEmoticons(2,1) = "Tongue"
saryEmoticons(2,2) = "[:P]"
saryEmoticons(2,3) = "images/smiley17.gif"

saryEmoticons(3,1) = "Wink"
saryEmoticons(3,2) = "[;)]"
saryEmoticons(3,3) = "images/smiley2.gif"

saryEmoticons(4,1) = "Cry"
saryEmoticons(4,2) = "[:^(]"
saryEmoticons(4,3) = "images/smiley19.gif"

saryEmoticons(5,1) = "Big smile"
saryEmoticons(5,2) = "[:D]"
saryEmoticons(5,3) = "images/smiley4.gif"

saryEmoticons(6,1) = "LOL"
saryEmoticons(6,2) = "[LOL]"
saryEmoticons(6,3) = "images/smiley36.gif"

saryEmoticons(7,1) = "Dead"
saryEmoticons(7,2) = "[xx(]"
saryEmoticons(7,3) = "images/smiley11.gif"

saryEmoticons(8,1) = "Embarrassed"
saryEmoticons(8,2) = "[:$]"
saryEmoticons(8,3) = "images/smiley9.gif"

saryEmoticons(9,1) = "Confused"
saryEmoticons(9,2) = "[:s]"
saryEmoticons(9,3) = "images/smiley5.gif"

saryEmoticons(10,1) = "Clap"
saryEmoticons(10,2) = "[=D&gt;]"
saryEmoticons(10,3) = "images/smiley32.gif"

saryEmoticons(11,1) = "Angry"
saryEmoticons(11,2) = "[:x]"
saryEmoticons(11,3) = "images/smiley7.gif"

saryEmoticons(12,1) = "Ouch"
saryEmoticons(12,2) = "[8(]"
saryEmoticons(12,3) = "images/smiley18.gif"

saryEmoticons(13,1) = "Star"
saryEmoticons(13,2) = "[:*:]"
saryEmoticons(13,3) = "images/smiley10.gif"

saryEmoticons(14,1) = "Shocked"
saryEmoticons(14,2) = "[:o]"
saryEmoticons(14,3) = "images/smiley3.gif"

saryEmoticons(15,1) = "Sleepy"
saryEmoticons(15,2) = "[|)]"
saryEmoticons(15,3) = "images/smiley12.gif"

saryEmoticons(16,1) = "Unhappy"
saryEmoticons(16,2) = "[:(]"
saryEmoticons(16,3) = "images/smiley6.gif"

saryEmoticons(17,1) = "Approve"
saryEmoticons(17,2) = "[:^:]"
saryEmoticons(17,3) = "images/smiley14.gif"

saryEmoticons(18,1) = "Cool"
saryEmoticons(18,2) = "[8D]"
saryEmoticons(18,3) = "images/smiley16.gif"

saryEmoticons(19,1) = "Clown"
saryEmoticons(19,2) = "[:o)]"
saryEmoticons(19,3) = "images/smiley8.gif"

saryEmoticons(20,1) = "Evil Smile"
saryEmoticons(20,2) = "[}:)]"
saryEmoticons(20,3) = "images/smiley15.gif"

saryEmoticons(21,1) = "Disapprove"
saryEmoticons(21,2) = "[:V:]"
saryEmoticons(21,3) = "images/smiley13.gif"

saryEmoticons(22,1) = "Stern Smile"
saryEmoticons(22,2) = "[:|]"
saryEmoticons(22,3) = "images/smiley22.gif"

saryEmoticons(23,1) = "Thumbs Up"
saryEmoticons(23,2) = "[:Y:]"
saryEmoticons(23,3) = "images/smiley20.gif"

saryEmoticons(24,1) = "Thumbs Down"
saryEmoticons(24,2) = "[:N:]"
saryEmoticons(24,3) = "images/smiley21.gif"

saryEmoticons(25,1) = "Geek"
saryEmoticons(25,2) = "[:-B]"
saryEmoticons(25,3) = "images/smiley23.gif"

saryEmoticons(26,1) = "Ermm"
saryEmoticons(26,2) = "[:[]"
saryEmoticons(26,3) = "images/smiley24.gif"

saryEmoticons(27,1) = "Question"
saryEmoticons(27,2) = "[:?:]"
saryEmoticons(27,3) = "images/smiley25.gif"

saryEmoticons(28,1) = "Pinch"
saryEmoticons(28,2) = "[&gt;&lt;]"
saryEmoticons(28,3) = "images/smiley26.gif"

saryEmoticons(29,1) = "Heart"
saryEmoticons(29,2) = "[L]"
saryEmoticons(29,3) = "images/smiley27.gif"

saryEmoticons(30,1) = "Broken Heart"
saryEmoticons(30,2) = "[%(]"
saryEmoticons(30,3) = "images/smiley28.gif"

saryEmoticons(31,1) = "Wacko"
saryEmoticons(31,2) = "[8-}]"
saryEmoticons(31,3) = "images/smiley29.gif"

saryEmoticons(32,1) = "Pig"
saryEmoticons(32,2) = "[:@)]"
saryEmoticons(32,3) = "images/smiley30.gif"

saryEmoticons(33,1) = "Hug"
saryEmoticons(33,2) = "[&gt;:D&lt;]"
saryEmoticons(33,3) = "images/smiley31.gif"

saryEmoticons(34,1) = "Censored"
saryEmoticons(34,2) = "[XXX]"
saryEmoticons(34,3) = "images/smiley35.gif"

saryEmoticons(35,1) = "Ying Yang"
saryEmoticons(35,2) = "[%]"
saryEmoticons(35,3) = "images/smiley33.gif"

saryEmoticons(36,1) = "Nuke"
saryEmoticons(36,2) = "[!]"
saryEmoticons(36,3) = "images/smiley34.gif"



'If you add more emoticons don't forget to increase the number in the Dim statement at the top!
%>