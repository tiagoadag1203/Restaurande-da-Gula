<?php

require 'vendor/autoload.php';

use App\controllers\HomeController;

$action = $_GET['action'] ?? 'home';

switch ($action) {
    case 'home':
        $controller = new HomeController();
        $controller->index();
        break;

    default:
        echo "Página não encontrada.";
        break;
}
