<?php
require_once ('../../config/bd.php');
$conn = conexion();
session_start();

// Validar que se haya enviado el formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

  // Validar nombre y apellido
  if (empty($_POST['nombre']) || empty($_POST['apellido'])) {
      echo "Por favor ingrese su nombre y apellido.";
      exit;
  }

  // Validar alias
  if (strlen($_POST['alias']) < 5 || !preg_match('/^[a-zA-Z0-9]+$/', $_POST['alias'])) {
      echo "El alias debe tener al menos 5 caracteres y contener solo letras y números.";
      exit;
  }

  // Validar correo electrónico
  if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
      echo "Por favor ingrese un correo electrónico válido.";
      exit;
  }

  // Validar selección de opciones
  if (empty($_POST['opciones']) || count($_POST['opciones']) < 2) {
      echo "Por favor seleccione al menos dos opciones.";
      exit;
  }

  // Validar que no se hayan ingresado más de una vez el mismo RUT
  $rut = $_POST['rut'];
  $query = "SELECT COUNT(*) FROM votante WHERE rut = '$rut'";
  $result = pg_query($conn, $query);
  $count = pg_fetch_result($result, 0, 0);
  if ($count > 0) {
      echo "Ya se ha registrado un voto con este RUT.";
      exit;
  }

  // Validar formato de RUT chileno
  $rut = preg_replace('/[^0-9kK]/', '', $_POST['rut']);
  if (strlen($rut) != 8 && strlen($rut) != 9) {
      echo "Por favor ingrese un RUT válido.";
      exit;
  }
  $rut = str_pad($rut, 9, '0', STR_PAD_LEFT);
  $dv = substr($rut, -1);
  $body = substr($rut, 0, -1);
  $sum = 0;
  $factor = 2;
  for ($i = strlen($body) - 1; $i >= 0; $i--) {
      $sum += $factor * $body[$i];
      $factor = $factor == 7 ? 2 : $factor + 1;
  }
  $dv_calculated = 11 - ($sum % 11);
  $dv_calculated = $dv_calculated == 11 ? 0 : ($dv_calculated == 10 ? 'K' : $dv_calculated);
  if (strtoupper($dv) != strtoupper($dv_calculated)) {
      echo "Por favor ingrese un RUT válido.";
      exit;
  }

  // Si llegamos hasta aquí, el formulario es válido
  // Procesar los datos del formulario
  $nombre = $_POST["nombre"];
  $apellido = $_POST["apellido"];
  $alias = $_POST["alias"];
  $rut = $_POST["rut"];
  $email = $_POST["email"];
  $comuna = $_POST["comuna"];
  $candidato = $_POST["candidato"];
  $encuestas = $_POST["opciones"];


  // Insertamos los datos del voto en la tabla de votos
  $sql = "INSERT INTO votante (nombre, apellido, alias, rut, email, comuna_id, candidato_id) 
          VALUES ('$nombre', '$apellido', '$alias', '$rut', '$email', '$comuna', '$candidato')";
  $resultado = pg_query($conn, $sql);

  // Obtenemos el ID del voto insertado
    $votante_id_query = pg_query_params($conn, 'SELECT id FROM votante WHERE rut = $1', array($rut));
    $votante_id = pg_fetch_result($votante_id_query, 0, 0);

  // Insertamos las encuesta seleccionadas en la tabla de encuesta
  foreach ($encuestas as $encuesta) {
    $sql = "INSERT INTO encuesta_votante (votante_id, encuesta_id) VALUES ('$votante_id', '$encuesta')";
    pg_query($conn, $sql);
  }
  
  $_SESSION['acept'] = "Se ha registrado su voto corectamente";
  header("location:../view/home.php");
  exit();
}

?>