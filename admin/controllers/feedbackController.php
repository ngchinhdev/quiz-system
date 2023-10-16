<?php
    require_once("../models/feedback.php");
    $feedback = new Feedback();

    if(isset($_GET['page']) && $_GET['page'] === 'feedback') {
        $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
        $per_page = 5;
        $off_set = ($cur_page - 1) * $per_page;
        $total_records = $feedback->getCountRecords('phan_hoi', 'ma_phan_hoi', null);
        $total_pages = ceil($total_records / $per_page);

        $dataFeedback = $feedback->getFeedbackRows($per_page, $off_set);
        $response = array(
            "data" => $dataFeedback,
            "totalPages" => $total_pages
        );

        header('Content-Type: application/json');
        echo json_encode($response);
    }

    if(isset($_GET['page']) && $_GET['page'] === 'edit-feedback') {
        $feedback_data_edit = $feedback->getFeedbackEdit($_GET['id']);
    }

    if (isset($_POST['submit']) && $_POST['submit']) {
        $status = $_POST['feedback-status'];
        $feedback->updateFeedbackStatus((int)$_GET['id'], $status);
        header("Location: index.php?page=feedback");
    }

    if (isset($_GET['act']) && $_GET['act'] === 'delete') {
        $feedback->deleteFeedback((int)$_GET['id']);
        header("Location: index.php?page=feedback");
    }
?>