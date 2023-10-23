<?php

    require_once '../models/user.php';

    $user = new User();
    $row = $user->getUser($_COOKIE['email']);
    setcookie("is_user", $row['ma_nguoi_dung'], time() + 84000, "/");

    if(!empty($row)) {
        if($row['ma_vai_tro'] === 1) {
            setcookie("is_admin", true, time() + 84000, "/");
            setcookie("name", "", time() - 3600, "/");
            setcookie("email", "", time() - 3600, "/");
            setcookie("avatar", "", time() - 3600, "/");
            header("Location: ../../admin/controllers/index.php");
        } else {
            header("Location: index.php?page=profile");
        }
    } else {
        $user->addUser($_COOKIE['name'], $_COOKIE['email'], $_COOKIE['avatar']);
        header("Location: index.php?page=profile");
    }
?>