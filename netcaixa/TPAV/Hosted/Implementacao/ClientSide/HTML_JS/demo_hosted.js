/**
 * 
 * Author Caixatec
 * Version 1.0 - 2013/09
 * 	
 * Copyright Caixatec 
 * 
 * Este código foi desenvolvido pela equipa ténica da Caixatec - Tecnologias de Comunicação SA (http://www.caixatec.pt) sendo sua propriedade.
 * A sua finalidade foi a de explorar a implementação técnica da solução TPAV Hosted da netcaixa Online (http://www.netcaixa.pt) e criar um template 
 * que possa servir de base de trabalho aos clientes Netcaixa.
 * 
 * A Caixatec autoriza o uso gratuito deste código, sem exclusividade, que pode ser modificado para que se adeqúe à necessidade de integração deste sistema
 * de pagamento num determinado site. Quando utilizado, esta nota deve estar presente indicando a proveniência do código original, sendo acrescentada uma 
 * adenda a especificar resumidamente que modificações foram realizadas.
 * 
 * A Caixatec não garante a correcta execução deste código, devendo o mesmo ser testado exaustivamente a fim de prevenir possíveis falhas ou discrepâncias de 
 * conformidade com requisitos SIBS, devido por exemplo a uma alteração técnica do sistema e/ou procedimentos de pagamento.
 * 
 * A Caixatec declina quaisquer responsabilidades relativamente a anomalias, incorrecções ou prejuízos que decorram do uso deste código.
 * 
 * Para esclarecimentos de dúvidas técnicas pode contactar netcaixa@caixatec.pt
 */

// Campos necessário para a realização das autorizações de pagamento
var CCom = ""; // Número do cartão do comerciante
var A001 = ""; // Número do TPA Virtual

var arrFieldsProperties = new Array( 
	"A001-N9", 
	"A030-C4", 
	"A031-N3", 
	"A032-N3", 
	"A037-N14", 
	"A038-N3", 
	"A050-N2", 
	"A052-N3", 
	"A053-N10", 
	"A054-C10", 
	"A061-N8", 
	"A077-C16", 
	"A078-C16", 
	"A085-C10", 
	"A089-N10", 
	"A103-N8", 
	"A105-N4", 
	"A149-C1", 
	"A7706-C44", 
	"A7707-N1", 
	"C003-C16", 
	"C004-N6", 
	"C005-N3", 
	"C007-N15", 
	"C012-C128", 
	"C013-C40", 
	"C016-N2", 
	"C017-N2", 
	"C025-N7", 
	"C026-C6", 
	"C042-N1",
	"C046-C128",
	"C108-N3",
	"XA086-C42"
);

/*	
	CCom - Número do cartão do comerciante
	A001 - Número do TPA Virtual
	C007 - Referência do pagamento
	A061 - Montante da operação
	C046 - URL do CSS
	C012 - URL da página de confirmação da encomenda do Comerciante
	iFrame - Nome do iFrame onde será apresentado o formulário (Campo não obrigatório)
	popup - Utilizar popup? (true / false)
	popupHeight - Largura da popup
	popupWidth - Altura da popup
*/ 
function submitPaymentByFrame(C007, A061, C046, C012){
	submitPayment(C007, A061, C046, C012, 'netcaixa');
}

function submitPaymentByPopUp(C007, A061, C046, C012, popupHeight, popupWidth){
	submitPayment( C007, A061, C046, C012, '', true, popupHeight, popupWidth);
}

function submitPayment(C007, A061, C046, C012, iFrame, popup, popupHeight, popupWidth){
	var A030 = "H3D0"; // Código de Mensagem
	var A105 = "9782"; // Moeda da Operação (Euro)
		
	var fieldsPayment = "CCom:" + CCom + "§A030:" + A030 + "§A001:" + A001 + "§C007:" + C007 + "§A105:" + A105 + "§A061:" + A061 + "§C046:" + C046 + "§C012:" + C012;
	var C013 = buildHashHMACSHA1(fieldsPayment); // Elemento de segurança
	
	var hiddenForm = document.createElement('FORM');
	hiddenForm.name = "frmPayment";
	hiddenForm.method = "POST";
	
	var height = 570; 
	var width = 470;
	if(popupHeight != undefined){
		height = popupHeight;
	}
	
	if(popupWidth != undefined){
		width = popupWidth;
	}
	
	if(iFrame != null && iFrame != "" && iFrame != undefined){
		hiddenForm.target = iFrame;
	}else if(popup != undefined && popup){
		var popwindow = window.open('', 'formpopup', config='height=' + height + ', width=' + width + ', toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, directories=no, status=no');
    	hiddenForm.target = 'formpopup';
		popwindow.focus();
	}

	hiddenForm.action = "https://teste.mbnet.pt/servlet/pvtn"; // O URL para ambiente de testes é https://teste.mbnet.pt/servlet/pvtn. O URL para ambiente de produção é https://www.mbnet.pt/servlet/pvtn
	
	var hiddenInput = document.createElement("INPUT");
	hiddenInput.type = "hidden";
	hiddenInput.id = "A030";
	hiddenInput.name = "A030";
	hiddenInput.value = paddingString(A030, 4, '0');
	hiddenForm.appendChild(hiddenInput);
	
	hiddenInput = document.createElement("INPUT");
	hiddenInput.type = "hidden";
	hiddenInput.id = "A001";
	hiddenInput.name = "A001";
	hiddenInput.value = paddingString(A001, 9, '0');
	hiddenForm.appendChild(hiddenInput);
	
	hiddenInput = document.createElement("INPUT");
	hiddenInput.type = "hidden";
	hiddenInput.id = "C007";
	hiddenInput.name = "C007";
	hiddenInput.value = paddingString(C007, 15, '0');
	hiddenForm.appendChild(hiddenInput);
	
	hiddenInput = document.createElement("INPUT");
	hiddenInput.type = "hidden";
	hiddenInput.id = "A105";
	hiddenInput.name = "A105";
	hiddenInput.value = paddingString(A105, 4, '0');
	hiddenForm.appendChild(hiddenInput);
	
	hiddenInput = document.createElement("INPUT");
	hiddenInput.type = "hidden";
	hiddenInput.id = "A061";
	hiddenInput.name = "A061";
	hiddenInput.value = paddingString(parseFloat(A061).toFixed(2).replace(",", "."), 8, '0');
	hiddenForm.appendChild(hiddenInput);
	
	hiddenInput = document.createElement("INPUT");
	hiddenInput.type = "hidden";
	hiddenInput.id = "C046";
	hiddenInput.name = "C046";
	hiddenInput.value = C046;
	hiddenForm.appendChild(hiddenInput);

	hiddenInput = document.createElement("INPUT");
	hiddenInput.type = "hidden";
	hiddenInput.id = "C012";
	hiddenInput.name = "C012";
	hiddenInput.value = C012;
	hiddenForm.appendChild(hiddenInput);

	hiddenInput = document.createElement("INPUT");
	hiddenInput.type = "hidden";
	hiddenInput.id = "C013";
	hiddenInput.name = "C013";
	hiddenInput.value = C013;
	hiddenForm.appendChild(hiddenInput);
	
	document.body.appendChild(hiddenForm);
	hiddenForm.submit();
}

function buildHashHMACSHA1(fieldsPayment){
	var C013 = "";	
	var message = "";

	// Elementos do pagamento
	var arrFieldsPayment = new Array();
	arrFieldsPayment = fieldsPayment.split("§");

	for(var i = 0; i != arrFieldsPayment.length; i++){
		var elementName = arrFieldsPayment[i].substring(0, arrFieldsPayment[i].indexOf(":")); 
		var elementValue = arrFieldsPayment[i].substring(arrFieldsPayment[i].indexOf(":") + 1, arrFieldsPayment[i].length);

		// Formatação do campo A061
		if(elementName == "A061"){
			elementValue = elementValue.replace(",", ".");
			elementValue = parseFloat(elementValue).toFixed(2).replace(".", "");
		}

		if(elementName == "CCom"){
			key = elementValue;
		}
		
		// Leitura das propriedades do campo
		for(var j = 0; j != arrFieldsProperties.length; j++){
			var prop = arrFieldsProperties[j];
			var propName = prop.substring(0, prop.indexOf("-"));
			var propType = prop.substring(prop.indexOf("-") + 1, prop.indexOf("-") + 2);
			var propLength = prop.substring(prop.indexOf("-") + 2, prop.length);

			if(elementName == propName){
				// Padding dos campos
				var prefix = "";
				if(propType == "N"){
					for(var k = 0; k != (propLength - elementValue.length); k++){
						prefix +="0";
					}
				}
				message += prefix + elementValue; 
				break;
			}
		}
	}

	try{
		C013 = CryptoJS.HmacSHA1(message, key);
	}catch(e){}

	return C013; 
}

function paddingString (strString, intLength, charToPadding){
	if(strString == null) return "";
	if(strString.length > intLength) return strString;
	
	var strToPadding = "";
	for(var i=0; i!=(intLength - strString.length); i++){
		strToPadding += charToPadding;
	}
	
	return strToPadding + strString;
}

/*
CryptoJS v3.1.2
code.google.com/p/crypto-js
(c) 2009-2013 by Jeff Mott. All rights reserved.
code.google.com/p/crypto-js/wiki/License
http://crypto-js.googlecode.com/svn/tags/3.1.2/build/rollups/hmac-sha1.js
*/
var CryptoJS=CryptoJS||function(g,l){var e={},d=e.lib={},m=function(){},k=d.Base={extend:function(a){m.prototype=this;var c=new m;a&&c.mixIn(a);c.hasOwnProperty("init")||(c.init=function(){c.$super.init.apply(this,arguments)});c.init.prototype=c;c.$super=this;return c},create:function(){var a=this.extend();a.init.apply(a,arguments);return a},init:function(){},mixIn:function(a){for(var c in a)a.hasOwnProperty(c)&&(this[c]=a[c]);a.hasOwnProperty("toString")&&(this.toString=a.toString)},clone:function(){return this.init.prototype.extend(this)}},
p=d.WordArray=k.extend({init:function(a,c){a=this.words=a||[];this.sigBytes=c!=l?c:4*a.length},toString:function(a){return(a||n).stringify(this)},concat:function(a){var c=this.words,q=a.words,f=this.sigBytes;a=a.sigBytes;this.clamp();if(f%4)for(var b=0;b<a;b++)c[f+b>>>2]|=(q[b>>>2]>>>24-8*(b%4)&255)<<24-8*((f+b)%4);else if(65535<q.length)for(b=0;b<a;b+=4)c[f+b>>>2]=q[b>>>2];else c.push.apply(c,q);this.sigBytes+=a;return this},clamp:function(){var a=this.words,c=this.sigBytes;a[c>>>2]&=4294967295<<
32-8*(c%4);a.length=g.ceil(c/4)},clone:function(){var a=k.clone.call(this);a.words=this.words.slice(0);return a},random:function(a){for(var c=[],b=0;b<a;b+=4)c.push(4294967296*g.random()|0);return new p.init(c,a)}}),b=e.enc={},n=b.Hex={stringify:function(a){var c=a.words;a=a.sigBytes;for(var b=[],f=0;f<a;f++){var d=c[f>>>2]>>>24-8*(f%4)&255;b.push((d>>>4).toString(16));b.push((d&15).toString(16))}return b.join("")},parse:function(a){for(var c=a.length,b=[],f=0;f<c;f+=2)b[f>>>3]|=parseInt(a.substr(f,
2),16)<<24-4*(f%8);return new p.init(b,c/2)}},j=b.Latin1={stringify:function(a){var c=a.words;a=a.sigBytes;for(var b=[],f=0;f<a;f++)b.push(String.fromCharCode(c[f>>>2]>>>24-8*(f%4)&255));return b.join("")},parse:function(a){for(var c=a.length,b=[],f=0;f<c;f++)b[f>>>2]|=(a.charCodeAt(f)&255)<<24-8*(f%4);return new p.init(b,c)}},h=b.Utf8={stringify:function(a){try{return decodeURIComponent(escape(j.stringify(a)))}catch(c){throw Error("Malformed UTF-8 data");}},parse:function(a){return j.parse(unescape(encodeURIComponent(a)))}},
r=d.BufferedBlockAlgorithm=k.extend({reset:function(){this._data=new p.init;this._nDataBytes=0},_append:function(a){"string"==typeof a&&(a=h.parse(a));this._data.concat(a);this._nDataBytes+=a.sigBytes},_process:function(a){var c=this._data,b=c.words,f=c.sigBytes,d=this.blockSize,e=f/(4*d),e=a?g.ceil(e):g.max((e|0)-this._minBufferSize,0);a=e*d;f=g.min(4*a,f);if(a){for(var k=0;k<a;k+=d)this._doProcessBlock(b,k);k=b.splice(0,a);c.sigBytes-=f}return new p.init(k,f)},clone:function(){var a=k.clone.call(this);
a._data=this._data.clone();return a},_minBufferSize:0});d.Hasher=r.extend({cfg:k.extend(),init:function(a){this.cfg=this.cfg.extend(a);this.reset()},reset:function(){r.reset.call(this);this._doReset()},update:function(a){this._append(a);this._process();return this},finalize:function(a){a&&this._append(a);return this._doFinalize()},blockSize:16,_createHelper:function(a){return function(b,d){return(new a.init(d)).finalize(b)}},_createHmacHelper:function(a){return function(b,d){return(new s.HMAC.init(a,
d)).finalize(b)}}});var s=e.algo={};return e}(Math);
(function(){var g=CryptoJS,l=g.lib,e=l.WordArray,d=l.Hasher,m=[],l=g.algo.SHA1=d.extend({_doReset:function(){this._hash=new e.init([1732584193,4023233417,2562383102,271733878,3285377520])},_doProcessBlock:function(d,e){for(var b=this._hash.words,n=b[0],j=b[1],h=b[2],g=b[3],l=b[4],a=0;80>a;a++){if(16>a)m[a]=d[e+a]|0;else{var c=m[a-3]^m[a-8]^m[a-14]^m[a-16];m[a]=c<<1|c>>>31}c=(n<<5|n>>>27)+l+m[a];c=20>a?c+((j&h|~j&g)+1518500249):40>a?c+((j^h^g)+1859775393):60>a?c+((j&h|j&g|h&g)-1894007588):c+((j^h^
g)-899497514);l=g;g=h;h=j<<30|j>>>2;j=n;n=c}b[0]=b[0]+n|0;b[1]=b[1]+j|0;b[2]=b[2]+h|0;b[3]=b[3]+g|0;b[4]=b[4]+l|0},_doFinalize:function(){var d=this._data,e=d.words,b=8*this._nDataBytes,g=8*d.sigBytes;e[g>>>5]|=128<<24-g%32;e[(g+64>>>9<<4)+14]=Math.floor(b/4294967296);e[(g+64>>>9<<4)+15]=b;d.sigBytes=4*e.length;this._process();return this._hash},clone:function(){var e=d.clone.call(this);e._hash=this._hash.clone();return e}});g.SHA1=d._createHelper(l);g.HmacSHA1=d._createHmacHelper(l)})();
(function(){var g=CryptoJS,l=g.enc.Utf8;g.algo.HMAC=g.lib.Base.extend({init:function(e,d){e=this._hasher=new e.init;"string"==typeof d&&(d=l.parse(d));var g=e.blockSize,k=4*g;d.sigBytes>k&&(d=e.finalize(d));d.clamp();for(var p=this._oKey=d.clone(),b=this._iKey=d.clone(),n=p.words,j=b.words,h=0;h<g;h++)n[h]^=1549556828,j[h]^=909522486;p.sigBytes=b.sigBytes=k;this.reset()},reset:function(){var e=this._hasher;e.reset();e.update(this._iKey)},update:function(e){this._hasher.update(e);return this},finalize:function(e){var d=
this._hasher;e=d.finalize(e);d.reset();return d.finalize(this._oKey.clone().concat(e))}})})();