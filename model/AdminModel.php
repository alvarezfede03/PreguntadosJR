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

        //Averiguar en base a que se hace el calculo
        /*
        $sql = "";
        return $this->database->query($sql);*/
    }
}