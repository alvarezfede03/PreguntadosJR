<?php

class CrearPreguntasController {
    private $model;
    private $presenter;

    public function __construct($model, $presenter) {
        $this->model = $model;
        $this->presenter = $presenter;
    }

    public function form() {
        if((isset($_SESSION['user'])) && ($_SESSION['tipo_usuario'] == "jugador")) {
            $data = [
                'categorias' => ['Geografia', 'Historia', 'Deportes', 'Arte', 'Ciencia', 'Entretenimiento']
            ];
            $this->presenter->show('crearPregunta', $data);
        }
    }

    public function crear() {
        if((isset($_SESSION['user'])) && ($_SESSION['tipo_usuario'] == "jugador")) {
            $pregunta = $_POST['pregunta'];
            $opcion1 = $_POST['opcion1'];
            $opcion2 = $_POST['opcion2'];
            $opcion3 = $_POST['opcion3'];
            $opcion4 = $_POST['opcion4'];
            $reportada = 'no';
            $dificultad = $_POST['dificultad'] ?? 0;
            $categoria = $_POST['categoria'];
            $opcionCorrecta = $_POST['opcionCorrectaTexto'];

            $status = $this->model->crearPregunta($pregunta, $opcion1, $opcion2, $opcion3, $opcion4, $opcionCorrecta, $reportada, $dificultad, $categoria);
            if($status){
                $_SESSION['success'] = "Pregunta creada exitosamente";
            }else{
                $_SESSION['error'] = "Error al crear pregunta";
            }
            $data = [];
            $this->presenter->show('crearPregunta', $data);
            //header("Location: /home");
            //exit();
        }
    }
}