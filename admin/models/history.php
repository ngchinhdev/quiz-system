<?php
    require_once ("../../configs/pdoModel.php");

    class History extends PDOModel {

        public function getHistory($limit, $offset) {
            $sql = "SELECT ls.*, d.ten_de, nd.ten_nguoi_dung FROM lich_su_lam_bai ls JOIN de d 
                    ON ls.ma_de = d.ma_de JOIN nguoi_dung nd ON ls.ma_nguoi_dung = nd.ma_nguoi_dung
                    ORDER BY nd.ten_nguoi_dung LIMIT $limit OFFSET $offset";

            return $this->pdoQuery($sql);
        }
    }
?>