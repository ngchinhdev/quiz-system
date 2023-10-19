<?php
    require_once("../models/user.php");
    $user = new User();
    if(isset($_GET['page']) && $_GET['page'] === 'user') {

        $cur_page = isset($_GET['curpage']) ? $_GET['curpage'] : 1;
        $per_page = 10;
        $off_set = ($cur_page - 1) * $per_page;
        $total_records = $user->getCountRecords('nguoi_dung', 'ma_nguoi_dung', null);
        $total_pages = ceil($total_records / $per_page);

        $dataUser = $user->getUser($per_page, $off_set);
        $response = array(
            "data" => $dataUser,
            "totalPages" => $total_pages
        );

        header('Content-Type: application/json');
        echo json_encode($response);
    }

    if(isset($_GET['page']) && $_GET['page'] === 'edit-user') {
        $user_id = $_GET['id'];

        if(isset($_POST['submit'])) {
            $new_role = $_POST['role-user'];
            $user->updateUser($user_id, (int)$new_role);
            header("Location: index.php");
        }
    }

    if(isset($_GET['act']) && $_GET['act'] === 'delete') {
        if($_GET['email'] === $_COOKIE['email']) {
            echo '<script>alert("Bạn không thể xóa chính mình"); history.back();</script>';
        } else {
            $user_id = $_GET['user-id'];
            $user->deleteFeedback($user_id);
            $user->deleteChoseAnswers($user_id);
            $user->deleteHistory($user_id);
            $user->deleteUser($user_id);
            header("Location: index.php?page=user");
        }
    }
?>