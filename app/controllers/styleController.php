<?php
    $isPage = isset($_GET['page']) && $_GET['page'] === 'list';

    if($isPage) {
        echo '<link rel="stylesheet" href="../../public/css/levelpage.css">';
    }
?>