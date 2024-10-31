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
        $this->presenter->show('informes',$data);
    }

    public function cantidadUsuariosXSexo()
    {
        $data['cantUsuariosXSexo'] = $this->model->getCantidadusuariosXSexo();
        $data['mostrarUsuariosXSexo'] = true;
        $this->presenter->show('informes',$data);
    }

    public function cantidadUsuariosXGrupoEdad()
    {
        $data['cantUsuariosXGrupoEdad'] = $this->model->getCantidadUsuariosXGrupoEdad();
        $data['mostrarUsuariosXGrupoEdad'] = true;
        $this->presenter->show('informes',$data);
    }

    public function porcentajeDePreguntasCorrectas()
    {
        $data = [];
        //Averiguar en base a que se hace el calculo de porcentaje
        //$data['porcentajePreguntasCorrectas'] = $this->model->getPorcentajePreguntasCorrectas();
        /*$usuarios  = $this->model->getPorcentajePreguntasCorrectas();

        $data['porcentajePreguntasCorrectas'] = [];

        foreach ($usuarios as $usuario) {
            $data['porcentajePreguntasCorrectas'][] = [
                'nombre_usuario' => $usuario['nombre_usuario'],
                'porcentaje_correctas' => number_format($usuario['porcentaje_correctas'], 2) . '%'
            ];
        }
        $data['mostrarPorcentajePreguntasCorrectas'] = true;*/
        $this->presenter->show('informes',$data);
    }

}