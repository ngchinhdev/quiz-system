<?php 
    require_once("../models/exam.php");
    require_once("../models/dbConnect.php");
    require_once("../models/constants.php");
    $exam = new Exam($conn);
    $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
    $per_page = 1;
    $off_set = ($cur_page - 1) * $per_page;
    $data = $exam->getExam($title[$_GET['topic']], $title[$_GET['level']], $per_page, $off_set);
    $total_records = $exam->getTotalRecords();
    $total_pages = ceil($total_records / $per_page);

    $response = array(
        "data" => $data,
        "totalRecords" => $total_records,
        "totalPages" => $total_pages
    );

    header('Content-Type: application/json');
    echo json_encode($response);
?>
