<?php
    $isPage = isset($_GET['page']);

    if($isPage && $_GET['page'] === 'list') {
        echo '<script type="module" src="../../public/js/ajax/exam.js"></script>';
    }

    if($isPage && $_GET['page'] === 'start') {
        // echo '<script src="../../public/js/ajax/question.js"></script>';
        echo '<script type="module" src="../../public/js/start.js"></script>';
    }

    if($isPage && $_GET['page'] === 'profile') {
        echo '<script type="module" src="../../public/js/ajax/history.js"></script>';
    }

    if($isPage && $_GET['page'] === 'support') {
        echo '<script src="../../public/js/slider.js"></script>';
    }
?>