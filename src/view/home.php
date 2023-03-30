<!DOCTYPE html>
<html lang="es">
<?php
require '../controller/regionController.php';
require '../controller/candidatoController.php';
require '../controller/encuestaController.php';
?>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Votación</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="#">Formulario</a></li>
                <li><a href="#">Ver votaciones</a></li>
                <li><a href="#">Información</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <h1>Formulario de votación</h1>
        <form autocomplete="off"  action="../controller/guardarController.php" method="post">
            <fieldset>
                <legend>Datos para la votación</legend>
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required maxlength="30" autofocus>
                <br>
                <label for="apellido">Apellido:</label>
                <input type="text" id="apellido" name="apellido" required maxlength="30">
                <br>
                <label for="alias">Alias:</label>
                <input type="text" id="alias" name="alias" required maxlength="20">
                <br>
                <label for="rut">RUT:</label>
                <input type="text" id="rut" name="rut" required maxlength="12">
                <br>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required maxlength="35">
                <br>
                <label for="region">Región:</label>
                <select id="region" name="region" required onchange="getComunas()">
                    <option value="0">Seleccione una región</option>
                    <?php while ($row = pg_fetch_assoc($resultRegion)): ?>
                        <option value="<?php echo $row['id']; ?>"><?php echo $row['nombre']; ?></option>
                    <?php endwhile; ?>
                </select>
                <br>
                <label for="comuna">Comuna:</label>
                <select id="comuna" name="comuna" required></select>
                <br>
                <label for="candidato">Candidato:</label>
                <select id="candidato" name="candidato" required>
                    <?php while ($line = pg_fetch_assoc($resultCandidato)): ?>
                        <option value="<?php echo $line['id']; ?>"><?php echo $line['nombre']; ?></option>
                    <?php endwhile; ?>
                </select>
                <br>
				<label>Como se entero de Nosotros:</label>
				<?php
				while ($row = pg_fetch_assoc($resultEncuesta)) {
					echo "<input type='checkbox' name='opciones[]' value='".$row['id']."'>".$row['nombre']."</input>";
				}
				?>
				<br><br>
				<input type="submit" value="Votar">
			</fieldset>
		</form>
	</div>
	<div class="footer"></div>

</body>
</html>
<script src="../public/js/script.js" ></script>
