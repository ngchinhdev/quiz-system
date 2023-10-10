<?php 
    if(isset($_GET['page'])) {
        $type = $_GET['page'];
    }
?>
<section class="login">
    <div class="login--container">
        <p class="title">Đăng <?php echo $type == 'register' ? 'ký' : 'nhập'; ?> ngay để bắt đầu trải nghiệm học tiếng Anh,
            lưu lại lịch sử làm bài và làm các đề thi đa dạng, hiệu quả mỗi ngày.</p>
        <a class="log" href="<?= $client->createAuthUrl(); ?>">
            Đăng <?php echo $type == 'register' ? 'ký' : 'nhập'; ?> với Google
        </a>
        <?php if($type == 'register') { ?>
        <p class="privicy">
            Bằng cách đăng ký, bạn đồng ý với
            <a href="">điều khoản sử dụng</a> và
            <a href="">điều khoản bảo mật</a> của chúng tôi.
        </p>
        <?php } ?>
        <p class="another">
            <?php echo $type == 'register' ? '<a href="index.php?page=login">Đã có tài khoản? Đăng nhập ngay!</a>' 
                                           : '<a href="index.php?page=register">Chưa có tài khoản? Đăng ký ngay!</a>'; 
            ?>
        </p>
    </div>
</section>