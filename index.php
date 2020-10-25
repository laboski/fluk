<?php
    include_once './app/connect.php';
    include_once './v1/controllers/Controller.php';
    // init controller
    $controller = new Controller($conn);
    // set header { json }
    $controller->jsonheader();
    // call structure
    $controller->structure();