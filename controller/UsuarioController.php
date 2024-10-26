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

        $validation = $this->model->validate($user, $pass);

        if ($validation === true) {
            $_SESSION['user'] = $user;
            header('location: /home');
        } elseif ($validation === 'inactive') {
            // Si la cuenta está inactiva, mostrar mensaje de cuenta inactiva
            $_SESSION['error'] = "Cuenta inactiva. Por favor, verifica tu correo para activarla.";
            header('location: /login');
        } else {
            // Si las credenciales son incorrectas
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
        // Verificar si hay un mensaje de éxito en la sesión
        if (isset($_SESSION['success'])) {
            $data['success'] = $_SESSION['success'];
            unset($_SESSION['success']);  // Limpiar el mensaje de éxito
        }
        // Verificamos si el usuario está logueado
        if (isset($_SESSION['user'])) {
            $data = $this->model->filter($_SESSION['user']); // Le paso toods los datos directamente y lo filtro desde la vista
            $_SESSION['foto_perfil'] = $data['usuario'][0]['foto_perfil'];
            $_SESSION['id'] = $data['usuario'][0]['id'];
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
        $uuid = uniqid(time(), true);
        $username = $_POST['username'];
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $fullname = $_POST['fullname'];
        $birthyear = $_POST['birthyear'];
        $sexo = $_POST['sexo'];
        $email = $_POST['email'];
        $country = $_POST['country'];
        $city = $_POST['city'];

        // Validar imagen de perfil (igual que antes)
        if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
            $resultadoImagen = $this->validarImagen($_FILES['image']);
            if ($resultadoImagen['valid']) {
                // Ruta relativa para guardar en la base de datos
                $urlImagen = "../public/perfiles/" . $username . "." . $resultadoImagen['extension'];

                // Ruta absoluta para mover el archivo en el servidor
                $rutaImagenCompleta = $_SERVER['DOCUMENT_ROOT'] . "/public/perfiles/" . $username . "." . $resultadoImagen['extension'];

                // Mover el archivo a la ruta absoluta en el servidor
                move_uploaded_file($_FILES['image']['tmp_name'], $rutaImagenCompleta);
            } else {
                $_SESSION['error'] = $resultadoImagen['message'];
                header("Location: /registro");
                exit();
            }
        } else {
            $urlImagen = null;  // Si no hay imagen, la ruta se guarda como null
        }

        // Guardar los datos del usuario en la base de datos (inactivo hasta que verifique el correo)
        $token = $this->model->crearUsuario($uuid, $username, $password, $fullname, $birthyear, $sexo, $email, $country, $city, $urlImagen);

        if ($token) {
            // Enviar correo con el enlace de verificación
            $emailSender = new EmailSender();
            $emailExitoso = $emailSender->enviarMail($email, $token);

            if ($emailExitoso) {
                $_SESSION['success'] = "Usuario registrado exitosamente. Revisa tu correo para activar tu cuenta.";
                header("Location: /login");
            } else {
                $_SESSION['error'] = "Error al enviar el correo de activación.";
                header("Location: /registro");
            }
        } else {
            $_SESSION['error'] = "Hubo un problema al registrar el usuario.";
            header("Location: /registrar");
        }
    }


    // Función para validar la imagen
    private function validarImagen($file) {
        $allowed_extensions = ['jpg', 'jpeg', 'png', 'gif', 'svg'];
        $extension = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));

        if (in_array($extension, $allowed_extensions) && $file['size'] <= 2 * 1024 * 1024) {
            return ['valid' => true, 'extension' => $extension];
        }

        $errorMessage = (in_array($extension, $allowed_extensions))
            ? 'El tamaño de la imagen debe ser de 2MB o menos.'
            : 'Formato de imagen no permitido. Solo se permiten: jpg, jpeg, png, gif, svg.';

        return ['valid' => false, 'message' => $errorMessage];
    }

    public function verificarCuenta() {
        if (isset($_GET['token'])) {
            $token = $_GET['token'];
            $usuario = $this->model->buscarUsuarioPorToken($token);

            if ($usuario) {
                // Activar el usuario
                $this->model->activarUsuario($usuario['uuid']);
                $_SESSION['success'] = "Cuenta activada correctamente.";
                header('location: /login');
            } else {
                $_SESSION['error'] = "Token inválido.";
                header('location: /registro');
            }
        } else {
            $_SESSION['error'] = "Token no proporcionado.";
            header('location: /registro');
        }
        exit();
    }


}