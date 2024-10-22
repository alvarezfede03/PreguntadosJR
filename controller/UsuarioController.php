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

    public function mostrarFormularioRegistro()
    {
        $data=[];
        $this->presenter->show('registro', []);
    }

    public function registrarUsuario()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $uuid = uniqid(time(), true);
            $nombre_usuario = $_POST['nombre_usuario'];

            // Verificar si se ha subido un archivo de imagen
            if (isset($_FILES['foto_perfil']) && $_FILES['foto_perfil']['error'] === UPLOAD_ERR_OK) {
                $fotoPerfil = $_FILES['foto_perfil'];

                // Validar tipo de archivo permitido (jpg, png, svg)
                $allowedTypes = ['image/jpeg', 'image/png', 'image/svg+xml'];
                $fileType = mime_content_type($fotoPerfil['tmp_name']);

                if (!in_array($fileType, $allowedTypes)) {
                    $_SESSION['error'] = "Formato de imagen no permitido. Solo se aceptan archivos .jpg, .png o .svg.";
                    header('location: /registro');
                    exit();
                }

                // Obtener la extensión del archivo original
                $extension = pathinfo($fotoPerfil['name'], PATHINFO_EXTENSION);

                // Renombrar la imagen con el nombre del usuario
                /*
                $uploadDir = './public/perfiles/';
                $newFileName = $nombre_usuario . '.' . $extension;  // Nombre de usuario + extensión
                $uploadFilePath = $uploadDir . $newFileName;

                echo $uploadFilePath;

                // Mover el archivo subido a la carpeta
                if (!move_uploaded_file($fotoPerfil['tmp_name'], $uploadFilePath)) {
                    $_SESSION['error'] = "Error al subir la imagen.";
                    header('location: /registro');
                    exit();
                }
            } else {
                $_SESSION['error'] = "No se ha subido ninguna imagen.";
                header('location: /registro');
                exit();
            }

            // Registrar el usuario con la ruta de la imagen renombrada
            $data = [
                'uuid' => $uuid,
                'nombre_usuario' => $nombre_usuario,
                'contraseña' => password_hash($_POST['contraseña'], PASSWORD_DEFAULT),
                'nombre_completo' => $_POST['nombre_completo'],
                'anio_nacimiento' => $_POST['anio_nacimiento'],
                'sexo' => $_POST['sexo'],
                'mail' => $_POST['mail'],
                'foto_perfil' => $uploadFilePath  // Guardar la ruta de la imagen renombrada en la BD
            ];
                */
                $fileName = basename($fotoPerfil['name']);
                $uploadDir = '/public/perfiles/';
                $newFileName = $nombre_usuario . '.' . $extension;
                $uploadFilePath = $uploadDir . $newFileName;
                $uploadFileBDD = $_SERVER['DOCUMENT_ROOT'] . $uploadDir . $newFileName;

                // Mover el archivo subido a la carpeta
                if (!move_uploaded_file($fotoPerfil['tmp_name'], $uploadFileBDD)) {
                    $_SESSION['error'] = "Error al subir la imagen.";
                    header('location: /registro');
                    exit();
                }
            } else {
                $_SESSION['error'] = "No se ha subido ninguna imagen.";
                header('location: /registro');
                exit();
            }

            // Registrar el usuario con la ruta de la imagen
            $data = [
                'uuid' => $uuid,
                'nombre_usuario' => $_POST['nombre_usuario'],
                'contraseña' => password_hash($_POST['contraseña'], PASSWORD_DEFAULT),
                'nombre_completo' => $_POST['nombre_completo'],
                'anio_nacimiento' => $_POST['anio_nacimiento'],
                'sexo' => $_POST['sexo'],
                'mail' => $_POST['mail'],
                'foto_perfil' => $uploadFilePath // Guardar la ruta de la imagen en la BD
            ];





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