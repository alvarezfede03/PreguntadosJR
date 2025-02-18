<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class EmailSender
{

    public function enviarMail($email, $token)
    {
        $mail = new PHPMailer(true);
        try {
            $mail->isSMTP();
            $mail->Host = 'smtp.gmail.com';
            $mail->SMTPAuth = true;
            $mail->Username = 'alvarezfede159@gmail.com';
            $mail->Password = 'xmlc ggvr etrz vxwf';
            $mail->SMTPSecure = 'tls';
            $mail->Port = 587;

            $mail->setFrom('alvarezfede159@gmail.com', 'PreguntadoJr');
            $mail->addAddress($email);
            $mail->CharSet = 'UTF-8';
            $mail->Encoding = 'base64';
            $mail->isHTML(true);
            $mail->Subject = 'Activación de Cuenta';

            $mail->Body = "Para activar tu cuenta, ingresa al siguiente enlace: " .
                "<a href='http://localhost/usuario/verificarCuenta?token=$token'>Activar cuenta</a>";
            $mail->send();

            /*//////////////////////////////////////////////////////////////////////////*/
            // Descomentar el siguiente codigo si no hay internet para validar el token //
            /*//////////////////////////////////////////////////////////////////////////*/

            /*$url = "http://localhost/usuario/verificarCuenta?token=";
            $data = ['url' =>$url, 'token' => $token];
            $json = json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
            file_put_contents('token.json', $json);*/

            return true;
        } catch (Exception $e) {
            error_log('Error al enviar el correo: ' . $mail->ErrorInfo);
            return false;
        }
    }
}