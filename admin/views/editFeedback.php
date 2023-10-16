<?php date_default_timezone_set('Asia/Ho_Chi_Minh'); ?>
<form action="../controllers/feedbackController.php?id=<?= $feedback_data_edit['ma_phan_hoi'] ?>" method="POST">
    <div class="title">
        <h2>Sửa phản hồi <span class="err"></span></h2>
    </div>
    <div class="general">
        <div class="general__row row-1">
            <div class="box">
                <label for="feedback-user">Người phản hồi</label>
                <input type="text" value="<?= $feedback_data_edit['ten_nguoi_dung'] ?>" name="feedback-user" id="feedback-user" class="inp" disabled>
            </div>
            <div class="box">
                <label for="feedback-date">Ngày phản hồi</label>
                <input type="text" value="<?= $feedback_data_edit['thoi_diem'] ?>" name="feedback-date" id="feedback-date" class="inp" disabled>
            </div>
            <div class="box">
                <label for="feedback-status">Trạng thái</label>
                <input type="text" value="<?= $feedback_data_edit['trang_thai'] ?>" name="feedback-status" id="feedback-status" class="inp">
            </div>
        </div>
        <div class="general__row row-2">
            <div class="box">
                <label for="feedback-content">Nội dung</label>
                <input type="text" name="feedback-content" id="feedback-content" value="<?= $feedback_data_edit['noi_dung'] ?>" disabled>
            </div>
        </div>
    </div>
    <input type="submit" name="submit" class="btn-submit" value="Sửa phản hồi">
</form>