<?php
/* User login process, checks if user exists and password is correct */

// Escape email to protect against SQL injections
$email = $mysqli->escape_string($_POST['email']);
$result = $mysqli->query("SELECT * FROM acceso WHERE email='$email'");

if ( $result->num_rows == 0 ){ // User doesn't exist
    $_SESSION['message'] = "No existe usuario con ese email!";
    header("location: error.php");
}
else { // User exists
    $user = $result->fetch_assoc();

    if ( password_verify($_POST['password'], $user['password']) ) {
        
        $_SESSION['id'] = $user['id'];        
        $_SESSION['email'] = $user['email'];
        $_SESSION['first_name'] = $user['nombre'];
        $_SESSION['last_name'] = $user['apellidos'];
        $_SESSION['active'] = $user['activo'];
        
        // This is how we'll know the user is logged in
        $_SESSION['logged_in'] = true;
	
	$identificador = $_SESSION['id'];
        $asociaCat = "INSERT IGNORE INTO asociacatprof (prof_id, cat_id) values ('$identificador', 1)";
        $insertAsoc = $mysqli->query($asociaCat);
	

        if($_SESSION['active'] == 1){

        header("location: http://ucalearn.uca.es/formulario.php");
        }
        else{
            $_SESSION['message'] = "Cuenta no activa, espere que el administrador la active.!";
            header("location: error.php");
        } 	
    }
    else {
        $_SESSION['message'] = "Has introducido una contraseña incorrecta, prueba de nuevo!";
        header("location: error.php");
    }
}

