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
}