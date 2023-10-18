<?php
    require_once("../models/exam.php");
    $exam = new Exam();

    if(isset($_GET['page'])) {
        $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
        $per_page = 10;
        $off_set = ($cur_page - 1) * $per_page;

         if($_GET['page'] === 'lib_test'){
            $total_records = $exam->getCountRecords('de', 'ma_de', 0);
            $total_pages = ceil($total_records / $per_page);
            $dataExam = $exam->getExamTestRows($per_page, $off_set, 0);

            $response = array(
                "data" => $dataExam,
                "totalPages" => $total_pages
            );

            header('Content-Type: application/json');
            echo json_encode($response);
        } 

        if($_GET['page'] === 'lib_exam' || $_GET['page'] === 'lib') {
            $total_records = $exam->getCountRecords('de', 'ma_de', 1);
            $total_pages = ceil($total_records / $per_page);
            $dataExam = $exam->getExamTestRows($per_page, $off_set, 1);

            $response = array(
                "data" => $dataExam,
                "totalPages" => $total_pages
            );

            header('Content-Type: application/json');
            echo json_encode($response);
        }

        if($_GET['page'] === 'add-exam') {
            if(isset($_POST['submit'])) {
                $exam_name = $_POST['exam-name'];
                $exam_kit = $_POST['exam-kit'];
                $time = $_POST['time'];

                $questions = $_POST['question'];
                $audios = $_FILES['audio'];
                $explains = $_POST['explain'];
                $answers = $_POST['answer'];
                $corrects = $_POST['correct'];

                $exam_id = $exam->addExam($exam_name, $exam_kit, $time);

                for($i = 0; $i < count($questions); $i++) {
                    $question = $questions[$i];
                    $explain = $explains[$i];

                    $question_id = $exam->addQuestion($question, $explain, $exam_id);

                    if(!empty($audios)) {
                        $audio = $audios['name'][$i];
                        $destination =  "../../public/audios/$audio";
                        $tmp_name = $audios['tmp_name'][$i];

                        if(move_uploaded_file($tmp_name, $destination)) {
                            $exam->addAudio($audio, $question_id);
                        } 
                    }

                    for($j = 0; $j < count($answers[$i]); $j++) {
                        $answer = $answers[$i][$j];
                        $isCorrect = ($corrects[$i] == $j + 1) ? 1 : 0;

                        $exam->addAnswer($answer, $isCorrect, $question_id);
                    }
                }
                
                header("Location: index.php?page=lib");
            }
        }

        if($_GET['page'] === 'add-test') {
            if(isset($_POST['submit'])) {
                $exam_name = $_POST['exam-name'];
                $exam_kit = $_POST['exam-kit'];
                $exam_level = $_POST['exam-level'];

                $questions = $_POST['question'];
                $audios = $_FILES['audio'];
                $explains = $_POST['explain'];
                $answers = $_POST['answer'];
                $corrects = $_POST['correct'];

                $test_id = $exam->addTest($exam_name, $exam_kit, $exam_level);

                for($i = 0; $i < count($questions); $i++) {
                    $question = $questions[$i];
                    $explain = $explains[$i];

                    $question_id = $exam->addQuestion($question, $explain, $test_id);

                    if(!empty($audios)) {
                        $audio = $audios['name'][$i];
                        $destination =  "../../public/audios/$audio";
                        $tmp_name = $audios['tmp_name'][$i];

                        if(move_uploaded_file($tmp_name, $destination)) {
                            $exam->addAudio($audio, $question_id);
                        } 
                    }

                    for($j = 0; $j < count($answers[$i]); $j++) {
                        $answer = $answers[$i][$j];
                        $isCorrect = ($corrects[$i] == $j + 1) ? 1 : 0;

                        $exam->addAnswer($answer, $isCorrect, $question_id);
                    }
                }
                
                header("Location: index.php?page=lib");
            }
        }

        if($_GET['page'] === 'edit-exam') {
            $exam_id = (int)$_GET['id'];
            $dataExamEdit = $exam->getExamEdit($exam_id);
            $dataQuestionsEdit = $exam->getQuestionsEdit($exam_id);
            $dataAnswersEdit = $exam->getAnswersEdit($exam_id);

            if(isset($_POST['submit'])) {
                $exam_name = $_POST['exam-name'];
                $exam_kit = $_POST['exam-kit'];
                $time = $_POST['time'];

                $questions = $_POST['question'];
                $audios = $_FILES['audio'];
                $explains = $_POST['explain'];
                $answers = $_POST['answer'];
                $corrects = $_POST['correct'];

                $exam->updateExam($exam_name, $exam_kit, $time, $exam_id);

                for($i = 0; $i < count($questions); $i++) {
                    $question = $questions[$i];
                    $explain = $explains[$i];

                    $question_id = $exam->addQuestion($question, $explain, $exam_id);

                    if(!empty($audios)) {
                        $audio = $audios['name'][$i];
                        $destination =  "../../public/audios/$audio";
                        $tmp_name = $audios['tmp_name'][$i];

                        if(move_uploaded_file($tmp_name, $destination)) {
                            $exam->addAudio($audio, $question_id);
                        } 
                    }

                    for($j = 0; $j < count($answers[$i]); $j++) {
                        $answer = $answers[$i][$j];
                        $isCorrect = ($corrects[$i] == $j + 1) ? 1 : 0;

                        $exam->addAnswer($answer, $isCorrect, $question_id);
                    }
                }
                // header("Location: index.php?page=lib");
            }
        }

        if($_GET['page'] === 'edit-test') {
            $test_id = (int)$_GET['id'];
            $dataTestEdit = $exam->getExamEdit($test_id);
            $dataQuestionsEdit = $exam->getQuestionsEdit($test_id);
            $dataAnswersEdit = $exam->getAnswersEdit($test_id);

            if(isset($_POST['submit'])) {
                header("Location: index.php?page=lib");
            }
        }
    }



    // Delete for both exam and test
    if(isset($_GET['act']) && $_GET['act'] === 'delete') {
        $exam->deleteAnswer((int)$_GET['id']);
        $exam->deleteAudio((int)$_GET['id']);
        $exam->deleteQuestion((int)$_GET['id']);
        $exam->deleteExam((int)$_GET['id']);

        header("Location: index.php?page=lib");
    }
?>