<?php
//Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$database = "desis";

//Crear una nueva conexión
$conn = new mysqli($servername, $username, $password, $database);

//Verificar si hay errores en la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

$conn->set_charset("utf8");

?>