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

    public function cantidadUsuariosNuevos()
    {
        $data['cantUsuariosNuevos'] = $this->model->getCantidadUsuariosNuevos();
        $this->presenter->show('informes',$data);
    }

    public function cantidadUsuariosXPais()
    {
        $data['cantUsuariosXPais'] = $this->model->getCantidadUsuariosXPais();
        $data['mostrarUsuariosXPais'] = true;

        $labels = [];
        $dataValues = [];

        foreach ($data['cantUsuariosXPais'] as $item) {
            $labels[] = $item['pais'];
            $dataValues[] = $item['total_usuarios'];
        }

        $data['labels'] = json_encode($labels);
        $data['data'] = json_encode($dataValues);
        $data['chartLabel'] = "Cantidad de usuarios"; // "Hover" del grafico
        $data['chartText'] = "Distribución de usuarios por pais"; // Titulo del grafico
        $this->presenter->show('informes',$data);
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
        $data['chartLabel'] = "Cantidad de usuarios"; // "Hover" del grafico
        $data['chartText'] = "Distribución de usuarios por sexo"; // Titulo del grafico
        $this->presenter->show('informes',$data);
    }

    public function cantidadUsuariosXGrupoEdad()
    {
        $data['cantUsuariosXGrupoEdad'] = $this->model->getCantidadUsuariosXGrupoEdad();
        $data['mostrarUsuariosXGrupoEdad'] = true;

        // Preparar los datos para los gráficos
        $labels = [];
        $dataValues = [];

        foreach ($data['cantUsuariosXGrupoEdad'] as $item) {
            $labels[] = $item['grupo_edad'];
            $dataValues[] = $item['total_usuarios'];
        }

        $data['labels'] = json_encode($labels);
        $data['data'] = json_encode($dataValues);
        $data['chartLabel'] = "Cantidad de usuarios"; // "Hover" del grafico
        $data['chartText'] = "Distribución de usuarios por grupo de edad"; // Titulo del grafico
        $this->presenter->show('informes',$data);
    }

    public function porcentajeDePreguntasCorrectas()
    {
        //Para el grafico esta utilizando total_correctas pero deberia utilizar el de porcentaje -
        //Hay que pasarle porcentaje como INT sin el signo %
        $data['porcentajePreguntasCorrectas'] = $this->model->getPorcentajePreguntasCorrectas();
        $data['mostrarPorcentajePreguntasCorrectas'] = true;

        $labels = [];
        $dataValues = [];

        foreach ($data['porcentajePreguntasCorrectas'] as $item) {
            $labels[] = $item['usuario'];
            $dataValues[] = $item['total_correctas'];
        }

        $data['labels'] = json_encode($labels);
        $data['data'] = json_encode($dataValues);
        $data['chartLabel'] = "Porcentaje de respuestas correctas";
        $data['chartText'] = "Porcentajes de preguntas respondidas correctamente por usuario";
        $this->presenter->show('informes',$data);
    }

}