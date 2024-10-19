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

    /*



        public function registrarUsuario($data) {
            $sql = "INSERT INTO usuarios (uuid, nombre_usuario, contraseña, nombre_completo, anio_nacimiento, sexo, pais, ciudad, mail, foto_perfil, tipo_usuario, fecha_registro, ultimo_login, nivel)
                VALUES (:uuid, :nombre_usuario, :contraseña, :nombre_completo, NOW(), :sexo,  ".", ".", :mail, ".", 'Jugador', NOW(), NOW(), 0)";
            var_dump($data);
            $stmt = $this->database->prepare($sql);  // Cambiado a prepare()
            var_dump($stmt);
            if (!$stmt) {
                throw new Exception("Error al preparar la consulta");  // Verificar si hay error al preparar
            }

            $stmt->bindParam(':uuid', $data['uuid']);
            $stmt->bindParam(':nombre_usuario', $data['nombre_usuario']);
            $stmt->bindParam(':contraseña', $data['contraseña']);  // La contraseña ya está hasheada
            $stmt->bindParam(':nombre_completo', $data['nombre_completo']);
            $stmt->bindParam(':anio_nacimiento', $data['anio_nacimiento']);
            $stmt->bindParam(':sexo', $data['sexo']);
            $stmt->bindParam(':pais', $data['pais']);
            $stmt->bindParam(':ciudad', $data['ciudad']);
            $stmt->bindParam(':mail', $data['mail']);
            $stmt->bindParam(':foto_perfil', $data['foto_perfil']);

            // Ejecutar la consulta
            $resultado = $stmt->execute();
            return $resultado;
        }
    */

    public function registrarUsuario($data)
    {
        // Consulta SQL correctamente formada
        $sql = "INSERT INTO usuarios (uuid, nombre_usuario, contraseña, nombre_completo, anio_nacimiento, sexo, mail, tipo_usuario, fecha_registro, ultimo_login, nivel)
            VALUES (?, ?, ?, ?, ?, ?, ?, 'jugador', NOW(), NOW(), 0)";

        // Preparar la consulta
        $stmt = $this->database->prepare($sql);

        // Verificar si la consulta fue preparada correctamente
        if (!$stmt) {
            throw new Exception("Error al preparar la consulta: " . $this->database->conn->error);
        }

        // Enlazar los parámetros, asegurándote de pasar 'null' si no hay foto de perfil
        $stmt->bind_param(
            'sssssss',  // Tipos de los parámetros: s = string, i = integer
            $data['uuid'],
            $data['nombre_usuario'],
            $data['contraseña'],  // La contraseña ya está hasheada
            $data['nombre_completo'],
            $data['anio_nacimiento'],
            $data['sexo'],
            $data['mail']
        );

        // Ejecutar la consulta
        if (!$stmt->execute()) {
            throw new Exception("Error al ejecutar la consulta: " . $stmt->error);
        }

        return true;
    }







}