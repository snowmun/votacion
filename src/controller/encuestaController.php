<?php
require_once ('../../config/bd.php');
$conn = conexion();

if (!$conn) {
    echo "Error al conectar a la base de datos";
    exit();
}

$sql = "SELECT id, nombre FROM encuesta ORDER BY nombre ASC";
$resultEncuesta = pg_query($conn, $sql);

if (!$resultEncuesta) {
    echo "Error al obtener los datos de la tabla: " . pg_last_error($conn);
    exit();
}

?>