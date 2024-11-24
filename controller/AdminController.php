<?php

class AdminController
{
    private $model;
    private $presenter;

    public function __construct($model, $presenter)
    {
        $this->model = $model;
        $this->presenter = $presenter;
    }

    public function informes()
    {
        $data = [];
        $this->presenter->show('informes', $data);
    }

    public function cantidadJugadores()
    {
        $data['cantJugadores'] = $this->model->getCantidadJugadores();
        $this->presenter->show('informes', $data);
    }

    public function cantidadPartidasJugadas()
    {
        $data['cantPartidasJugadas'] = $this->model->getCantidadPartidasJugadas();
        $this->presenter->show('informes', $data);
    }

    public function cantidadPreguntasCreadas()
    {
        $data['cantPreguntasCreadas'] = $this->model->getCantidadPreguntasCreadas();
        $this->presenter->show('informes', $data);
    }

    public function cantidadUsuariosNuevos()
    {
        $data['cantUsuariosNuevos'] = $this->model->getCantidadUsuariosNuevos();
        $this->presenter->show('informes', $data);
    }

    public function cantidadUsuariosXPais()
    {
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
        $data['chartText'] = "Distribución de usuarios por pais";
        $data['nombreFuncion'] = "cantidadUsuariosXPais";
        $this->presenter->show('informes', $data);
    }

    public function cantidadUsuariosXSexo()
    {
        $fecha_inicio = $_POST['fecha_inicio'] ?? null;
        $fecha_fin = $_POST['fecha_fin'] ?? null;

        $data['cantUsuariosXSexo'] = $this->model->getCantidadusuariosXSexo($fecha_inicio, $fecha_fin);


        $labels = [];
        $dataValues = [];

        foreach ($data['cantUsuariosXSexo'] as $item) {
            $labels[] = $item['sexo'];
            $dataValues[] = $item['total_usuarios'];
        }

        if ($fecha_inicio && $fecha_fin) {
            echo json_encode([
                'labels' => $labels,
                'data' => $dataValues
            ]);
            exit;
        }
        $data['mostrarUsuariosXSexo'] = true;
        $data['labels'] = json_encode($labels);
        $data['data'] = json_encode($dataValues);
        $data['chartText'] = "Distribución de usuarios por sexo";
        $data['nombreFuncion'] = "cantidadUsuariosXSexo";
        $this->presenter->show('informes', $data);
    }

    public function cantidadUsuariosXGrupoEdad()
    {
        $fecha_inicio = $_POST['fecha_inicio'] ?? null;
        $fecha_fin = $_POST['fecha_fin'] ?? null;

        $data['cantUsuariosXGrupoEdad'] = $this->model->getCantidadUsuariosXGrupoEdad($fecha_inicio, $fecha_fin);

        $labels = [];
        $dataValues = [];

        foreach ($data['cantUsuariosXGrupoEdad'] as $item) {
            $labels[] = $item['grupo_edad'];
            $dataValues[] = $item['total_usuarios'];
        }

        if ($fecha_inicio && $fecha_fin) {
            echo json_encode([
                'labels' => $labels,
                'data' => $dataValues
            ]);
            exit;
        }

        $data['mostrarUsuariosXGrupoEdad'] = true;
        $data['labels'] = json_encode($labels);
        $data['data'] = json_encode($dataValues);
        $data['chartText'] = "Distribución de usuarios por grupo de edad";
        $data['nombreFuncion'] = "cantidadUsuariosXGrupoEdad";
        $this->presenter->show('informes', $data);
    }

    public function porcentajeDePreguntasCorrectas()
    {
        $fecha_inicio = $_POST['fecha_inicio'] ?? null;
        $fecha_fin = $_POST['fecha_fin'] ?? null;
        $data['porcentajePreguntasCorrectas'] = $this->model->getPorcentajePreguntasCorrectas($fecha_inicio, $fecha_fin);

        $labels = [];
        $dataValues = [];

        foreach ($data['porcentajePreguntasCorrectas'] as $item) {
            $labels[] = $item['usuario'];
            $dataValues[] = $item['porcentaje_correctas'];
        }

        if ($fecha_inicio && $fecha_fin) {
            echo json_encode([
                'labels' => $labels,
                'data' => $dataValues
            ]);
            exit;
        }

        $data['mostrarPorcentajePreguntasCorrectas'] = true;
        $data['labels'] = json_encode($labels);
        $data['data'] = json_encode($dataValues);
        $data['chartText'] = "Porcentajes de preguntas respondidas correctamente por usuario";
        $data['nombreFuncion'] = "porcentajeDePreguntasCorrectas";
        $data['mostrarPorcentaje'] = 'true';
        $this->presenter->show('informes', $data);
    }
}