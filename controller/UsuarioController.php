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
            $_SESSION['foto_perfil'] = $data['usuario'][0]['foto_perfil'];
            $_SESSION['id'] = $data['usuario'][0]['id'];
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
        $password =  password_hash($_POST['password'], PASSWORD_DEFAULT);
        $fullname = $_POST['fullname'];
        $birthyear = $_POST['birthyear'];
        $sexo = $_POST['sexo'];
        $email = $_POST['email'];
        $country = $_POST['country'];
        $city = $_POST['city'];

        // Validar imagen de perfil
        if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
            // Llamar a la función que valida la imagen
            $resultadoImagen = $this->validarImagen($_FILES['image']);
            if ($resultadoImagen['valid']) {
                // Definir la ruta relativa para la URL pública (lo que se almacena en la base de datos)
                $urlImagen = "../public/perfiles/" . $username . "." . $resultadoImagen['extension'];

                // Definir la ruta absoluta para guardar la imagen físicamente
                $rutaImagen = $_SERVER['DOCUMENT_ROOT'] . $urlImagen;
                // Mover el archivo subido a la carpeta destino
                move_uploaded_file($_FILES['image']['tmp_name'], $rutaImagen);

            } else {
                // Si hay un problema con la imagen, redirigir con mensaje de error
                $_SESSION['error'] = $resultadoImagen['message'];
                header("Location: /registro");
                exit();
            }
        } else {
            // Si no se ha cargado ninguna imagen o hubo un error
            $rutaImagen = null; // O una imagen por defecto si lo prefieres
        }


        // Guardar los datos del usuario en la base de datos
        $resultado = $this->model->crearUsuario($uuid, $username, $password, $fullname, $birthyear, $sexo, $email, $country, $city, $urlImagen);

        if ($resultado) {
            // Redirigir a una página de registro exitoso
            $_SESSION['success'] = "Usuario registrado exitosamente.";
            header("Location: /login");
        } else {
            // Si falla, redirigir al formulario de registro con un mensaje de error
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

}