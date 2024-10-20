<?php

class UsuarioController{
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
            header('location: /home');
        }else {
            $_SESSION['error'] = "Credenciales incorrectas. Intenta nuevamente.";
            header('location: /login');
        }
        exit();
    }

    public function login()
    {
        $data = [];

        // Verificar si hay un mensaje de error en la sesión
        if (isset($_SESSION['error'])) {
            $data['error'] = $_SESSION['error']; // Pasar el mensaje de error
            unset($_SESSION['error']); // Limpiar el mensaje de error de la sesión
        }
        // Verificamos si el usuario está logueado
        if (isset($_SESSION['user'])) {
            $data['user'] = $_SESSION['user'];  // Pasamos el nombre de usuario a la vista
            $data['logged_in'] = true;
            $this->presenter->show('home', $data);  // Pasamos los datos del usuario a la vista 'home'
        } else {
            $data['logged_in'] = false;
            $this->presenter->show('login', $data);  // Redirigimos al formulario de login si no está logueado
        }
    }

    public function search(){
        if (isset($_SESSION['user'])) {
            $data = $this->model->filter($_SESSION['user']);
            $this->presenter->show('perfilUsuario', $data);
        }
    }

    public function logout()
    {
        session_start();
        session_unset();
        session_destroy();
        header('Location: /login');  // Redirige al formulario de login
        exit();
    }

    public function registrar() {
        $data = [];  // Si necesitas pasar datos a la vista, lo haces aquí
        $this->presenter->show('registrar', $data);  // Renderiza la vista 'registrar.mustache'
    }

    public function procesarRegistro() {
        // Recibir los datos del formulario
        $username = $_POST['username'];
        $password = $_POST['password'];
        $fullname = $_POST['fullname'];
        $birthyear = $_POST['birthyear'];
        $sexo = $_POST['sexo'];
        $email = $_POST['email'];
        $country = $_POST['country'];
        $city = $_POST['city'];

        // Guardar los datos del usuario en la base de datos
        $resultado = $this->model->crearUsuario($username, $password, $fullname, $birthyear, $sexo, $email, $country, $city);

        if ($resultado) {
            // Redirigir a una página de registro exitoso
            header("Location: /login");
        } else {
            // Si falla, redirigir al formulario de registro con un mensaje de error
            $_SESSION['error'] = "Hubo un problema al registrar el usuario.";
            header("Location: /registrar");
        }
    }

}