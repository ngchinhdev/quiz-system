<?php include_once("../models/constants.php") ?>
<section class="lv">
    <div class="lv__wrapper">
        <div class="lv__content">
            <div class="lv__content--left">
                <h1><?php echo $_GET['type'] === 'exam' ? 'Thư viện đề thi' : 'Các '.$title[$_GET['type']] . ' ' .
                            $title[$_GET['topic']] . ' ' . 'cấp độ ' . mb_strtoupper($title[$_GET['level']]); 
                    ?>
                </h1>
                <div class="search--control">
                    <div class="search--box">
                        <input type="text" placeholder="Nhập tên bài kiểm tra, bài test ...">
                        <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
                    </div>
                    <button>Tìm kiếm</button>
                </div>
            </div>
            <div class="lv__content--right">
                <?php if(isset($_COOKIE['is_user'])): ?>
                <div class="profile">
                    <img src="<?= $_COOKIE['avatar'] ?>" alt="Avatar">
                    <div class="name">
                        <?= substr($_COOKIE['email'], 0, strpos($_COOKIE['email'], '@')) ?>
                    </div>
                    <span class="note">
                        <i class="fa-sharp fa-solid fa-bars-progress"></i>
                        <i>Xem lịch sử bạn đã học</i>
                    </span>
                    <div class="divide"></div>
                    <a href="index.php?page=profile" class="statistic">
                        <i class="fa-sharp fa-solid fa-chart-line"></i>
                        Thống kê kết quả
                    </a>
                </div>
                <?php endif ?>
            </div>
        </div>

        <div class="lv__main">
            <ul class="lv__main--navtab">
                <li><a href="#" class="active">Tất cả</a></li>
                <li><a href="#">Bộ đề thi</a></li>
            </ul>

            <div class="lv__main--row">
                <div class="exam">
                 
                </div>
                <div class="row__right">
                    <div class="row__right--imgs">
                        <img src="../../public/imgs/banner-small-1.jpg" alt="Image 1">
                        <img src="../../public/imgs/banner-small-2.jpg" alt="Image 2">
                        <img src="../../public/imgs/banner-small-3.png" alt="Image 3">
                    </div>
                </div>
            </div>
            <ul class="exams__pagination">
                
            </ul>
            <div class="exams__banner"></div>
        </div>
    </div>
</section>