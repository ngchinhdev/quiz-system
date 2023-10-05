<?php 
require_once "../models/dbConnect.php";
require_once "../views/includes/header.php" ?>

<?php 
    $isPage = isset($_GET['page']);

    // mod=page, about;
    // if page -> c_page, act...

    $isTestPage = isset($_GET['type']) && $_GET['type'] === 'test';
    
    if($isPage && $isPage && $_GET['page'] === 'list' && $isTestPage) {
        require_once "../views/exam.php";
    } else if($isPage && $_GET['page'] === 'start') {
        require_once "../views/startQuiz.php";
    } else {
        require_once "../views/home.php";
    }
?>

<?php require_once "../views/includes/footer.php" ?>