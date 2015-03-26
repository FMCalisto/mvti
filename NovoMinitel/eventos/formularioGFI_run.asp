<%
Dim xEventoNome : xEventoNome=replace(request.Form("EventoNome"),"'","")
Dim xNome : xNome=replace(request.Form("Nome"),"'","")
Dim xEmpresa : xEmpresa=replace(request.Form("Empresa"),"'","")
Dim xCargo : xCargo=replace(request.Form("Cargo"),"'","")
Dim xMorada : xMorada=replace(request.Form("Morada"),"'","")
Dim xCPostal : xCPostal=replace(request.Form("CPostal"),"'","")
Dim xCP2 : xCP2=replace(request.Form("CP2"),"'","")
Dim xLocalidade : xLocalidade=replace(request.Form("Localidade"),"'","")
Dim xTelefone : xTelefone=replace(request.Form("Telefone"),"'","")
Dim xFax : xFax=replace(request.Form("Fax"),"'","")
Dim xemail : xemail=request.Form("email")
Dim xNome2 : xNome2=replace(request.Form("Nome2"),"'","")
Dim xCargo2 : xCargo2=replace(request.Form("Cargo2"),"'","")
Dim xemail2 : xemail2=request.Form("email2")

Dim xMAR04 : xMAR04=request.Form("MAR04")
Dim xMAR11 : xMAR11=request.Form("MAR11")
Dim xMAR18 : xMAR18=request.Form("MAR18")
Dim xMAR25 : xMAR25=request.Form("MAR25")
Dim xABR01 : xABR01=request.Form("ABR01")
Dim xABR08 : xABR08=request.Form("ABR08")
Dim xABR15 : xABR15=request.Form("ABR15")
Dim xABR22 : xABR22=request.Form("ABR22")

'Dim xContaEventos

'Comentado pelo Antonio Garcia
'Vai buscar a DLL das funções
	'Dim TXT
	Set TXT = Server.CreateObject("Minitel.TXT")
	'Dim db
	Set db = Server.CreateObject("Minitel.db")
	'Dim MySQL : MySQL=""
	'Dim Conteudo : Conteudo=False

'SET xContaEventos = db.query("SELECT COUNT(*) AS Conta, EventoNome FROM Eventos GROUP BY EventoNome")
'If xContaEventos("Conta") => "30" then
'Response.Redirect("evento_cheio.asp")
'End If

'faz a query
MySQL="insert into eventos (EventoNome,Nome,EmpresaNome,Cargo,Morada,CPostal,CP2,Localidade,Telefone,Fax,email,Nome2,Cargo2,email2,MAR04,MAR11,MAR18,MAR25,ABR01,ABR08,ABR15,ABR22)"
MySQL=MySQL & " values ('" & xEventoNome  & "','" & xNome  & "','" & xEmpresa  & "','" & xCargo  & "','" & xMorada  & "','" & xCPostal  & "','" & xCP2  & "','" & xLocalidade  & "','" & xTelefone  & "','" & xFax  & "','" &  xemail & "','" & xNome2  & "','" & xCargo2  & "','" & xemail2  & "','" & xMAR04  & "','" & xMAR11  & "','" & xMAR18  & "','" & xMAR25  & "','" & xABR01  & "','" & xABR08  & "','" & xABR15  & "','" & xABR22  & "');"
db.queryexec (MySQL)
'Envia e-mail após registo na BD
Call EnviaEmail("WebMaster Minitel","comercial@minitel.pt","WebMaster Minitel","webmaster@minitel.pt","Inscricao nos Eventos","Houve uma inscrição para o evento " & xEventoNome & ". 24Horas para responder. Verique todos os registos em: M:\VidaPortatil\acesso eventos vidaportatil.xls")


%>


  <link href="http://www.minitel.pt/includes/Minitel.css" rel="stylesheet" type="text/css" />
<title>Formul&aacute;rio GFI</title><table width="500" border="0" align="center" cellpadding="0" cellspacing="0" id="page">
    <tr>
      <td valign="top"><table width="500" height="250" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000" id="border">
        <tr>
          <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="blank">
            <tr>
              <td valign="top"><img src="../eventos/Header_GFI.jpg" width="500" height="45" /></td>
            </tr>
            <tr>
              <td height="100" align="center" valign="middle"><p class="Texto"><strong>O seu registo foi efectuado com sucesso!</strong></p>
                <p class="Texto">Contamos com a sua presen&ccedil;a. Obrigado.</p>                </td>
            </tr>
            <tr>
              <td bgcolor="#999999">&nbsp;</td></tr>
            <tr>
              <td valign="top"><table width="100%" border="0" cellspacing="5" cellpadding="0">
                <tr>
                  <td height="100" align="center"><p class="Texto">Para mais informa&ccedil;&otilde;es ou em caso de d&uacute;vida, por favor, contacte-nos:<br />
                      <br />
Telefone: 
                      21 381 09 00 | <a href="http://www.minitel.pt">www.minitel.pt</a></p></td>
                </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
  </table>




