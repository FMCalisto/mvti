function createHTML5Player(id, width, height) {
	var video = document.createElement("iframe");
	video.id = "html5Vid";
	video.className = "youtube-player";
	video.type = "text/html";
	video.width = width;
	video.height = height;
	video.src = "http://www.youtube.com/embed/" + id;
	video.setAttribute("frameborder", "0");
	document.body.appendChild(video);
}

function createFlashPlayer(id, width, height, params) {
	var video = document.createElement("object");
	var par = "";

	if (params.autoplay) {
		par += "&autoplay=1";
	}
	if (params.loop) {
		par += "&loop=1";	
	}
	if (params.hd) {
		par += "&hd=1";	
	}
	if (params.start != undefined) {
		par += "&start="+params.start;	
	}
	if (params.border) {
		var color1 = "0x"+params.color1.substring(1);
		var color2 = "0x"+params.color2.substring(1);
		par += "&border=1"+"&color1="+color1+"&color2="+color2;		
	}
	
	var src = "http://www.youtube.com/v/"+id+"?fs=1"+par;
	video.id = "flashVid";
	video.width = width;
	video.height = height;
	
	var movieNode = createParamNode("movie", src);
	var fsNode = createParamNode("allowFullScreen", "true");
	var jsNode = createParamNode("allowscriptaccess", "always");
	
	//Create embed node
	var embed = document.createElement("embed");
	embed.src = src;
	embed.type = "application/x-shockwave-flash";
	embed.width = width;
	embed.height = height;
	embed.setAttribute("allowscriptaccess", "always");
	embed.setAttribute("allowfullscreen", "true");
	
	video.appendChild(movieNode);
	video.appendChild(fsNode);
	video.appendChild(jsNode);
	video.appendChild(embed);
	return video;
}

function createParamNode(name, value) {
	var param = document.createElement("param");
	param.name = name;
	param.value = value;
	return param;	
}