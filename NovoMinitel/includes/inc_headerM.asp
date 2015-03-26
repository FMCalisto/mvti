<style type="text/css">
<!--
h1 {
	font-family: Verdana, Geneva, sans-serif;
	font-size: 6px;
	color: #FFFFFF;
}
.links {
	font-family: "Arial";
	font-size: 11px;
	color: #666;
	font-weight: bold;
}
a.links:link {
	color: #666;
	text-decoration:none
}     /* unvisited link */
a.links:visited {
	color: #CCC;
	text-decoration:none
}  /* visited link */
a.links:hover {
	color: #666;
	text-decoration:underline
}   /* mouse over link */
a.links:active {
	color: #666;
	text-decoration: underline;
}   /* selected link */
#buttons {
	background-image: url(/images/header/back.gif);
	background-repeat: no-repeat;
}
-->
</style>
<script type="text/javascript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Minitel- Distribuição Informática e Electrónica aos melhores preços</title>
<link href="Minitel.css" rel="stylesheet" type="text/css" />
</head>

<body onLoad="MM_preloadImages('../images/header/bt01_f2.gif','../images/header/bt02_f2.gif','../images/header/bt03_f2.gif','../images/header/bt04_f2.gif','../images/header/bt05_f2.gif','../images/header/bt06_f2.gif','../images/header/bt07_f2.gif')">
<table width="1150" border="0" cellpadding="0" cellspacing="0" id="1" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><h1>Distribuidora  informatica, fornecedores informatica, produtos distribuidor, compras sites,  informatica computador, pre&ccedil;os inform&aacute;tica, em informatica</h1></td>
  </tr>
  <tr>
    <td colspan="2"><table width="1150" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="145" rowspan="2" align="left"><img src="/images/header/logo_minitel_28.png" width="200" height="75"></td>
        <td width="513" rowspan="2" align="center" >&nbsp;</td>
        <td width="162" align="left"><div align="center"><a href="/?OP=IV" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('bt07','','../images/header/bt07_f2.gif',1)"><img src="../images/header/bt07.gif" alt="International Visitors" name="bt07" width="162" height="39" usemap="#bt07Map" border="0"></a></div></td>
      </tr>
      <tr>
        <td><div align="justify">
          <p align="center"><a href="http://www.minitel.pt/?OP=LD"><img src="http://www.minitel.pt/images/Logotipos/facebook.png" width="53" height="49"  /></a> <a href="http://www.linkedin.com/company/minitel?trk=company_logo"><img src="/images/Logotipos/linkedin.png" width="51" height="51" /></a></p>
        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="785" align="right">
	<%If session("ComercialOn") or session("ClienteON") Then%>        
    <%if session("ComercialON")=True and session("ClienteON")=True then %>
    <span class="links">SIMULA&Ccedil;&Atilde;O : <%=trim(db.query(cstr("Select Nome From WN_Clientes where no=" & Session("no")))("Nome"))%>
    </span> | 
		<%End if%>
		<span class="links"><a href="/includes/DO_logout_run.asp" title="Terminar Sess&atilde;o" class="links" onClick="return confirm('Tem a certeza ?')">Terminar Sess&atilde;o</a></span>
<%Else%>
	<%End if%>
    </td>
    <td width="15" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="buttons">
      <tr valign="top">
        <td width="60" height="45"><a href="/" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('bt01','','../images/header/botao_paginainicial_amarelo.jpg',1)"><img src="../images/header/botao_paginaincial.jpg" alt="Página Inicial" name="bt01" width="168" height="45" border="0"></a></td>
        <td width="60"><a href="/?OP=QSN" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('bt02','','../images/header/botao_quemsomos_amarelo.jpg',1)"><img src="../images/header/botao_quemsomos.jpg" alt="Quem Somos" name="bt02" width="161" height="45" border="0"></a></td>
        <td width="115" height="45"><a href="/?OP=NVP" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('botao_novosparceiros.jpg','','../images/header/botao_novosparceiros_amarelo.jpg',1)"><img src="../images/header/botao_novosparceiros.jpg" alt="Novos Parceiros" name="botao_novosparceiros.jpg" width="161" height="45" border="0"></a></td>
        <td width="115" height="45"><a href="/?OP=CA" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('botao_carreiras.jpg','','../images/header/botao_carreiras_amarelo.jpg',1)"><img src="../images/header/botao_carreiras.jpg" alt="Carreira" name="botao_carreiras.jpg" width="161" height="45" border="0"></a></td>
<% //        <td width="115" height="45"><img src="../images/header/bt09.gif" width="115" height="45" alt="Carreiras"></td>%>
        <td width="135" height="45"><a href="/?OP=EV" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('botao_eventos.jpg','','../images/header/botao_eventos.jpg',1)"><img src="../images/header/botao_eventos.jpg" alt="Eventos" name="botao_eventos.jpg" width="161" height="45" border="0"></a></td>
        <td width="80" height="45"><a href="/?OP=AT" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('bt04','','../images/header/botao_servico_apoio_amarelo.jpg',1)"><img src="../images/header/botao_servico_apoio.jpg" alt="Assistência Técnica" name="bt04" width="187" height="45" border="0"></a></td>
    <td width="115" height="45"><%if session("ComercialON")=True then %>
              <a href="/?OP=LoginComercialOK" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('bt05','','../images/header/botao_meusclientes_amarelo.jpg',1)"><img src="../images/header/boato_meusclientes.jpg" alt="Meus Clientes" name="bt05" width="151" height="45" border="0"></a>
          <%End if%></td>
    <td width="120" height="45"><%if session("ClienteON")<>True then %>
              <a href="/" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('bt06','','../images/header/botao_arearevenda_amarelo.jpg',1)"><img src="../images/header/botao_arearevenda.jpg" alt="Área de Revenda" name="bt06" width="168" height="45" border="0"></a>
          <%End if%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="10" ></td>
  </tr>
</table>

<map name="bt07Map" id="bt07Map">
  <area shape="rect" coords="1,35,2,37" href="#" />
</map>
