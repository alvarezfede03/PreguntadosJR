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

    public function logout()
    {
        session_start();
        session_unset();
        session_destroy();
        header('Location: /login');  // Redirige al formulario de login
        exit();
    }

    // Nueva función para mostrar el formulario de registro
    public function mostrarFormularioRegistro()
    {
        $data=[];
        $this->presenter->show('registro', []);
    }

    // Nueva función para registrar usuario usando GET
    public function registrarUsuario()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            // Generar UUID
            $uuid = uniqid(time(), true);

            // Guardar foto de perfil (si es parte del GET, debe manejarse de otra forma, aquí se ignora por ahora)
            $fotoPerfilPath = isset($_GET['foto_perfil']) ? $_GET['foto_perfil'] : null;

            // Obtener datos del formulario usando GET
            $data = [
                'uuid' => $uuid,
                'nombre_usuario' => $_GET['nombre_usuario'],
                'contraseña' => password_hash($_GET['contraseña'], PASSWORD_DEFAULT),
                'nombre_completo' => $_GET['nombre_completo'],
                'anio_nacimiento' => $_GET['anio_nacimiento'],
                'sexo' => $_GET['sexo'],
                'pais' => $_GET['pais'],
                'ciudad' => $_GET['ciudad'],
                'mail' => $_GET['mail'],
                'foto_perfil' => $fotoPerfilPath,
                'tipo_usuario' => $_GET['tipo_usuario']
            ];

            // Registrar usuario en la base de datos
            $registroExitoso = $this->model->registrarUsuario($data);

            if ($registroExitoso) {
                $_SESSION['success'] = "Usuario registrado con éxito.";
                header('location: /login');  // Redirige al login después del registro exitoso
            } else {
                $_SESSION['error'] = "Error al registrar usuario.";
                header('location: /registro');  // Redirige al formulario de registro en caso de error
            }
            exit();
        } else {
            $this->mostrarFormularioRegistro();
        }
    }
}