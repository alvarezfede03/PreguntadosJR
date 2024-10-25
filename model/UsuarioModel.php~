<?php

class UsuarioModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function validate($user, $pass)
    {
        // Consulta SQL para obtener la contraseña hasheada del usuario
        $sql = "SELECT contrasenia FROM usuarios WHERE nombre_usuario = '$user'";
        $resultado = $this->database->query($sql);

        // Si se encuentra el usuario
        if (count($resultado) === 1) {
            $usuario = $resultado[0]; // Obtenemos la única fila
            $hashedPassword = $usuario['contrasenia'];

            // Verificar la contraseña usando password_verify
            if (password_verify($pass, $hashedPassword)) {
                return true; // Contraseña válida
            }
        }

        return false; // Usuario no encontrado o contraseña incorrecta
    }


    public function filter($user)
    {
        $sql = "SELECT nombre_completo, anio_nacimiento, sexo, pais, ciudad, foto_perfil
                FROM usuarios 
                WHERE nombre_usuario = '" . $user. "'";
        $data["usuario"] =$this->database->query($sql);
        return $data;
    }

    public function crearUsuario($uuid, $username, $password, $fullname, $birthyear, $sexo, $email, $country, $city, $rutaImagen) {
        $sql = "INSERT INTO usuarios (uuid, nombre_usuario, contrasenia, nombre_completo, anio_nacimiento, sexo, mail, pais, ciudad, foto_perfil) 
            VALUES ('". $uuid . "', '" . $username . "', '" . $password . "', '" . $fullname . "', '" . $birthyear . "', '" . $sexo . "', '" . $email . "', '" . $country . "', '" . $city . "', '" . $rutaImagen . "');";

        return $this->database->execute($sql);
    }


}