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
            $_SESSION['error'] = "Cuenta inactiva. Por favor, verifica tu correo para activarla.";
            header('location: /login');
        } else {
            $_SESSION['error'] = "Credenciales incorrectas. Intenta nuevamente.";
            header('location: /login');
        }
        exit();
    }

    public function login()
    {
        $data = [];
        if (isset($_SESSION['error'])) {
            $data['error'] = $_SESSION['error'];
            unset($_SESSION['error']);
        }
        if (isset($_SESSION['success'])) {
            $data['success'] = $_SESSION['success'];
            unset($_SESSION['success']);
        }
        if (isset($_SESSION['user'])) {
            $data = $this->model->filter($_SESSION['user']);
            $_SESSION['id'] = $data['usuario'][0]['id'];
            $data['userRanking'] = $this->model->getUserRanking($data['usuario'][0]['id']);
            $data['logged_in'] = true;
            $this->presenter->show('home', $data);
        } else {
            $data['logged_in'] = false;
            $this->presenter->show('login', $data);
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
        header('Location: /login');
        exit();
    }

    public function registrar() {
        $data = [];
        $this->presenter->show('registrar', $data);
    }

    public function procesarRegistro() {
        $uuid = uniqid(time(), true);
        $username = $_POST['username'];
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $fullname = $_POST['fullname'];
        $birthyear = $_POST['birthyear'];
        $sexo = $_POST['sexo'];
        $email = $_POST['email'];
        $country = $_POST['country'];
        $city = $_POST['city'];

        if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
            $resultadoImagen = $this->validarImagen($_FILES['image']);
            if ($resultadoImagen['valid']) {
                $urlImagen = "../public/perfiles/" . $username . "." . $resultadoImagen['extension'];
                $rutaImagenCompleta = $_SERVER['DOCUMENT_ROOT'] . "/public/perfiles/" . $username . "." . $resultadoImagen['extension'];
                move_uploaded_file($_FILES['image']['tmp_name'], $rutaImagenCompleta);
            } else {
                $_SESSION['error'] = $resultadoImagen['message'];
                header("Location: /registro");
                exit();
            }
        } else {
            $urlImagen = null;
        }

        // Guardar los datos del usuario en la base de datos (inactivo hasta que verifique el correo)
        $token = $this->model->crearUsuario($uuid, $username, $password, $fullname, $birthyear, $sexo, $email, $country, $city, $urlImagen);
        if ($token) {
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

    public function verificarUsername() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $username = $_POST['username'];
            $existe = $this->model->existeUsername($username);
            header('Content-Type: application/json');
            echo json_encode(['existe' => $existe]);
            exit();
        }
    }
}