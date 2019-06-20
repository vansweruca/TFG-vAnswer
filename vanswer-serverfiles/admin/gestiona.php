<?php
/* Displays user information and some useful messages */
session_start();

// Check if user is logged in using the session variable
if ( $_SESSION['logged_in'] != 1 ) {
  $_SESSION['message'] = "Debes iniciar sesion antes de ver el portal de gestión!";

  header("location: http://ucalearn.uca.es/admin/");
}
?>

<!DOCTYPE=html>
<meta charset="UTF-8">


<?php
        $con = mysqli_connect("127.0.0.1", "root", "", "vanswer") or die("Error");
?>

<html>
<div class="lobster">
<head>
        <title> Panel de administrador vAnswer </title>
        <link rel="stylesheet" type="text/css" href="../style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="http://allfont.es/allfont.css?fonts=bodoni">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
        <h2> Bienvenido, <?php echo $_SESSION['first_name']." ".$_SESSION['last_name']."." ?>
	<form method="POST"><input type="submit" name="cerrarSesion" value="Cerrar sesión"></form></h2>
        </br>

<?php
        if(isset($_POST['cerrarSesion'])){
        $_SESSION['logged_in'] = 0;
        echo '<script language="javascript">alert("Sesión cerrada correctamente, redirigiendo al panel de registro/login");</script>';

        header("location: http://ucalearn.uca.es/admin/");
        }
?>

	<form method="POST">
	<fieldset>
	<legend> Vinculación / desvinculación de asignaturas </legend>	
	<label> Elegir temática a asociar/desvincular:</label>
        <select id="tematica" name="tematica">
                <?php
                       
                        $temaquery = "SELECT nombre FROM categoria";
                        $resultado = mysqli_query($con, $temaquery) or die("Error al consultar".mysql_error());
                        while($filaTem = mysqli_fetch_array($resultado)){
                                $titTem = utf8_encode($filaTem['nombre']);
                                echo '<option value="'.$titTem.'">'.$titTem.'</option>';
                        }
                
                ?>
        </select><br/>
	<label> Elegir profesor: </label>
	<select id="profesor" name="profesor">
		<?php
		$profquery = "SELECT email FROM acceso";
		$res = mysqli_query($con, $profquery) or die("Error al consultar profesores".mysql_error());
		while($profTem = mysqli_fetch_array($res)){
			$eProf = utf8_encode($profTem['email']);
			echo '<option value="'.$eProf.'">'.$eProf.'</option>';
		}
		
		?>
	</select><br/>
        <input type="submit" value="Asociar temática a profesor" name="asociaTem"/>
        <input type="submit" value="Desvincular profesor de temática" name="desvTem"/><br/>
	</fieldset>
	</form>

        <br/>
<?php
	if(isset($_POST['asociaTem'])){
                $tem = utf8_decode($_POST['tematica']);
                $prof = utf8_decode($_POST['profesor']);
		
		$q_tem = "SELECT id FROM categoria where nombre = '$tem'";
		$res_tem = mysqli_query($con, $q_tem);
		$row = mysqli_fetch_array($res_tem);
                $valorId = $row['id'];

		$q_prof = "SELECT id from acceso where email = '$prof'";
		$res_prof = mysqli_query($con, $q_prof);
		$rowp = mysqli_fetch_array($res_prof);
		$valorIdProf = $rowp['id'];
		
                $enlazaTem = "INSERT INTO asociacatprof (prof_id, cat_id) values ($valorIdProf, $valorId)";
                $asigTem = mysqli_query($con, $enlazaTem);
               
                if($asigTem){
                        echo '<script language="javascript">alert("Asignación realizada correctamente");</script>';

		}
		
		if(!$asigTem){
			echo '<script language="javascript">alert("Imposible realizar la asignación (ya existe o es errónea)");</script>';
		}
	}
?>

<?php
	if(isset($_POST['desvTem'])){

	 	$tem = utf8_decode($_POST['tematica']);
                $prof = utf8_decode($_POST['profesor']);

                $desvq_tem = "SELECT id FROM categoria where nombre = '$tem'";
                $desvres_tem = mysqli_query($con, $desvq_tem);
                $desvrow = mysqli_fetch_array($desvres_tem);
                $desvvalorId = $desvrow['id'];

                $desvq_prof = "SELECT id from acceso where email = '$prof'";
                $desvres_prof = mysqli_query($con, $desvq_prof);
                $desvrowp = mysqli_fetch_array($desvres_prof);
                $desvvalorIdProf = $desvrowp['id'];

                $desvenlazaTem = "DELETE FROM asociacatprof where prof_id = $desvvalorIdProf and cat_id = $desvvalorId";
                $desvTem = mysqli_query($con, $desvenlazaTem);
		
		if(mysqli_affected_rows($con) == 0){
			echo '<script language="javascript">alert("No existen registros a eliminar para dicho profesor/temática");</script>';
			goto end;
		} 
		
                if($desvTem){
                        echo '<script language="javascript">alert("Desvinculación realizada correctamente");</script>';

                }

                if(!$desvTem){
                        echo '<script language="javascript">alert("Imposible realizar la desvinculación (ya existe o es errónea)");</script>';
                }

		end:
	}
?>
</div>
</html>
