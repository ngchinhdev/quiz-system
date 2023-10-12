<?php
    require_once ("../models/question.php");
    $question = new Question();

    $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
    $per_page = 1;
    $off_set = ($cur_page - 1) * $per_page;

    $exam_id = $_GET['examId'];
    $quantity_questions = $question->getQuestionsQuantity($exam_id);
    $question_data = $question->getCurQuestionData($exam_id, $per_page, $off_set);
    $audio_link = $question->getAudiosData($question_data['ma_cau_hoi']);
    $answer_data = $question->getCurAnswerData($question_data['ma_cau_hoi']);
    $time_to_do = $question->getTimeToDo($exam_id);
    $correct_answers = $question->getCorretAnswers($exam_id);
    $all_questions_answers = $question->getAllQuestionsAnswers($exam_id);
    
    $response = array(
        "dataQuestions" => $question_data,
        "questionQuantity" => $quantity_questions,
        "audioLink" => $audio_link,
        "dataAnswers" => $answer_data,
        "timeToDo" => $time_to_do,
        "correctAnswers" => $correct_answers,
        "allQuestionsAnswers" => $all_questions_answers
    );

    $question->closeConnection();
    
    header('Content-Type: application/json');
    echo json_encode($response);
?>