<?php 
    require_once("../models/exam.php");
    require_once("../../configs/constants.php");

    $exam = new Exam();

    if(isset($_GET['type'])) {
        if($_GET['type'] === 'test') {
            $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
            $per_page = 8;
            $type = 0;
            $off_set = ($cur_page - 1) * $per_page;
        
            $data = $exam->getTest($title[$_GET['topic']], $title[$_GET['level']], $per_page, $off_set);
            $total_records = $exam->getTotalRecords($title[$_GET['topic']], $title[$_GET['level']], $type);
            $total_pages = ceil($total_records / $per_page);
        
            $exam->closeConnection();
        
            $response = array(
                "data" => $data,
                "totalPages" => $total_pages
            );
        
            header('Content-Type: application/json');
            echo json_encode($response);
        }

        if($_GET['type'] === 'exam') {
            $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
            $per_page = 8;  
            if(isset($_GET['isHome']) && $_GET['isHome']) {
                $per_page = 10;
            }
            $type = 1;
            $off_set = ($cur_page - 1) * $per_page;
            
            $data = $exam->getExam($per_page, $off_set);
            $total_records = $exam->getTotalRecords(null, null, $type);
            $total_pages = ceil($total_records / $per_page);
        
            $exam->closeConnection();
        
            $response = array(
                "data" => $data,
                "totalPages" => $total_pages
            );
        
            header('Content-Type: application/json');
            echo json_encode($response);
        }
    } else if(isset($_GET['q'])) {
        $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
        $per_page = 20;  
        $off_set = ($cur_page - 1) * $per_page;
        
        $data = $exam->queryExam($_GET['q']);
        $total_records = 20;
        $total_pages = ceil($total_records / $per_page);
    
        $exam->closeConnection();
    
        $response = array(
            "data" => $data,
            "totalPages" => $total_pages
        );
    
        header('Content-Type: application/json');
        echo json_encode($response);
    } else {
        header("Location: index.php");
    }

?>
