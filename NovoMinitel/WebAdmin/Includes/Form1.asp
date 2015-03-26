<!-- AspUpload Code samples: Form1.asp -->
<!-- Simple upload form -->
<!-- Copyright (c) 2001 Persits Software, Inc. -->
<!-- http://www.persits.com -->

<HTML> 
<BODY BGCOLOR="#FFFFFF">

<h3>Simple Upload</h3>

	<FORM METHOD="POST" ENCTYPE="multipart/form-data" ACTION="UploadScript1.asp"> 
		<INPUT TYPE="FILE" SIZE="40" NAME="FILE1"><BR> 
		<INPUT TYPE="FILE" SIZE="40" NAME="FILE2"><BR> 
		<INPUT TYPE="FILE" SIZE="40" NAME="FILE3"><BR> 
	<INPUT TYPE=SUBMIT VALUE="Upload!">
	</FORM>
</BODY> 
</HTML>