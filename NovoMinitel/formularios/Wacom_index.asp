<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Campanha Natal Wacom Intuos3</title>
<style type="text/css">
<!--
#form  {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-style: normal;
	line-height: 13px;
	font-weight: bold;
	font-variant: normal;
	color: #333333;
}
.titulo {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 16px;
	font-style: normal;
	line-height: 20px;
	font-weight: bold;
	font-variant: normal;
	text-transform: none;
	color: #333333;
}
.texto {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	font-style: normal;
	line-height: 13px;
	font-weight: normal;
	font-variant: normal;
	color: #666666;
}
.box {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	font-style: normal;
	line-height: 13px;
	font-weight: normal;
	font-variant: normal;
	color: #666666;
	text-transform: none;
	background-color: #E1E1E1;
	border: 1px solid #666666;
}
.bt {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-style: normal;
	line-height: normal;
	font-weight: bold;
	font-variant: normal;
	text-transform: none;
	color: #333333;
	border: 1px solid #666666;
	background-color: #E1E1E1;
}
.pic {
	background-color: #CCCCCC;
	background-image: url(Xmas.jpg);
	background-repeat: no-repeat;
	background-position: center center;
}
-->
</style>
</head>
<script language="javascript">
function valida()
{
    var erro=false;	
	var saida=true;

	if (document.form1.Nome.value=='' && erro==false)
		{
		alert('O Nome é um campo obrigatório !');
		saida=false;
		erro=true;
		document.form1.Nome.focus();
		}
	if (document.form1.Morada.value=='' && erro==false)
		{
		alert('A Morada é um campo obrigatório !');
		saida=false;
		erro=true;
		document.form1.Morada.focus();
		}
	if (document.form1.CP4.value=='' && erro==false)
		{
		alert('O Código Postal (4digitos) é um campo obrigatório !');
		saida=false;
		erro=true;
		document.form1.CP4.focus();
		}
		
	if (document.form1.CP3.value=='' && erro==false)
		{
		alert('O Código Postal (3digitos) é um campo obrigatório !');
		saida=false;
		erro=true;
		document.form1.CP3.focus();
		}
	if (document.form1.Localidade.value=='' && erro==false)
		{
		alert('A Localidade é um campo obrigatório !');
		saida=false;
		erro=true;
		document.form1.Localidade.focus();
		}

	if  (erro==false)
	{
	var Email=document.form1.Email.value;
	if (Email=='')
		{
			alert('O endereço de e-mail é obrigatório.');
			erro=true;
			saida=false;
			document.form1.Email.focus();
		}
	else
		{
			if (Email.match(/\b(^(\S+@).+((\.com)|(\.net)|(\.edu)|(\.mil)|(\.gov)|(\.org)|(\..{2,2}))$)\b/gi)==null)
			{
				alert('O endereço de e-mail é inválido.');
				erro=true;
				saida=false;
			}
		}
	}

	if (document.form1.Telefone.value=='' && erro==false)
		{
		alert('O Telefone é um campo obrigatório !');
		saida=false;
		erro=true;
		document.form1.Telefone.focus();
		}

	if (document.form1.Local.value=='' && erro==false)
		{
		alert('É obrigatório identificar a Loja onde adquiriu a intuos3 !');
		saida=false;
		erro=true;
		document.form1.Local.focus();
		}

	if (document.form1.SN.value=='' && erro==false)
		{
		alert('O Número de Série é campo obrigatório !');
		saida=false;
		erro=true;
		document.form1.SN.focus();
		}


	if (document.form1.DD.value=='' && erro==false)
		{
		alert('O DIA é campo obrigatório !');
		saida=false;
		erro=true;
		document.form1.DD.focus();
		}

	if (document.form1.MM.value=='' && erro==false)
		{
		alert('O MÊS é campo obrigatório !');
		saida=false;
		erro=true;
		document.form1.MM.focus();
		}

	if (erro==false)
	{
	if (document.form1.MM.value=='11' && document.form1.DD.value=='31')
		{
		alert('Data inválida !');
		saida=false;
		erro=true;
		document.form1.MM.focus();
		}
	}
	return saida;
}
</script>
<body>
<form id="form1" name="form1" method="post" action="gravaformulario.asp">
<table width="600" border="0" align="center" cellpadding="5" cellspacing="5" bgcolor="#CCCCCC" class="pic">
  <tr>
    <td><table border="0" align="center" cellpadding="10" cellspacing="0" id="form">
        <tr>
          <td>
      <span class="titulo">Formulário de Registo<br />
      </span><br />
      <br />
      Nome&nbsp;&nbsp;&nbsp;
      <input name="Nome" type="text" class="box" id="Nome" size="85" maxlength="80" />
      <p>
        Morada
        <input name="Morada" type="text" class="box" id="Morada" value="" size="85" maxlength="80" />
     </p>
      <p>
Código Postal
        <input name="CP4" type="text" class="box" id="CP4" size="5" maxlength="4" />
      -
      <input name="CP3" type="text" class="box" id="CP3" size="4" maxlength="3" />
      &nbsp;&nbsp;&nbsp;&nbsp;
Localidade
      <input name="Localidade" type="text" class="box" id="Localidade" size="16" maxlength="15" />
</p>
      <p>
E-mail
        <input name="Email" type="text" class="box" id="Email" size="42" maxlength="40" />
&nbsp;&nbsp;&nbsp;
Telefone
        <input name="Telefone" type="text" class="box" id="Telefone" size="10" maxlength="9" />
</p>
      <p>
        Loja onde adquiriu a sua intuos3?
          <input name="Local" type="text" class="box" id="Local" size="52" maxlength="50" />
      </p>
      <p>
    Nº Série
        <input name="SN" type="text" class="box" id="SN" size="10" maxlength="9" />
	&nbsp;&nbsp;&nbsp;
	Data de compra
	  <select name="DD" class="box">
	  	<option value=""></option>
		<%
		Dim r 
			for r=1 to 31
			  	%><option value="<%=r%>"><%=r%></option><%
			Next
		%>
	   </select>		
      /
      <select name="MM" class="box" id="MM">
	  	<option value=""></option>
		<option value="11">Novembro</option>
		<option value="12">Dezembro</option>
        <option value="01">Janeiro</option>
        <option value="02">Fevereiro</option>
	   </select>
      / 
	  <select name="AAAA" class="box" id="AAAA">
	  	<option value=""></option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
	   </select>		
      <br />
            <div align="right"><br />
          <input name="submit" type="submit" class="bt" id="submit" value="Registar"  onclick="javascript:return valida();"/>
      </div>    
      </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
<br />
<p align="center" class="texto">Este formulário é exclusivo para clientes que tenham adquirido, num revendedor autorizado Minitel 
uma intuos3,<br /> 
ao abrigo da Campanha  Wacom, no período de 1 de Novembro a 28 de Fevereiro de 2009.<br />
O registo é válido apenas até 13 de Março de 2009. Para mais informações, contacte-nos pelo telefone : 21 381 09 00.<br />
  <br />
  Por favor preencha o formulário de registo para receber o seu reembolso. <br />
  Todos os campos são de preenchimento obrigatório.</p>
</body>
</html>
