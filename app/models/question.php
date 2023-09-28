<?php
    class Question {
        private $dbConnection;

        public function __construct($conn){
            $this->dbConnection = $conn;
        }

        public function getCurrentExam($ma_de, $loai) {
            $sql = "SELECT ma_de from de
                    where ma_de = $ma_de && loai = $loai";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetch(PDO::FETCH_ASSOC);

            return $data['ma_de'];
        }

        public function getQuestions($quesntion_id, $ma_de) {
            $sql = "SELECT ch.noi_dung as cau_hoi, da.noi_dung as dap_an from cau_hoi ch join dap_an da 
                    on ch.ma_cau_hoi = da.ma_cau_hoi join de d on ch.ma_de = d.ma_de
                    WHERE ch.ma_cau_hoi = $quesntion_id && d.ma_de = $ma_de";

            $result = $this->dbConnection->query($sql);
            $data = $result->fetchAll(PDO::FETCH_ASSOC);

            return $data;
        }
    }
?>