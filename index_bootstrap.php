<?php
    include_once('funciones.php');

    //Obtiene el select con la data consultada en la db
    $selectRegion = select_region();
    $selectCandidatos = select_candidatos();
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Votación</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .form-container {
            border: 1px solid #808080;
            border-radius: 10px;
            padding: 20px;
            width: 40%;
            margin: auto;
            margin-top: 20px;
        }

        .row {
            display: flex;
            margin-bottom: 10px;
        }

        label {
            width: 400px;
            text-align: left;
            margin-right: 10px;
        }

        input[type="text"] {
            width: 100%;
        }

        select {
            width: 100%;
        }

        .center-button {
            display: block;
            margin: 0 auto;
        }
    </style>
</head>
<body>

    <h3 class="text-center" style="padding-top: 20px;">Formulario de Votaci&oacute;n:</h3>

    <div class="container form-container">
        <div class="row">
            <label for="input_nombreApellido">Nombre y Apellido</label>
            <input class="form-control" type="text" id="input_nombreApellido" name="input_nombreApellido" placeholder="Ingrese Nombre y Apellido" onkeypress="return soloLetras(event)">
        </div>

        <div class="row">
            <label for="input_alias">Alias <span id="aliasError"></span></label>
            <input class="form-control" type="text" id="input_alias" name="input_alias" placeholder="Ingrese Alias">
        </div>

        <div class="row">
            <label for="input_rut">RUT <span id="rutError" class="error"></span></label>
            <input class="form-control" type="text" id="input_rut" name="input_rut" placeholder="XX.XXX.XXX-X" oninput="validateRut(this.value)">
        </div>

        <div class="row">
            <label for="input_email">Email <span id="emailOK"></span></label>
            <input class="form-control" type="text" id="input_email" name="input_email" placeholder="Ingrese Email">
        </div>

        <div class="row">
            <label for="select_region">Regi&oacute;n</label>
            <select class="form-control" id="select_region" name="select_region" onchange="obtenerComuna(this.value);">
                <?php echo $selectRegion ?>
            </select>
        </div>

        <div class="row">
            <label for="select_comuna">Comuna</label>
            <select class="form-control" id="select_comuna" name="select_comuna">
                <option value="0">-- SELECCIONE --</option>
            </select>
        </div>

        <div class="row">
            <label for="select_candidato">Candidato</label>
            <select class="form-control" id="select_candidato" name="select_candidato">
                <?php echo $selectCandidatos ?>
            </select>
        </div>

        <div class="row">
            <label for="alias">Como se enter&oacute; de Nosotros</label>
            <div class="col-sm-8">
                <div class="form-check form-check-inline">
                    <input type="checkbox" class="form-check-input" id="check_web" name="check_web" value="web">
                    <label class="form-check-label" for="check_web">Web</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="checkbox" class="form-check-input" id="check_tv" name="check_tv" value="tv">
                    <label class="form-check-label" for="check_tv">TV</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="checkbox" class="form-check-input" id="check_redesSociales" name="check_redesSociales" value="redes_sociales">
                    <label class="form-check-label" for="check_redesSociales">Redes Sociales</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="checkbox" class="form-check-input" id="check_amigos" name="check_amigos" value="amigos">
                    <label class="form-check-label" for="check_amigos">Amigos</label>
                </div>
            </div>
        </div>

        <button class="btn btn-success center-button" type="button" onclick="enviarFormulario()">Votar</button>
    </div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>
    //Funcion para ingresar solo letras, no numeros tampoco caracteres
    function soloLetras(e) {
        var key = e.keyCode || e.which,
            tecla = String.fromCharCode(key).toLowerCase(),
            letras = " áéíóúabcdefghijklmnñopqrstuvwxyz",
            especiales = [8, 37, 39, 46],
            tecla_especial = false;

        for (var i in especiales) {
            if (key == especiales[i]) {
            tecla_especial = true;
            break;
            }
        }

        if (letras.indexOf(tecla) == -1 && !tecla_especial) {
            return false;
        }
    }

    //Valida email ingresado
    document.getElementById('input_email').addEventListener('input', function() {
        campo = event.target;
        valido = document.getElementById('emailOK');

        if (!campo.value.trim()) {
            valido.innerText = ""; // Dejar el mensaje vacío
            return; // Salir de la función si el campo está vacío
        }

        emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;

        if (emailRegex.test(campo.value)) {
            valido.innerText = " - Válido";
            valido.style.color = "green";
        } else {
            valido.innerText = " - Inválido";
            valido.style.color = "red";
        }
    });

    //Valida rut ingresado y le da formato
    function validateRut(rut) {
        if (!rut || rut.trim() === '') {
            var rutError = document.getElementById('rutError');
            rutError.textContent = '';
            return; // Salir de la función si el RUT está vacío
        }
        // Eliminar puntos y guión del RUT
        rut = rut.replace(/\./g, '').replace(/-/g, '');

        // Separar dígitos verificadores
        var rutDigits = rut.slice(0, -1);
        var verificador = rut.slice(-1).toUpperCase();

        // Calcular dígito verificador esperado
        var suma = 0;
        var multiplo = 2;

        for (var i = rutDigits.length - 1; i >= 0; i--) {
            suma += parseInt(rutDigits.charAt(i)) * multiplo;
            multiplo = multiplo === 7 ? 2 : multiplo + 1;
        }

        var resto = suma % 11;
        var dvEsperado = 11 - resto;

        if (dvEsperado === 10) dvEsperado = 'K';
        if (dvEsperado === 11) dvEsperado = '0';

        // Validar RUT
        var rutValido = verificador === dvEsperado.toString();

        // Mostrar mensaje de error
        var rutError = document.getElementById('rutError');
        rutError.textContent = rutValido ? '- Válido' : '- Inválido';
        rutError.style.color = rutValido ? 'green' : 'red';
    }

    //Valida alias dejando mayores de 5 caracteres aceptando letras y numeros
    document.getElementById('input_alias').addEventListener('input', function() {
        var alias = this.value;

        if (!alias.trim()) {
            document.getElementById('aliasError').textContent = '';
            return; //Salir de la función si el campo está vacío
        }

        if (alias.length > 5 && /^[a-zA-Z0-9]+$/.test(alias)) {
            document.getElementById('aliasError').textContent = '';
            document.getElementById('aliasError').style.color = "green";
        } else {
            document.getElementById('aliasError').textContent = '- Debe tener al menos 6 caracteres y contener solo letras y números.';
            document.getElementById('aliasError').style.color = "red";
        }
    });

    //Rellena las comunas respecto al valor seleccionado en la region
    function obtenerComuna(value) {
        $.ajax({
            type: 'POST',
            data: {
                region: value
            },
            url: "ajax/obtener_comunas.php",
            dataType: 'HTML',
        }).done(function(response) {
            //Limpia el select_comuna para agregar nuevas comunas
            $("#select_comuna").empty();
            $("#select_comuna").append(response);
        });
    }

    //Guarda los datos obtenidos en el formulario
    function enviarFormulario(){
        var nombreApellido = $("#input_nombreApellido").val();
        var alias = $("#input_alias").val();
        var rut = $("#input_rut").val();
        var email = $("#input_email").val();
        var region = $("#select_region").val();
        var comuna = $("#select_comuna").val();
        var candidato = $("#select_candidato").val();

        //Se contruye un array para guardar la informacion seleccionada en todos los checkbox
        var comoSeEntero = [];

        if ($("#check_web").is(":checked")) {
            comoSeEntero.push("Web");
        }
        if ($("#check_tv").is(":checked")) {
            comoSeEntero.push("TV");
        }
        if ($("#check_redesSociales").is(":checked")) {
            comoSeEntero.push("Redes Sociales");
        }
        if ($("#check_amigos").is(":checked")) {
            comoSeEntero.push("Amigos");
        }

        //Valida que se seleccionen 2 tipos de opciones
        if (comoSeEntero.length < 2) {
            alert("Selecciona al menos dos opciones como se enteró de nosotros.");
            return;
        }

        //Nombre Apellido deben ser obligatorios para ingresar los datos.
        if(nombreApellido == ''){
            alert("El campo Nombre y Apellido deben estar ingresados para guardar el voto.");
            return;
        }else{
            $.ajax({
                type: 'POST',
                data: {
                    nombreApellido: nombreApellido,
                    alias: alias,
                    rut: rut,
                    email: email,
                    region: region,
                    comuna: comuna,
                    comoSeEntero: comoSeEntero,
                    candidato: candidato
                },
                url: "ajax/guardar_voto.php",
                dataType: 'HTML',
            }).done(function(response) {
                if(response == 'Error: El rut ya está registrado en la base de datos.'){
                    Swal.fire(
                        'Voto no se guardo!',
                        response,
                        'warning'
                    )
                }else{
                    Swal.fire(
                        'Voto agregado!',
                        response,
                        'success'
                    )
                    //Limpia el formulario si lo ingresa
                    $("#input_nombreApellido").val('');
                    $("#input_alias").val('');
                    $("#input_rut").val('');
                    $("#input_email").val('');
                    $("#select_region").val(0);
                    $("#select_comuna").val(0);
                    $("#check_web").prop('checked', false);
                    $("#check_tv").prop('checked', false);
                    $("#check_redesSociales").prop('checked', false);
                    $("#check_amigos").prop('checked', false);
                }
            });
        }

    }
</script>
</body>
</html>