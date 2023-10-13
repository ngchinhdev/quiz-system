<?php
    require_once ("../../configs/pdoModel.php");

    class Feedback extends PDOModel {

        public function getFeedback($limit, $offset) {
            $sql = "SELECT ph.*, nd.ten_nguoi_dung FROM phan_hoi ph JOIN nguoi_dung nd 
                    ON ph.ma_nguoi_dung = nd.ma_nguoi_dung
                    ORDER BY nd.ten_nguoi_dung LIMIT $limit OFFSET $offset";

            return $this->pdoQuery($sql);
        }
    }
?>