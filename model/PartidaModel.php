<?php

class PartidaModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
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
<<<<<<< Updated upstream
=======

    public function getPuntaje($idPartida)
    {
        $sql = "SELECT resultado FROM partidas WHERE id_partida = " . $idPartida;
        $result =$this->database->query($sql);
        return $result[0]['resultado'];
    }

    public function guardarReportePregunta($idUsuario, $idPregunta, $motivo)
    {
        $fechaReporte = date('Y-m-d');
        $sql = "INSERT INTO reportePregunta (id_usuario, id_pregunta, fecha_reporte, motivo_reporte, estado)
            VALUES ('$idUsuario', '$idPregunta', '$fechaReporte', '$motivo', 'pendiente')";
        $this->database->execute($sql);
    }

>>>>>>> Stashed changes
}