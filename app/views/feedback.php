<?php require_once ("../controllers/feedbackController.php") ?>
<section class="feedback">
    <div class="feedback__container">
        <div class="feedback__tabs">
            <div class="feedback--tab instruct-1">
                <i class="fa-sharp fa-solid fa-circle-info"></i>
                Hướng dẫn sử dụng
                <i class="fa-sharp fa-solid fa-angle-right"></i>
            </div>
            <div class="feedback--tab instruct-2">
                <i class="fa-sharp fa-solid fa-circle-info"></i>
                Hướng dẫn làm bài
                <i class="fa-sharp fa-solid fa-angle-right"></i>
            </div>
            <div class="feedback--tab care">
                <i class="fa-sharp fa-solid fa-square-plus"></i>
                Chăm sóc khách hàng
                <i class="fa-sharp fa-solid fa-angle-right"></i>
            </div>
        </div>
        <div class="feedback__slider">
            <?php foreach($feedbacks as $index => $feedback): ?>
            <div class="slide slide--<?= $index + 1 ?>">
                <div class="testimonial">
                    <blockquote class="testimonial__text">
                        <?= $feedback['noi_dung'] ?>
                    </blockquote>
                    <address class="testimonial__author">
                        <img src="<?= $feedback['hinh_anh'] ?>" alt="avatar" class="testimonial__photo" />
                        <h5 class="testimonial__name"><?= $feedback['ten_nguoi_dung'] ?></h5>
                    </address>
                </div>
            </div>
            <?php endforeach ?>
            <button class="slider__btn slider__btn--left">
                <i class="fa-sharp fa-solid fa-circle-arrow-left"></i>
            </button>
            <button class="slider__btn slider__btn--right">
                <i class="fa-sharp fa-solid fa-circle-arrow-right"></i>
            </button>
        </div>
        <form class="feedback__form" action="../controllers/feedbackController.php" method="post">
            <input type="text" name="text-feedback" placeholder="Bạn cảm thấy EnglishTestPro thế nào?" required>
            <input type="submit" name="send-feedback" value="Gửi phản hồi">
        </form>
    </div>
</section>