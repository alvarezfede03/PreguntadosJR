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
        // Traer la contraseña hasheada de la base de datos
        $sql = "SELECT contraseña 
            FROM usuarios 
            WHERE nombre_usuario = ?";

        $stmt = $this->database->prepare($sql);
        $stmt->bind_param('s', $user);
        $stmt->execute();
        $stmt->bind_result($hashedPassword);
        $stmt->fetch();
        $stmt->close();

        // Verificar si la contraseña ingresada por el usuario coincide con la contraseña hasheada
        if ($hashedPassword && password_verify($pass, $hashedPassword)) {
            return true;
        } else {
            return false;
        }
    }


    public function registrarUsuario($data)
    {
        $sql = "INSERT INTO usuarios (uuid, nombre_usuario, contraseña, nombre_completo, anio_nacimiento, sexo, mail, tipo_usuario, fecha_registro, ultimo_login, nivel, foto_perfil)
            VALUES (?, ?, ?, ?, ?, ?, ?, 'jugador', NOW(), NOW(), 0, ?)";
        $stmt = $this->database->prepare($sql);

        // Verificar si la consulta fue preparada correctamente
        if (!$stmt) {
            throw new Exception("Error al preparar la consulta: " . $this->database->conn->error);
        }

        $stmt->bind_param(
            'ssssssss',
            $data['uuid'],
            $data['nombre_usuario'],
            $data['contraseña'],
            $data['nombre_completo'],
            $data['anio_nacimiento'],
            $data['sexo'],
            $data['mail'],
            $data['foto_perfil']  // Aquí se incluye la ruta de la imagen
        );

        if (!$stmt->execute()) {
            throw new Exception("Error al ejecutar la consulta: " . $stmt->error);
        }
        return true;
    }

}