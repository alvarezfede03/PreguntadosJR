<?php
include_once("helper/MysqlObjectDatabase.php");
include_once("helper/Router.php");
include_once("helper/MustachePresenter.php");
include_once("helper/EmailSender.php");

include_once("controller/UsuarioController.php");
include_once("model/UsuarioModel.php");
include_once("controller/PartidaController.php");
include_once("model/PartidaModel.php");
include_once("controller/AdminController.php");
include_once("model/AdminModel.php");
include_once("controller/CrearPreguntasController.php");
include_once("model/CrearPreguntasModel.php");
include_once("controller/EditorController.php");
include_once("model/EditorModel.php");

include_once('vendor/mustache/src/Mustache/Autoloader.php');
include_once('vendor/PHPMailer/src/PHPMailer.php');
include_once('vendor/PHPMailer/src/SMTP.php');
include_once('vendor/PHPMailer/src/Exception.php');
include_once('vendor/phpqrcode/qrlib.php');

class Configuration
{
    public function __construct()
    {
    }

    public function getUsuarioController()
    {
        return new UsuarioController($this->getUsuarioModel(), $this->getPresenter());
    }

    public function getPartidaController()
    {
        return new PartidaController($this->getPartidaModel(), $this->getPresenter());
    }

    public function getAdminController()
    {
        return new AdminController($this->getAdminModel(), $this->getPresenter());
    }

    public function getCrearPreguntasController()
    {
        return new CrearPreguntasController($this->getCrearPreguntasModel(), $this->getPresenter());
    }

    public function getEditorController()
    {
        return new EditorController($this->getEditorModel(), $this->getPresenter());
    }

    public function getPresenter()
    {
        return new MustachePresenter("./view");
    }

    private function getDatabase()
    {
        $config = parse_ini_file('configuration/config.ini');
        return new MysqlObjectDatabase(
            $config['host'],
            $config['port'],
            $config['user'],
            $config['password'],
            $config["database"]
        );
    }

    public function getRouter()
    {
        return new Router($this, "getUsuarioController", "login");
    }

    private function getUsuarioModel()
    {
        return new UsuarioModel($this->getDatabase());
    }

    private function getPartidaModel()
    {
        return new PartidaModel($this->getDatabase());
    }

    private function getAdminModel()
    {
        return new AdminModel($this->getDatabase());
    }

    private function getCrearPreguntasModel()
    {
        return new CrearPreguntasModel($this->getDatabase());
    }

    private function getEditorModel()
    {
        return new EditorModel($this->getDatabase());
    }
}