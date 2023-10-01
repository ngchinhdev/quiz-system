<?php
    require_once ("../models/question.php");
    $question = new Question($conn);
    $first_question = $question->getFirstQuestion($_GET['id']);

    if(!isset($_GET['id'])) return;

    $id_exam = $_GET['id'];
    $order = (int)$_GET['order'];
    $change_question = $_GET['question'];

    $first_question_number = $question->getFirstQuestion($id_exam);
    $last_question_number = $question->getLastQuestion($id_exam);

    $cur_question_number = !($_GET['question'] === '0') ? $_GET['question'] : $first_question_number;

    $questions_quantity = $question->getQuestionsQuantity($id_exam);

    $question_data = $question->getCurQuestionData($cur_question_number, $id_exam);

    $url = (empty($_SERVER['HTTPS']) ? 'http' : 'https') . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

    $next_question = $order > $question->getNextQuestionData($cur_question_number, $id_exam) ?
                     $first_question_number : $question->getNextQuestionData($cur_question_number, $id_exam);
    $prev_question = $order < 2 ? $last_question_number : 
                     $question->getPrevQuestionData($cur_question_number, $id_exam);

    $next_url_question = str_replace(['question='.$change_question, 'order='.$order], 
            ['question='.$next_question, 'order='.($order > $questions_quantity - 1 ? 1 : $order + 1)], $url);
    $prev_url_question = str_replace(['question='.$change_question, 'order='.$order], 
            ['question='.$prev_question, 'order='.($order < 2 ? $questions_quantity : $order - 1)], $url);

    include ("../views/startQuiz.php");
?>