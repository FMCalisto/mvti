window.addEvent('domready', function(){
	var divs = $$(['aspx', 'html', 'css']);
	divs.each(function(div){
		var link = $(div.id + 'code');
		div.setStyle('display', 'none');
		link.addEvent('click', function(e){
			e = new Event(e);
			divs.each(function(other){
				if (other != div) other.setStyle('display', 'none');
			});
			div.setStyle('display', (div.getStyle('display') == 'block') ? 'none' : 'block');
			e.stop();
		});
	});
	if ($('exampleonly') != null) {
	    $('exampleonly').addEvent('click', function( e ) {
		    e = new Event(e);
		    divs.each(function(other){
			    other.setStyle('display', 'none');
		    });
		    e.stop();
	    });
	}
	$$('form').each(function( form ) {
		var t = window.location.href.replace('demos/', '' );
		if( t.indexOf('?')!=-1 ) t = t.substr( 0, t.indexOf('?') );
		t = t.replace('.aspx.cs', '/' )+form.getProperty('action' );
		form.setProperty('action', t );
	});

    if ($('billbook') != null) {
	    $('billbook').addEvent("click", function() {
		    var f = document.forms["aspnetForm"];
		    if (typeof f.fullWebPayment_recurringAmount != 'undefined') {
		        f.fullWebPayment_recurringAmount.value = Math.round( (f.fullWebPayment_paymentAmount.value - f.fullWebPayment_recurringFirstAmount.value) / (f.fullWebPayment_recurringBillingLeft.value - 1) );
		    } else if (typeof f.doRecurrentWalletPayment_recurringAmount != 'undefined') {
		        f.doRecurrentWalletPayment_recurringAmount.value = Math.round( (f.doRecurrentWalletPayment_paymentAmount.value - f.doRecurrentWalletPayment_recurringFirstAmount.value) / (f.doRecurrentWalletPayment_recurringBillingLeft.value - 1) );
		    }
	    });
    }
});