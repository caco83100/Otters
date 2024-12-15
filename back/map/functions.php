<?php

/**
 * Evaluate the total length for the $path given in parameters
 *
 * @param array $path 	array of point of the path
 * @return float		total length
 */
function calculDistance(array $path):float{
	$length = 0;

	foreach ($path as $step => $pathItem){
		if ($step>0)
		{
			$a = $pathItem['x']-$previous['x'];
			$b = $pathItem['y']-$previous['y'];
			$length += sqrt(($a*$a)+($b*$b));
		}
		$previous=$pathItem;
	}
	return $length;
}

function getNodeList(array $paths):array{
	$nodeList = array();

	foreach($paths as $path){
		if (isset($nodeList[$path->startX][$path->startY])){
			$nodeList[$path->startX][$path->startY]++;
		} else {
			$nodeList[$path->startX][$path->startY]=1;
		}

		if (isset($nodeList[$path->endX][$path->endY])){
			$nodeList[$path->endX][$path->endY]++;
		} else {
			$nodeList[$path->endX][$path->endY]=1;
		}

	}
	return $nodeList;
}

