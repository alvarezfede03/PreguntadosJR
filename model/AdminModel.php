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
}