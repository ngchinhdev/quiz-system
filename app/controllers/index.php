<?php 
    require_once "../views/includes/header.php";
?>

<?php 
    if(isset($_GET['page'])) {
        switch($_GET['page']) {
            case 'list':
                require_once "../views/exam.php";
                break;
            case 'start':
                require_once "../views/startQuiz.php";
                break;
            case 'login':
            case 'register':
                require_once "oauthController.php";
                break;
            case 'profile':
                require_once "../views/profile.php";
                break;
            case 'support':
                require_once "../views/feedback.php";
                break;
            default:
                require_once "../views/home.php";
        }
    } else if(isset($_GET['q']) && $_GET['q']) {
        require_once "../views/exam.php";
    } else {
        require_once "../views/home.php";
    }

    if(isset($_GET['q']) && $_GET['q']) {
        require_once "../views/exam.php";
    }

    // $isPage = isset($_GET['page']);

    // mod=page, about;
    // if page -> c_page, act...

    // $isTestPage = isset($_GET['type']) && $_GET['type'] === 'test';
    
    // if($isPage && $isPage && $_GET['page'] === 'list' && $isTestPage) {
    //     require_once "../views/exam.php";
    // } else if($isPage && $_GET['page'] === 'start') {
    //     require_once "../views/startQuiz.php";
    // } else if($isPage && ($_GET['page'] === 'login' || $_GET['page'] === 'register')) {
    //     require_once "oauthController.php";
    // } else if($isPage && $_GET['page'] === 'profile') {
    //     require_once "../views/profile.php";
    // } else if($isPage && $_GET['page'] === 'support') {
    //     require_once "../views/feedback.php";
    // } else if(($isPage && $_GET['page'] === 'list')) {
    //     require_once "../views/exam.php";
    // } else if(isset($_GET['q']) && $_GET['q']) {
    //     require_once "../views/exam.php";
    // } else {
    //     require_once "../views/home.php";
    // }
?>

<?php require_once "../views/includes/footer.php" ?>