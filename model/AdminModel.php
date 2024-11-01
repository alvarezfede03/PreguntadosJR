<?php
class AdminModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getCantidadJugadores(){
        $sql = "SELECT COUNT(*) AS count FROM usuarios WHERE tipo_usuario = 'jugador';";
        $resultado = $this->database->query($sql);
        return $resultado[0]['count'];
    }

    public function getCantidadPartidasJugadas(){
        $sql = "SELECT COUNT(*) AS count FROM partidas;";
        $resultado = $this->database->query($sql);
        return $resultado[0]['count'];
    }

    public function getCantidadUsuariosNuevos(){
        $sql = "SELECT DATE(fecha_registro) AS dia, COUNT(*) AS count
                FROM usuarios
                WHERE fecha_registro >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
                GROUP BY DATE(fecha_registro)
                ORDER BY dia;";
        $resultado = $this->database->query($sql);
        return $resultado[0]['count'];
    }

    public function getCantidadUsuariosXPais(){
        $sql = "SELECT pais, COUNT(*) AS total_usuarios
                FROM usuarios
                GROUP BY pais
                ORDER BY total_usuarios DESC;";
        return $this->database->query($sql);
    }

    public function getCantidadUsuariosXSexo(){
        $sql = "SELECT sexo, COUNT(*) AS total_usuarios
                FROM usuarios
                GROUP BY sexo
                ORDER by total_usuarios DESC;";
        return $this->database->query($sql);
    }

    public function getCantidadUsuariosXGrupoEdad(){
        $sql = "SELECT 
                CASE 
                    WHEN YEAR(CURDATE()) - YEAR(anio_nacimiento) < 18 THEN 'Menores'
                    WHEN YEAR(CURDATE()) - YEAR(anio_nacimiento) >= 65 THEN 'Jubilados'
                ELSE 'Medio'
                END AS grupo_edad,
                COUNT(*) AS total_usuarios
                FROM usuarios
                GROUP BY grupo_edad
                ORDER BY grupo_edad;";
        return $this->database->query($sql);
    }

    public function getPorcentajePreguntasCorrectas(){
        $sql = "SELECT u.nombre_usuario AS usuario,
                COUNT(pr.pregunta_id) AS total_correctas,
                CONCAT(ROUND(COUNT(pr.pregunta_id) * 100.0 / (SELECT COUNT(*) FROM preguntas), 2), '%') AS porcentaje_correctas
                FROM partidas p
                JOIN preguntas_respondidas pr ON p.id_partida = pr.partida_id
                JOIN usuarios u ON p.id_jugador = u.id
                WHERE u.tipo_usuario = 'jugador'
                GROUP BY u.nombre_usuario;";
        return $this->database->query($sql);
    }
}