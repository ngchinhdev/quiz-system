<?php
    if(isset($_GET['page'])) {
        switch($_GET['page']) {
            case 'list':
                echo '<script type="module" src="../../public/js/jsapp/ajax/exam.js"></script>';
                break;
            case 'start':
                echo '<script type="module" src="../../public/js/jsapp/start.js"></script>';
                break;
            case 'profile':
                echo '<script type="module" src="../../public/js/jsapp/ajax/history.js"></script>';
                break;
            case 'support':
                echo '<script src="../../public/js/jsapp/slider.js"></script>';
                break;
        }
    }

    // $isPage = isset($_GET['page']);

    // if($isPage && $_GET['page'] === 'list') {
    //     echo '<script type="module" src="../../public/js/jsapp/ajax/exam.js"></script>';
    // }

    // if($isPage && $_GET['page'] === 'start') {
    //     echo '<script type="module" src="../../public/js/jsapp/start.js"></script>';
    // }

    // if($isPage && $_GET['page'] === 'profile') {
    //     echo '<script type="module" src="../../public/js/jsapp/ajax/history.js"></script>';
    // }

    // if($isPage && $_GET['page'] === 'support') {
    //     echo '<script src="../../public/js/jsapp/slider.js"></script>';
    // }
?>