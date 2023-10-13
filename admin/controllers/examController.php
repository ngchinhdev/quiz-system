<?php
    require_once("../models/exam.php");
    if(isset($_GET['page'])) {
        $exam = new Exam();

        $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
        $per_page = 5;
        $off_set = ($cur_page - 1) * $per_page;

        if($_GET['page'] === 'lib_exam' || $_GET['page'] === 'lib') {
            $dataExam = $exam->getExam($per_page, $off_set, 1);

            header('Content-Type: application/json');
            echo json_encode($dataExam);
        } else {
            $dataExam = $exam->getExam($per_page, $off_set, 0);

            header('Content-Type: application/json');
            echo json_encode($dataExam);
        }
    }
?>