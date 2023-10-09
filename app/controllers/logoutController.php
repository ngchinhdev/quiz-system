<?php
    unset($_COOKIE['name']);
    unset($_COOKIE['email']);
    unset($_COOKIE['avatar']);

    setcookie("name", "", time() - 3600, "/");
    setcookie("email", "", time() - 3600, "/");
    setcookie("avatar", "", time() - 3600, "/");
    setcookie("is_user", "", time() - 3600, "/");

    header("Location: index.php");
?>