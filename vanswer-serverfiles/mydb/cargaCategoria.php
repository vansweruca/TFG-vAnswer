<?php
$server = "127.0.0.1";
$username = "root";
$password = "";
$db = "vanswer";

$connect = new mysqli($server,$username,$password,$db);

//Comprobar conexion:
if(!$connect){
	die("Conexion fallida.". mysqli_connect_error());
}

$sql = "SELECT nombre from categoria";
$result = mysqli_query($connect, $sql);


if(mysqli_num_rows($result) > 0){
	//Mostrar resultados:
	while($row = mysqli_fetch_assoc($result)){
		echo utf8_encode($row['nombre']).";";
	}
}
?>
