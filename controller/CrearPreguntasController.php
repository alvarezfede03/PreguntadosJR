<?php

class CrearPreguntasController {
    private $model;
    private $presenter;

    public function __construct($model, $presenter) {
        $this->model = $model;
        $this->presenter = $presenter;
    }

    public function form() {
        $data = [
            'categorias' => ['Selecciona una categoria','Geografia', 'Historia', 'Deportes', 'Arte', 'Ciencia', 'Entretenimiento']
        ];
        $this->presenter->show('crearPregunta', $data);
    }

    public function crear() {
        $pregunta = $_POST['pregunta'];
        $opcion1 = $_POST['opcion1'];
        $opcion2 = $_POST['opcion2'];
        $opcion3 = $_POST['opcion3'];
        $opcion4 = $_POST['opcion4'];
        $opcionCorrecta = $_POST['opcionCorrecta'];
        $reportada = 'no';
        $dificultad = $_POST['dificultad'] ?? 0;
        $categoria = $_POST['categoria'];

        $this->model->crearPregunta($pregunta, $opcion1, $opcion2, $opcion3, $opcion4, $opcionCorrecta, $reportada, $dificultad, $categoria);

        header("Location: /home");
        exit();
    }

}