<link href="Minitel.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<table width="200" cellpadding="0" cellspacing="0" border="0">
  
  <tr>
    <td height="25" valign="left" width="200" background="../images/Separador_Pesquisa.jpg" align="left" class="Titulo_branco">&nbsp;</td>
  </tr>
  <tr>
    <td height="10" ></td>
  </tr>
  <form id="PESQUISATEXTO" name="PESQUISATEXTO" method="Get" action="/index.asp">
    <tr>
      <td height="21" valign="top" align="center"><input type="text" name="<%=txt.e36("TEXTO")%>" id="<%=txt.e36("TEXTO")%>" class="Texto" value="<%=txt.ABSTxt(request.querystring(txt.e36("TEXTO")))%>"/></td>
    </tr>
    <tr>
      <td height="21" align="center" valign="top" class="caixa_produtos"><input type="submit" class="Texto" value="Pesquisar"  onclick="return ValidaPesquisa()"/></td>
    </tr>
    <input type="hidden" name="OP" value="PESQUISATEXTO"/>
  </form>
  <form id="FABRICANTEID" name="FABRICANTEID" method="GET" action="index.asp">
     <tr>
    <td height="10" ></td>
    </tr>
    <tr>
      <td height="25" valign="left" background="../images/Separador_Fabricantes.jpg" width="200" bgcolor="#8C9594" align="center" class="Titulo_branco"></td>
    </tr>
     <tr>
    <td height="10" ></td>
    </tr>
    <tr class="Texto">
      <td height="25" align="center" valign="middle" ><%=txt.combobox(txt.e36("FABRICANTEID"),txt.qsv("FABRICANTEID",request.QueryString,1),"select distinct fabricante as DataOutTXT,FABRICANTEID as DataOutID From WN_Fabricante",1)%></td>
    </tr>
    <input type="hidden" name="OP" value="ListaProdutos" />
  </form>
  <tr>
    <td height="10" ></td>
  </tr>
  <tr>
    <td height="25" valign="left" width="200" background="../images/Separador_Produtos.jpg" bgcolor="#8C9594" align="center" class="Titulo_branco">&nbsp;</td>
  </tr>
   <tr>
    <td height="10" ></td>
  </tr>
  <tr>
    <td><!--#INCLUDE FILE="inc_gera_menus.asp"--></td>
  </tr>
  <tr>
    <td bordercolor="#666666"><div align="center">
      <table width="100%" border="0" cellpadding="0">
        <tr>
          <td height="25">&nbsp;</td>
          </tr>
        </table>
    </div></td>
  </tr>
  <%if Session("ComercialON") Then%>
  <tr>
    <td height="25" valign="left" width="200" bgcolor="#8C9594" align="center" class="Titulo_branco">Actualizações PHC</td>
  </tr>
  <tr>
    <td height="21" align="center" valign="middle" class="menu_direito"><a href="/WebAdmin/Index.asp" title="RELOAD" target="_self" class="Texto_azul">BackOffice</a></td>
  </tr>
  <%end if%>
</table>
