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
        $usuario = $_SESSION['id'];
        $partida = $this->model->getCrearPartida($usuario);
        $_SESSION['partidaActual'] = $partida;
        $this->traerPregunta();
    }

    public function traerPregunta()
    {
        $data['respuestaDada'] = false;
        $data['pregunta'] = $this->model->getPregunta();
        $_SESSION['pregunta'] = $data['pregunta'][0]['id'];;
        $_SESSION['prueba'] = $data['pregunta'];
        $data['color'] = $this->getCategoriaColor($data['pregunta'][0]['categoria']);
        $this->presenter->show('partidaNueva', $data);
    }

    public function validarRespuesta()
    {
        $repuestaSeleccionada = $_POST['opcion'];
        $pregunta = $_SESSION['pregunta'];
        $data['correcta'] = $this->model->verificarPregunta($pregunta, $repuestaSeleccionada);
        $data['respuestaDada'] = true;
        $data['pregunta'] = $_SESSION['prueba'];
        $data['puntaje'] = $this->model->getPuntaje($_SESSION['partidaActual']['id_partida']);
        unset($_SESSION['prueba']);
        unset($_SESSION['pregunta']);
        $this->presenter->show('partidaNueva', $data);

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
}