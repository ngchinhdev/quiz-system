<?php 
require_once "../models/dbConnect.php";
require_once "../views/includes/header.php" ?>

<?php 
    $isPage = isset($_GET['page']) && $_GET['page'] === 'list';
    $isTestPage = isset($_GET['type']) && $_GET['type'] === 'test';
    if($isPage && $isTestPage) {
        require_once "../views/exam.php";
    } else {
        require_once "../views/home.php";
    }
?>

<?php require_once "../views/includes/footer.php" ?>