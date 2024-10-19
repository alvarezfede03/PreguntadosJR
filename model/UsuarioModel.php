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
    public function registrarUsuario($data) {
        $sql = "INSERT INTO usuarios (uuid, nombre_usuario, contraseña, nombre_completo, anio_nacimiento, sexo, pais, ciudad, mail, foto_perfil, tipo_usuario, fecha_registro, ultimo_login, nivel)
                VALUES (:uuid, :nombre_usuario, :contraseña, :nombre_completo, :anio_nacimiento, :sexo, :pais, :ciudad, :mail, :foto_perfil, :tipo_usuario, NOW(), NULL, 0)";

        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':uuid', $data['uuid']);
        $stmt->bindParam(':nombre_usuario', $data['nombre_usuario']);
        $stmt->bindParam(':contraseña', password_hash($data['contraseña'], PASSWORD_DEFAULT));
        $stmt->bindParam(':nombre_completo', $data['nombre_completo']);
        $stmt->bindParam(':anio_nacimiento', $data['anio_nacimiento']);
        $stmt->bindParam(':sexo', $data['sexo']);
        $stmt->bindParam(':pais', $data['pais']);
        $stmt->bindParam(':ciudad', $data['ciudad']);
        $stmt->bindParam(':mail', $data['mail']);
        $stmt->bindParam(':foto_perfil', $data['foto_perfil']);
        $stmt->bindParam(':tipo_usuario', $data['tipo_usuario']);
        return $stmt->execute();
    }

}