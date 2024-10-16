<?php

class LoginController{
    private $model;
    private $presenter;

    public function __construct($model, $presenter)
    {
        $this->model = $model;
        $this->presenter = $presenter;
    }

    public function auth()
    {
        $user = $_POST['username'];
        $pass = $_POST['password'];

        $validation = $this->model->validate2($user, $pass);

        if ($validation) {
            $_SESSION['user'] = $user;
        }

        header('location: /login');
        exit();
    }

    public function list()
    {
        if (isset($_SESSION['user'])) {
            $data['user'] = $_SESSION['user'];
            $this->presenter->show('home');
        }
        else{
            $this->presenter->show('login');
        }
    }

}