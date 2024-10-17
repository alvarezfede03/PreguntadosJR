<?php
session_start();
include_once("configuration/Configuration.php");
$configuration = new Configuration();
$router = $configuration->getRouter();

$methodName = isset( $_GET['action'])? $_GET['action']:"";
// el ? es para si la condicion es verdarea
// el : es para si la condicion es falsa
// si es verdadera devuelve $_GET['action'], si es falsa devuelve nada
$router->route($_GET['page'], $methodName);
