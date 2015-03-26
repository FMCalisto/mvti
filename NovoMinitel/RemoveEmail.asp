<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE VIRTUAL="/includes/OpenCon.asp"-->
<!--#INCLUDE VIRTUAL="/includes/FuncoesCOMBO.asp"-->
<!--#INCLUDE VIRTUAL="/includes/FuncoesMENU.asp"-->
<!--#INCLUDE VIRTUAL="/includes/FuncoesGenericas.asp"-->
<%Call GravaEvento("RemoveEmail")%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><%=Titulo(1)%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META NAME="creationdate" CONTENT="Janeiro 2005">
<META NAME="webmaster" CONTENT="Rui Fernandes, rui.fernandes@minitel.pt">
<META NAME="Author" CONTENT="Rui Fernandes (rui.fernandes@minitel.pt)">
<META NAME="Description" CONTENT="Minitel - Sociedade de Fomento de Aplicações Informáticas, L.da.">
<META NAME="keywords" CONTENT="Archos,Belkin,Dazzle,Freecom,Hauppauge,Intec,Macromedia,McAfee,Microtek,Plawa,Quark,Scansoft,Seiko,Shopfactory,Sonnet,Symantec,TechnoDesign,Topcom,Umax,Wacom">
<link href="/includes/Minitel.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	color: #666666;
	font-weight: bold;
}
-->
</style>
</head>
<body topmargin="0" leftmargin="0">
<table border="0" cellpadding="0" cellspacing="0" width="800" height="600">
	<tr>
	  <td width="600" height="100" colspan="2"><div align="center"><!--#INCLUDE VIRTUAL="/includes/inc_banner.asp"--></div></td>
	</tr>
	<tr>
	  <td width="150" height="500" valign="top" bgcolor="#E8E8E8">
	  	<table width="150" border="0" cellpadding="0" cellspacing="0" bgcolor="#E8E8E8">
			<!--#INCLUDE VIRTUAL="/includes/inc_gera_menus.asp"-->
	    </table>
	  </td>
	<form action="RemoveMailRUN.Asp" method="post" name="RemoveMailFORM">
	  <td width="450" height="500" align="center"><div align="center">
	    <p class="style1"> Introduza o e-mail que pretende remover </p>
				<p>&nbsp;</p>
				<p><span class="Texto_Corrente">Seu endereço de e-mail : </span>			  
			        <input name="endereco" type="text" class="ComboBOX" maxlength="50">
                    <input name="submit" type="submit" value="Submeter pedido">				
                  <br>
		                    </p>
	  </div>
 	  </td>
	</form>
	</tr>
</table>
</body>
</html>
<!--#INCLUDE VIRTUAL="/includes/CloseCon.asp"-->