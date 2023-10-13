<?php
    require_once("../models/feedback.php");
    if(isset($_GET['page']) && $_GET['page'] === 'feedback') {
        $feedback = new Feedback();

        $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
        $per_page = 5;
        $off_set = ($cur_page - 1) * $per_page;

        $dataFeedback = $feedback->getFeedback($per_page, $off_set);

        header('Content-Type: application/json');
        echo json_encode($dataFeedback);
    }
?>