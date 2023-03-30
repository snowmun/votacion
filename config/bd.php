<?php

function conexion(){
    $dbname = 'candidatura';
    $dbuser = 'postgres';
    $dbpass = 'secreta12';
    $dbhost = 'localhost';
    $dbport = '5432';

    $conn = pg_connect("dbname=$dbname user=$dbuser password=$dbpass host=$dbhost port=$dbport");
    if (!$conn) {
        echo "Error de conexión: " . pg_last_error();
        exit;
    }

    return $conn;
}

?>