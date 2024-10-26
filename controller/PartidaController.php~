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
        $data['respuestaDada'] = false;
        $data['pregunta'] = $this->model->getPregunta();
        $_SESSION['pregunta'] = $data['pregunta'][0]['id'];;
        $_SESSION['prueba'] =$data['pregunta'];
        $this->presenter->show('partidaNueva', $data);
    }


    public function validarRespuesta()
    {

        $repuestaSeleccionada = $_POST['opcion'];
        $pregunta = $_SESSION['pregunta'];
        $data['correcta'] = $this->model->verificarPregunta($pregunta, $repuestaSeleccionada);
        $data['respuestaDada'] = true;
        $data['pregunta'] =$_SESSION['prueba'];
        unset($_SESSION['prueba']);
        unset($_SESSION['pregunta']);
        $this->presenter->show('partidaNueva', $data);

    }
<<<<<<< Updated upstream
=======

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
        if (!isset($_SESSION['pregunta'])) {
            die('ID de pregunta no definido en la sesión.');
        }

        $idUsuario = $_SESSION['id'];
        $idPregunta = $_SESSION['pregunta'];
        $motivo = $_POST['motivo'];

        // Guardar el reporte en la base de datos
        $this->model->guardarReportePregunta($idUsuario, $idPregunta, $motivo);

        // Redirigir a la siguiente pregunta o a otra página
        header('Location: ../partida/traerPregunta');
    }



>>>>>>> Stashed changes
}