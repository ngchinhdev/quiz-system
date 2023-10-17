<?php
    require_once("../models/dashboard.php");
    $dashboard = new Dashboard();

    if(isset($_GET['page']) && $_GET['page'] === 'dashboard') {
        $quantity_user = $dashboard->getNumberUser();
        $quantity_history = $dashboard->getNumberHistory();
        $quantity_feedback = $dashboard->getNumberFeedback();
        $quantity_both_exam_test = $dashboard->getNumberExam(null);
        $quantity_exam = $dashboard->getNumberExam(1);
        $quantity_test = $quantity_both_exam_test - $quantity_exam;

        $percent_exam = ($quantity_exam / $quantity_both_exam_test) * 100;

        $response = array(
            "quantityUser" => $quantity_user,
            "quantityHistory" => $quantity_history,
            "quantityFeedback" => $quantity_feedback,
            "quantityExam" => $quantity_exam,
            "quantityTest" => $quantity_test,
            "percentExam" => round($percent_exam, 1),
            "percentTest" => round(100 - $percent_exam, 1)
        );

        header('Content-Type: application/json');
        echo json_encode($response);
    }
?>