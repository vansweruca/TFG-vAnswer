<?php

//Variables conexion:
$servername = "127.0.0.1";
$server_username = "root";
$server_password = "";
$db = "vanswer";

//Variables del cliente
$clave = $_POST["clavePost"];

$connect = new mysqli($servername,$server_username,$server_password,$db);

//Comprobar conexion:
if(!$connect){
	die("Conexion fallida.". mysqli_connect_error());
}

// Registro/login usuario:

$sql = "INSERT INTO usuario (clave) VALUES ('".$clave."') ON DUPLICATE KEY UPDATE clave = '".$clave."'";

$result = mysqli_query($connect, $sql);

if($result){
	echo "Proceso correcto.";
}
else{
	echo "Error.".mysqli_error($connect);
}

?>
