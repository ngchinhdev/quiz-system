<?php date_default_timezone_set('Asia/Ho_Chi_Minh'); ?>
<form action="../controllers/examController.php?page=add-test" method="POST" enctype="multipart/form-data">
    <div class="title">
        <h2>Thêm bài test <span class="err"></span></h2>
    </div>
    <div class="general">
        <div class="general__row row-1">
            <div class="box">
                <label for="exam-name">Tên đề</label>
                <input type="text" name="exam-name" id="exam-name" class="inp">
            </div>
            <div class="box">
                <label for="exam-kit">Bộ đề</label>
                <input type="text" name="exam-kit" id="exam-kit" class="inp">
            </div>
        </div>
        <div class="general__row row-2">
            <div class="box">
                <label for="exam-level">Cấp độ</label>
                <input type="text" name="exam-level" id="exam-level" class="inp">
            </div>
            <div class="box">
                <label for="date">Ngày tạo đề</label>
                <input type="text" name="" id="date" value="<?= date('H:i:s d/m/Y', time()); ?>" disabled>
            </div>
            <div class="box">
                <label for="member">Người tham gia</label>
                <input type="text" name="" id="member" value="0" disabled>
            </div>
        </div>
    </div>
    <hr>
    <div class="questions__row">
        <?php
        for ($i = 0; $i <= 9; $i++) {
            echo '<div class="col">';
            echo '<div class="box">';
            echo '<div class="ques">';
                echo '<label for="question-' . $i . '"><strong>Câu hỏi ' . ($i + 1) . '</strong></label>';
                echo '<input type="text" name="question[]" id="question-' . $i . '" class="inp ques-add">';
                echo '<label for="audio-' . $i . '">Audio<input type="file" size="60" name="audio[]" id="audio-' . $i . '"></label>';
            echo '</div>';
            echo '<div class="expl">';
                echo '<label for="explain-' . $i . '">Giải thích</label>';
                echo '<input type="text" name="explain[]" id="explain-' . $i . ' class="inp"">';
            echo '</div>';
            echo '</div>';
            for ($j = 1; $j <= 4; $j++) {
                echo '<div class="box">';
                echo '<label for="answer-' . $i . '-' . $j . '">Phương án</label>';
                echo '<input type="text" name="answer[' . $i . '][]" id="answer-' . $i . '-' . $j . '" class="inp">';
                echo '<input type="radio" name="correct[' . $i . ']" value="' . $j . '" class="inp">';
                echo '</div>';
            }
            echo '</div>';
        }
        ?>
        <input type="submit" name="submit" class="btn-submit" value="Sửa đề">
    </div>
</form>