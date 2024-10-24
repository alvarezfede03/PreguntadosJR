<?php

class PartidaModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function generarPartida($user)
    {
        $sql = "INSERT INTO partidas (id_jugador, resultado) VALUES (" . $user . ", 0)";
        $this->database->execute($sql);

        return $this->database->query("SELECT LAST_INSERT_ID() as id_partida")[0]['id_partida'];
    }

    public function getPregunta()
    {
        $randomNumber = rand(1, 45);
        $sql = "SELECT * FROM preguntas WHERE id = " . $randomNumber;
        return $this->database->query($sql);
    }

    public function verificarPregunta($preguntaId, $repuestaSeleccionada)
    {
        $sql = "SELECT * FROM preguntas WHERE id = " . $preguntaId;
        $data = $this->database->query($sql);
        if ($data[0]['opcion_correcta'] == $repuestaSeleccionada) {
            return true;
        } else {
            return false;
        }
    }

    public function actualizarResultado($id_partida, $nuevoResultado)
    {
        $sql = "UPDATE partidas SET resultado = " . $nuevoResultado . " WHERE id_partida = " . $id_partida;
        $this->database->execute($sql);
    }

    public function obtenerResultado($id_partida)
    {
        $sql = "SELECT resultado FROM partidas WHERE id_partida = " . $id_partida;
        $data = $this->database->query($sql);
        return $data[0]['resultado'] ?? 0;
    }

}