<!--#include Virtual="/WebAdmin/Editor/RTE_configuration/browser_page_encoding_inc.asp" -->
<%
Dim MenuX(1,2)

MenuX(1,1)="Grava as alterções"
MenuX(1,2)="Graba las alteraciones"

%>

<body bgcolor="#FFFFFF" text="#000000" OnLoad="initialiseWebWizRTE();">
 <div align="center" class="heading">
  <br />
  <br />
  <table width="650"  border="0" cellpadding="1" cellspacing="1" bgcolor="#666666">
  <tr>
    <td align="center" bgcolor="E6E7F2">     
      <form name="myForm" method="post" action="/WebAdmin/Editor/display_form_submission.asp">
		<%
		Dim strFormName
		Dim strTextAreaName
		strFormName = "myForm"
		strTextAreaName = "myTextarea"
		%>
		<!--#include Virtual="/WebAdmin/Editor/RTE_editor_inc.asp" -->
        <textarea name="textarea" cols="80" rows="15" id="myTextarea">
			<%=DescricaoDoProduto%>
		</textarea>
        <br />
        <br />
		<input type="hidden" name="referencia" value="<%=Referencia%>">
        <input type="submit" name="Submit" value="<%=MenuX(1,Session("Lingua"))%>">
        <br />
      </form>
   </td>
  </tr>
</table>
</div>
