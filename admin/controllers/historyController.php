<?php
    require_once("../models/history.php");
    if(isset($_GET['page']) && $_GET['page'] === 'history') {
        $history = new History();

        $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
        $per_page = 5;
        $off_set = ($cur_page - 1) * $per_page;

        $dataHistory = $history->getHistory($per_page, $off_set);

        header('Content-Type: application/json');
        echo json_encode($dataHistory);
    }
?>