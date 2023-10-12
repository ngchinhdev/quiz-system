<?php
    include_once ("pdoModel.php");

    class Feedback extends PDOModel {

        public function getFeedback() {
            $sql = "SELECT ph.noi_dung, nd.hinh_anh, nd.ten_nguoi_dung FROM phan_hoi ph JOIN nguoi_dung nd
                    ON ph.ma_nguoi_dung = nd.ma_nguoi_dung WHERE ph.trang_thai = 1";

            return $this->pdoQuery($sql);
        }

        public function addFeedback($noi_dung, $ma_nguoi_dung) {
            $sql = "INSERT INTO phan_hoi (noi_dung, ma_nguoi_dung)
                    VALUES ('$noi_dung', $ma_nguoi_dung)";

            return $this->pdoExecute($sql);
        }
    }
?>