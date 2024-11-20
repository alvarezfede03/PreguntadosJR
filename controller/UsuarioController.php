<?php

class UsuarioController
{
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
            $data = $this->model->filter($_SESSION['user']);
            $_SESSION['tipo_usuario'] = $data['usuario'][0]['tipo_usuario'];
            header('location: /usuario/home');
        } elseif ($validation === 'inactive') {
            $_SESSION['error'] = "Cuenta inactiva. Por favor, verifica tu correo para activarla.";
            header('location: /usuario/login'); //verificar
        } else {
            $_SESSION['error'] = "Credenciales incorrectas. Intenta nuevamente.";
            header('location: /');
        }
        exit();
    }

    public function login()
    {
        $data = [];
        if (isset($_SESSION['user'])) {
            $data = $this->model->filter($_SESSION['user']);
            if ($_SESSION['tipo_usuario'] == 'jugador') {
                $_SESSION['id'] = $data['usuario'][0]['id'];
                $data['userRanking'] = $this->model->getUserRanking($data['usuario'][0]['id']);
                $partidas = $this->model->getHistorial5Partida($data['usuario'][0]['id']);
                foreach ($partidas as $index => $partida) {
                    $partidas[$index]['numero'] = $index + 1;
                }
                $data['partidas'] = $partidas;
                $data['jugador'] = true;
                //$_SESSION['tipo_usuario'] = $data['usuario'][0]['tipo_usuario'];
            } else if ($_SESSION['tipo_usuario'] == 'admin') {
                $data['admin'] = true;
                //$_SESSION['tipo_usuario'] = $data['usuario'][0]['tipo_usuario'];
            } else {
                $data['editor'] = true;
                //$_SESSION['tipo_usuario'] = $data['usuario'][0]['tipo_usuario'];
            }

            $data['logged_in'] = true;
            $this->presenter->show('home', $data);
        } else {
            $data['logged_in'] = false;
            $this->presenter->show('login', $data);
        }
    }

    public function verPerfil()
    {
            $data = $this->model->filter($_SESSION['user']);
            $this->presenter->show('perfilUsuario', $data);
    }

    public function logout()
    {
        session_start();
        session_unset();
        session_destroy();
        header('Location: /');
        exit();
    }

    public function registrar()
    {
        if (!isset($_SESSION['user'])) {
            $data = [];
            $this->presenter->show('registrar', $data);
        }
    }

    public function procesarRegistro()
    {
        if (!isset($_SESSION['user'])) {
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

            $token = $this->model->crearUsuario($uuid, $username, $password, $fullname, $birthyear, $sexo, $email, $country, $city, $urlImagen);
            if ($token) {
                $emailSender = new EmailSender();
                $emailExitoso = $emailSender->enviarMail($email, $token);
                if ($emailExitoso) {
                    $_SESSION['success'] = "Usuario registrado exitosamente. Revisa tu correo para activar tu cuenta.";
                    header("Location: /");
                } else {
                    $_SESSION['error'] = "Error al enviar el correo de activación.";
                    header("Location: /registro");
                }
            } else {
                $_SESSION['error'] = "Hubo un problema al registrar el usuario.";
                header("Location: /registrar");
            }
        }
    }

    private function validarImagen($file)
    {
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

    public function verificarCuenta()
    {
        if (isset($_GET['token'])) {
            $token = $_GET['token'];
            $usuario = $this->model->buscarUsuarioPorToken($token);

            if ($usuario) {
                $this->model->activarUsuario($usuario['uuid']);
                $_SESSION['success'] = "Cuenta activada correctamente.";
                header('location: /');
            } else {
                $_SESSION['error'] = "Token inválido.";
                header('location: /');
            }
        } else {
            $_SESSION['error'] = "Token no proporcionado.";
            header('location: /');
        }
        exit();
    }

    public function historial()
    {
        if (isset($_SESSION['user'])) {
            $data = $this->model->filter($_SESSION['user']);
            $data['userRanking'] = $this->model->getUserRanking($_SESSION['id']);
            $partidas = $this->model->getHistorialPartidas($_SESSION['id']);
            foreach ($partidas as $index => $partida) {
                $partidas[$index]['numero'] = $index + 1;
            }
            $data['partidas'] = $partidas;
            $this->presenter->show('historial', $data);
        }
    }

    public function verificarUsername()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $username = $_POST['username'];
            $existe = $this->model->existeUsername($username);
            header('Content-Type: application/json');
            echo json_encode(['existe' => $existe]);
            exit();
        }
    }

    public function verPerfilJugadores()
    {
        if (isset($_GET['qr']) && $_GET['qr'] === 'true' && isset($_GET['usuario'])) {
            $user = $_GET['usuario'];
            $this->generarQR($user);
            exit;
        }
        if($_SERVER['REQUEST_METHOD'] === 'POST')
        {
            $user = $_POST['usuario'];
        }else if($_SERVER['REQUEST_METHOD'] === 'GET')
        {
            $user = $_GET['usuario'];
        }
        $data = $this->model->filter($user);
        $this->presenter->show('perfilUsuario', $data);
    }

    private function generarQR($nombre_usuario) {
        $urlPerfil = 'http://' . $_SERVER['HTTP_HOST'] . '/usuario/verPerfilJugadores?usuario=' . urlencode($nombre_usuario);
        QRcode::png($urlPerfil, false, QR_ECLEVEL_H, 10, 2);
    }

}