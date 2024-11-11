<?php

class PartidaModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }


    public function finalizadorPartidas($usuario)
    {
        date_default_timezone_set('America/Argentina/Buenos_Aires');
        $horaActual = date("H:i:s");
        $sql2="SELECT *
        FROM partidas
        WHERE id_jugador = ".$usuario. "
        AND terminada = 'no'
        ORDER BY hora_pregunta_recibida DESC
        LIMIT 1;";
        $data = $this->database->query($sql2);
        if ($data != null ){
            $horaPreguntaTimestamp = strtotime($data[0]['hora_pregunta_recibida']);
            $horaActualTimestamp = strtotime($horaActual);
             if ($horaActualTimestamp - $horaPreguntaTimestamp > 60) {
                $sql3 = "UPDATE partidas SET terminada = 'si' WHERE id_partida = " . $data[0]['id_partida'];
                $this->database->execute($sql3);
                 }
        }

    }
    public function getCrearPartida($usuario)
    {
        date_default_timezone_set('America/Argentina/Buenos_Aires');
        $horaActual = date("H:i:s");
        $sql2="SELECT *
        FROM partidas
        WHERE id_jugador = ".$usuario. "
        AND terminada = 'no'
        ORDER BY hora_pregunta_recibida DESC
        LIMIT 1;";

        $data = $this->database->query($sql2);

        if ($data != null && $data[0]['terminada'] == 'no') {
            return $data[0];
        }

        $sql = "INSERT INTO partidas (id_jugador, resultado ) VALUES ('$usuario', '0')";
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




        public function getPregunta($id_partida, $idPregunta)
        {
        if ($idPregunta != null) {
            $sql = "SELECT p.*, r.* 
            FROM preguntas AS p
            JOIN respuestas AS r ON p.id = r.id_pregunta
            LEFT JOIN preguntas_respondidas AS pr ON p.id = pr.pregunta_id AND pr.partida_id = $id_partida
            WHERE pr.pregunta_id IS NULL 
            AND p.id = $idPregunta
            ORDER BY RAND() 
            LIMIT 1;";

            $pregunta = $this->database->query($sql);
            return $pregunta;
        }


            $sql7="SELECT *
                 FROM partidas
                WHERE id_partida = ".$id_partida. "
                AND terminada = 'no'
                 ORDER BY hora_pregunta_recibida DESC
                LIMIT 1;";
            $data = $this->database->query($sql7);
            if ($data[0]['id_ultima_pregunta'] != null) {
                date_default_timezone_set('America/Argentina/Buenos_Aires');
                $horaActual = date("H:i:s");
                $horaPreguntaTimestamp = strtotime($data[0]['hora_pregunta_recibida']);
                $horaActualTimestamp = strtotime($horaActual);
                if ($horaActualTimestamp - $horaPreguntaTimestamp < 80) {
                    $sql5="SELECT p.*, o.*
                        FROM partidas AS pa
                        JOIN preguntas AS p ON pa.id_ultima_pregunta = p.id
                         JOIN respuestas AS o ON o.id_pregunta = p.id
                        WHERE pa.id_partida = $id_partida
                         AND pa.terminada = 'no'
                        ORDER BY pa.hora_pregunta_recibida ASC
                         LIMIT 1;
                            ";
                    $data2 = $this->database->query($sql5);

                    return $data2;
                }
            }
        // SQL para contar preguntas no respondidas en la partida actual
        $sql1 = "SELECT COUNT(*) AS count FROM preguntas AS p
            LEFT JOIN preguntas_respondidas AS pr 
            ON p.id = pr.pregunta_id AND pr.partida_id = $id_partida
            WHERE pr.pregunta_id IS NULL;";

        $preguntasDisponibles = $this->database->query($sql1);

        // Si no hay preguntas disponibles, borra el historial de preguntas respondidas para la partida
        if ($preguntasDisponibles[0]['count'] == 0) {
            $this->database->execute("DELETE FROM preguntas_respondidas WHERE partida_id = $id_partida");
        }

        // SQL para seleccionar una pregunta aleatoria que no haya sido respondida
        $sql2 = "SELECT p.*, r.* 
             FROM preguntas AS p
             JOIN respuestas AS r ON p.id = r.id_pregunta
             LEFT JOIN preguntas_respondidas AS pr ON p.id = pr.pregunta_id AND pr.partida_id = $id_partida
             WHERE pr.pregunta_id IS NULL 
             ORDER BY RAND() 
             LIMIT 1;";

        $pregunta = $this->database->query($sql2); // Usa query en lugar de execute para obtener el resultado

        // Verificar si se obtuvo una pregunta
        if (!empty($pregunta)) {
            $pregunta_id = $pregunta[0]['id'];
            date_default_timezone_set('America/Argentina/Buenos_Aires');
            $horaActual = date("Y-m-d H:i:s");

            // Actualizar la partida con la hora y el ID de la última pregunta
            $sql3 = "UPDATE partidas 
                 SET hora_pregunta_recibida = '$horaActual', id_ultima_pregunta = '$pregunta_id' 
                 WHERE id_partida = $id_partida";

            $this->database->execute($sql3);
            return $pregunta; // Retorna la pregunta obtenida
        }

        // En caso de que no haya preguntas disponibles, retornar null o manejar el caso apropiadamente
        return null;
    }


    public function verificarPregunta($preguntaId, $repuestaSeleccionada, $idPartida)
    {
        $sql = "SELECT * FROM preguntas AS p
         JOIN respuestas AS r on p.id = r.id_pregunta
         WHERE p.id = " . $preguntaId;
        $data = $this->database->query($sql);

        if ($data[0]['opcion_correcta'] == $repuestaSeleccionada) {
            $this->database->execute("UPDATE partidas SET resultado = resultado + 1 WHERE id_partida = " . $idPartida);
            $this->database->execute("INSERT INTO preguntas_respondidas (partida_id, pregunta_id) VALUES (" . $idPartida . ", $preguntaId)");
            $this->database->execute("UPDATE partidas SET id_ultima_pregunta = null  WHERE id_partida = " . $idPartida);
            return true;
        } else {
            $this->database->execute("UPDATE partidas
            SET terminada = 'si'
            WHERE id_partida = ". $idPartida);
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
        // Insertar el reporte en la tabla reportes
        $sqlReporte = "INSERT INTO reportes (pregunta_id, motivo) VALUES ('$preguntaId', '$motivo')";
        $this->database->execute($sqlReporte);

        // Actualizar el campo reportada en la tabla preguntas
        $sqlActualizarPregunta = "UPDATE preguntas SET reportada = 'si' WHERE id = '$preguntaId'";
        $this->database->execute($sqlActualizarPregunta);
    }


}