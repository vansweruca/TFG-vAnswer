<?php

//Variables conexion:
$servername = "127.0.0.1";
$server_username = "root";
$server_password = "";
$db = "vanswer";

//Variables del cliente
//$clave = $_POST["clavePost"];
$usuario = utf8_decode($_POST["usuarioP"]);
$idP = $_POST["idPost"];
$tema = utf8_decode($_POST["temaPost"]);

$connect = new mysqli($servername,$server_username,$server_password,$db);

//Comprobar conexion:
if(!$connect){
	die("Conexion fallida.". mysqli_connect_error());
}

// Insertar aciertos:

//$sql = "INSERT INTO usuario (clave, aciertos) VALUES ('".$clave."', '0') ON DUPLICATE KEY UPDATE clave = '".$clave."'";
$sql = "INSERT INTO repaso (usuario, tematica, pregunta_id) VALUES ('".$usuario."', '".$tema."', '".$idP."')";

$result = mysqli_query($connect, $sql);

if($result){
	echo "Proceso correcto.";
}
else{
	echo "Error.".mysqli_error($connect);
}

?>
