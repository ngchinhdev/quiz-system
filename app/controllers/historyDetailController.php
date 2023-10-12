<?php
    require_once ("../models/history.php");

    $history = new History();

    $history_id = $_GET['historyId'];
    $exam_id = $_GET['examId'];

    $detail = $history->getDetailHistory($history_id);
    $all_questions_answers = $history->getAllQuestionsAnswers($exam_id);
    $correct_answer = $history->getCorrectAnswers($exam_id);

    $response = array(
        "correctAnswers" => $correct_answer,
        "detailData" => $detail,
        "originData" => $all_questions_answers
    );

    header('Content-Type: application/json');
    echo json_encode($response);

?>