<?php

include '../conexion/conexion.php';

//Obtener los datos del formulario POST y limpiarlos
$nombreApellido = trim($_POST["nombreApellido"]);
$alias = trim($_POST["alias"]);
$rut = trim($_POST["rut"]);
$rut = preg_replace("/[^0-9kK]/", "", $rut); //dejar numeros y k de rut
$email = trim($_POST["email"]);
$region = trim($_POST["region"]);
$comuna = trim($_POST["comuna"]);
$comoSeEnteroArray = $_POST["comoSeEntero"];
$comoSeEntero = implode(', ', $comoSeEnteroArray); // convertir en string
$id_candidato = $_POST["candidato"];

//Validar si el rut ya está registrado en la base de datos
$check_rut_sql = "SELECT COUNT(*) as count FROM usuarios WHERE rut = '$rut'";
$check_rut_result = $conn->query($check_rut_sql);
$check_rut_row = $check_rut_result->fetch_assoc();

//Iniciar mensaje
if ($check_rut_row['count'] > 0) {
    $mensaje = "Error: El rut ya está registrado en la base de datos.";
} else {
    //Si el rut no está registrado, realizar la inserción en la tabla 'usuarios'
    $sql = "INSERT INTO usuarios (nombre_apellido,
                                alias,
                                rut,
                                email,
                                activo,
                                conocimiento_usuario,
                                id_comuna)
                        VALUES ('$nombreApellido',
                                '$alias',
                                '$rut',
                                '$email',
                                1,
                                '$comoSeEntero',
                                $comuna)";

    if ($conn->query($sql) === TRUE) {
        //Obtener el id que recie se inserto
        $id_usuario = $conn->insert_id;

        //Isertar el voto en la tabla 'voto'
        $sql_insert_voto = "INSERT INTO votos (id_usuario,
                                                id_candidato)
                                        VALUES ($id_usuario,
                                                $id_candidato)";

        if ($conn->query($sql_insert_voto) === TRUE) {
            $mensaje = "Voto registrado con éxito.";
        } else {
            $mensaje = "Error al registrar el voto en la tabla de votos: " . $conn->error;
        }
    } else {
        $mensaje = "Error al registrar el voto: " . $conn->error;
    }
}

echo $mensaje;

$conn->close();
?>