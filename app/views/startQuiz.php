<section class="dotest">
    <div class="ribbon">
        <div class="lt-tail"></div>
        <div class="lb-tail"></div>
        <span>box-sizing: border-box;</span>
        <div class="rt-tail"></div>
        <div class="rb-tail"></div>
    </div>
    <div class="dotest__container">
        <h2 class="dotest__container--title"><span>Tổng Quan Bài Test</span></h2>
        <div class="dotest__container--info">
            <ul class="rules--test">
                <li class="rule">Có 10 câu hỏi trong bài test này.</li>
                <li class="rule">Tất cả các câu hỏi đều ở mức dễ.</li>
                <li class="rule">Không sử dụng bất kì sách hay công cụ hỗ trợ khi làm bài!</li>
                <li class="rule">Đừng bận tâm quá nhiều vào kết quả. Có thể bạn cần học thêm nữa!</li>
                <li class="rule">Nhấn nút bắt đầu làm bài để bắt đầu.</li>
            </ul>
            <div class="time--test">
                <div class="timer">
                    <span>Thời gian còn lại: <span class="down">12:00</span></span>
                </div>
                <div class="start--btn">
                    <button>Bắt đầu làm bài</button>
                </div>
            </div>
        </div>
        <div class="dotest__container--boxquest">
            <div class="number--ques">Câu 
                <strong><?= $order ?></strong> trên <strong><?= $questions_quantity ?></strong>
            </div>
            <div class="ques">
                <?= $question_data[0]['cau_hoi'] ?>
            </div>
            <ul class="anwsers--box">
                <?php foreach($question_data as $index => $anwser) { ?>
                <li class="anwser--item">
                    <label class="answer" for="anwser-<?= $index ?>">
                        <input type="radio" name="anws" id="anwser-<?= $index ?>">
                        <?= $anwser['dap_an'] ?>
                    </label>
                </li>
                <?php } ?>
            </ul>
            <a href="<?= $prev_url_question ?>" class="move--ques prev">Prev</a>
            <a href="<?= $next_url_question ?>" class="move--ques next">Next</a>

        </div>
    </div>
</section>