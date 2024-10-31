<?php
include_once("helper/MysqlObjectDatabase.php");
include_once("helper/Router.php");
include_once("helper/MustachePresenter.php");
include_once("helper/EmailSender.php");

include_once("controller/UsuarioController.php");
include_once("model/UsuarioModel.php");
include_once("controller/PartidaController.php");
include_once("model/PartidaModel.php");

include_once('vendor/mustache/src/Mustache/Autoloader.php');
include_once ('vendor/PHPMailer/src/PHPMailer.php');
include_once ('vendor/PHPMailer/src/SMTP.php');
include_once ('vendor/PHPMailer/src/Exception.php');

class Configuration
{
    public function __construct()
    {
    }

    public function getUsuarioController(){
        return new UsuarioController($this->getUsuarioModel(), $this->getPresenter());
    }

    public function getPartidaController(){
        return new PartidaController($this->getPartidaModel(), $this->getPresenter());
    }

    private function getPresenter()
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
}