<?php
    include_once ("pdoModel.php");
    
    class History extends PDOModel {

        public function getHistory($ma_nguoi_dung, $limit, $offset) {
            $sql = "SELECT ls.*, d.ten_de, d.bo_de, d.cap_do FROM lich_su_lam_bai ls 
                    JOIN de d ON ls.ma_de = d.ma_de WHERE ma_nguoi_dung = $ma_nguoi_dung
                    LIMIT $limit OFFSET $offset";

            return $this->pdoQuery($sql);
        }

        function getTotalRecords($ma_nguoi_dung) {
            $sql = "SELECT COUNT(*) AS so_lich_su FROM lich_su_lam_bai 
                    WHERE ma_nguoi_dung = $ma_nguoi_dung";

            return $this->pdoQueryValue($sql);
        }

        public function addHistory($thoi_gian, $diem, $ma_nguoi_dung, $ma_de) {
            $sql = "INSERT INTO lich_su_lam_bai (thoi_gian_lam, diem_so, ma_nguoi_dung, ma_de) 
                    VALUES ('$thoi_gian', '$diem', '$ma_nguoi_dung', '$ma_de')";

            return $this->pdoExecute($sql);
        }

        public function addHistoryAnswers($dap_an_chon, $ma_lich_su, $ma_cau_hoi) {
            $sql = "INSERT INTO dap_an_chon (dap_an_chon, ma_lich_su, ma_cau_hoi)
                    VALUES ('$dap_an_chon', '$ma_lich_su', '$ma_cau_hoi')";

            return $this->pdoExecute($sql);
        }

    }
?>