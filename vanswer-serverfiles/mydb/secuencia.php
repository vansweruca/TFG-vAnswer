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

$tem = utf8_decode($_REQUEST["tematica"]); //Recibe parametro de la categoria elegida por usuario.
$tipo = utf8_decode($_REQUEST["tipo"]);
$modo = utf8_decode($_REQUEST["modo"]);

if($modo == 2){
$sqlmodo = "SELECT id from categoria where nombre = '$tem' and activo = '1'";
$resultmodo = mysqli_query($connect, $sqlmodo);
if(mysqli_num_rows($resultmodo) <= 0){ echo "999"; exit();}
}

$sql1 = "SELECT id from categoria where nombre = '$tem'";
$result1 = mysqli_query($connect, $sql1);
$fila = mysqli_fetch_array($result1);
$idTematica = $fila['id'];

if($tipo == 0){
$sql = "SELECT id, titulo, vof FROM pregunta where categoria_id = '$idTematica' and (tipo = '0' or tipo = '1')";
$result = mysqli_query($connect, $sql);
$totalPreguntas = mysqli_num_rows($result);
echo $totalPreguntas. ";";

if(mysqli_num_rows($result) > 0){

        while($row = mysqli_fetch_assoc($result)){
                if($row['vof'] == ""){

                        echo $row['id'].";".utf8_encode($row['titulo']).";";

                        $idP = $row['id'];
                        $sql2 = "SELECT descripcion, is_correct FROM respuesta where pregunta_id = '$idP'";
                        $result2 = mysqli_query($connect, $sql2);

                        while($row2 = mysqli_fetch_assoc($result2)){
                                echo utf8_encode($row2['descripcion']).";".$row2['is_correct'].";";
                        }

                        echo "\n";
                }else
                echo $row['id'].";".utf8_encode($row['titulo']).";".$row['vof'].";\n";
        }
}

}

if($tipo == 1){
$sql = "SELECT id, titulo, vof FROM pregunta where categoria_id = '$idTematica' and (tipo = '1' or tipo = '2')";
$result = mysqli_query($connect, $sql);
$totalPreguntas = mysqli_num_rows($result);
echo $totalPreguntas. ";";


if(mysqli_num_rows($result) > 0){

	while($row = mysqli_fetch_assoc($result)){
		if($row['vof'] == ""){

			echo $row['id'].";".utf8_encode($row['titulo']).";";

			$idP = $row['id'];
			$sql2 = "SELECT descripcion, is_correct FROM respuesta where pregunta_id = '$idP'";
			$result2 = mysqli_query($connect, $sql2);
			
			while($row2 = mysqli_fetch_assoc($result2)){
				echo utf8_encode($row2['descripcion']).";".$row2['is_correct'].";";
			}

			echo "\n";
		}else
		echo $row['id'].";".utf8_encode($row['titulo']).";".$row['vof'].";\n";
	}
}
}
?>
