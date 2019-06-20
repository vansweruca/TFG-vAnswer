<?php

//Variables conexion:
$servername = "127.0.0.1";
$server_username = "root";
$server_password = "";
$db = "vanswer";

//Variables del cliente
//$clave = $_POST["clavePost"];
$tematica = utf8_decode($_POST["temaPost"]);
$usuario = $_POST["usuarioPost"];
$aciertos = $_POST["aciertosPost"];
$total = $_POST["totalPost"];

$connect = new mysqli($servername,$server_username,$server_password,$db);

//Comprobar conexion:
if(!$connect){
	die("Conexion fallida.". mysqli_connect_error());
}

// Insertar aciertos:

//$sql = "INSERT INTO usuario (clave, aciertos) VALUES ('".$clave."', '0') ON DUPLICATE KEY UPDATE clave = '".$clave."'";
$sql = "INSERT INTO calificacion (usuario, tematica, aciertos, total) VALUES ('".$usuario."', '".$tematica."', '".$aciertos."', '".$total."')";

$result = mysqli_query($connect, $sql);

if($result){
	echo "Proceso correcto.";
}
else{
	echo "Error.".mysqli_error($connect);
}

?>
