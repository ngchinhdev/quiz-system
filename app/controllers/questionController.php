<?php
    require_once("../models/dbConnect.php");
    require_once ("../models/question.php");
    $question = new Question($conn);

    $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
    $per_page = 1;
    $off_set = ($cur_page - 1) * $per_page;
    $ma_de = $_GET['id'];
    $quantity_questions = $question->getQuestionsQuantity($ma_de);
    $question_data = $question->getCurQuestionData($ma_de, $per_page, $off_set);
    $answer_data = $question->getCurAnswerData($question_data['ma_cau_hoi']);
    $time_to_do = $question->getTimeToDo($ma_de);
    
    $response = array(
        "dataQuestions" => $question_data,
        "questionQuantity" => $quantity_questions,
        "dataAnswers" => $answer_data,
        "timeToDo" => $time_to_do
    );

    if(isset($_GET['topic']) && $_GET['topic'] === 'listening') {
        $audio_link = $question->getAudiosData($question_data['ma_cau_hoi']);
        $response["audioLink"] = $audio_link;
    }
    
    header('Content-Type: application/json');
    echo json_encode($response);
?>