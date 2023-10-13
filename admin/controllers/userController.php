<?php
    require_once("../models/user.php");
    if(isset($_GET['page']) && $_GET['page'] === 'user') {
        $user = new User();

        $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
        $per_page = 5;
        $off_set = ($cur_page - 1) * $per_page;

        $dataUser = $user->getUser($per_page, $off_set);

        header('Content-Type: application/json');
        echo json_encode($dataUser);
    }
?>