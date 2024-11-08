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
        if((isset($_SESSION['user'])) && ($_SESSION['tipo_usuario'] == "jugador")) {
            $usuario = $_SESSION['id'];
            $partida = $this->model->getCrearPartida($usuario);
            $_SESSION['partidaActual'] = $partida;
            $this->traerPregunta();
        }
        else{
            $data['gif']=true;
            $frases = json_decode(file_get_contents('public/frases.json'), true)['frases'];
            $data['frases'] = $frases[array_rand($frases)];
            $this->presenter->show('blank',$data);
        }
    }

    public function traerPregunta()
    {
        if((isset($_SESSION['user'])) && ($_SESSION['tipo_usuario'] == "jugador")) {
            $data['respuestaDada'] = false;
            $data['pregunta'] = $this->model->getPregunta($_SESSION['partidaActual']['id_partida']);

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
        else{
            $data['gif']=true;
            $frases = json_decode(file_get_contents('public/frases.json'), true)['frases'];
            $data['frases'] = $frases[array_rand($frases)];
            $this->presenter->show('blank',$data);
        }
    }

    public function validarRespuesta()
    {
        if((isset($_SESSION['user'])) && ($_SESSION['tipo_usuario'] == "jugador")) {
            $repuestaSeleccionada = $_POST['opcion'];
            $pregunta = $_SESSION['pregunta'];
            $data['correcta'] = $this->model->verificarPregunta($pregunta, $repuestaSeleccionada);
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
        }
        else{
            $data['gif']=true;
            $frases = json_decode(file_get_contents('public/frases.json'), true)['frases'];
            $data['frases'] = $frases[array_rand($frases)];
            $this->presenter->show('blank',$data);
        }
    }

    public function ranking()
    {
        if((isset($_SESSION['user'])) && ($_SESSION['tipo_usuario'] == "jugador")) {
            $data['rankings'] = $this->model->getTopRankings();
            foreach ($data['rankings'] as $index => $row) {
                $data['rankings'][$index]['ranking'] = $index + 1;
            }
            $this->presenter->show('ranking', $data);
        }
        else{
            $data['gif']=true;
            $frases = json_decode(file_get_contents('public/frases.json'), true)['frases'];
            $data['frases'] = $frases[array_rand($frases)];
            $this->presenter->show('blank',$data);
        }
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
        if((isset($_SESSION['user'])) && ($_SESSION['tipo_usuario'] == "jugador")) {
            $preguntaId = $_POST['pregunta_id'];
            $motivo = $_POST['motivo'];

            $this->model->guardarReporte($preguntaId, $motivo);
            header("Location: ../usuario/home");
        }
        else{
            $data['gif']=true;
            $frases = json_decode(file_get_contents('public/frases.json'), true)['frases'];
            $data['frases'] = $frases[array_rand($frases)];
            $this->presenter->show('blank',$data);
        }
    }
}