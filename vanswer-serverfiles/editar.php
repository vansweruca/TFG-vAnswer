<?php

if(isset($_GET['editar'])){
	$editar_id = $_GET['editar'];

	$consulta = "SELECT * from pregunta where id = '$editar_id'";
	$ejecutar = mysqli_query($con, $consulta);

	$fila = mysqli_fetch_array($ejecutar);

	$id = $fila['id'];
	$titulo = $fila['titulo'];
}
?>

<br/>


<fieldset>
<form method="POST" action="">
<textarea name="titulo" placeholder="Escriba la pregunta de nuevo" value="<?php echo $titulo; ?>"></textarea>
<input type="submit" name="actualizar" value="Actualizar pregunta">
	</form>
	</fieldset>
<?php
if(isset($_POST['actualizar'])){
$actualizar_titulo = utf8_decode($_POST['titulo']);

$actualizar = "UPDATE pregunta SET titulo = '$actualizar_titulo' WHERE id = '$editar_id'";
$ejecutar = mysqli_query($con, $actualizar);

	if($ejecutar){
		echo '<script language="javascript">alert("Pregunta actualizada correctamente");</script>';
	}
	echo '<meta http-equiv="refresh" content="1; URL=formulario.php" />';
}
?>
