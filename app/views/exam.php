<?php include_once("../../configs/constants.php") ?>
<section class="lv">
    <div class="lv__wrapper">
        <div class="lv__content">
            <?php if(isset($_GET['type'])): ?>
            <div class="lv__content--left">
                <h1>
                    <?= $_GET['type'] === 'exam' ? 'Thư viện đề thi' : 'Các '.$title[$_GET['type']] . ' ' .
                    $title[$title[$_GET['topic']]] . ' ' . 'cấp độ ' . mb_strtoupper($title[$_GET['level']]); ?> 
                </h1>
                <form action="../controllers/searchController.php" method="get" class="search--control">
                    <div class="search--box">
                        <input type="text" name="q" placeholder="Nhập tên bài kiểm tra, bài test ...">
                        <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
                    </div>
                    <button type="submit">Tìm kiếm</button>
                </form>
            </div>
            <div class="lv__content--right">
                <?php if(isset($_COOKIE['email'])): ?>
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
            <?php endif ?>
            <?php if(isset($_GET['q'])): ?>
                <h2>Kết quả tìm kiếm cho "<?= $_GET['q'] ?>" </h2>
            <?php endif ?>
        </div>

        <div class="lv__main">
            <ul class="lv__main--navtab">
                <li><a href="#" class="active">Tất cả</a></li>
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