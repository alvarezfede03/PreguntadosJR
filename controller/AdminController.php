<?php

class AdminController{
    private $model;
    private $presenter;

    public function __construct($model, $presenter){
        $this->model = $model;
        $this->presenter = $presenter;
    }

    public function informes()
    {
        $data = [];
        $this->presenter->show('informes',$data);
    }

    public function cantidadJugadores()
    {
        $data['cantJugadores'] = $this->model->getCantidadJugadores();
        $this->presenter->show('informes',$data);
    }

    public function cantidadPartidasJugadas()
    {
        $data['cantPartidasJugadas'] = $this->model->getCantidadPartidasJugadas();
        $this->presenter->show('informes',$data);
    }

    public function cantidadPreguntasCreadas()
    {
        $data['cantPreguntasCreadas'] = $this->model->getCantidadPreguntasCreadas();
        $this->presenter->show('informes',$data);
    }

    public function cantidadUsuariosNuevos()
    {
        $data['cantUsuariosNuevos'] = $this->model->getCantidadUsuariosNuevos();
        $this->presenter->show('informes',$data);
    }

    public function cantidadUsuariosXPais()
    {
        // Revisar si esta bien la forma de pasar los datos por json (mustache para mostrar el total y ajax para filtrarlo)
        $fecha_inicio = $_POST['fecha_inicio'] ?? null;
        $fecha_fin = $_POST['fecha_fin'] ?? null;

        $data['cantUsuariosXPais'] = $this->model->getCantidadUsuariosXPais($fecha_inicio, $fecha_fin);

        $labels = [];
        $dataValues = [];

        foreach ($data['cantUsuariosXPais'] as $item) {
            $labels[] = $item['pais'];
            $dataValues[] = $item['total_usuarios'];
        }

        if ($fecha_inicio && $fecha_fin) {
            echo json_encode([
                'labels' => $labels,
                'data' => $dataValues
            ]);
            exit;
        }

        $data['mostrarUsuariosXPais'] = true;
        $data['labels'] = json_encode($labels);
        $data['data'] = json_encode($dataValues);
        //$data['chartLabel'] = "Cantidad de usuarios"; // "Hover" del grafico ya no se usa mas
        $data['chartText'] = "Distribución de usuarios por pais";  // Titulo del grafico

        $this->presenter->show('informes', $data);
    }

    public function cantidadUsuariosXSexo()
    {
        $data['cantUsuariosXSexo'] = $this->model->getCantidadusuariosXSexo();
        $data['mostrarUsuariosXSexo'] = true;

        $labels = [];
        $dataValues = [];

        foreach ($data['cantUsuariosXSexo'] as $item) {
            $labels[] = $item['sexo'];
            $dataValues[] = $item['total_usuarios'];
        }

        $data['labels'] = json_encode($labels);
        $data['data'] = json_encode($dataValues);
        //$data['chartLabel'] = "Cantidad de usuarios";
        $data['chartText'] = "Distribución de usuarios por sexo";
        $this->presenter->show('informes',$data);
    }

    public function cantidadUsuariosXGrupoEdad()
    {
        $data['cantUsuariosXGrupoEdad'] = $this->model->getCantidadUsuariosXGrupoEdad();
        $data['mostrarUsuariosXGrupoEdad'] = true;

        $labels = [];
        $dataValues = [];

        foreach ($data['cantUsuariosXGrupoEdad'] as $item) {
            $labels[] = $item['grupo_edad'];
            $dataValues[] = $item['total_usuarios'];
        }

        $data['labels'] = json_encode($labels);
        $data['data'] = json_encode($dataValues);
        //$data['chartLabel'] = "Cantidad de usuarios";
        $data['chartText'] = "Distribución de usuarios por grupo de edad";
        $this->presenter->show('informes',$data);
    }

    public function porcentajeDePreguntasCorrectas()
    {
        $data['porcentajePreguntasCorrectas'] = $this->model->getPorcentajePreguntasCorrectas();
        $data['mostrarPorcentajePreguntasCorrectas'] = true;

        $labels = [];
        $dataValues = [];

        foreach ($data['porcentajePreguntasCorrectas'] as $item) {
            $labels[] = $item['usuario'];
            $dataValues[] = $item['porcentaje_correctas'];
        }

        $data['labels'] = json_encode($labels);
        $data['data'] = json_encode($dataValues);
        //$data['chartLabel'] = "Porcentaje de respuestas correctas";
        $data['chartText'] = "Porcentajes de preguntas respondidas correctamente por usuario";
        $this->presenter->show('informes',$data);
    }

}