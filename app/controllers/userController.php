<?php

    require_once '../models/user.php';

    $user = new User();
    $row = $user->getUser($_COOKIE['email']);
    setcookie("is_user", $row['ma_nguoi_dung'], time() + 84000, "/");

    var_dump($row);;

    if(!empty($row)) {
        header("Location: index.php?page=profile");
    } else {
        $user->addUser($_COOKIE['name'], $_COOKIE['email'], $_COOKIE['avatar']);
        header("Location: index.php?page=profile");
    }
?>