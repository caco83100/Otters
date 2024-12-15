<?php

include_once 'database.php';
include_once 'functions.php';

$image = "parc-animalier-la-barben-Plan-visiteur.png";

if (isset($_REQUEST['action']) && ($_REQUEST['action']=="linkanimal"))
{
	// Enregistre le lien entre un point du chemin et un animal

	$data = json_decode(file_get_contents('php://input'), true);

	$id = DBInsert('geo_animals',array(
		'animalId'=>$data['animalId'],
		'posX'=>$data['x'],
		'posY'=>$data['y'],
		'pathX'=>$data['pathX'],
		'pathY'=>$data['pathY'],
	));
	$animallist = selectDB('geo_animals');
	echo json_encode($animallist,true);
	exit;
}

// Load each point and path when you refresh the map

$pathlist = json_encode(selectDB('geo_path'),true);
$animallist = json_encode(selectDB('geo_animals'),true);

list($width, $height, $type, $attr) = getimagesize($image);

?>


<html>
<head>
	<script type="text/javascript">
		var animal = {};
		var pathlist = <?php echo $pathlist; ?>;
		var animallist = <?php echo $animallist; ?>;
		var pointlist = [];
	</script>
</head>
<body>
<div>
	<canvas id="geomap" width="<?php echo $width; ?>" height="<?php echo $height; ?>">
	</canvas>
</div>
<input type="text" value="" placeholder="Id de l'animal" id="animalId">
<script type="text/javascript">

	var a = document.getElementById('geomap');
	var ctx = a.getContext("2d");
	var image = new Image();
	image.src = '<?php echo $image; ?>';
	image.onload = function() {
		ctx.drawImage(this, 0, 0, <?php echo $width; ?>, <?php echo $height; ?>);
		drawAllPath();
		drawAllAnimals();
	}

	i = document.getElementById('animalId');
	i.addEventListener('change',function(e){
		animal.animalId = e.target.value;
		console.log(animal);
	});

	a.addEventListener('click', function(event) {
		elemLeft = event.target.offsetLeft;
		elemTop = event.target.offsetTop;
		x = event.pageX - elemLeft,
			y = event.pageY - elemTop;
		if (animal.animalId) {
			if (animal.x) {
				var xmin = x - 5;
				var xmax = x + 5;
				var ymin = y - 5;
				var ymax = y + 5;
				for (i in pointlist) {
					if ((pointlist[i].x <= xmax) && (pointlist[i].x >= xmin) && (pointlist[i].y <= ymax) && (pointlist[i].y >= ymin)) {
						// ce point est proche du clique => on utilise ses coordonnées comme point de départ
						x = pointlist[i].x;
						y = pointlist[i].y;
						animal.pathX = x;
						animal.pathY = y;
						ctx.beginPath();
						ctx.lineWidth = "3";
						ctx.strokeStyle = "yellow";
						ctx.moveTo(x, y);
						ctx.arc(x, y, 2, 0, 2 * Math.PI);
						ctx.stroke();
						ctx.closePath();
						saveAnimal();
						break;
					}
				}
			} else {
				animal.x = x;
				animal.y = y;
				ctx.beginPath();
				ctx.lineWidth = "3";
				ctx.strokeStyle = "yellow";
				ctx.moveTo(x, y);
				ctx.arc(x, y, 10, 0, 2 * Math.PI);
				ctx.stroke();
				ctx.closePath();

			}
		}
	});

	function saveAnimal(){
		options = {method: 'POST', headers: {'Content-Type': 'application/json;charset=utf-8'},body: JSON.stringify(animal)};
		fetch('linkanimals.php?action=linkanimal', options)
			.then(response => response.json())
			.then(result => traceAllPath(result));
		animal = {};
		document.getElementById('animalId').value="";

	}

	function traceAllPath(list) {
		ctx.drawImage(image, 0, 0, <?php echo $width; ?>, <?php echo $height; ?>);
		animallist = list;
		drawAllPath();
		drawAllAnimals();
	}

	function drawAllAnimals(){
		for (id in animallist){
			tmpanimal = animallist[id];
			ctx.beginPath();
			ctx.lineWidth = "3";
			ctx.strokeStyle = "yellow";
			ctx.moveTo(tmpanimal.posX, tmpanimal.posY);
			ctx.arc(tmpanimal.posX, tmpanimal.posY, 10, 0, 2 * Math.PI);
			ctx.stroke();
			ctx.closePath();
		}

	}

	function drawAllPath() {
		for (id in pathlist){
			// afficher le chemin
			chemin = pathlist[id];
			tmppath = JSON.parse(chemin.path);
			ctx.beginPath();
			ctx.lineWidth = "1";
			ctx.strokeStyle ="blue";  // This path is green.
			for (let i = 0; i < tmppath.length; i++) {
				if (i==0) {
					ctx.moveTo(tmppath[i].x, tmppath[i].y);
				} else {
					ctx.lineTo(tmppath[i].x, tmppath[i].y);
				}
			}
			ctx.stroke();
			ctx.closePath();
			// afficher le point start
			ctx.beginPath();
			ctx.lineWidth = "3";
			ctx.strokeStyle ="red";
			ctx.moveTo(chemin.startX, chemin.startY);
			ctx.arc( chemin.startX, chemin.startY,2 , 0, 2 * Math.PI);
			ctx.stroke();
			ctx.closePath();
			pointlist.push({'x':chemin.startX,'y':chemin.startY});
			// afficher le point stop
			ctx.beginPath();
			ctx.lineWidth = "3";
			ctx.strokeStyle ="red";
			ctx.moveTo(chemin.endX, chemin.endY);
			ctx.arc( chemin.endX, chemin.endY,2 , 0, 2 * Math.PI);
			ctx.stroke();
			ctx.closePath();
			pointlist.push({'x':chemin.endX,'y':chemin.endY});
		}
	}

</script>

</body>
</html>

<?php


?>
