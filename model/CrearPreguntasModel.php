<?php

class CrearPreguntasModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function crearPregunta($pregunta, $opcion1, $opcion2, $opcion3, $opcion4, $opcionCorrecta, $reportada, $dificultad, $categoria)
    {
        // Agregar campos fecha_creacion y creada (si - no)
        $sqlPregunta = "INSERT INTO preguntas (pregunta, reportada, aprobada, dificultad, categoria, creada) 
                        VALUES (?, ?, 'no', ?, ?, 'si')";
        $stmt = $this->database->prepare($sqlPregunta);
        $stmt->bind_param('sssis', $pregunta, $reportada, $dificultad, $categoria);
        if (!$stmt->execute()) {
            $stmt = null;
            return false;
        }
        $idPregunta = $this->database->getLastInsertId();
        $stmt = null;
        $sqlRespuesta = "INSERT INTO respuestas (id_pregunta, opcion_1, opcion_2, opcion_3, opcion_4, opcion_correcta) 
                         VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $this->database->prepare($sqlRespuesta);
        $stmt->bind_param('isssss',$idPregunta, $opcion1, $opcion2, $opcion3, $opcion4, $opcionCorrecta);
        if (!$stmt->execute()) {
            $stmt = null;
            return false;
        }
        $stmt = null;
        return true;
    }
}
