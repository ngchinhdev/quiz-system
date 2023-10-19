<?php date_default_timezone_set('Asia/Ho_Chi_Minh'); ?>
<form action="../controllers/examController.php?page=edit-exam&id=<?= $dataExamEdit['ma_de'] ?>" method="POST" enctype="multipart/form-data">
    <div class="title">
        <h2>Sửa đề thi <span class="err"></span></h2>
    </div>
    <div class="general">
        <div class="general__row row-1">
            <div class="box">
                <label for="exam-name">Tên đề</label>
                <input type="text" value="<?= $dataExamEdit['ten_de'] ?>" name="exam-name" id="exam-name" class="inp">
            </div>
            <div class="box">
                <label for="exam-kit">Bộ đề</label>
                <input type="text" value="<?= $dataExamEdit['bo_de'] ?>" name="exam-kit" id="exam-kit" class="inp">
            </div>
        </div>
        <div class="general__row row-2">
            <div class="box">
                <label for="date">Ngày tạo đề</label>
                <input type="text" name="" id="date" value="<?= $dataExamEdit['thoi_diem_tao'] ?>" disabled>
            </div>
            <div class="box">
                <label for="member">Người tham gia</label>
                <input type="text" name="" id="member" value="<?= $dataExamEdit['nguoi_tham_gia'] ?>" disabled>
            </div>
            <div class="box">
                <label for="time">Thời gian(s)</label>
                <input type="text" name="time" id="time" value="<?= $dataExamEdit['thoi_gian_lam_bai'] ?>" class="inp time-add">
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
                echo '<label for="question-' . $i . '">Câu hỏi ' . ($i + 1) . '</label>';
                echo '<input type="text" name="question[]" id="question-' . $i . '" class="inp ques-add" value="'. $dataQuestionsEdit[$i]['cau_hoi'] .'">';
                echo '<input type="hidden" name="ques-id-hidden[]" value="'. $dataQuestionsEdit[$i]['ma_cau_hoi'] .'">';
                echo '<label for="audio-' . $i . '">Audio<input type="file" size="60" name="audio[]" id="audio-' . $i . '" value="'. ($dataAudioEdit[$i]['duong_dan'] ?? '' ).'"></label>';
                echo '<input type="hidden" name="audio-id-hidden[]" value="'. ($dataAudioEdit[$i]['ma_am_thanh'] ?? '').'">';
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
                echo '<input type="hidden" name="ans-id-hidden[' . $i . '][]" value="'. $dataAnswersEdit[$answerIndex]['ma_phuong_an'] .'">';
                echo '<input type="radio" name="correct[' . $i . ']" value="' . $j . '" class="inp" '.$isChecked.'>';
                echo '</div>';
            }
            echo '</div>';
        }
        ?>
        <input type="submit" name="submit" class="btn-submit" value="Sửa đề">
    </div>
</form>