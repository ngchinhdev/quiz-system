<?php
    if(isset($_GET['page'])) {
        switch($_GET['page']) {
            case 'list':
                echo '<link rel="stylesheet" href="../../public/css/levelpage.css">';
                break;
            case 'start':
                echo '<link rel="stylesheet" href="../../public/css/testpage.css">';
                break;
            case 'login':
            case 'register':
                echo '<link rel="stylesheet" href="../../public/css/login.css">';
                break;
            case 'profile':
                echo '<link rel="stylesheet" href="../../public/css/profile.css">';
                break;
            case 'support':
                echo '<link rel="stylesheet" href="../../public/css/feedback.css">';
                break;
        }
    } 

    if(isset($_GET['q'])) {
        echo '<link rel="stylesheet" href="../../public/css/levelpage.css">';
    }
?>