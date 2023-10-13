<?php
    include_once ("../../configs/pdoModel.php");
    
    class History extends PDOModel {

        public function getHistory($ma_nguoi_dung, $limit, $offset) {
            $sql = "SELECT ls.*, d.ten_de, d.bo_de, d.cap_do FROM lich_su_lam_bai ls 
                    JOIN de d ON ls.ma_de = d.ma_de WHERE ma_nguoi_dung = $ma_nguoi_dung
                    ORDER BY ls.thoi_diem DESC LIMIT $limit OFFSET $offset";

            return $this->pdoQuery($sql);
        }

        function getTotalRecords($ma_nguoi_dung) {
            $sql = "SELECT COUNT(*) AS so_lich_su FROM lich_su_lam_bai 
                    WHERE ma_nguoi_dung = $ma_nguoi_dung";

            return $this->pdoQueryValue($sql);
        }

        public function getDetailHistory($ma_lich_su) {
            $sql = "SELECT  ma_cau_hoi, dap_an_chon FROM dap_an_chon WHERE ma_lich_su = $ma_lich_su";

            return $this->pdoQuery($sql);
        }

        public function getAllQuestionsAnswers($ma_de) {
            $sql = "SELECT ch.noi_dung AS cau_hoi, ch.giai_thich, pa.noi_dung 
                    AS phuong_an, pa.ma_phuong_an, at.duong_dan FROM cau_hoi ch LEFT JOIN phuong_an pa 
                    ON ch.ma_cau_hoi = pa.ma_cau_hoi LEFT JOIN am_thanh AS `at` ON at.ma_cau_hoi = ch.ma_cau_hoi
                    WHERE ch.ma_de = $ma_de";

            return $this->pdoQuery($sql);
        }

        public function getCorrectAnswers($ma_de) {
            $sql = "SELECT ch.ma_cau_hoi, pa.ma_phuong_an FROM cau_hoi ch
                    JOIN phuong_an pa ON ch.ma_cau_hoi = pa.ma_cau_hoi 
                    WHERE ch.ma_de = $ma_de AND pa.phuong_an_dung = 1";

            return $this->pdoQuery($sql);
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

        public function addViews($ma_de) {
            $sql = "UPDATE de SET nguoi_tham_gia = nguoi_tham_gia + 1 
                    WHERE ma_de = $ma_de";

            return $this->pdoExecute($sql);
        }

    }
?>