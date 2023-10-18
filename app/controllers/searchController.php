<?php
    require_once("../models/exam.php");
    $exam = new Exam();

    if(isset($_GET['q']) && $_GET['q']) {
        header("Location: index.php?q=".$_GET['q']);
    }
?>