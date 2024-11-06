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
        $sql = "INSERT INTO preguntas (pregunta, opcion_1, opcion_2, opcion_3, opcion_4, opcion_correcta, reportada, aprobada, dificultad, categoria, creada) 
            VALUES (?, ?, ?, ?, ?, ?, ?, 'no', ?, ?, 'si')";
        $stmt = $this->database->prepare($sql);

        $stmt->bind_param('sssssssis', $pregunta, $opcion1, $opcion2, $opcion3, $opcion4, $opcionCorrecta, $reportada, $dificultad, $categoria);

        return $stmt->execute();
    }






}
