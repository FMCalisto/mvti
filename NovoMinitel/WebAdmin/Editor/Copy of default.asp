<html>
<head>
<title>Web Wiz Rich Text Editor</title>
<!--#include file="RTE_configuration/browser_page_encoding_inc.asp" -->

<!--//
/* *******************************************************
Application: Web Wiz Rich Text Editor
Author: Bruce Corkhill
Info: http://www.richtexteditor.org
Available FREE: http://www.richtexteditor.org
Copyright: Bruce Corkhill ©2002-2005
******************************************************* */
//-->

<meta name="description" content="Web Wiz Rich Text Editor, free WYSIWYG Eeditor for replacement of HTML text areas.">
</head>

<body bgcolor="#FFFFFF" text="#000000" OnLoad="initialiseWebWizRTE();">
 
 <div align="center" class="heading"><strong>Web Wiz Rich Text Editor</strong>
  <br />
  <br />
  <table width="680"  border="0" cellpadding="1" cellspacing="1" bgcolor="#666666">
  <tr>
    <td align="center" bgcolor="E6E7F2">     
     
     
     
      <form name="myForm" method="post" action="display_form_submission.asp">
      
      
      
<%
'----------------------------------------------------------------------------------------------

'The following onload event needs to be placed into the body tag for the web page you
'are placing the RTE into to initialise the Javascript for the Web Wiz Rich Text Editor (RTE):-

'OnLoad="initialiseWebWizRTE();"


'The following needs to be placed on the line above the textarea that you wish to be 
'replaced with the Web Wiz Rich Text Editor (RTE).

'----------------------------------------------------------------------------------------------


Dim strFormName
Dim strTextAreaName

'Edit the intilised variables below to put in the name of your textrea's ID and the name
'of the form the textarea is within

'Name of the HTML form the textarea is within
strFormName = "myForm"

'ID tag name of HTML textarea being replaced
strTextAreaName = "myTextarea"

'----------------------------------------------------------------------------------------------

%>
<!-- include the Web Wiz Rich Text Editor -->
<!--#include file="RTE_editor_inc.asp" -->
        <textarea name="textarea" cols="80" rows="15" id="myTextarea">
			<P align="center">CENTRADO</P>
			<P align="LEFT">LEFT</P>
			<P align="RIGHT">RIGHT</P>
		</textarea>
        <br />
        <br />
        <input type="submit" name="Submit" value="Submit Form">
        <input name="reset" type="reset" value="Reset Form">
        <br />
      </form>
   </td>
  </tr>
</table>
<%

'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
If blnAbout Then
	Response.Write("<br /><span class=""text"" style=""font-size:10px"">Powered by <a href=""http://www.richtexteditor.org"" target=""_blank"" style=""font-size:10px"">Web Wiz Rich Text Editor</a> version " & strRTEversion)
	Response.Write("<br />Copyright &copy;2002-2005 <a href=""http://www.webwizguide.info"" target=""_blank"" style=""font-size:10px"">Web Wiz Guide</a></span>")
End If 
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******

%>
</div>
</body>
</html>
