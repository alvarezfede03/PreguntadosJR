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
            $idPartida = $this->database->getLastInsertId();

            $query = "SELECT * FROM partidas WHERE id_partida = $idPartida";
            $result = $this->database->query($query);
            return $result[0];
        } else {
            echo "Error en la inserción: " . $this->database->conn->error;
            return false;
        }
    }

    public function getPregunta($id_partida)
    {
        //hay que revisar si la funcionalidad es por partida o por sesion!!! por ahora esta por partida
        //$randomNumber = rand(1, 60); se anula porque que se rompia al intentaba buscar una pregunta que ya estaba utilizada y devolvia null
        //sql1 se fija si hay preguntas sin responder en la partida -
        //- cuenta la cantidad de preguntas en la tabla preguntas que no tengan coincidencia en la tabla preguntas_respondidas
        $sql1 = "SELECT COUNT(*) AS count FROM preguntas AS p
            LEFT JOIN preguntas_respondidas AS pr 
            ON p.id = pr.pregunta_id AND pr.partida_id = $id_partida
            WHERE pr.pregunta_id IS NULL;
        ";

        $preguntasDisponibles = $this->database->query($sql1);

        //Si el contador llega a 0 (osea quen o hay preguntas disponibles dado que se usaron todas) borra todas las pregutnas del "historial"
        //y permite utilizarlas de nuevo
        if ($preguntasDisponibles[0]['count'] == 0) {
            $this->database->execute("DELETE FROM preguntas_respondidas WHERE partida_id = $id_partida");
        }

        //sql2 selecciona una pregunta al azar con la variable randomNumber y la manda al controller
        $sql2 = "SELECT p.* FROM preguntas AS p
        LEFT JOIN preguntas_respondidas AS pr ON p.id = pr.pregunta_id AND pr.partida_id = $id_partida
        WHERE pr.pregunta_id IS NULL ORDER BY RAND() LIMIT 1;
        "; //ahora se usa RAND() porque $randomNumber no funcionaba bien
        return $this->database->query($sql2);
    }

    public function verificarPregunta($preguntaId, $repuestaSeleccionada)
    {
        $sql = "SELECT * FROM preguntas WHERE id = " . $preguntaId;
        $data = $this->database->query($sql);
        if ($data[0]['opcion_correcta'] == $repuestaSeleccionada) {
            $this->database->execute("UPDATE partidas SET resultado = resultado + 1 WHERE id_partida = " . $_SESSION['partidaActual']['id_partida']);
            $this->database->execute("INSERT INTO preguntas_respondidas (partida_id, pregunta_id) VALUES (" . $_SESSION['partidaActual']['id_partida'] . ", $preguntaId)");
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

    public function getTopRankings()
    {
        $sql = "SELECT u.nombre_usuario, MAX(p.resultado) AS resultado
                FROM partidas p
                JOIN usuarios u ON p.id_jugador = u.id
                GROUP BY u.id
                ORDER BY CAST(MAX(p.resultado) AS UNSIGNED) DESC;";
        return $this->database->query($sql);
    }

    public function guardarReporte($preguntaId, $motivo)
    {
        $sql = "INSERT INTO reportes (pregunta_id, motivo) VALUES ('$preguntaId', '$motivo')";
        $this->database->execute($sql);
    }


}