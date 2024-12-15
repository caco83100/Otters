<?php

include_once 'database.php';
include_once 'functions.php';

$image = "assets/parc-animalier-la-barben-Plan-visiteur.png";

if (isset($_REQUEST['action'])&&($_REQUEST['action']=="savepath"))
{
	// Enregistre le chemin en bdd

	$path = json_decode(file_get_contents('php://input'), true);

	$length = calculDistance($path);

	$id = DBInsert('geo_path',array(
		'startX'=>$path[0]['x'],
		'startY'=>$path[0]['y'],
		'endX'=>$path[count($path)-1]['x'],
		'endY'=>$path[count($path)-1]['y'],
		'path'=>json_encode($path),
		'length'=>$length
	));
	$pathlist = selectDB('geo_path');
	$nodelist = getNodeList($pathlist);
	echo json_encode(array('path'=>$pathlist,'nodes'=>$nodelist),true);
	exit;
}


// Load each point and path when you refresh the map
$listbdd = selectDB('geo_path');
$pathlist = json_encode($listbdd,true);
$nodelist = json_encode(getNodeList($listbdd),true);

list($width, $height, $type, $attr) = getimagesize($image);


?>


<html>
<head>
	<script type="text/javascript">
		var path = [];
		var pathlist = <?php echo $pathlist; ?>;
		var pointlist = [];
		var nodelist = <?php echo $nodelist; ?>;

	</script>
</head>
<body>
<div>
	<canvas id="geomap" width="<?php echo $width; ?>" height="<?php echo $height; ?>">
	</canvas>
	<button id="add" type="submit">Ajouter chemin</button>
</div>
<div>
	<table>
		<tr>
			<td>PathId</td>
			<td>From X,Y</td>
			<td>To X,Y</td>
			<td>Chemin</td>
		</tr>
		<tbody id="liste"></tbody>
	</table>
</div>
<script type="text/javascript">

	var a = document.getElementById('geomap');
	var ctx = a.getContext("2d");
	var image = new Image();
	image.src = '<?php echo $image; ?>';
	image.onload = function() {
		ctx.drawImage(this, 0, 0, <?php echo $width; ?>, <?php echo $height; ?>);
		drawAllPath();
	}

	a.addEventListener('click', function(event) {
		elemLeft = event.target.offsetLeft;
		elemTop = event.target.offsetTop;
		x = event.pageX - elemLeft,
		y = event.pageY - elemTop;
		existingpoint = false;
		endingpoint = false;
		// C'est une début de chemin nous recherchons si le point cliqué est commun avec un autre chemin pour mettre les coordonnées exactes
		var xmin = x-5;
		var xmax = x+5;
		var ymin = y-5;
		var ymax = y+5;
		for (i in pointlist) {
			if ((pointlist[i].x<=xmax) && (pointlist[i].x>=xmin) && (pointlist[i].y<=ymax) && (pointlist[i].y>=ymin))
			{
				// ce point est proche du clique => on utilise ses coordonnées comme point de départ
				console.log("valeur avant modif x="+x+" y="+y);
				x = pointlist[i].x;
				y = pointlist[i].y;
				console.log("valeur après modif x="+x+" y="+y);
				existingpoint = true;
				if (path.length != 0) { endingpoint = true; }
				break;
			}
		}
		path.push({'x':x, 'y':y});
		tracePath(path);
		if (endingpoint==true){
			savePath();
		}
	}, false);

	function tracePath(path)
	{
		var a = document.getElementById('geomap');
		var ctx = a.getContext("2d");
		if (path.length>1)
		{
			ctx.beginPath();     // Start a new path.
			ctx.lineWidth = "3";
			ctx.strokeStyle = "green";  // This path is green.
			for (let i = 0; i < path.length; i++) {
				if (i==0) {
					ctx.moveTo(path[i].x, path[i].y);
				} else {
					ctx.lineTo(path[i].x, path[i].y);
				}
			}
			ctx.stroke();
			ctx.closePath();
		}
	}

	function savePath(){
		options = {method: 'POST', headers: {'Content-Type': 'application/json;charset=utf-8'},body: JSON.stringify(path)};
		fetch('tracepath.php?action=savepath', options)
			.then(response => response.json())
			.then(result => traceAllPath(result));
		path = [];

	}

	document.getElementById('add').addEventListener('click',savePath);
	document.body.addEventListener('keypress',function(e) {
		if (e.key == "Enter") {
			savePath();
		}
	});

	function traceAllPath(result) {
		ctx.drawImage(image, 0, 0, <?php echo $width; ?>, <?php echo $height; ?>);
		pathlist = result.path;
		nodelist = result.nodes;
		drawAllPath();

	}

	function drawAllPath() {
		pointlist = [];
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
			ctx.strokeStyle ="#000000";
			ctx.fillStyle='#000000';
			ctx.font = "bold 20px Verdana, Arial, serif";
			ctx.textAlign = "center";
			x = ((parseInt(chemin.startX)+parseInt(chemin.endX))/2);
			y = ((parseInt(chemin.startY)+parseInt(chemin.endY))/2);
			ctx.fillText(chemin.pathId,x , y);
			pointlist.push({'x':chemin.startX,'y':chemin.startY});
			pointlist.push({'x':chemin.endX,'y':chemin.endY});
		}

		for (x in nodelist){
			for (y in nodelist[x]){
				console.log(nodelist[x][y]);
				if (nodelist[x][y]==1) {
					ctx.beginPath();
					ctx.lineWidth = "7";
					ctx.strokeStyle ="#FF0000";
					ctx.fillStyle='#FF0000';
					ctx.moveTo(x, y);
					ctx.arc( x, y,5 , 0, 2 * Math.PI);
					ctx.stroke();
					ctx.closePath();
				}
				else {
					ctx.beginPath();
					ctx.lineWidth = "4";
					ctx.strokeStyle ="#00FF00";
					ctx.fillStyle='#00FF00';
					ctx.moveTo(x, y);
					ctx.arc( x, y,3 , 0, 2 * Math.PI);
					ctx.stroke();
					ctx.closePath();
				}
			}
		}

	}

	function getPixelColor(x,y){
		var pixel = ctx.getImageData(x, y, 1, 1);
		var data = pixel.data;
		if (data[0]==255&&data[1]==0&&data[2]==0){
			return true;
		}
		if (data[0]==0&&data[1]==255&&data[2]==0){
			return true;
		}
		return false;


		return data;
	}

</script>

</body>
</html>

<?php


?>
