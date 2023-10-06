<?php
    class Question {
        private $dbConnection;

        public function __construct($conn){
            $this->dbConnection = $conn;
        }

        public function getAllQuestionsAnswers($ma_de) {
            $sql = "SELECT ch.noi_dung AS cau_hoi, ch.giai_thich, pa.noi_dung AS phuong_an, pa.ma_phuong_an 
                    FROM cau_hoi ch JOIN phuong_an pa ON ch.ma_cau_hoi = pa.ma_cau_hoi WHERE ch.ma_de = $ma_de";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetchAll(PDO::FETCH_ASSOC);

            return $data;
        }


        public function getQuestionsQuantity($ma_de) {
            $sql = "SELECT COUNT(ch.ma_cau_hoi) AS cau_hoi FROM cau_hoi ch JOIN de d 
                    ON d.ma_de = ch.ma_de WHERE d.ma_de = $ma_de";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetch(PDO::FETCH_ASSOC);

            return $data['cau_hoi'];
        }

        public function getCurQuestionData($ma_de, $per_page, $offset) {
            $sql = "SELECT ma_cau_hoi, noi_dung, giai_thich FROM cau_hoi
                    WHERE ma_de = $ma_de
                    LIMIT $per_page OFFSET $offset";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetch(PDO::FETCH_ASSOC);

            return $data;
        }

        public function getCurAnswerData($question_id) {
            $sql = "SELECT ma_phuong_an, noi_dung FROM phuong_an WHERE ma_cau_hoi = $question_id";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetchAll(PDO::FETCH_ASSOC);

            return $data;
        }

        public function getAudiosData($question_id) {
            $sql = "SELECT duong_dan FROM am_thanh WHERE ma_cau_hoi = $question_id";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetch(PDO::FETCH_ASSOC);

            return $data['duong_dan'];
        }

        public function getTimeToDo($ma_de) {
            $sql = "SELECT thoi_gian_lam_bai FROM de WHERE ma_de = $ma_de";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetch(PDO::FETCH_ASSOC);

            return $data['thoi_gian_lam_bai'];
        }

        public function getCorretAnswers($ma_de) {
            $sql = "SELECT ch.ma_cau_hoi, pa.ma_phuong_an FROM cau_hoi ch
                    JOIN phuong_an pa ON ch.ma_cau_hoi = pa.ma_cau_hoi 
                    WHERE ch.ma_de = $ma_de AND pa.phuong_an_dung = 1";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetchAll(PDO::FETCH_ASSOC);

            return $data;
        }
    }
?>