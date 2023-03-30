<?php
require_once ('../../config/bd.php');
$conn = conexion();

if (!$conn) {
    echo "Error al conectar a la base de datos";
    exit();
}

$sql = "SELECT id, nombre FROM candidato ORDER BY nombre ASC";
$resultCandidato = pg_query($conn, $sql);

if (!$resultCandidato) {
    echo "Error al obtener los datos de la tabla: " . pg_last_error($conn);
    exit();
}

?>