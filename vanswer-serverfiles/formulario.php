<?php
/* Displays user information and some useful messages */
session_start();

// Check if user is logged in using the session variable
if ( $_SESSION['logged_in'] != 1 ) {
  $_SESSION['message'] = "Debes iniciar sesion antes de ver el portal de gestión!";

  header("location: http://ucalearn.uca.es/admin/");    
}
?>

<?php
        if(($_SESSION['email']) == "vansweruca@gmail.com"){
	header("location: http://ucalearn.uca.es/admin/gestiona.php");
	}
?>

<!DOCTYPE=html>
<meta charset="UTF-8">
<div class="lobster">

<?php 
	$con = mysqli_connect("127.0.0.1", "root", "", "vanswer") or die("Error");
?>

<html>
<head>
	<title> Panel de gestión vAnswer </title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="http://allfont.es/allfont.css?fonts=bodoni">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<div class="lobster dv0">
	<fieldset>
	<h2> Bienvenid@, <?php echo $_SESSION['first_name']." ".$_SESSION['last_name']."." ?> <form method="POST"><input type="submit" name="cerrarSesion" value="Cerrar sesión"></form></h2>
        </fieldset>
	</div>
	 </br>
<?php 
	if(isset($_POST['cerrarSesion'])){
        $_SESSION['logged_in'] = 0;
        echo '<script language="javascript">alert("Sesión cerrada correctamente, redirigiendo al panel de registro/login");</script>';

        header("location: http://ucalearn.uca.es/admin/");
	}  
?>
	<div class="dv1">
	<form method="POST">
	<fieldset>
	<legend>Añadir nuevas temáticas</legend>	
	<label> Temática nueva:</label>
		<input type="text" name="temNuev" placeholder="Escriba el nombre de tematica" required><br/>
	<label> Dirección URL Youtube:</label>	
	<input type="url" name="url" id="url" placeholder="URL del vídeo de Youtube" required><br/>
		<input type="submit" name="insertTem" value="Insertar tematica">
	</fieldset>
	</form>
	</div>

<?php
	if(isset($_POST['insertTem'])){
		$tem = utf8_decode($_POST['temNuev']);
		$uri = $_POST['url'];
                $temi = $_POST['temNuev'];
		$insertTem = "INSERT INTO categoria (nombre, activo) values ('$tem', 0)";
		$addTem = mysqli_query($con, $insertTem);
		$lastid = mysqli_insert_id($con);
		$identificador = $_SESSION['id'];
		$asociaCat = "INSERT INTO asociacatprof (prof_id, cat_id) values ('$identificador', '$lastid')";
		$insertAsoc = mysqli_query($con, $asociaCat);
		if($addTem){
			echo '<script language="javascript">alert("Tematica insertada correctamente");</script>';

		$format = "mp4";
		$fileName = $temi.".mp4";
                
                function removeAccents($str) {
                   $a = array('À', 'Á', 'Â', 'Ã', 'Ä', 'Å', 'Æ', 'Ç', 'È', 'É', 'Ê', 'Ë', 'Ì', 'Í', 'Î', 'Ï', 'Ð', 'Ñ', 'Ò', 'Ó', 'Ô', 'Õ', 'Ö', 'Ø', 'Ù', 'Ú', 'Û', 'Ü', 'Ý', 'ß', 'à', 'á', 'â', 'ã', 'ä', 'å', 'æ', 'ç', 'è', 'é', 'ê', 'ë', 'ì', 'í', 'î', 'ï', 'ñ', 'ò', 'ó', 'ô', 'õ', 'ö', 'ø', 'ù', 'ú', 'û', 'ü', 'ý', 'ÿ', 'Ā', 'ā', 'Ă', 'ă', 'Ą', 'ą', 'Ć', 'ć', 'Ĉ', 'ĉ', 'Ċ', 'ċ', 'Č', 'č', 'Ď', 'ď', 'Đ', 'đ', 'Ē', 'ē', 'Ĕ', 'ĕ', 'Ė', 'ė', 'Ę', 'ę', 'Ě', 'ě', 'Ĝ', 'ĝ', 'Ğ', 'ğ', 'Ġ', 'ġ', 'Ģ', 'ģ', 'Ĥ', 'ĥ', 'Ħ', 'ħ', 'Ĩ', 'ĩ', 'Ī', 'ī', 'Ĭ', 'ĭ', 'Į', 'į', 'İ', 'ı', 'Ĳ', 'ĳ', 'Ĵ', 'ĵ', 'Ķ', 'ķ', 'Ĺ', 'ĺ', 'Ļ', 'ļ', 'Ľ', 'ľ', 'Ŀ', 'ŀ', 'Ł', 'ł', 'Ń', 'ń', 'Ņ', 'ņ', 'Ň', 'ň', 'ŉ', 'Ō', 'ō', 'Ŏ', 'ŏ', 'Ő', 'ő', 'Œ', 'œ', 'Ŕ', 'ŕ', 'Ŗ', 'ŗ', 'Ř', 'ř', 'Ś', 'ś', 'Ŝ', 'ŝ', 'Ş', 'ş', 'Š', 'š', 'Ţ', 'ţ', 'Ť', 'ť', 'Ŧ', 'ŧ', 'Ũ', 'ũ', 'Ū', 'ū', 'Ŭ', 'ŭ', 'Ů', 'ů', 'Ű', 'ű', 'Ų', 'ų', 'Ŵ', 'ŵ', 'Ŷ', 'ŷ', 'Ÿ', 'Ź', 'ź', 'Ż', 'ż', 'Ž', 'ž', 'ſ', 'ƒ', 'Ơ', 'ơ', 'Ư', 'ư', 'Ǎ', 'ǎ', 'Ǐ', 'ǐ', 'Ǒ', 'ǒ', 'Ǔ', 'ǔ', 'Ǖ', 'ǖ', 'Ǘ', 'ǘ', 'Ǚ', 'ǚ', 'Ǜ', 'ǜ', 'Ǻ', 'ǻ', 'Ǽ', 'ǽ', 'Ǿ', 'ǿ', 'Ά', 'ά', 'Έ', 'έ', 'Ό', 'ό', 'Ώ', 'ώ', 'Ί', 'ί', 'ϊ', 'ΐ', 'Ύ', 'ύ', 'ϋ', 'ΰ', 'Ή', 'ή');
                   $b = array('A', 'A', 'A', 'A', 'A', 'A', 'AE', 'C', 'E', 'E', 'E', 'E', 'I', 'I', 'I', 'I', 'D', 'N', 'O', 'O', 'O', 'O', 'O', 'O', 'U', 'U', 'U', 'U', 'Y', 's', 'a', 'a', 'a', 'a', 'a', 'a', 'ae', 'c', 'e', 'e', 'e', 'e', 'i', 'i', 'i', 'i', 'n', 'o', 'o', 'o', 'o', 'o', 'o', 'u', 'u', 'u', 'u', 'y', 'y', 'A', 'a', 'A', 'a', 'A', 'a', 'C', 'c', 'C', 'c', 'C', 'c', 'C', 'c', 'D', 'd', 'D', 'd', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'G', 'g', 'G', 'g', 'G', 'g', 'G', 'g', 'H', 'h', 'H', 'h', 'I', 'i', 'I', 'i', 'I', 'i', 'I', 'i', 'I', 'i', 'IJ', 'ij', 'J', 'j', 'K', 'k', 'L', 'l', 'L', 'l', 'L', 'l', 'L', 'l', 'l', 'l', 'N', 'n', 'N', 'n', 'N', 'n', 'n', 'O', 'o', 'O', 'o', 'O', 'o', 'OE', 'oe', 'R', 'r', 'R', 'r', 'R', 'r', 'S', 's', 'S', 's', 'S', 's', 'S', 's', 'T', 't', 'T', 't', 'T', 't', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'W', 'w', 'Y', 'y', 'Y', 'Z', 'z', 'Z', 'z', 'Z', 'z', 's', 'f', 'O', 'o', 'U', 'u', 'A', 'a', 'I', 'i', 'O', 'o', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'A', 'a', 'AE', 'ae', 'O', 'o', 'Α', 'α', 'Ε', 'ε', 'Ο', 'ο', 'Ω', 'ω', 'Ι', 'ι', 'ι', 'ι', 'Υ', 'υ', 'υ', 'υ', 'Η', 'η');
                   return str_replace($a, $b, $str);
                }  

                $fName = removeAccents($fileName);
               

		shell_exec("youtube-dl -f mp4 $uri -o /var/www/html/descarga/files/'$fName'");
		
		        
		}
	}
?>
	<div class="dv2">
	<form method="POST">
	<fieldset>
	<legend> Cargar preguntas de temáticas</legend>
	<select id="tematica" name="tematica">
		<?php
			$identificador = $_SESSION['id'];
			$catquery = "SELECT cat_id FROM asociacatprof WHERE prof_id = $identificador";
			$rescat = mysqli_query($con, $catquery) or die("Error al consultar".mysql_error());
			while($catTem = mysqli_fetch_array($rescat)){
 			$catId = $catTem['cat_id'];
			$temaquery = "SELECT nombre FROM categoria where id = $catId";
			$resultado = mysqli_query($con, $temaquery) or die("Error al consultar".mysql_error());
			while($filaTem = mysqli_fetch_array($resultado)){
				$titTem = utf8_encode($filaTem['nombre']);
				echo '<option value="'.$titTem.'">'.$titTem.'</option>';
			}
		}
		?>
	</select>
	<input type="submit" value="Cargar preguntas de temática" name="cargaTem"/><br/>
	</fieldset>
	</form>

	<br/>
	
	<?php
                if(isset($_POST['cargaTem'])){
                echo '<table widht="500" border="2" style="background-color: #F9F9F9;">
        <tr>
                <th>ID</th>
                <th>Titulo</th>
                <th>Editar</th>
                <th>Borrar</th>
        </tr>';


                $tt = utf8_decode($_POST['tematica']);
                $cons1 = "SELECT id FROM categoria where categoria.nombre = '$tt'";
                $qq = mysqli_query($con, $cons1);
                $row = mysqli_fetch_array($qq);
                $valor = $row['id'];

                $consulta = "SELECT * FROM pregunta where categoria_id = '$valor'";
            $ejecutar = mysqli_query($con, $consulta);

            $i = 0;
                while($fila = mysqli_fetch_array($ejecutar)){
                        $id = $fila['id'];
                        $titulo = utf8_encode($fila['titulo']);
                        $i++;
        ?>
            <tr align="center">
                <td><?php echo $id; ?></td>
                <td><?php echo $titulo; ?></td>
                <td><a href="formulario.php?editar=<?php echo $id; ?>">Editar</a></td>
                <td><a href="formulario.php?borrar=<?php echo $id; ?>">Borrar</a></td>
            </tr>
            <?php }} ?>
        </table>
	
        <?php

        if(isset($_GET['editar'])){
                include("editar.php");
        }
        ?>
	</div>
        <?php
   
	if(isset($_GET['borrar'])){
                $borrar_id = $_GET['borrar'];
                $borrar = "DELETE from pregunta where id = '$borrar_id'";

                $ejecutar = mysqli_query($con, $borrar);

                if($ejecutar){
                echo '<script language="javascript">alert("Pregunta borrada correctamente");</script>';
                echo '<meta http-equiv="refresh" content="1; URL=formulario.php" />';
                }
        }
        ?>
<br/>	
	<div class="dv3">
        <form method="POST">
        <fieldset>
	<legend> Activar o desactivar exámenes </legend>
	<select id="tematica" name="temat">
                <?php
                       $identificador = $_SESSION['id'];
                        $catquery = "SELECT cat_id FROM asociacatprof WHERE prof_id = $identificador";
                        $rescat = mysqli_query($con, $catquery) or die("Error al consultar".mysql_error());
                        while($catTem = mysqli_fetch_array($rescat)){
                        $catId = $catTem['cat_id'];
                        $temaquery = "SELECT nombre FROM categoria where id = $catId";
                        $resultado = mysqli_query($con, $temaquery) or die("Error al consultar".mysql_error());

                        while($filaTem = mysqli_fetch_array($resultado)){
                                $titTem = utf8_encode($filaTem['nombre']);
                                echo '<option value="'.$titTem.'">'.$titTem.'</option>';
                        }
		   }
          	?>
        </select>
        <input type="submit" value="Activar examen" name="cargaTemat"/>
        <input type="submit" value="Desactivar examen" name="desactTemat"/><br/>        

	</fieldset>
	</form>
	</div>
        <br/>
	
	<div class="dv4">
	<form method="POST">
	<fieldset>
	<legend> Consultar calificaciones de alumnos </legend>
	<select id="tematica" name="temaconsulta">
                <?php
                       $identificador = $_SESSION['id'];
                        $catquery = "SELECT cat_id FROM asociacatprof WHERE prof_id = $identificador";
                        $rescat = mysqli_query($con, $catquery) or die("Error al consultar".mysql_error());
                        while($catTem = mysqli_fetch_array($rescat)){
                        $catId = $catTem['cat_id'];
                        $temaquery = "SELECT nombre FROM categoria where id = $catId";
                        $resultado = mysqli_query($con, $temaquery) or die("Error al consultar".mysql_error());

                        while($filaTem = mysqli_fetch_array($resultado)){
                                $titTem = utf8_encode($filaTem['nombre']);
                                echo '<option value="'.$titTem.'">'.$titTem.'</option>';
                        }
                   }
                ?>
        </select>
	<input type="date" name="fechaConsulta" value="<?php echo date('Y-m-d'); ?>" /><br/>
	<input type="submit" name="consultaCalif" value="Consultar calificaciones"/>
	</fieldset>
	</form>
	
<br/>	
	
	<?php
	if(isset($_POST['consultaCalif'])){
	
	$tematicaCons = $_POST['temaconsulta'];
	$new_date = date('Y-m-d', strtotime($_POST['fechaConsulta']));
	$tematicaCons = urlencode($tematicaCons);	
	$url = "http://ucalearn.uca.es:8080/restLearn-Ldap/rest/service/consulta/$tematicaCons/$new_date";
	$data = file_get_contents($url);
	$response = json_decode($data, true);
				
	echo '<table width="500" border="2" style="background-color: #F9F9F9;">
        <tr>
                <th>Alumno</th>
                <th>Aciertos</th>
                <th>Preguntas</th>
        </tr>';

	   foreach($response as $key => $arrResponse){           
           
       		echo '<tr align="center">';
              echo '<td>'.$arrResponse['usuario'].'</td>';
              echo '<td>'.$arrResponse['aciertos'].'</td>';
             echo '<td>'.$arrResponse['total'].'</td>';
            echo '</tr>';
	   }
	}
	?>
	</table>
	</div>
	<br/>
        <?php
        if(isset($_POST['cargaTemat'])){
        $temactiv = utf8_decode($_POST['temat']);
        $consultita = "UPDATE categoria SET activo = 1 where categoria.nombre = '$temactiv'";
        $dale = mysqli_query($con, $consultita);
	
	if(mysqli_affected_rows($con) == 0){
                        echo '<script language="javascript">alert("El examen ya se encuentra activado.");</script>';
                        goto end;
                }  	
	
	if($dale){ echo '<script language="javascript">alert("Examen activado correctamente.");</script>';
        	}
	end:
	}
?>

<?php
        if(isset($_POST['desactTemat'])){
        $temactiv1 = utf8_decode($_POST['temat']);
        $consultita1 = "UPDATE categoria SET activo = 0 where categoria.nombre = '$temactiv1'";
        $dale1 = mysqli_query($con, $consultita1);
        
	if(mysqli_affected_rows($con) == 0){
                        echo '<script language="javascript">alert("El examen ya se encuentra desactivado.");</script>';
                        goto fin;
                }	

	if($dale1){ echo '<script language="javascript">alert("Examen desactivado correctamente.");</script>';
        	}
	fin:
	}
?>

	<div class="dv5">
	<form method="POST">
		<fieldset> 
		<legend> Añadir preguntas tipo Verdadero/Falso </legend>
		<label> Pregunta: </label>
		<textarea name="titulo" placeholder="Escriba título de la pregunta." required></textarea><br/>
		<label> Respuesta (V/F): </label>
		<input type="text" name="vof" placeholder="Escriba V o F." required><br/>
		<label> Temática correspondiente: </label>		
		<select id="tematica" name="temv">
                <?php
                       $identificador = $_SESSION['id'];
                        $catquery = "SELECT cat_id FROM asociacatprof WHERE prof_id = $identificador";
                        $rescat = mysqli_query($con, $catquery) or die("Error al consultar".mysql_error());
                        while($catTem = mysqli_fetch_array($rescat)){
                        $catId = $catTem['cat_id'];
                        $temaquery = "SELECT nombre FROM categoria where id = $catId";
                        $resultado = mysqli_query($con, $temaquery) or die("Error al consultar".mysql_error());

                        while($filaTem = mysqli_fetch_array($resultado)){
                                $titTem = utf8_encode($filaTem['nombre']);
                                echo '<option value="'.$titTem.'">'.$titTem.'</option>';
                        }
                   }
                ?>
                </select><br/>
		<label> Tipo de la pregunta: </label>
                <input type="text" name="tipo" placeholder="0-Practica, 1-Mixto, 2-Examen." required><br/>
                <input type="submit" name="insertv" value="Insertar">
	</fieldset>
	</form>
	</div>
<?php
	if(isset($_POST['insertv'])){
		$titulo = utf8_decode($_POST['titulo']);
		$vof = utf8_decode($_POST['vof']);
		$temv = utf8_decode($_POST['temv']);
                $tipo = utf8_decode($_POST['tipo']);

		if($tipo < 0 || $tipo > 2){
                        header("location: http://ucalearn.uca.es/formulario.php");

                }


		$obtieneCatId = "SELECT id from categoria where nombre = '$temv'";
		$exec = mysqli_query($con, $obtieneCatId);
		$vfi = mysqli_fetch_array($exec);
		$valorr = $vfi['id'];

		$insertarv = "INSERT INTO pregunta (titulo, vof, tipo, categoria_id) values ('$titulo', '$vof', '$tipo', '$valorr')";


		$ejecutar = mysqli_query($con, $insertarv);

		if($ejecutar){
			echo '<script language="javascript">alert("Registro insertado correctamente");</script>';
		}
	}
?>

	<div class="dv6">
	<form method="POST">
	<fieldset class="f6">
	<legend> Añadir preguntas de múltiples respuestas </legend>
		<label> Pregunta: </label>
		<textarea name="titulop" placeholder="Escriba título de la pregunta." required></textarea><br/>
		<label> Respuesta correcta: </label>
		<input type="text" name="rp1" placeholder="Escriba la respuesta verdadera." required><br/>
		<label> Respuesta incorrecta: </label>
		<input type="text" name="rp2" placeholder="Escriba una respuesta." required><br/>
		<label> Respuesta incorrecta: </label>
		<input type="text" name="rp3" placeholder="Escriba una respuesta." required><br/>
		<label> Respuesta incorrecta: </label>
		<input type="text" name="rp4" placeholder="Escriba una respuesta." required><br/>
		<label> Temática correspondiente: </label>
		 <select id="tematica" name="tem">
                <?php
                       $identificador = $_SESSION['id'];
                        $catquery = "SELECT cat_id FROM asociacatprof WHERE prof_id = $identificador";
                        $rescat = mysqli_query($con, $catquery) or die("Error al consultar".mysql_error());
                        while($catTem = mysqli_fetch_array($rescat)){
                        $catId = $catTem['cat_id'];
                        $temaquery = "SELECT nombre FROM categoria where id = $catId";
                        $resultado = mysqli_query($con, $temaquery) or die("Error al consultar".mysql_error());

                        while($filaTem = mysqli_fetch_array($resultado)){
                                $titTem = utf8_encode($filaTem['nombre']);
                                echo '<option value="'.$titTem.'">'.$titTem.'</option>';
                        }
                   }
                ?>
                </select><br/>
                <label> Tipo de la pregunta: </label>
                <input type="text" name="tip" placeholder="0-Practica, 1-Mixto, 2-Examen." required><br/>

		<input type="submit" name="insertm" value="Insertar">
	</fieldset>
	</form>
	</div>

<?php
	if(isset($_POST['insertm'])){
		$titulop = utf8_decode($_POST['titulop']);
		$resp1 = utf8_decode($_POST['rp1']);
		$resp2 = utf8_decode($_POST['rp2']);
		$resp3 = utf8_decode($_POST['rp3']);
		$resp4 = utf8_decode($_POST['rp4']);
		$tem = utf8_decode($_POST['tem']);
		$tip = utf8_decode($_POST['tip']);

		if($tip < 0 || $tip > 2){
			header("location: http://ucalearn.uca.es/formulario.php");

		}

		$obtieneCat = "SELECT id from categoria where nombre = '$tem'";
		$execc = mysqli_query($con, $obtieneCat);
		$vff = mysqli_fetch_array($execc);
		$valorc = $vff['id'];
		
		$insertaPreg = "INSERT into pregunta (titulo, tipo,  categoria_id) values ('$titulop', '$tip', '$valorc')";

		$xx = mysqli_query($con, $insertaPreg);

		$cId = "SELECT LAST_INSERT_ID()";
		$yy = mysqli_query($con, $cId);
		$filita = mysqli_fetch_array($yy);
		$ultId = $filita[0];


		$insertarm1 = "INSERT INTO respuesta (descripcion, is_correct, pregunta_id) values ('$resp1', 1, '$ultId')";
		$insertarm2 = "INSERT INTO respuesta (descripcion, is_correct, pregunta_id) values ('$resp2', 0, '$ultId')";
		$insertarm3 = "INSERT INTO respuesta (descripcion, is_correct, pregunta_id) values ('$resp3', 0, '$ultId')";	
		$insertarm4 = "INSERT INTO respuesta (descripcion, is_correct, pregunta_id) values ('$resp4', 0, '$ultId')";

		$ejecutar1 = mysqli_query($con, $insertarm1);
		$ejecutar2 = mysqli_query($con, $insertarm2);
		$ejecutar3 = mysqli_query($con, $insertarm3);
		$ejecutar4 = mysqli_query($con, $insertarm4);

		if($ejecutar1 && $ejecutar2 && $ejecutar3 && $ejecutar4){
			echo '<script language="javascript">alert("Registro insertado correctamente");</script>';
		}
	}
?>

<br/>
</div>
</body>
</html>
