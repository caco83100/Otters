<?php
include 'database.php';


$db = getDBInstance();

if (isset($_GET['action']) && ($_GET['action']=="initmap")) { 


	$image = "../../assets/parc-animalier-la-barben-Plan-visiteur.png";
	$pathlist = selectDB('geo_path');
	$jsonpathlist = array();
	foreach ($pathlist as $path) {
		$jsonpathlist[$path->pathId] = $path;
	}
	$animallist = selectDB('geo_animals');
	list($width, $height, $type, $attr) = getimagesize($image);
	$ratio = $width / $height;
	$finalwidth = 900;
	$finalheight = $finalwidth / $ratio;

	$scale = $finalwidth / $width;

	$result = array(
		'image' => '../../assets/parc-animalier-la-barben-Plan-visiteur.png',
		'scale' => $scale,
		'width' => $finalwidth,
		'height' => $finalheight,
		'animallist' => $animallist,
		'pathlist' => $jsonpathlist
	);
	echo json_encode($result);
	exit;
}

// Création de l'itineraire entre deux annimaux

$startAnimalId = $_GET['start'];
$endAnimalId = $_GET['end'];

$itineraires = array();
$pathblacklist = array();

// récupère les coordonnées pathX et pathY des deux animaux
$sql = "SELECT * FROM geo_animals WHERE animalId=$startAnimalId ";
$resql = $db->query($sql);
$row = $resql->fetch_object();
$startX=$row->pathX;
$startY=$row->pathY;
$sql = "SELECT * FROM geo_animals WHERE animalId=$endAnimalId ";
$resql = $db->query($sql);
$row = $resql->fetch_object();
$endX=$row->pathX;
$endY=$row->pathY;


// Appel de la fonction récurcive
recursivePath($startX,$startY,$endX,$endY);
recursivePath($endX,$endY,$startX,$startY);
$shortest = null;
foreach($itineraires as $itineraire){
	if (is_null($shortest)) {
		$shortest = $itineraire;
	} elseif ($shortest['distance'] >= $itineraire['distance']) {
		$shortest = $itineraire;
	}
}
echo json_encode($shortest['chemin']);
exit;


function recursivePath($startX,$startY,$endX,$endY, $posX = null,$posY =null, $path = array(), $length=0,$level=0) {
	global $db, $itineraires,$pathblacklist;
	if (is_null($posX)){
//		echo "point de départ\n";
//		echo "$startX $startY\n";
		$posX = $startX;
		$posY = $startY;
	}

	if (($posX == $endX) && ($posY == $endY)) {
//		echo "itinéraires valide\n";
		$itineraires[] = array('distance'=>$length,'chemin'=> $path);
		return true;
	}

//	echo "$level recherche prochaines possibilités $posX $posY\n";
	// Cherche les chemins ayant un point d'arrivée ou de départ avec posX et posY et n'étant pas déjà présent dans $path
	$sql = "SELECT * FROM geo_path WHERE ((startX=$posX AND startY=$posY) OR (endX=$posX AND endY=$posY))";
	if ((count($path)>0) || (count($pathblacklist)>0)) {
		$exclude = array();
		$exclude = array_merge($path,$pathblacklist);
		$sql .= " AND pathId NOT IN (".implode(',',$exclude)."); ";
	}
//	echo $sql."\n";
	$resql = $db->query($sql);
	// Si aucune chemin retourné return false;
	if ($resql->num_rows == 0) {
//		echo $sql."\n";
//		echo "ce chemin est une impasse\n";
		return false;
	}
	// pour chaque chemin trouvés rappeler recursivePath avec posX et posY avec la valeur de l'autre extérmité du chemin
//	echo "Nombre de possibilité : ".$resql->num_rows."\n";
	while ($row = $resql->fetch_object()) {
		$tmppath = array_merge($path,array($row->pathId));
//		$path[]=$row->pathId;
		$tmplength = $length + $row->length;
		if (($posX == $row->startX) && ($posY == $row->startY)) {
			$tmpposX = $row->endX;
			$tmpposY = $row->endY;
		} else {
			$tmpposX = $row->startX;
			$tmpposY = $row->startY;
		}
//		echo $level;

//		for($i=0; $i<$level; $i++){
//			echo "--";
//		}
//		echo "{$row->pathId} - $posX $posY\n";
		$result = recursivePath($startX,$startY,$endX,$endY,$tmpposX,$tmpposY,$tmppath,$tmplength,($level+1));
		if ($result === false){
			$pathblacklist[]=$row->pathId;
		}
	}



}
