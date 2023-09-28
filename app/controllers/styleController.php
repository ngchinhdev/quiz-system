<?php
    $isPage = isset($_GET['page']);

    if($isPage && $_GET['page'] === 'list') {
        echo '<link rel="stylesheet" href="../../public/css/levelpage.css">';
    }

    if($isPage && $_GET['page'] === 'start') {
        echo '<link rel="stylesheet" href="../../public/css/testpage.css">';
    }
?>