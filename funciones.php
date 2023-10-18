<?php

//Obtener opciones de regiones desde la base de datos
function select_region(){
    //Incluir el archivo de conexión
    include 'conexion/conexion.php';

    //Consulta SQL
    $sql = "SELECT id, nombre_region FROM region";
    $result = $conn->query($sql);

    //Inicializar de forma predeterminada
    $options = "<option value='0'>-- SELECCIONE --</option>";

    //Obtener los datos e ingresarlos al select
    while ($row = $result->fetch_assoc()) {
        $options .= "<option value='{$row['id']}'>{$row['nombre_region']}</option>";
    }

    //Devolver las opciones
    return $options;

    $conn->close();
}

//Obtener opciones de candidatos desde la base de datos
function select_candidatos(){
    //Incluir el archivo de conexión
    include 'conexion/conexion.php';

    //Consulta SQL
    $sql = "SELECT id, nombre_candidato FROM candidatoS";
    $result = $conn->query($sql);

    //Inicializar de forma predeterminada
    $options = "<option value='0'>-- SELECCIONE --</option>";

    //Obtener los datos e ingresarlos al select
    while ($row = $result->fetch_assoc()) {
        $options .= "<option value='{$row['id']}'>{$row['nombre_candidato']}</option>";
    }

    //Devolver las opciones
    return $options;

    $conn->close();
}
?>