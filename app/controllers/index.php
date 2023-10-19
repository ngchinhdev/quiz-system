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
    } else if(isset($_GET['q'])) {
        require_once "../views/exam.php";
    } else {
        require_once "../views/home.php";
    }
?>

<?php require_once "../views/includes/footer.php" ?>