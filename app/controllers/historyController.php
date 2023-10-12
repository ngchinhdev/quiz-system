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

            $history->addViews($exam_id);
            $last_id = $history->addHistory($time_did, $points, $user_id , $exam_id);
    
            foreach($history_choose as $ques => $ans) {
                $history->addHistoryAnswers($ans, $last_id, $ques);
            }
    
        } else {
            $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
            $per_page = 9;
            $offset = ($cur_page - 1) * $per_page;

            $data_history = $history->getHistory($user_id, $per_page, $offset);
            $total_records = $history->getTotalRecords($user_id);
            $pagi_num = ceil($total_records / $per_page);

            $res = array(
                "data" => $data_history,
                "totalPagi" => $pagi_num
            );

            header('Content-Type: application/json');
            echo json_encode($res);
        }
    }
?>