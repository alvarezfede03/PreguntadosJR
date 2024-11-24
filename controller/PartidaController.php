<?php

class PartidaController
{

    private $model;
    private $presenter;

    public function __construct($model, $presenter)
    {
        $this->model = $model;
        $this->presenter = $presenter;
    }

    public function nueva()
    {
        $this->model->calcularDificultadPreguntas();
        $usuario = $_SESSION['id'];
        $this->model->calcularNivelJugador($_SESSION['id']);
        $this->model->finalizadorPartidas($usuario);
        $partida = $this->model->getCrearPartida($usuario);
        $_SESSION['partidaActual'] = $partida;
        if ($_SESSION['partidaActual']['terminada'] == "no") {
            $this->traerPregunta();
        } else {
            $_SESSION['partidaActual']['id_ultima_pregunta'] = null;
            $this->traerPregunta();
        }
    }


    public function traerPregunta()
    {
        $data['respuestaDada'] = false;
        $data['pregunta'] = $this->model->getPregunta($_SESSION['partidaActual']['id_partida'], ($_SESSION['partidaActual']['id_ultima_pregunta']), $_SESSION['id']);

        $opciones = [
            $data['pregunta'][0]['opcion_1'],
            $data['pregunta'][0]['opcion_2'],
            $data['pregunta'][0]['opcion_3'],
            $data['pregunta'][0]['opcion_4']
        ];
        shuffle($opciones);

        $data['pregunta'][0]['opcion_1'] = $opciones[0];
        $data['pregunta'][0]['opcion_2'] = $opciones[1];
        $data['pregunta'][0]['opcion_3'] = $opciones[2];
        $data['pregunta'][0]['opcion_4'] = $opciones[3];

        $_SESSION['pregunta'] = $data['pregunta'][0]['id'];

        $_SESSION['prueba'] = $data['pregunta'];
        $data['color'] = $this->getCategoriaColor($data['pregunta'][0]['categoria']);
        $this->presenter->show('partidaNueva', $data);
    }

    public function validarRespuesta()
    {
        try {
            $_SESSION['partidaActual']['id_ultima_pregunta'] = null;
            $repuestaSeleccionada = $_POST['opcion'];
            $pregunta = $_SESSION['pregunta'];
            $data['correcta'] = $this->model->verificarPregunta($pregunta, $repuestaSeleccionada, $_SESSION['partidaActual']['id_partida'], $_SESSION['id']);
            $data['respuestaDada'] = true;
            $data['pregunta'] = $_SESSION['prueba'];
            $data['puntaje'] = $this->model->getPuntaje($_SESSION['partidaActual']['id_partida']);
            $data['color'] = $this->getCategoriaColor($data['pregunta'][0]['categoria']);
            unset($_SESSION['prueba']);
            unset($_SESSION['pregunta']);
            if (!$data['correcta']) {
                unset($_SESSION['partidaActual']);
            }
            $this->presenter->show('partidaNueva', $data);
        } catch (Exception $e) {
            $this->model->finalizadorPartidasViolento($_SESSION['id']);
            unset($_SESSION['partidaActual']);
            $_SESSION['warning'] = "Actualizar las páginas no te dará ninguna ventaja";
            header("location: /usuario/home");
        }
    }


    public function ranking()
    {
        $data['rankings'] = $this->model->getTopRankings();
        foreach ($data['rankings'] as $index => $row) {
            $data['rankings'][$index]['ranking'] = $index + 1;
        }
        $this->presenter->show('ranking', $data);
    }

    public function getCategoriaColor($categoria)
    {
        $colores = [
            'Geografía' => "cyan",
            'Ciencia' => "green",
            'Historia' => "yellow",
            'Arte' => "red",
            'Deportes' => "orange",
            'Entretenimiento' => "hotpink",
        ];
        return $colores[$categoria] ?? "white";
    }

    public function reportarPregunta()
    {
        $preguntaId = $_POST['pregunta_id'];
        $motivo = $_POST['motivo'];

        $this->model->guardarReporte($preguntaId, $motivo);
        $_SESSION['success'] = "Reporte enviado.";
        header("Location: ../usuario/home");
    }
}