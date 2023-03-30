<?php
// Conectarse a la base de datos
require_once('../../config/bd.php');
$dbconn = conexion();

// Obtener el ID de la región seleccionada
$regionId = $_GET['regionId'];

// Obtener las comunas correspondientes a la región
$result = pg_query_params($dbconn, 'SELECT id, nombre FROM comuna WHERE region_id = $1 ORDER BY nombre ASC', array($regionId));

// Crear un array con los resultados
$comunas = array();
while ($row = pg_fetch_assoc($result)) {
    $comunas[] = $row;
}

// Devolver el array en formato JSON
header('Content-Type: application/json');
echo json_encode($comunas);
?>