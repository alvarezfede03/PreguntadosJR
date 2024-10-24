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
        $userId = $_SESSION['id'];
        $id_partida = $this->model->generarPartida($userId);
        $_SESSION['id_partida'] = $id_partida;

        $data['respuestaDada'] = false;
        $data['pregunta'] = $this->model->getPregunta();
        $_SESSION['pregunta'] = $data['pregunta'][0]['id'];;
        $_SESSION['prueba'] =$data['pregunta'];
        switch ($data['pregunta'][0]['categoria']){
            case 'Geografía':
                $data['color'] = "cyan";
                break;
            case 'Ciencia':
                $data['color'] = "lightskyblue";
                break;
            case 'Historia':
                $data['color'] = "brown";
                break;
            case 'Naturaleza':
                $data['color'] = "lightgreen";
                break;
            case 'Arte':
                $data['color'] = "red";
                break;
            case 'Religión':
                $data['color'] = "lightgrey";
                break;
            case 'Cultura general':
                $data['color'] = "yellow";
                break;
            case 'Deportes':
                $data['color'] = "green";
                break;
            case 'Economía':
                $data['color'] = "orange";
                break;
            case 'Literatura':
                $data['color'] = "purple";
                break;
            default:
                $data['color'] = "white";
                break;
        }
        $this->presenter->show('partidaNueva', $data);

    }

    public function validarRespuesta()
    {

        $respuestaSeleccionada = $_POST['opcion'];
        $pregunta = $_SESSION['pregunta'];
        $idPartida = $_SESSION['id_partida'];
        $data['correcta'] = $this->model->verificarPregunta($pregunta, $respuestaSeleccionada);
        $data['respuestaDada'] = true;
        $data['pregunta'] = $_SESSION['prueba'];
        unset($_SESSION['prueba']);
        unset($_SESSION['pregunta']);

        if ($data['correcta']) {
            $this->model->actualizarResultado($idPartida, 1);
        }

        $data['resultado'] = $this->model->obtenerResultado($idPartida);

        $this->presenter->show('partidaNueva', $data);

    }
}