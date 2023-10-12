<?php
    include_once ("pdoModel.php");
    class Question extends PDOModel {

        public function getAllQuestionsAnswers($ma_de) {
            $sql = "SELECT ch.noi_dung AS cau_hoi, ch.giai_thich, pa.noi_dung 
                    AS phuong_an, pa.ma_phuong_an, at.duong_dan FROM cau_hoi ch LEFT JOIN phuong_an pa 
                    ON ch.ma_cau_hoi = pa.ma_cau_hoi LEFT JOIN am_thanh AS `at` ON at.ma_cau_hoi = ch.ma_cau_hoi
                    WHERE ch.ma_de = $ma_de";

            return $this->pdoQuery($sql);
        }

        public function getQuestionsQuantity($ma_de) {
            $sql = "SELECT COUNT(ch.ma_cau_hoi) AS cau_hoi FROM cau_hoi ch JOIN de d 
                    ON d.ma_de = ch.ma_de WHERE d.ma_de = $ma_de";

            return $this->pdoQueryValue($sql);
        }

        public function getCurQuestionData($ma_de, $per_page, $offset) {
            $sql = "SELECT ma_cau_hoi, noi_dung, giai_thich FROM cau_hoi
                    WHERE ma_de = $ma_de
                    LIMIT $per_page OFFSET $offset";

            return $this->pdoQueryOne($sql);
        }

        public function getCurAnswerData($question_id) {
            $sql = "SELECT ma_phuong_an, noi_dung FROM phuong_an WHERE ma_cau_hoi = $question_id";

            return $this->pdoQuery($sql);
        }

        public function getAudiosData($question_id) {
            $sql = "SELECT duong_dan FROM am_thanh WHERE ma_cau_hoi = $question_id";
            
            $countSql = "SELECT COUNT(*) FROM am_thanh WHERE ma_cau_hoi = $question_id";
            $rowCount = $this->pdoQueryValue($countSql);
            
            if ($rowCount > 0) {
                return $this->pdoQueryValue($sql);
            } else {
                return null;
            }
        }

        public function getTimeToDo($ma_de) {
            $sql = "SELECT thoi_gian_lam_bai FROM de WHERE ma_de = $ma_de";

            return $this->pdoQueryValue($sql);
        }

        public function getCorretAnswers($ma_de) {
            $sql = "SELECT ch.ma_cau_hoi, pa.ma_phuong_an FROM cau_hoi ch
                    JOIN phuong_an pa ON ch.ma_cau_hoi = pa.ma_cau_hoi 
                    WHERE ch.ma_de = $ma_de AND pa.phuong_an_dung = 1";

            return $this->pdoQuery($sql);
        }
    }
?>