<?php
session_start();
include_once("configuration/Configuration.php");
$configuration = new Configuration();
$router = $configuration->getRouter();
$presenter = $configuration->getPresenter();

$page = isset($_GET['page']) ? $_GET['page'] : "";
$methodName = isset( $_GET['action']) ? $_GET['action']: "";
// el ? es para si la condicion es verdarea
// el : es para si la condicion es falsa
// si es verdadera devuelve $_GET['action'], si es falsa devuelve nada

if ($page === '' && $methodName === '') {
    $router->route($page, $methodName);
    exit;
}

if ($page === 'usuario' && $methodName === 'auth') {
    $router->route($page, $methodName);
    exit;
}

if ($page === 'usuario' && (($methodName === 'registrar') || ($methodName === 'procesarRegistro'))) {
    $router->route($page, $methodName);
    exit;
}

$userRole = isset($_SESSION['tipo_usuario']) ? $_SESSION['tipo_usuario'] : '';

$permissions = [
    'jugador' => [
        'usuario' => ['search', 'search2', 'login', 'home', 'logout', 'historial'],
        'partida' => ['ranking', 'nueva', 'traerPregunta', 'validarRespuesta', 'reportarPregunta'],
        'crearpreguntas' => ['form', 'crear']
    ],
    'editor' => [
        'usuario' => ['search', 'login', 'home', 'logout'],
        'editor' => ['verPreguntas', 'editarPregunta', 'actualizarPregunta', 'eliminarPregunta', 'verPreguntasReportadas',
            'verPreguntasSugeridas', 'darDeAltaPregunta']
    ],
    'admin' => [
        'usuario' => ['search', 'login', 'home', 'logout'],
        'admin' => ['informes', 'cantidadJugadores', 'cantidadPartidasJugadas', 'cantidadPreguntasCreadas', 'cantidadUsuariosNuevos',
            'cantidadUsuariosXPais', 'cantidadUsuariosXSexo', 'cantidadUsuariosXGrupoEdad', 'porcentajeDePreguntasCorrectas']
    ]
];

if (isset($permissions[$userRole][$page]) && in_array($methodName, $permissions[$userRole][$page])) {
    $router->route($page, $methodName);
} else {
    $data['gif']=true;
    $frases = json_decode(file_get_contents('public/frases.json'), true)['frases'];
    $data['frases'] = $frases[array_rand($frases)];
    $presenter->show('blank',$data);
}

//$router->route($page, $methodName);