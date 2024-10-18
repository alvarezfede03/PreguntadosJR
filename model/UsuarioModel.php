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

}