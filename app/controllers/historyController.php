<?php
    require_once ("../models/history.php");

    if(isset($_COOKIE['is_user'])) {
        $history = new History();

        $user_id = (int)$_COOKIE['is_user'];
        $data = json_decode(file_get_contents("php://input"), true);
        
        if(!empty($data)) {

            $points = (int)$data['correctPoints'];
            $exam_id = (int)$data['idExam'];
            $time_did = (int)$data['timeDid'];
            $history_choose = $data['historyAnswers'];

            $last_id = $history->addHistory($time_did, $points, $user_id , $exam_id);
    
            foreach($history_choose as $ques => $ans) {
                $history->addHistoryAnswers($ans, $last_id, $ques);
            }
    
            // header('Content-Type: application/json');
            // echo json_encode($time_did);
        } else {
            $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
            $per_page = 1;
            $offset = ($cur_page - 1) * $per_page;

            $data_history = $history->getHistory($user_id, $per_page, $offset);
            $total_records = $history->getTotalRecords($user_id);

            $res = array(
                "data" => $data_history,
                "totalRecords" => $total_records
            );

            header('Content-Type: application/json');
            echo json_encode($res);
        }

        // header("Location: index.php?page=profile"); 
    } else {
        echo 'cut';
    }
?>