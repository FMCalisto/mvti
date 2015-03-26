<!-- AspUpload Code samples: UploadScript1.asp -->
<!-- Invoked by Form1.asp -->
<!-- Copyright (c) 2001 Persits Software, Inc. -->
<!-- http://www.persits.com -->

<HTML>
<BODY>

<%
Set Upload = Server.CreateObject("Persits.Upload")
Count = Upload.Save("c:\upload")

Response.Write Count & " file(s) uploaded to c:\upload"

%>

</BODY>
</HTML>
