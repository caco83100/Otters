<?php

/**
 * Create a connected instance of mysqli
 *
 * @return mysqli
 */
function getDBInstance():mysqli {
	// try to connect to database
	include 'conf.php';
	$db = new mysqli($hostname,$user,$password,$database);
	if($db->connect_error) {
		// Stop execution if the connection not work
		echo "Connection Error";
		die();
	}
	// return the mysqli instance
	return $db;
}

/**
 * Insert function in database from an array into the $table name
 *
 * @param string $table		table name to use in the insert into query
 * @param array $array		data to insert into table 'fieldsname' => value to insert
 * @return int				return last insertid
 */
function DBInsert(string $table, array $array): int {
	// get a connected mysqli instance
	$db = getDBInstance();
	// create 2 parts of query (fields list and values list)
	$fields = array();
	$values = array();
	foreach($array as $key => $value) {
		$fields[]="`{$key}`";
		$values[]="'".$db->real_escape_string($value)."'";
	}

	// concat all element in a sql string
	$sql = "INSERT INTO $table (".implode(',',$fields).") VALUES (".implode(',',$values).");";
	$result = $db->query($sql);
	return $db->insert_id;
}

function selectDB(string $table, string $fields = '*', string $where ='', string $orderby = '', string $order = 'ASC'): array {
	$db = getDBInstance();

	// create sql query from function parameters
	$sql = "SELECT $fields FROM $table ";
	if (!empty($where)){
		$sql .= " WHERE $where $orderby $order;";
	}
	// initialize the results variable
	$results = array();
	// execute query
	$resql = $db->query($sql);
	// check if the answer at least 1 row
	if ($resql->num_rows!=0){
		// loop in the answer to create an array of row object
		while ($row = $resql->fetch_object()) {
			$results[] = $row;
		}
	}
	// return table of row or an empty array
	return $results;
}
