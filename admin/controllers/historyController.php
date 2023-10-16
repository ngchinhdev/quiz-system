<?php
    require_once("../models/history.php");
    if(isset($_GET['page']) && $_GET['page'] === 'history') {
        $history = new History();

        $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
        $per_page = 5;
        $off_set = ($cur_page - 1) * $per_page;
        $total_records = $history->getCountRecords('lich_su_lam_bai', 'ma_lich_su', null);
        $total_pages = ceil($total_records / $per_page);

        $dataHistory = $history->getHistory($per_page, $off_set);
        $response = array(
            "data" => $dataHistory,
            "totalPages" => $total_pages
        );

        header('Content-Type: application/json');
        echo json_encode($response);
    }
?>