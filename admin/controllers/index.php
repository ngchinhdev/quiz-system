<?php 
    if(!isset($_COOKIE['is_admin'])) {
        header("Location: ../../app/controllers/index.php?page=login");
        return;
    }

    include_once("../views/includes/header.php");
?>

<?php
    if(isset($_GET['page'])) {
        switch($_GET['page']) {
            case 'add-exam': 
                include_once("../views/addExam.php");
                break;
            case 'add-test': 
                include_once("../views/addTest.php");
                break;
            case 'edit-exam': 
                include_once("examController.php");
                include_once("../views/editExam.php");
                break;
            case 'edit-test': 
                include_once("examController.php");
                include_once("../views/editTest.php");
                break;
            case 'edit-feedback': 
                include_once("feedbackController.php");
                include_once("../views/editFeedback.php");
                break;
            default:
                include_once("../views/main.php");
        }
    } else {
        include_once("../views/main.php");
    }
?>

<?php include_once("../views/includes/footer.php") ?>
