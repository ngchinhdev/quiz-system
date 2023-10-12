<?php 
    // session_start();
    require_once "../views/includes/header.php" 
?>

<?php 
    $isPage = isset($_GET['page']);

    // mod=page, about;
    // if page -> c_page, act...

    $isTestPage = isset($_GET['type']) && $_GET['type'] === 'test';
    
    if($isPage && $isPage && $_GET['page'] === 'list' && $isTestPage) {
        require_once "../views/exam.php";
    } else if($isPage && $_GET['page'] === 'start') {
        require_once "../views/startQuiz.php";
    } else if($isPage && ($_GET['page'] === 'login' || $_GET['page'] === 'register')) {
        require_once "oauthController.php";
    } else if($isPage && $_GET['page'] === 'profile') {
        require_once "../views/profile.php";
    } else if($isPage && $_GET['page'] === 'support') {
        require_once "../views/feedback.php";
    } else if($isPage && $_GET['page'] === 'list') {
        require_once "../views/exam.php";
    } else {
        require_once "../views/home.php";
    }
?>

<?php require_once "../views/includes/footer.php" ?>