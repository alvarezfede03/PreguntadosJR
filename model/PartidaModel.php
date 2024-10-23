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
}