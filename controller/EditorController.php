<?php

class EditorController
{
    private $model;
    private $presenter;

    public function __construct($model, $presenter)
    {
        $this->model = $model;
        $this->presenter = $presenter;
    }

    public function verPreguntas()
    {
        if (isset($_SESSION['user']) && $_SESSION['tipo_usuario'] == "editor") {
            $data['preguntas'] = $this->model->getTodasLasPreguntasConRespuestas();
            $this->presenter->show('editor', $data);
        } else {
            $data['gif'] = true;
            $frases = json_decode(file_get_contents('public/frases.json'), true)['frases'];
            $data['frases'] = $frases[array_rand($frases)];
            $this->presenter->show('blank', $data);
        }
    }

    public function editarPregunta()
    {
        if (isset($_SESSION['user']) && $_SESSION['tipo_usuario'] == "editor") {
            $id = $_POST['id'] ?? null;

            if ($id) {
                $data['pregunta'] = $this->model->getPreguntaById($id);
                $this->presenter->show('editarPregunta', $data);
            }
        } else {
            $data['gif'] = true;
            $frases = json_decode(file_get_contents('public/frases.json'), true)['frases'];
            $data['frases'] = $frases[array_rand($frases)];
            $this->presenter->show('blank', $data);
        }
    }


    public function actualizarPregunta()
    {
        if (isset($_SESSION['user']) && $_SESSION['tipo_usuario'] == "editor") {
            $id = $_POST['id'] ?? null;

            if ($id) {

                $nuevaPregunta = $_POST['pregunta'];
                $nuevaCategoria = $_POST['categoria'];
                $opcion1 = $_POST['opcion_1'];
                $opcion2 = $_POST['opcion_2'];
                $opcion3 = $_POST['opcion_3'];
                $opcion4 = $_POST['opcion_4'];
                $opcionCorrecta = $_POST['opcion_correcta'];


                $this->model->actualizarPregunta($id, $nuevaPregunta, $nuevaCategoria, $opcion1, $opcion2, $opcion3, $opcion4, $opcionCorrecta);

                header("Location: ../usuario/home");
            }
        } else {
            $data['gif'] = true;
            $frases = json_decode(file_get_contents('public/frases.json'), true)['frases'];
            $data['frases'] = $frases[array_rand($frases)];
            $this->presenter->show('blank', $data);
        }
    }

    public function eliminarPregunta()
    {
        if (isset($_SESSION['user']) && $_SESSION['tipo_usuario'] == "editor") {
            $id = $_POST['id'] ?? null;

            if ($id) {
                $this->model->eliminarPregunta($id);
                header("Location: ../usuario/home");
            }
        } else {
            $data['gif'] = true;
            $frases = json_decode(file_get_contents('public/frases.json'), true)['frases'];
            $data['frases'] = $frases[array_rand($frases)];
            $this->presenter->show('blank', $data);
        }
    }

    public function verPreguntasReportadas()
    {
        if (isset($_SESSION['user']) && $_SESSION['tipo_usuario'] == "editor") {
            $data['preguntas'] = $this->model->getPreguntasReportadas();
            $data['reportadas'] = true;
            $this->presenter->show('editor', $data);
        } else {
            $data['gif'] = true;
            $frases = json_decode(file_get_contents('public/frases.json'), true)['frases'];
            $data['frases'] = $frases[array_rand($frases)];
            $this->presenter->show('blank', $data);
        }
    }


    public function verPreguntasSugeridas()
    {
        if (isset($_SESSION['user']) && $_SESSION['tipo_usuario'] == "editor") {
            $data['preguntas'] = $this->model->getPreguntasSugeridas();
            $data['sugeridas'] = true;
            $this->presenter->show('editor', $data);
        } else {
            $data['gif'] = true;
            $frases = json_decode(file_get_contents('public/frases.json'), true)['frases'];
            $data['frases'] = $frases[array_rand($frases)];
            $this->presenter->show('blank', $data);
        }
    }


    public function darDeAltaPregunta()
    {
        if (isset($_SESSION['user']) && $_SESSION['tipo_usuario'] == "editor") {
            $id = $_POST['id'] ?? null;

            if ($id) {
                $this->model->aprobarPregunta($id);
                header("Location: ../usuario/home");
            }
        } else {
            $data['gif'] = true;
            $frases = json_decode(file_get_contents('public/frases.json'), true)['frases'];
            $data['frases'] = $frases[array_rand($frases)];
            $this->presenter->show('blank', $data);
        }
    }


}
