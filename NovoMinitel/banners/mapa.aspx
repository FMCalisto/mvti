<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="http://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>
<!-- BeginOAWidget_Shared_2187524 -->
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<!-- EndOAWidget_Shared_2187524 -->
<script type="text/xml">
<!--
<oa:widgets>
  <oa:widget wid="2187524" binding="#mapCanvas" />
</oa:widgets>
-->
</script>
<style type="text/css">
ul {
	font-family: Raleway;
}
</style>
</head>

<body>
<ins><div id="mapCanvas" style="width:100%; height:100%; min-width:300px; min-height:300px"></div>
</ins>
<p align="center"><ins>
  <script type="text/javascript">
// BeginOAWidget_Instance_2187524: #mapCanvas

	  // initialize the google Maps 	
	
     function initializeGoogleMap() {
		// set latitude and longitude to center the map around
		var latlng = new google.maps.LatLng(38.723, 
											-9.15648);
		
		// set up the default options
		var myOptions = {
		  zoom: 16,
		  center: latlng,
		  navigationControl: true,
		  navigationControlOptions: 
		  	{style: google.maps.NavigationControlStyle.DEFAULT,
			 position: google.maps.ControlPosition.TOP_LEFT },
		  mapTypeControl: true,
		  mapTypeControlOptions: 
		  	{style: google.maps.MapTypeControlStyle.DEFAULT,
			 position: google.maps.ControlPosition.TOP_RIGHT },

		  scaleControl: true,
		   scaleControlOptions: {
        		position: google.maps.ControlPosition.BOTTOM_LEFT
    	  }, 
		  mapTypeId: google.maps.MapTypeId.ROADMAP,
		  draggable: true,
		  disableDoubleClickZoom: false,
		  keyboardShortcuts: true
		};
		var map = new google.maps.Map(document.getElementById("mapCanvas"), myOptions);
		if (false) {
			var trafficLayer = new google.maps.TrafficLayer();
			trafficLayer.setMap(map);
		}
		if (false) {
			var bikeLayer = new google.maps.BicyclingLayer();
			bikeLayer.setMap(map);
		}
		if (true) {
			addMarker(map,38.723,-9.15648,"Estamos aqui!");
		}
	  }

	  window.onload = initializeGoogleMap();

	 // Add a marker to the map at specified latitude and longitude with tooltip
	 function addMarker(map,lat,long,titleText) {
	  	var markerLatlng = new google.maps.LatLng(lat,long);
	 	var marker = new google.maps.Marker({
      		position: markerLatlng, 
      		map: map, 
      		title:"Estamos aqui!",
			icon: ""});   
	 }

	
// EndOAWidget_Instance_2187524
</script>
</ins><ul></p>
<p align="justify"><strong>Minitel - Sociedade de Fomento de Aplicações Informáticas, L.da.</strong></p>
<p align="justify">&nbsp;</p>
<p align="justify"><strong>Contactos</strong></p>
<p align="justify">Travessa Légua da Póvoa, 1A - 1250-136 Lisboa</p>
<p align="justify">Tel: +351 21 381 09 00 | Fax: +351 21 385 05 44</p>
</ul></p>
<p>&nbsp;</p>
</body>
</html>
