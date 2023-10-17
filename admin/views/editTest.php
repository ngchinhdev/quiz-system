<?php date_default_timezone_set('Asia/Ho_Chi_Minh'); ?>
<form action="../controllers/examController.php?page=edit-test" method="POST" enctype="multipart/form-data">
    <div class="title">
        <h2>Sửa bài test <span class="err"></span></h2>
    </div>
    <div class="general">
        <div class="general__row row-1">
            <div class="box">
                <label for="exam-name">Tên đề</label>
                <input type="text" name="exam-name" id="exam-name" value="<?= $dataTestEdit['ten_de'] ?>" class="inp">
            </div>
            <div class="box">
                <label for="exam-kit">Bộ đề</label>
                <input type="text" name="exam-kit" id="exam-kit" class="inp" value="<?= $dataTestEdit['bo_de'] ?>">
            </div>
        </div>
        <div class="general__row row-2">
            <div class="box">
                <label for="exam-level">Cấp độ</label>
                <input type="text" name="exam-level" id="exam-level" class="inp" value="<?= $dataTestEdit['cap_do'] ?>">
            </div>
            <div class="box">
                <label for="date">Ngày tạo đề</label>
                <input type="text" name="" id="date"  value="<?= $dataTestEdit['thoi_diem_tao'] ?>" disabled>
            </div>
            <div class="box">
                <label for="member">Người tham gia</label>
                <input type="text" name="" id="member" value="<?= $dataTestEdit['nguoi_tham_gia'] ?>" disabled>
            </div>
        </div>
    </div>
    <hr>
    <div class="questions__row">
        <?php
        for ($i = 0; $i < count($dataQuestionsEdit); $i++) {
            echo '<div class="col">';
            echo '<div class="box">';
            echo '<div class="ques">';
                echo '<label for="question-' . $i . '"><strong>Câu hỏi ' . ($i + 1) . '</strong></label>';
                echo '<input type="text" name="question[]" id="question-' . $i . '" class="inp ques-add" value="'. $dataQuestionsEdit[$i]['cau_hoi'] .'">';
                echo '<label for="audio-' . $i . '">Audio<input type="file" size="60" name="audio[]" id="audio-' . $i . '"></label>';
            echo '</div>';
            echo '<div class="expl">';
                echo '<label for="explain-' . $i . '">Giải thích</label>';
                echo '<input type="text" name="explain[]" id="explain-' . $i . '" class="inp" value="'. $dataQuestionsEdit[$i]['giai_thich'] .'">';
            echo '</div>';
            echo '</div>';
            for ($j = 1; $j <= 4; $j++) {
                $answerIndex = $i * 4 + $j - 1; 
                $isChecked = $dataAnswersEdit[$answerIndex]['phuong_an_dung'] === 1 ? 'checked' : '';
                echo '<div class="box">';
                echo '<label for="answer-' . $i . '-' . $j . '">Phương án</label>';
                echo '<input type="text" name="answer[' . $i . '][]" id="answer-' . $i . '-' . $j . '" class="inp" value="'. $dataAnswersEdit[$answerIndex]['phuong_an'] .'">';
                echo '<input type="radio" name="correct[' . $i . ']" value="' . $j . '" class="inp"'.$isChecked.' >';
                echo '</div>';
            }
            echo '</div>';
        }
        ?>
        <input type="submit" name="submit" class="btn-submit" value="Sửa đề">
    </div>
</form>