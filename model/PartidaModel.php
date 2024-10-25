<?php

class PartidaModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getCrearPartida($usuario)
    {
        $sql = "INSERT INTO partidas (id_jugador, resultado) VALUES ('$usuario', '0')";
        if ($this->database->execute($sql) > 0) {
            // Obtén el ID de la última inserción
            $idPartida = $this->database->getLastInsertId();
            // Realiza una consulta para obtener la fila completa
            $query = "SELECT * FROM partidas WHERE id_partida = $idPartida";
            $result = $this->database->query($query);
            return $result[0]; // Devuelve la fila completa
        } else {
            echo "Error en la inserción: " . $this->database->conn->error;
            return false;
        }
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
            $this->database->execute("UPDATE partidas SET resultado = resultado + 1 WHERE id_partida = " . $_SESSION['partidaActual']['id_partida']);
            return true;
        } else {
            return false;
        }
    }

    public function getPuntaje($idPartida)
    {
        $sql = "SELECT resultado FROM partidas WHERE id_partida = " . $idPartida;
        $result =$this->database->query($sql);
        return $result[0]['resultado'];
    }
}