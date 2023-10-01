<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="../../public/imgs/favic.png">
    <link rel="stylesheet" href="../../public/css/style.css">
    <?php include_once("../controllers/styleController.php") ?>
    <link rel="stylesheet" href="../../public/css/fontawesome/css/all.css">
    <script defer src="../../main.js"></script>
    <script defer type="module" src="../../public/js/ajax/exam.js"></script>
    <title>English Test Pro</title>
</head>
<body>
    <div class="pad"></div>
    <header class="header">
        <div class="header__logo">
            <a href="<?php echo $_SERVER['PHP_SELF']; ?>"><img src="../../public/imgs/logo.png" alt="Logo EnglishTestPro"></a>
        </div>
        <div class="header__nav">
            <ul class="header__nav--list">
                <li class="header__nav--item">
                    <a href="#" class="header__nav--link toggle-nav">Bài test <i class="fa-sharp fa-solid fa-angle-down"></i></a>
                    <div class="header__subnav">
                        <ul class="wwrr">
                            <li class="header__subnav--item" data-link="0">
                                <i class="fa-sharp fa-solid fa-pen subject"></i>
                                Từ vựng
                                <i class="fa-sharp fa-solid fa-angle-right arrow"></i>
                            </li>
                            <li class="header__subnav--item" data-link="1">
                                <i class="fa-sharp fa-solid fa-spell-check subject"></i>
                                Ngữ pháp
                                <i class="fa-sharp fa-solid fa-angle-right arrow"></i>
                            </li>
                            <li class="header__subnav--item" data-link="2">
                                <i class="fa-sharp fa-solid fa-book-open subject"></i>
                                Đọc hiểu
                                <i class="fa-sharp fa-solid fa-angle-right arrow"></i>
                            </li>
                            <li class="header__subnav--item" data-link="3">
                                <i class="fa-sharp fa-solid fa-headphones subject"></i>
                                Kỹ năng nghe
                                <i class="fa-sharp fa-solid fa-angle-right arrow"></i>
                            </li>
                        </ul>
                        <ul class="header__nav--level">
                            <li><a href="#" class="nav__level--link"><i class="fa-sharp fa-solid fa-bolt"></i> Cơ bản</a></li>
                            <li><a href="#" class="nav__level--link"><i class="fa-sharp fa-solid fa-hourglass-start"></i> Trung bình</a></li>
                            <li><a href="#" class="nav__level--link"><i class="fa-sharp fa-solid fa-crown"></i> Nâng cao</a></li>
                        </ul>
                    </div>
                </li>
                <li class="header__nav--item">
                    <a href="levelpage.html" class="header__nav--link">Đề thi</a>
                </li>
                <li class="header__nav--item">
                    <a href="#" class="header__nav--link">Lịch sử học</a>
                </li>
                <li class="header__nav--item">
                    <a href="#" class="header__nav--link">Hỗ trợ <i class="fa-sharp fa-regular fa-circle-question"></i></a>
                </li>
            </ul>
        </div>
        <div class="header__search">
            <div class="header__search--box">
                <input type="text" placeholder="Bài kiểm tra, đề thi" class="header__search-input">
                <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
            </div>
        </div>
        <div class="header__login">
            <a href="#" class="header__login--register">
                Đăng ký
            </a>
            <a href="#" class="header__login--login">
                Đăng nhập
            </a>
        </div>
    </header>