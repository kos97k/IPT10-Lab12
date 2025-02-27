<?php

require "vendor/autoload.php";
require "init.php";

global $conn;

try {

    $router = new \Bramus\Router\Router();

    $router->get('/', '\App\Controllers\HomeController@index');

    $router->get('/register', '\App\Controllers\ExamController@registrationForm');
    $router->post('/register', '\App\Controllers\ExamController@register');

    $router->get('/login', '\App\Controllers\LoginController@loginForm');
    $router->post('/login', '\App\Controllers\LoginController@login');
    $router->get('/logout', '\App\Controllers\LoginController@logout');

    $router->get('/exam', '\App\Controllers\ExamController@exam');
    $router->post('/exam', '\App\Controllers\ExamController@exam');
    $router->get('/result', '\App\Controllers\ExamController@result');

    $router->get('/examinees', '\App\Controllers\ExamineesController@index');
    $router->get('/exam-attempts/{exam_attempt_id}', '\App\Controllers\ExamineesController@exportToPDF');

    // Run it!
    $router->run();

} catch (Exception $e) {

    echo json_encode([
        'error' => $e->getMessage()
    ]);

}
