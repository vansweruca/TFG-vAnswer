<?php 
/* Verifies registered user email, the link to this page
   is included in the register.php email message 
*/
require 'db.php';
session_start();

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

//Load Composer's autoloader
require 'vendor/autoload.php';

// Make sure email and hash variables aren't empty
if(isset($_GET['email']) && !empty($_GET['email']) AND isset($_GET['hash']) && !empty($_GET['hash']))
{
    $email = $mysqli->escape_string($_GET['email']); 
    $hash = $mysqli->escape_string($_GET['hash']); 
    
    // Select user with matching email and hash, who hasn't verified their account yet (active = 0)
    $result = $mysqli->query("SELECT * FROM acceso WHERE email='$email' AND hash='$hash' AND activo='0'");

    if ( $result->num_rows == 0 )
    { 
        $_SESSION['message'] = "La cuenta ya ha sido activada o la URL no es válida!";

        header("location: error.php");
    }
    else {
        $_SESSION['message'] = "Tu cuenta ha sido activada!";
        
        // Set the user status to active (active = 1)
        $mysqli->query("UPDATE acceso SET activo='1' WHERE email='$email'") or die($mysqli->error);
        $_SESSION['active'] = 1;
        
	$to      = $email;
        $subject = 'Cuenta activada ( ucalearn.uca.es )';
        $message_body = '
        Hola querido usuario,

        Le informamos de que su cuenta ha sido activada con éxito por el administrador.
        Ya puede acceder con sus credenciales al portal de login: ucalearn.uca.es/admin y realizar acciones.';  

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

        $mail->setFrom('vansweruca@gmail.com', 'UCA Learn Info');
        $mail->addAddress($to);

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
        header("location: success.php");
    }
}
else {
    $_SESSION['message'] = "Parámetros introducidos para verificar la cuenta, no válidos!";
    header("location: error.php");
}     
?>
