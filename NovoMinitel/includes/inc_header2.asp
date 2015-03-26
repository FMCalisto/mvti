
<link href="http://www.minitel.pt/includes/Minitel.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
h1 {
	font-family: Verdana, Geneva, sans-serif;
	font-size: 6px;
	color: #DFDFD0;
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
<body onLoad="MM_preloadImages('../images/header/bt01_f2.gif','../images/header/bt02_f2.gif','../images/header/bt03_f2.gif','../images/header/bt04_f2.gif','../images/header/bt05_f2.gif','../images/header/bt06_f2.gif','../images/header/bt07_f2.gif')"><table o width="800" border="0" cellpadding="0" cellspacing="0" id="main" bgcolor="#FFFFFF" >
  <tr>
    <td align="left" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="div">
      <tr align="left" valign="top">
        <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="top">
          <tr>
            <td rowspan="2"><img name="logo" src="../images/header/logo.gif" width="145" height="75" border="0" id="logo" alt="Minitel" /></td>
            <td width="493" height="75" rowspan="2"><img name="topbanner" src="../images/header/topbanner.gif" width="493" height="75" border="0" id="topbanner" alt="" /></td>
            <td><a href="/?OP=IV" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('bt07','','../images/header/bt07_f2.gif',1)"><img src="../images/header/bt07.gif" alt="International Visitors" name="bt07" width="162" height="39" border="0"></a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr align="right" valign="middle">
        <td><%If session("ComercialOn") or session("ClienteON") Then%>        
        <%if session("ComercialON")=True and session("ClienteON")=True then %> <span class="links">SIMULA&Ccedil;&Atilde;O : <%=trim(db.query(cstr("Select Nome From WN_Clientes where no=" & Session("no")))("Nome"))%></span> | 
		<%End if%>
		<span class="links"><a href="/includes/DO_logout_run.asp" title="Terminar Sess&atilde;o" onclick="return confirm('Tem a certeza ?')">Terminar Sess&atilde;o</a></span>
<%Else%>
		&nbsp;
	<%End if%>
    </p>
      </td>
        <td width="15">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" align="left" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="buttons">
          <tr align="left" valign="top">
            <td><a href="/" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('bt01','','../images/header/bt01_f2.gif',1)"><img src="../images/header/bt01.gif" alt="Página Inicial" name="bt01" width="120" height="45" border="0"></a></td>
            <td><a href="/?OP=QS" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('bt02','','../images/header/bt02_f2.gif',1)"><img src="../images/header/bt02.gif" alt="Quem Somos" name="bt02" width="115" height="45" border="0"></a></td>
            <td><a href="/?OP=NR" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('bt03','','../images/header/bt03_f2.gif',1)"><img src="../images/header/bt03.gif" alt="Novos Parceiros" name="bt03" width="115" height="45" border="0"></a></td>
            <td><a href="/?OP=AT" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('bt04','','../images/header/bt04_f2.gif',1)"><img src="../images/header/bt04.gif" alt="Assistência Técnica" name="bt04" width="135" height="45" border="0"></a></td>
            <td><img name="bt00" src="../images/header/bt00.gif" width="80" height="45" border="0" id="bt00"/></td>
            <td><%if session("ComercialON")=True then %>
              <a href="/?OP=LoginComercialOK" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('bt05','','../images/header/bt05_f2.gif',1)"><img src="../images/header/bt05.gif" alt="Meus Clientes" name="bt05" width="115" height="45" border="0"></a>
              <%End if%></td>
            <td><%if session("ClienteON")<>True then %>
              <a href="/" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('bt06','','../images/header/bt06_f2.gif',1)"><img src="../images/header/bt06.gif" alt="Área de Revenda" name="bt06" width="120" height="45" border="0"></a>
              <%End if%></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>

