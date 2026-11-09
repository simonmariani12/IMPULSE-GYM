
<?php
$plan = $_GET["plan"] ?? "";
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscripción exitosa | Impulso Gym</title>
    <link rel="stylesheet" href="estilos.css?v=3">
</head>
<body>

<header class="encabezado">
    <div class="contenedor barra">
        <a class="logo" href="index.html">
            IMPULSO <span>GYM</span>
        </a>
    </div>
</header>

<main>
    <section class="seccion">
        <div class="contenedor">
            <div class="confirmacion">

                <h1>¡Inscripción exitosa!</h1>

                <p>
                    Tus datos fueron registrados
                    correctamente en Impulso Gym.
                </p>

                <?php if ($plan == "2" || $plan == "3") { ?>
                    <p>
                        Para coordinar tus actividades
                        y horarios, comunicate con
                        atención al cliente.
                    </p>

                    <button class="boton-whatsapp"
                        onclick="alert('Demostración: aquí se abriría WhatsApp para coordinar tus actividades.')">
                        Consultar por WhatsApp
                    </button>
                <?php } ?>

                <div>
                    <a href="index.html" class="boton">
                        Volver al inicio
                    </a>
                </div>

            </div>
        </div>
    </section>
</main>

</body>
</html>
