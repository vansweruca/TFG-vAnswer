<?php 
/* Reset your password form, sends reset.php password link */
require 'db.php';
session_start();

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

//Load Composer's autoloader
require 'vendor/autoload.php';

// Check if form submitted with method="post"
if ( $_SERVER['REQUEST_METHOD'] == 'POST' ) 
{   
    $email = $mysqli->escape_string($_POST['email']);
    $result = $mysqli->query("SELECT * FROM acceso WHERE email='$email'");

    if ( $result->num_rows == 0 ) // User doesn't exist
    { 
        $_SESSION['message'] = "No existe usuario con ese email!";
        header("location: error.php");
    }
    else { // User exists (num_rows != 0)

        $user = $result->fetch_assoc(); // $user becomes array with user data
        
        $email = $user['email'];
        $hash = $user['hash'];
        $first_name = $user['nombre'];

        // Session message to display on success.php
        $_SESSION['message'] = "<p>Por favor, comprueba tu correo <span>$email</span>"
        . " para un enlace de confirmacion para reestablecer contraseña</p>";

        // Send registration confirmation link (reset.php)
        $to      = $email;
        $subject = 'Enlace reestablecer password ( ucalearn.uca.es )';
        $message_body = '
        Hola '.$first_name.',

        Has solicitado reestablecer la contraseña

        Por favor entra al enlace siguiente para reestablecerla

        http://ucalearn.uca.es/admin/reset.php?email='.$email.'&hash='.$hash;  

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

?>
<!DOCTYPE html>
<html>
<head>
  <title>Reestablecer tu contraseña</title>
  <?php include 'css/css.html'; ?>
</head>

<body>
    
  <div class="form">

    <h1>Reestablecer tu contraseña</h1>

    <form action="forgot.php" method="post">
     <div class="field-wrap">
      <label>
        Direccion email <span class="req">*</span>
      </label>
      <input type="email"required autocomplete="off" name="email"/>
    </div>
    <button class="button button-block"/>Reestablecer</button>
    </form>
  </div>
          
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="js/index.js"></script>
</body>

</html>
