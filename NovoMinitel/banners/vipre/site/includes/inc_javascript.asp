<script language="javascript" type="text/javascript">
/*****************************************************************/
/**
 * DHTML date validation script for dd/mm/yyyy. Courtesy of SmartWebby.com (http://www.smartwebby.com/dhtml/)
 */
// Declaring valid date character, minimum year and maximum year

var dtCh= "/";
var minYear=1900;
var maxYear=2100;
function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function stripCharsInBag(s, bag){
	var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function daysInFebruary (year){
	// February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}

function isDate(dtStr){
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strDay=dtStr.substring(0,pos1)
	var strMonth=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("O formato da data deverá ser : dd/mm/yyyy")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Por favor introduza um mês correcto")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Por favor introduza um dia correcto")
		return false
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
		alert("Por favor coloque um ano valido entre "+minYear+" e "+maxYear)
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Inroduza uma data válida")
		return false
	}
return true
}
function ValidateForm(valor)
	{
	var dt=valor
	if (isDate(dt.value)==false){
		dt.focus()
		return false
	}
    return true
 }
/*****************************************************************/

function shoh(id) { 
	if (document.getElementById)
	{ // DOM3 = IE5, NS6
		if (document.getElementById(id).style.display == "none")
		{document.getElementById(id).style.display = 'block';}
		else {document.getElementById(id).style.display = 'none';}	
	 } 
	else
	{ 
		if (document.layers) 
		{	
			if (document.id.display == "none")
			{document.id.display = 'block';}
			else 
			{document.id.display = 'none';}
		} else {
			if (document.all.id.style.visibility == "none")
			{document.all.id.style.display = 'block';}
			else 
			{document.all.id.style.display = 'none';}
		}
	}
}
function alterapassword()
{
	var pass1=document.formulario.<%=txt.e36("PASSNOVA")%>.value
	var pass2=document.formulario.<%=txt.e36("PASSNOVA2")%>.value

	if (pass1=='')
		{
			alert('A utilização de password de acesso é obrigatória !')
			return false;
		}
	else
	{
	
		if (pass1!=pass2)
		{
			alert('A repetição da nova password não é igual à 1º introduzida !')
			return false;
		}
	else
		{return true;}	
	}

}


function validamail()
{
	var Email=document.formulario.email.value;

	if (Email=='')
		return true;
	else
		{
		if (Email.match(/\b(^(\S+@).+((\.com)|(\.net)|(\.edu)|(\.mil)|(\.gov)|(\.org)|(\..{2,2}))$)\b/gi)!=null)
		{return true;}
		else
		{	if (Email!='')
			{
				alert('O endereço de e-mail é inválido.');
				return false;
			}
		}
	}
	return true;
}

function outramorada()
{
	if (document.formulario.EntregarClienteFinal.checked == true)
	{
		document.formulario.MoradaEntregaDiferente.checked = true;
	}
	return true;
}

function outramoradapreenchida()
{
	var resultado=false
	if (document.formulario.MoradaEntregaDiferente.checked == true)
	{

		if (document.formulario.<%=txt.e36("contacto")%>.value=='')
			{
			alert('A Pessoa de contacto alternativa tem de ser preenchida');
			return false;
			}

		if (document.formulario.<%=txt.e36("morada")%>.value=='')
			{
			alert('A Morada alternativa tem de ser preenchida');
			return false;
			}

		if (document.formulario.<%=txt.e36("codpost")%>.value=='')
			{
			alert('O Código Postal alternativo tem de ser preenchido');
			return false;
			}

		if (document.formulario.<%=txt.e36("local")%>.value=='')
			{
			alert('A Localidade alternativa tem de ser preenchida');
			return false;
			}


		if (document.formulario.<%=txt.e36("email")%>.value=='')
			{
			alert('O Email alternativo tem de ser preenchido');
			return false;
			}
			else
			{
				return validamail();
			}

	}

}



function TrocaImagem(nome)
{
	document[nome].src='/img_produtos/semfoto.gif';
}
function ValidaPesquisa()
{
	var resultado=false
	if (document.PESQUISATEXTO.<%=txt.e36("TEXTO")%>.value!='') 
		{resultado=true;}
		else
		{resultado=false;}
	return resultado;
}
function validalogin()
{
	var resultado=true
	if (document.form_login.<%=txt.e36("no")%>.value==''){resultado=false;}
	if (document.form_login.<%=txt.e36("password")%>.value==''){resultado=false;}
	return resultado;
}

function limpa_n()
{
	if (document.form_login.<%=txt.e36("no")%>.value=='Numero') 
	{
		document.form_login.<%=txt.e36("no")%>.value='';
	}
}

function limpa_c()
{
	if (document.form_login.<%=txt.e36("colaborador")%>.value=='Admin') 
	{
		document.form_login.<%=txt.e36("colaborador")%>.value='';
	}
}



function valida_orcamento()
{
	var Email=formulario_orcamento.email.value;

	if (document.formulario_orcamento.nome.value=='')
	{
			alert('O nome é um campo obrigatório.');
			return false;
	}


	if (document.formulario_orcamento.telefone.value=='')
	{
			alert('O telefone é um campo obrigatório.');
			return false;
	}


	if (Email=='')
	{
			alert('O email é um campo obrigatório.');
			return false;
	}
	else
	{
		if (Email.match(/\b(^(\S+@).+((\.com)|(\.net)|(\.edu)|(\.mil)|(\.gov)|(\.org)|(\..{2,2}))$)\b/gi)!=null)
			{}
		else
		{	if (Email!='')
			{
				alert('O endereço de e-mail é inválido.');
				return false;
			}
		}
	}


	return true;
}

function validar_desconto()
{
	if (document.form_descontos.valor_desconto=='' || document.form_descontos.valor_desconto=='C%F3digo+Promo%E7%E3o')
	{return false;}
	return true;
}

function openpopup(popurl){
//JavaScriptKit.com
var w = 480, h = 360;
if (document.all || document.layers) {
   w = screen.availWidth;
   h = screen.availHeight;
}
var popW = 450, popH = 530;
var leftPos = (w-popW)/2, topPos = (h-popH)/2;
var winpops=window.open(popurl,'','width=' + popW + ',height=' + popH + ',top=' + topPos + ',left=' + leftPos)
}

function RMURLParams()
{
	str=request.getQueryString()
	return str
}

</script>
