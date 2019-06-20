<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

//Load Composer's autoloader
require 'vendor/autoload.php';

/* Registration process, inserts user info into the database 
   and sends account confirmation email message
 */

// Set session variables to be used on profile.php page
$_SESSION['email'] = $_POST['email'];
$_SESSION['first_name'] = $_POST['firstname'];
$_SESSION['last_name'] = $_POST['lastname'];

// Escape all $_POST variables to protect against SQL injections
$first_name = $mysqli->escape_string($_POST['firstname']);
$last_name = $mysqli->escape_string($_POST['lastname']);
$email = $mysqli->escape_string($_POST['email']);
$password = $mysqli->escape_string(password_hash($_POST['password'], PASSWORD_BCRYPT));
$hash = $mysqli->escape_string( md5( rand(0,1000) ) );
      
// Check if user with that email already exists
$result = $mysqli->query("SELECT * FROM acceso WHERE email='$email'") or die($mysqli->error());

// We know user email exists if the rows returned are more than 0
if ( $result->num_rows > 0 ) {
    
    $_SESSION['message'] = 'Ya existe un usuario con este email!';
    header("location: error.php");
    
}
else { // Email doesn't already exist in a database, proceed...

    // active is 0 by DEFAULT (no need to include it here)
    $sql = "INSERT INTO acceso (nombre, apellidos, email, password, hash) " 
            . "VALUES ('$first_name','$last_name','$email','$password', '$hash')";

    // Add user to the database
    if ( $mysqli->query($sql) ){

        $_SESSION['active'] = 0; //0 until user activates their account with verify.php
        $_SESSION['logged_in'] = true; // So we know the user has logged in
        $_SESSION['message'] =
                
                 "Un email de confirmacion ha sido enviado al administrador, por favor espera a que se verifique tu cuenta!";

        
        // Send registration confirmation link (verify.php)
        $to      = $email;
        $subject = 'Verificacion de cuenta ( ucalearn.uca.es )';
        $message_body = '
        Hola '.$first_name.',

        Gracias por registrarte!

        Por favor accede al siguiente enlace para activar tu cuenta:

        http://ucalearn.uca.es/admin/verify.php?email='.$email.'&hash='.$hash;  

        $mail = new PHPMailer(true); 
    
    try{

        $mail = new PHPMailer;
        $mail->SMTPDebug = 2;   
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'vansweruca@gmail.com';
        $mail->Password = 'ucalearn123';
        $mail->SMTPSecure = 'tls';
        $mail->Port = 587;

        $mail->setFrom('vansweruca@gmail.com', 'UCA Learn Admin');
        $mail->addAddress('vansweruca@gmail.com');

        $mail->SMTPOptions = array(
        'ssl' => array(
            'verify_peer' => false,
            'verify_peer_name' => false,
            'allow_self_signed' => true
            )
        );

        $mail->isHTML(true); 
        $mail->Subject = $subject;
        $mail->Body = $message_body;
        $mail->send();
        } catch (Exception $e) {
    echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
    }
        sleep(5);
        header("location: profile.php"); 

    }

    else {
        $_SESSION['message'] = 'Error en el registro!';
        header("location: error.php");
    }

}
