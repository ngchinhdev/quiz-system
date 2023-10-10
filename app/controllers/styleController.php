<?php
    $isPage = isset($_GET['page']);

    if($isPage && $_GET['page'] === 'list') {
        echo '<link rel="stylesheet" href="../../public/css/levelpage.css">';
    }

    if($isPage && $_GET['page'] === 'start') {
        echo '<link rel="stylesheet" href="../../public/css/testpage.css">';
    }

    if($isPage && ($_GET['page'] === 'login' || $_GET['page'] === 'register')) {
        echo '<link rel="stylesheet" href="../../public/css/login.css">';
    }

    if($isPage && $_GET['page'] === 'profile') {
        echo '<link rel="stylesheet" href="../../public/css/profile.css">';
    }
?>