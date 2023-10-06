<?php
    $isPage = isset($_GET['page']);

    if($isPage && $_GET['page'] === 'list') {
        echo '<script src="../../public/js/ajax/exam.js"></script>';
    }

    if($isPage && $_GET['page'] === 'start') {
        // echo '<script src="../../public/js/ajax/question.js"></script>';
        echo '<script type="module" src="../../public/js/start.js"></script>';
    }
?>