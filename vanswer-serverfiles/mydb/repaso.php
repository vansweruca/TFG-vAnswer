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

$tem = utf8_decode($_REQUEST["tematica"]);
$usu = utf8_decode($_REQUEST["usuario"]);
$tipo = utf8_decode($_REQUEST["tipo"]);

//$sql = "DELETE from repaso WHERE usuario = '".$usuario."' and tematica = '".$tema."' and pregunta_id = '".$idP."'";
$sql1 = "SELECT pregunta_id from repaso where usuario = '".$usu."' and tematica = '".$tem."'";
$result1 = mysqli_query($connect, $sql1);
$recordIdCount = mysqli_num_rows($result1);
if($recordIdCount!=0){echo $recordIdCount.";";}
if($recordIdCount == 0){ echo '99'; return;}

if($tipo == 0){
	if(mysqli_num_rows($result1) > 0){
		while($fg = mysqli_fetch_assoc($result1)){


	$sql = "SELECT id, titulo, vof FROM pregunta where id = '".$fg['pregunta_id']."' and (tipo = '0' or tipo = '1')";
	$result = mysqli_query($connect, $sql);
	$totalPreguntas = count($result);
	//echo $totalPreguntas. ";";

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
     }
}

if($tipo == 1){
        if(mysqli_num_rows($result1) > 0){
                while($fg = mysqli_fetch_assoc($result1)){


        $sql = "SELECT id, titulo, vof FROM pregunta where id = '".$fg['pregunta_id']."' and (tipo = '1' or tipo = '2')";
        $result = mysqli_query($connect, $sql);
        $totalPreguntas = count($result);
        //echo $totalPreguntas. ";";

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
     }
}

?>
