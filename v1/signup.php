<?php
	session_start();
	include_once '../app/connect.php';
	include_once './controllers/Controller.php';
	include_once './controllers/Database.php';
	include_once './controllers/Auth.php';
	$controller = new Controller($conn);
	$auth = new Authorize($conn);
	if (REQUEST_METHOD === 'GET') {
		$controller->jsonheader();
		$key = (isset($_GET['token'])) ? $_GET['token'] : null ;
		$token = $controller::cleanurl($token);
		echo $auth->auth0($token);
	}