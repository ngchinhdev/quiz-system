<?php
    require_once ("../models/feedback.php");

    $feedback = new Feedback();

    $feedbacks = $feedback->getFeedback();

    if(isset($_COOKIE['is_user'])) {
        if(isset($_POST['text-feedback']) && isset($_POST['send-feedback'])) {
            $ma_nguoi_dung = $_COOKIE['is_user'];
            $text = $_POST['text-feedback'];

            if(!(strlen(trim($text)) === 0))
                $add_feedback = $feedback->addFeedback($text, $ma_nguoi_dung);

            header("Location: index.php?page=support");
        } 
    } else {
        header("Location: index.php?page=login");
    }
?>