console.log("script map chargé");
var pathlist = {};
var animallist = {};
var pointlist = [];

var origin = -1;
var destination = -1;
var scale = 1;
var a;
var ctx;
var image;
var width;
var height;

document.addEventListener("DOMContentLoaded",function(){
	a = document.getElementById('geomap');
	ctx = a.getContext("2d");
	image = new Image();
	var options = { method: 'GET', headers: {'Content-Type': 'application/json;charset=utf-8'}};
	fetch('../../back/map/itineraire.php?action=initmap', options)
		.then(response => response.json())
		.then(result => loadMap(result));
});

function loadMap(data){
	pathlist = data.pathlist;
	animallist = data.animallist;
	width = data.width;
	height = data.height;
	a.width=width;
	a.height=height;

	scale = data.scale;
	image.src = data.image;
	image.onload = function() {
		ctx.drawImage(this, 0, 0, width, height);
	};

	var svg = document.getElementById('mapping');
	svg.setAttribute('width',width);
	svg.setAttribute('height',height);
	for(var i in animallist) {
		const disque = document.createElementNS("http://www.w3.org/2000/svg", "circle");
		disque.setAttribute("cx", animallist[i].posX*scale);
		disque.setAttribute("cy", animallist[i].posY*scale);
		disque.setAttribute("r", 10);
		disque.setAttribute("id", 'animal'+animallist[i].animalId);
		disque.setAttribute("animalid", animallist[i].animalId);
		disque.setAttribute("class", 'animaux');
		disque.addEventListener('click',selectAnimal);
		svg.appendChild(disque);
	}

	document.getElementById('reset').addEventListener('click',function(){
		clearSelection();
		ctx.drawImage(image, 0, 0, width, height);
		origin = -1;
		destination = -1;
	});

}



function clearSelection()
{
	var ellist = document.getElementsByClassName('animaux');
	for(i in ellist){
		el = ellist[i];
		if (el.tagName=="circle"){
			el.classList.remove('selected');
		}
	}
}

function selectAnimal(e){
	element = e.target;
	id = element.attributes.animalid.value;
	if (origin==-1) {
		origin = id;
		clearSelection();
		element.classList.add('selected');
	} else if (destination==-1) {
		console.log('destination');
		destination = id;
		element.classList.add('selected');
		getPath();
	} else {
		console.log('nouvelle destination');
		document.getElementById('animal'+destination).classList.remove("selected");
		destination = id;
		element.classList.add('selected');
		getPath();
	}
}

function getPath(){
	// effectuer une requête ajax pour calculer l'itinéraire
	options = {method: 'POST', headers: {'Content-Type': 'application/json;charset=utf-8'}};
	fetch('../../back/map/itineraire.php?start='+origin+'&end='+destination, options)
		.then(response => response.json())
		.then(result => drawPath(result));
}

function drawPath(list) {
	ctx.drawImage(image, 0, 0, width, height);
	for (id in list){
		// afficher le chemin
		chemin = pathlist[list[id]];
		tmppath = JSON.parse(chemin.path);
		console.log(tmppath);
		ctx.beginPath();
		ctx.lineWidth = "3";
		ctx.strokeStyle ="green";  // This path is green.
		for (let i = 0; i < tmppath.length; i++) {
			if (i==0) {
				ctx.moveTo(tmppath[i].x*scale, tmppath[i].y*scale);
			} else {
				ctx.lineTo(tmppath[i].x*scale, tmppath[i].y*scale);
			}
		}
		ctx.stroke();
		ctx.closePath();
	}
}
