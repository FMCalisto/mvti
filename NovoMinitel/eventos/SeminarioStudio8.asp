<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%If Session("LeuIntro")<>"OK" Then response.Redirect("/eventos.asp")%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Inscri&ccedil;&atilde;o para o Semin&aacute;rio Macromedia Studio 8</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../includes/Minitel.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<TABLE width="100%" border=0>
  <TBODY>
  <TR>
    <TD align=middle class="Zonas3"><FONT size=6>Seminário Macromedia Studio
        8</FONT></TD>
</TR></TBODY></TABLE><BR>
<FORM action="SeminarioRun.asp" method=post>
<TABLE borderColor=#eeeeee cellSpacing=0 borderColorDark=#eeeeee cellPadding=5 
width="100%" borderColorLight=#eeeeee border=1>
  <TBODY>
  <TR class="Titulos1">
    <TD align=middle colSpan=2><B class="Titulos1"><font size="4">Dados pessoais</font></B></TD>
  </TR>
  <TR class="Texto_Corrente">
    <TD colSpan=2><B>Quero participar no Seminário Macromedia Studio 8 em Lisboa
        dia 13/10/05: </B>
      <INPUT 
      type=checkbox value=1 name=Opcao1> 
    </TD>
	<TR class="Texto_Corrente">
    <TD colSpan=2><B>Quero participar no Seminário Macromedia Studio 8 no Porto dia
        18/10/05: </B>
      <INPUT 
      type=checkbox value=1 name=Opcao2> 
    </TD>
  </TR>
  <TR>
    <TD class="Titulos1Copy"><span class="Titulos1">Empresa :</span>      <INPUT name=Empresa class="Texto_Corrente" size=40> </TD>
     <TR>
    <TD class="Titulos1">Nome : 
      <INPUT name=Nome class="Texto_Corrente" size=40> </TD>
    <TD class="Titulos1Copy">Profissão : 
      <INPUT name=Profissao class="Texto_Corrente" size=40> </TD></TR>
  <TR class="Titulos1Copy">
    <TD colSpan=2>Morada : <INPUT name=Morada class="Texto_Corrente" size=80> </TD></TR>
  <TR>
    <TD class="Titulos1Copy">Localidade : 
      <INPUT name=Localidade class="Texto_Corrente" size=40> </TD>
    <TD class="Titulos1Copy">Código Postal : 
      <INPUT name=CodeP4 class="Texto_Corrente" size=4> 
      - <INPUT 
      name=CodeP3 class="Texto_Corrente" size=3> </TD></TR>
  <TR>
    <TD class="Titulos1Copy">Número de telefone : 
      <INPUT name=Telefone class="Texto_Corrente" size=13> </TD>
    <TD class="Titulos1Copy">Número de fax : 
      <INPUT name=Fax class="Texto_Corrente" size=13> </TD></TR>
  <TR class="Titulos1">
    <TD colSpan=2>E-Mail : <INPUT name=Email class="Texto_Corrente" size=40> </TD></TR>
  <TR class="Zonas4">
    </TR>
  <TR>
  <TD align=middle 
    colSpan=2><INPUT type=submit class="Titulos1" value="Submeter inscrição"></TD></TR></TBODY></TABLE><INPUT 
type="hidden" value="SiteMinitel" name="Extra0">
  <input type=hidden value="Studio8" name="Titulo">
</FORM></BODY></HTML>
