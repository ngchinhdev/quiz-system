<?php
    class Exam {
        private $dbConnection;

        public function __construct($conn){
            $this->dbConnection = $conn;
        }

        function getExam($bo_de, $cap_do, $per_page, $offset) {
            $sql = "SELECT de.*, count(*) AS so_cau_hoi FROM de JOIN cau_hoi ON de.ma_de = cau_hoi.ma_de 
            WHERE de.loai = 0 AND de.bo_de LIKE '%$bo_de' AND de.cap_do = '$cap_do' GROUP BY de.ma_de
            LIMIT $per_page OFFSET $offset";
            $result = $this->dbConnection->query($sql);
            $data = $result->fetchAll(PDO::FETCH_ASSOC);
            
            return $data;
        }

        function getTotalRecords($bo_de, $cap_do) {
            $sql = "SELECT COUNT(*) AS so_de FROM de WHERE
                                de.loai = 0 AND de.bo_de = '$bo_de' AND de.cap_do = '$cap_do'";
            $result = $this->dbConnection->query($sql);

            $data = $result->fetch(PDO::FETCH_ASSOC);

            return $data['so_de'];
        }
    }
?>