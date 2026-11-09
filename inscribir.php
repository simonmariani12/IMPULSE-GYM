
<?php

include("conexion.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $nombre = trim($_POST["nombre"] ?? "");
    $apellido = trim($_POST["apellido"] ?? "");
    $dni = trim($_POST["dni"] ?? "");
    $telefono = trim($_POST["telefono"] ?? "");
    $email = trim($_POST["email"] ?? "");
    $plan = $_POST["plan"] ?? "";

    if ($nombre == "" || $apellido == "" || $telefono == "" ||
        !preg_match('/^[0-9]{7,8}$/', $dni) ||
        !filter_var($email, FILTER_VALIDATE_EMAIL) ||
        !in_array($plan, ["1", "2", "3"], true)) {
        exit("Los datos ingresados no son validos.");
    }

    $consulta = $conexion->prepare(
        "select id_socio from socio where dni = ?"
    );

    $consulta->bind_param("s", $dni);
    $consulta->execute();
    $consulta->store_result();

    if ($consulta->num_rows > 0) {
        exit("Ya existe un socio registrado con ese DNI.");
    }

    $consulta->close();

    $sql = "insert into socio
            (nombre, apellido, dni, telefono, email, fecha_alta, id_plan)
            values (?, ?, ?, ?, ?, curdate(), ?)";

    $consulta = $conexion->prepare($sql);

    $consulta->bind_param(
        "sssssi",
        $nombre,
        $apellido,
        $dni,
        $telefono,
        $email,
        $plan
    );

    if ($consulta->execute()) {
        header("Location: confirmacion.php?plan=" . $plan);
        exit();
    } else {
        echo "No se pudo completar la inscripcion.";
    }

    $consulta->close();
}

$conexion->close();

?>
