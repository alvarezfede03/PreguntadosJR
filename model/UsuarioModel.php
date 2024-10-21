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
                WHERE nombre_usuario = '" . $user . "' 
                AND contraseña = '" . $pass . "'";
        $usuario = $this->database->query($sql);
        return sizeof($usuario) == 1;
        //return $usuario2 = 1;
    }

    public function registrarUsuario($data)
    {
        $sql = "INSERT INTO usuarios (uuid, nombre_usuario, contraseña, nombre_completo, anio_nacimiento, sexo, mail, tipo_usuario, fecha_registro, ultimo_login, nivel)
            VALUES (?, ?, ?, ?, ?, ?, ?, 'jugador', NOW(), NOW(), 0)";
        $stmt = $this->database->prepare($sql);

        // Verificar si la consulta fue preparada correctamente
        if (!$stmt) {
            throw new Exception("Error al preparar la consulta: " . $this->database->conn->error);
        }

        $stmt->bind_param(
            'sssssss',
            $data['uuid'],
            $data['nombre_usuario'],
            $data['contraseña'],
            $data['nombre_completo'],
            $data['anio_nacimiento'],
            $data['sexo'],
            $data['mail']
        );

        if (!$stmt->execute()) {
            throw new Exception("Error al ejecutar la consulta: " . $stmt->error);
        }
        return true;
    }
}