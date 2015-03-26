<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE VIRTUAL="/includes/OpenCon.asp"-->
<!--#INCLUDE VIRTUAL="/includes/FuncoesGenericas.asp"-->
<%Call GravaEvento("WacomRui")%>
<%
If Request.QueryString("Link")<>"" Then
	ConnObj.execute ("web.SPLogWacomPartner '" & Request.QueryString("Link") & "'" )
End if
%>
<!--#INCLUDE VIRTUAL="/includes/CloseCon.asp"-->
<%If instr(Request.QueryString("Link"),"@")=0 and trim(Request.QueryString("Link"))<>"" Then%>
<script language="JavaScript" type="text/JavaScript">
  myWin=open("http://<%=Request.QueryString("Link")%>","","");
</script>
<%end if%>
<%If instr(Request.QueryString("Link"),"@")>0 and trim(Request.QueryString("Link"))<>"" Then%>
<script language="JavaScript" type="text/JavaScript">
  myWin=open("mailto:<%=Request.QueryString("Link")%>","","");
</script>
<%end if%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Onde comprar Wacom</title>
<style type="text/css">
<!--
body {
	background-image: url(../Quark/Images/fundo.gif);
}
a:link {
	color: #0099CC;
	text-decoration: none;
}
body,td,th {
	font-family: trebuchet MS;
	font-size: 11px;
	color: #666666;
}
a:hover {
	color: #999999;
	text-decoration: underline;
}
a:visited {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
.style1 {
	color: #FF9900;
	font-weight: bold;
}
.style2 {color: #0099CC}
-->
</style></head>

<body>
<div align="center">
  <table width="800" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <!--DWLayoutTable-->
    <tr>
      <td height="80" colspan="3" valign="top"><img src="Images/header_new.jpg" width="800" height="100" /></td>
    </tr>
    <tr>
      <td width="10" height="45">&nbsp;</td>
      <td width="779">&nbsp;</td>
      <td width="11">&nbsp;</td>
    </tr>
    <tr>
      <td height="112">&nbsp;</td>
      <td align="left" valign="top"><p><span class="style1">Parceiros Premium Wacom </span><br />
        A Minitel desenvolveu uma rede de revendedores autorizados que lhe oferecem a   garantia de poder testar pessoalmente uma Wacom. Ao visitar um destes   revendedores autorizados, possui a garantia que disp&otilde;e da linha de produtos   Wacom em stock e preparados para serem testados imediatamente. <br />
        Esta   categoria de revendedores, possuem conhecimentos t&eacute;cnicos e pr&aacute;ticos que lhe   permitem esclarecer as suas d&uacute;vidas imediatamente.<br />
      </p></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="402"></td>
      <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr>
          <td width="779" height="4"></td>
          </tr>
        <tr>
          <td height="390" valign="top"><table cellspacing="0" cellpadding="0">
            <!--DWLayoutTable-->
            <col width="194" />
            <col width="432" />
            <col width="98" />
            <col width="215" />
            <col width="161" />
            <tr height="17">
              <td width="110" height="17" align="center" valign="middle"><p><span class="style1">Empresa&nbsp;</span>&nbsp;<br />
                <br />
                </p>                </td>
                  <td width="219" align="center" valign="top"><span class="style1">Morada&nbsp;</span><br />
                  <br /></td>
                  <td width="96" align="center" class="style1">Telefone</td>
                  <td width="173" align="center" class="style1">Mail&nbsp;</td>
                  <td width="144" align="center" class="style1">Site&nbsp;</td>
                  <td width="35"></td>
                </tr>
            <tr height="17">
              <td height="32" align="left" valign="middle" bgcolor="#F0F0F0"><div align="center"><strong>Vida Portatil 
&nbsp;</strong></div></td>
                  <td align="center" valign="top" bgcolor="#F0F0F0">Edif&iacute;cio Amoreiras Square<br />
                    Rua Joshua Benoliel, 1 E e F</td>
                  <td height="17" align="center" valign="middle" bgcolor="#F0F0F0">213 849 4 80</td>
                  <td height="17" align="center" valign="middle" bgcolor="#F0F0F0"><a href="mailto:geral@vidaportatil.com">geral@vidaportatil.com&nbsp;</a></td>
                  <td height="17" align="center" valign="middle" bgcolor="#F0F0F0"><a href="http://www.vidaportatil.pt">www.vidaportatil.pt</a></td>
                  <td height="17"></td>
                </tr>
                            <tr height="17">
              <td height="17"></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
            <tr height="17">
              <td height="17" valign="middle"><div align="center"><strong>MacService</strong></div></td>
                  <td align="center" valign="middle">Rua Lu&iacute;s Ant&oacute;nio Correia, 70&nbsp;<br />
4710-184 Braga</td>
                  <td height="17" align="center" valign="middle">253 678 646</td>
                  <td height="17" align="center" valign="middle"><a href="mailto:macservice@macservice.pt">macservice@macservice.pt</a></td>
                  <td height="17" align="center" valign="middle"><a href="http://www.macservice.pt">www.macservice.pt</a></td>
                  <td height="17"></td>
                </tr>
                
            <tr height="17">
              <td height="17"></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
            <tr height="17">
              <td height="32" valign="middle" bgcolor="#F0F0F0"><div align="center"><strong>Colorfoto</strong></div></td>
                  <td align="center" valign="top" bgcolor="#F0F0F0">Pra&ccedil;a de Alvalade n&ordm;2 D<br />
                  1700-035 Lisboa</td>
                  <td height="17" align="center" valign="middle" bgcolor="#F0F0F0">317 932 475</td>
                  <td height="17" align="center" valign="middle" bgcolor="#F0F0F0"><!--DWLayoutEmptyCell-->&nbsp;</td>
                  <td height="17" align="center" valign="middle" bgcolor="#F0F0F0"><a href="http://www.colorfoto.pt">www.colorfoto.pt</a></td>
                  <td height="17"></td>
                </tr>
            <tr height="17">
              <td height="23" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
            <tr height="17">
              <td height="32" valign="middle"><div align="center"><strong>MultipleZones</strong></div></td>
                  <td align="center" valign="top"><p>Travessa L&eacute;gua da P&oacute;voa, 1A <br />
1250-136 Lisboa</p>
                  </td>
                  <td align="center" valign="middle">213 810 990</td>
                  <td align="center" valign="middle"><a href="mailto:jose.oliveira@mzp.pt">jose.oliveira@mzp.pt</a><a href="mailto:geral@iberdigital.pt"></a></td>
                  <td align="center" valign="middle"><a href="http://www.mzp.pt">www.mzp.pt</a><a href="http://www.iberdigital.pt" title="http://www.iberdigital.pt"></a></td>
                  <td></td>
                </tr>
            <tr height="17">
              <td height="19">&nbsp;</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
            <tr height="17">
              <td height="32" valign="middle" bgcolor="#F0F0F0"><div align="center"><strong>Distriloc</strong></div></td>
                  <td valign="top" bgcolor="#F0F0F0"><div align="center">Rua dos Lusiadas N&ordm;6 B<br />
                  1300-370 Lisboa</div></td>
                  <td align="center" valign="middle" bgcolor="#F0F0F0">213 158 954</td>
                  <td valign="middle" bgcolor="#F0F0F0"><div align="center"><a href="mailto:encomendas@distriloc.pt">encomendas@distriloc.pt</a></div></td>
                  <td align="center" valign="middle" bgcolor="#F0F0F0"><a href="http://www.distriloc.pt">www.</a><a href="http://www.distriloc.pt">distriloc.pt</a></td>
                  <td></td>
                </tr>
            <tr height="17">
              <td height="27">&nbsp;</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
            <tr height="17">
              <td height="40" valign="middle" bgcolor="#F0F0F0"><div align="center"><strong>Trigenius</strong></div></td>
                  <td align="center" valign="middle" bgcolor="#F0F0F0"><p>Av Beato Nuno - Ed. Anjo de Portugal, <br />
                  Loja 10BM - 2495-401 F&aacute;tima</p></td>
                  <td align="center" valign="middle" bgcolor="#F0F0F0">249 530 800</td>
                  <td align="center" valign="middle" bgcolor="#F0F0F0"><a href="mailto:comercial@trigenius.pt">comercial@trigenius.pt</a></td>
                  <td align="center" valign="middle" bgcolor="#F0F0F0"><a href="www.trigenius.pt">www.</a><a href="http://www.trigenius.pt">trigenius.pt</a></td>
                  <td></td>
                </tr>
            <tr height="17">
              <td height="27">&nbsp;</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
            <tr height="17">
              <td height="30" align="center" valign="middle"><span lang="pt" xml:lang="pt"><strong>M.V.G.</strong>&nbsp;</span></td>
              <td valign="top"><p align="center"><span lang="pt" xml:lang="pt">Rua dos Pinheiros, Lote 7 - Loja A/B<br />
              2750-606 Cascais</span><span lang="pt" xml:lang="pt"></span></p>
                </td>
              <td align="center" valign="middle"><span lang="pt" xml:lang="pt">214 849 400</span></td>
              <td align="center" valign="middle"><span lang="pt" xml:lang="pt"><a href="mailto:global@medialogeuropa.com">global@medialogeuropa.com</a></span></td>
              <td align="center" valign="middle"><a href="http://www.medialog.pt"><span class="style2">www.medialog.pt</span></a></td>
              <td></td>
              </tr>
                          <tr height="17">
              <td height="27">&nbsp;</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
          </table></td>
          </tr>
      </table></td>
      <td></td>
    </tr>
    <tr>
      <td height="30" colspan="3" valign="top"><img src="../Quark/Images/barra_fundo.jpg" width="800" height="29" /></td>
    </tr>
  </table>
</div>
</body>
</html>
