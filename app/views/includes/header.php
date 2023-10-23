<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="../../public/imgs/favic.png">
    <link rel="stylesheet" href="../../public/css/style.css">
    <?php include_once("../controllers/styleController.php") ?>
    <link rel="stylesheet" href="../../public/css/fontawesome/css/all.css">
    <link rel="stylesheet" src="https://cdn.jsdelivr.net/npm/sweetalert2@10">
    <script cript src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <title>English Test Pro</title>
</head>

<body>
    <div class="pad"></div>
    <header class="header">
        <div class="header__container">
            <div class="header__logo">
                <a href="<?php echo $_SERVER['PHP_SELF']; ?>"><img src="../../public/imgs/logo.png" alt="Logo EnglishTestPro"></a>
            </div>
            <div class="header__menu--mobile">
                <svg xmlns="http://www.w3.org/2000/svg" width="34" height="34" viewBox="0 0 34 34" fill="none">
                    <g clip-path="url(#clip0_163_29)">
                        <path d="M28.3333 24.7916C28.879 24.7919 29.4037 25.0021 29.7987 25.3787C30.1937 25.7553 30.4286 26.2694 30.4548 26.8145C30.481 27.3596 30.2965 27.8939 29.9396 28.3066C29.5826 28.7194 29.0805 28.979 28.5373 29.0317L28.3333 29.0416H5.66666C5.12093 29.0413 4.59623 28.8311 4.20128 28.4545C3.80632 28.0779 3.57139 27.5638 3.54516 27.0187C3.51894 26.4736 3.70343 25.9393 4.0604 25.5266C4.41738 25.1138 4.91948 24.8542 5.46266 24.8015L5.66666 24.7916H28.3333ZM28.3333 14.8749C28.8969 14.8749 29.4374 15.0988 29.8359 15.4973C30.2344 15.8958 30.4583 16.4363 30.4583 16.9999C30.4583 17.5635 30.2344 18.104 29.8359 18.5025C29.4374 18.901 28.8969 19.1249 28.3333 19.1249H5.66666C5.10307 19.1249 4.56257 18.901 4.16405 18.5025C3.76554 18.104 3.54166 17.5635 3.54166 16.9999C3.54166 16.4363 3.76554 15.8958 4.16405 15.4973C4.56257 15.0988 5.10307 14.8749 5.66666 14.8749H28.3333ZM28.3333 4.95825C28.8969 4.95825 29.4374 5.18214 29.8359 5.58065C30.2344 5.97917 30.4583 6.51967 30.4583 7.08325C30.4583 7.64684 30.2344 8.18734 29.8359 8.58585C29.4374 8.98437 28.8969 9.20825 28.3333 9.20825H5.66666C5.10307 9.20825 4.56257 8.98437 4.16405 8.58585C3.76554 8.18734 3.54166 7.64684 3.54166 7.08325C3.54166 6.51967 3.76554 5.97917 4.16405 5.58065C4.56257 5.18214 5.10307 4.95825 5.66666 4.95825H28.3333Z" fill="#4D5FFF" />
                    </g>
                    <defs>
                        <clipPath id="clip0_163_29">
                            <rect width="34" height="34" fill="white" />
                        </clipPath>
                    </defs>
                </svg>
            </div>
            <div class="header__nav hide--mobile">
                <ul class="header__nav--list">
                    <li class="header__nav--item">
                        <a href="#" class="header__nav--link toggle-nav">Bài test <i class="fa-sharp fa-solid fa-angle-down"></i></a>
                        <div class="header__subnav">
                            <ul class="header__nav--topic">
                                <li class="header__subnav--item" data-link="0">
                                    <i class="fa-sharp fa-solid fa-pen subject vocab"></i>
                                    Từ vựng
                                    <i class="fa-sharp fa-solid fa-angle-right arrow"></i>
                                </li>
                                <li class="header__subnav--item" data-link="1">
                                    <i class="fa-sharp fa-solid fa-spell-check subject gram"></i>
                                    Ngữ pháp
                                    <i class="fa-sharp fa-solid fa-angle-right arrow"></i>
                                </li>
                                <li class="header__subnav--item" data-link="2">
                                    <i class="fa-sharp fa-solid fa-headphones subject lis"></i>
                                    Kỹ năng nghe
                                    <i class="fa-sharp fa-solid fa-angle-right arrow"></i>
                                </li>
                                <li class="header__subnav--item" data-link="3">
                                    <i class="fa-sharp fa-solid fa-book-open subject read"></i>
                                    Đọc hiểu
                                    <i class="fa-sharp fa-solid fa-angle-right arrow"></i>
                                </li>
                            </ul>
                            <ul class="header__nav--level">
                                <li><a href="#" class="nav__level--link"><i class="fa-sharp fa-solid fa-bolt easy"></i> Cơ bản</a></li>
                                <li><a href="#" class="nav__level--link"><i class="fa-sharp fa-solid fa-hourglass-start med"></i> Trung bình</a></li>
                                <li><a href="#" class="nav__level--link"><i class="fa-sharp fa-solid fa-crown adv"></i> Nâng cao</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="header__nav--item">
                        <a href="index.php?page=list&type=exam" class="header__nav--link">Đề thi</a>
                    </li>
                    <li class="header__nav--item">
                        <a href="<?php echo isset($_COOKIE['email'])
                                        ? 'index.php?page=profile'
                                        : 'index.php?page=login' ?>" class="header__nav--link">
                            Lịch sử học
                        </a>
                    </li>
                    <li class="header__nav--item">
                        <a href="index.php?page=support" class="header__nav--link">Hỗ trợ <i class="fa-sharp fa-regular fa-circle-question"></i></a>
                    </li>
                </ul>
            </div>
            <div class="header__search hide--mobile">
                <form action="../controllers/searchController.php" method="get" class="header__search--box">
                    <input type="text" name="q" placeholder="Bài kiểm tra, đề thi" class="header__search-input">
                    <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
                </form>
            </div>
            <div class="header__login hide--mobile">
                <?php
                if (!isset($_COOKIE['email'])) {
                    echo '<div class="no--logged">
                                <a href="index.php?page=register" class="register--btn">
                                    Đăng ký
                                </a>
                                <a href="index.php?page=login" class="login--btn">
                                    Đăng nhập
                                </a>
                            </div>';
                } else {
                    echo '<div class="logged">
                                <div class="announcement">
                                    <i class="fa-sharp fa-regular fa-bell"></i>
                                </div>
                                <a href="index.php?page=profile">
                                    <img src="' . $_COOKIE['avatar'] . '" alt="" class="avatar">
                                </a>
                            </div>';
                }
                ?>

            </div>
        </div>
    </header>