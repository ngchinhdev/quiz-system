<?php
    class Question {
        private $dbConnection;

        public function __construct($conn){
            $this->dbConnection = $conn;
        }

        public function getQuestionsQuantity($ma_de) {
            $sql = "SELECT COUNT(ch.ma_cau_hoi) AS cau_hoi FROM cau_hoi ch JOIN de d 
                    ON d.ma_de = ch.ma_de WHERE d.ma_de = $ma_de";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetch(PDO::FETCH_ASSOC);

            return $data['cau_hoi'];
        }

        public function getFirstQuestion($ma_de) {
            $sql = "SELECT MIN(ch.ma_cau_hoi) AS cau_hoi FROM cau_hoi ch JOIN de d 
                    ON d.ma_de = ch.ma_de WHERE d.ma_de = $ma_de";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetch(PDO::FETCH_ASSOC);

            return $data['cau_hoi'];
        }

        public function getLastQuestion($ma_de) {
            $sql = "SELECT MAX(ch.ma_cau_hoi) AS cau_hoi FROM cau_hoi ch JOIN de d 
                    ON d.ma_de = ch.ma_de WHERE d.ma_de = $ma_de";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetch(PDO::FETCH_ASSOC);

            return $data['cau_hoi'];
        }

        public function getCurQuestionData($question_id, $ma_de) {
            $sql = "SELECT ch.noi_dung AS cau_hoi, pa.noi_dung AS dap_an, pa.ma_phuong_an from cau_hoi 
                    AS ch JOIN phuong_an pa ON pa.ma_cau_hoi = ch.ma_cau_hoi
                    JOIN de d ON d.ma_de = ch.ma_de
                    WHERE ch.ma_cau_hoi = $question_id && d.ma_de = $ma_de";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetchAll(PDO::FETCH_ASSOC);

            return $data;
        }

        public function getPrevQuestionData($question_id, $ma_de) {
            $sql = "SELECT MAX(ch.ma_cau_hoi) AS cau_hoi FROM cau_hoi ch JOIN de d 
            ON d.ma_de = ch.ma_de WHERE ch.ma_cau_hoi < $question_id && d.ma_de = $ma_de";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetch(PDO::FETCH_ASSOC);

            return $data['cau_hoi'];
        }

        public function getNextQuestionData($question_id, $ma_de) {
            $sql = "SELECT MIN(ch.ma_cau_hoi) AS cau_hoi FROM cau_hoi ch JOIN de d 
            ON d.ma_de = ch.ma_de WHERE ch.ma_cau_hoi > $question_id && d.ma_de = $ma_de";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetch(PDO::FETCH_ASSOC);

            return $data['cau_hoi'];
        }

        public function getAudiosData($question_id) {
            $sql = "SELECT duong_dan from am_thanh WHERE ma_cau_hoi = $question_id";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetch(PDO::FETCH_ASSOC);

            return $data['duong_dan'];
        }
    }
?>