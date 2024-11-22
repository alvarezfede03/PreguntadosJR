<?php

class EditorModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getTodasLasPreguntasConRespuestas()
    {
        $sql = "
            SELECT p.id, p.pregunta, p.categoria, 
                   r.opcion_1, r.opcion_2, r.opcion_3, r.opcion_4, r.opcion_correcta
            FROM preguntas p
            JOIN respuestas r ON p.id = r.id_pregunta";

        return $this->database->query($sql);
    }

    public function getPreguntaById($id)
    {
        $sql = "
            SELECT p.id, p.pregunta, p.categoria, 
                   r.opcion_1, r.opcion_2, r.opcion_3, r.opcion_4, r.opcion_correcta
            FROM preguntas p
            JOIN respuestas r ON p.id = r.id_pregunta
            WHERE p.id = ?";
        $stmt = $this->database->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        return $stmt->get_result()->fetch_assoc();
    }

    public function actualizarPregunta($id, $pregunta, $categoria, $opcion1, $opcion2, $opcion3, $opcion4, $opcionCorrecta)
    {
        // Actualizar la pregunta en la tabla `preguntas`
        $sqlPregunta = "UPDATE preguntas SET pregunta = ?, categoria = ? WHERE id = ?";
        $stmtPregunta = $this->database->prepare($sqlPregunta);
        $stmtPregunta->bind_param("ssi", $pregunta, $categoria, $id);
        $stmtPregunta->execute();

        // Actualizar las opciones en la tabla `respuestas`
        $sqlRespuestas = "
        UPDATE respuestas 
        SET opcion_1 = ?, opcion_2 = ?, opcion_3 = ?, opcion_4 = ?, opcion_correcta = ?
        WHERE id_pregunta = ?";
        $stmtRespuestas = $this->database->prepare($sqlRespuestas);
        $stmtRespuestas->bind_param("sssssi", $opcion1, $opcion2, $opcion3, $opcion4, $opcionCorrecta, $id);
        $stmtRespuestas->execute();
    }


    public function eliminarPregunta($idPregunta)
    {
        $actualizarEstadoReporte = $this->database->prepare("UPDATE reportes SET estado = 'resuelto' WHERE pregunta_id = ?");
        $actualizarEstadoReporte->bind_param("i", $idPregunta);
        $actualizarEstadoReporte->execute();

        $eliminarRespuestas = $this->database->prepare("DELETE FROM respuestas WHERE id_pregunta = ?");
        $eliminarRespuestas->bind_param("i", $idPregunta);
        $eliminarRespuestas->execute([$idPregunta]);

        $eliminarPregunta = $this->database->prepare("DELETE FROM preguntas WHERE id = ? ");
        $eliminarPregunta->bind_param("i", $idPregunta);
        $eliminarPregunta->execute();
    }


    public function getPreguntasReportadas()
    {
        $sql = "
    SELECT p.id, p.pregunta, p.categoria, 
           r.opcion_1, r.opcion_2, r.opcion_3, r.opcion_4, r.opcion_correcta,
           rep.motivo
    FROM preguntas p
    JOIN respuestas r ON p.id = r.id_pregunta
    JOIN (
        SELECT pregunta_id, motivo
        FROM reportes
        WHERE id IN (
            SELECT MAX(id) 
            FROM reportes 
            GROUP BY pregunta_id
        )
    ) rep ON p.id = rep.pregunta_id
    WHERE p.reportada = 'si'";
        return $this->database->query($sql);
    }


    public function getPreguntasSugeridas()
    {
        $sql = "
        SELECT p.id, p.pregunta, p.categoria, 
               r.opcion_1, r.opcion_2, r.opcion_3, r.opcion_4, r.opcion_correcta
        FROM preguntas p
        JOIN respuestas r ON p.id = r.id_pregunta
        WHERE p.creada = 'si' AND p.aprobada = 'no'";

        return $this->database->query($sql);
    }


    public function aprobarPregunta($id)
    {

        $sql = "UPDATE preguntas SET aprobada = 'si', reportada = 'no' WHERE id = ?";
        $stmt = $this->database->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();


        $sqlReporte = "UPDATE reportes SET estado = 'resuelto' WHERE pregunta_id = ?";
        $stmtReporte = $this->database->prepare($sqlReporte);
        $stmtReporte->bind_param("i", $id);
        $stmtReporte->execute();
    }


}