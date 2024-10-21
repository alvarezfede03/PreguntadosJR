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
        } else {
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

    public function logout()
    {
        session_start();
        session_unset();
        session_destroy();
        header('Location: /login');
        exit();
    }

    public function mostrarFormularioRegistro()
    {
        $data=[];
        $this->presenter->show('registro', []);
    }

    public function registrarUsuario()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $uuid = uniqid(time(), true);
            $fotoPerfilPath = isset($_POST['foto_perfil']) ? $_POST['foto_perfil'] : null;

            $data = [
                'uuid' => $uuid,
                'nombre_usuario' => $_POST['nombre_usuario'],
                'contraseña' => password_hash($_POST['contraseña'], PASSWORD_DEFAULT),
                'nombre_completo' => $_POST['nombre_completo'],
                'anio_nacimiento' => $_POST['anio_nacimiento'],
                'sexo' => $_POST['sexo'],
                //'pais' => $_GET['pais'],
                //'ciudad' => $_GET['ciudad'],
                'mail' => $_POST['mail'],
                //'foto_perfil' => $fotoPerfilPath
            ];

            var_dump($data);
            $registroExitoso = $this->model->registrarUsuario($data);

            if ($registroExitoso) {
                $_SESSION['success'] = "Usuario registrado con éxito.";
                header('location: /login');
            } else {
                $_SESSION['error'] = "Error al registrar usuario.";
                header('location: /registro');
            }
            exit();
        } else {
            $this->mostrarFormularioRegistro();
            }
    }
}