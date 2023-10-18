<?php
include '../conexion/conexion.php';

//Obtener el valor de la región desde la solicitud POST
$region = $_POST["region"];

$options = "<option value='0'>-- SELECCIONE --</option>";

//Si la región es 0
if($region == 0){
    //Si la región es 0, imprimir las opciones predeterminadas
    echo $options;
} else {
    //Realizar una consulta SQL para obtener las comunas de esa región
    $sql = "SELECT id, nombre_comuna FROM comuna where id_region = $region";
    $result = $conn->query($sql);

    //Construir opciones de selección
    while ($row = $result->fetch_assoc()) {
        $options .= "<option value='{$row['id']}'>{$row['nombre_comuna']}</option>";
    }

    echo $options;
}
$conn->close();
?>