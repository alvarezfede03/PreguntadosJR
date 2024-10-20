<?php

class UsuarioModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function validate2($user, $pass)
    {
        $sql = "SELECT 1 
                FROM usuarios 
                WHERE nombre_usuario = '" . $user. "' 
                AND contraseña = '" . $pass . "'";
        $usuario = $this->database->query($sql);

        return sizeof($usuario) == 1;

        //return $usuario2 = 1;
    }

    public function filter($user)
    {
        $sql = "SELECT nombre_completo, año_nacimiento, sexo, pais, ciudad, foto_perfil
                FROM usuarios 
                WHERE nombre_usuario = '" . $user. "'";
        $data["usuario"] =$this->database->query($sql);
        return $data;
    }

    public function crearUsuario($username, $password, $fullname, $birthyear, $sexo, $email, $country, $city, $rutaImagen) {
        $sql = "INSERT INTO usuarios (nombre_usuario, contraseña, nombre_completo, año_nacimiento, sexo, mail, pais, ciudad, foto_perfil) 
            VALUES ('" . $username . "', '" . $password . "', '" . $fullname . "', '" . $birthyear . "', '" . $sexo . "', '" . $email . "', '" . $country . "', '" . $city . "', '" . $rutaImagen . "');";

        return $this->database->execute($sql);
    }


}