<?php foreach ($data as $row) { ?>
        <div class="row__left--column">
            <a href="#" class="hidden"></a>
            <div class="above">
                <h3><?= $row['ten_de'] ?></h3>
                <span>Bộ đề test: <?= ucwords($row['bo_de']) ?></span>
                <br>
                <span><i class="fa-sharp fa-regular fa-clock"></i> Thời gian: <?= $row['thoi_gian_lam_bai'] ?></span>
                <br>
                <span><i class="fa-solid fa-user-pen"></i>Người tham gia: <?= $row['nguoi_tham_gia'] ?></span>
                <br>
                <span><i class="fa-sharp fa-solid fa-circle-question"></i> Số câu hỏi: <?= $row['so_cau_hoi'] ?></span>
                <br>
                <span class="tag">#DETEST</span>
            </div>
            <br>
            <div class="bottom">
                <a href="#" class="do">Làm bài</a>
            </div>
        </div>
<?php } ?>