<?php
    include_once ("../../configs/pdoModel.php");
    
    class Exam extends PDOModel {

        function getTest($bo_de, $cap_do, $per_page, $offset) {
            $sql = "SELECT de.*, count(*) AS so_cau_hoi FROM de JOIN cau_hoi ON de.ma_de = cau_hoi.ma_de 
            WHERE de.loai = 0 AND de.bo_de LIKE '%$bo_de' AND de.cap_do = '$cap_do' GROUP BY de.ma_de
            LIMIT $per_page OFFSET $offset";

            return $this->pdoQuery($sql);
        }

        function getExam($per_page, $offset) {
            $sql = "SELECT de.*, count(*) AS so_cau_hoi FROM de JOIN cau_hoi ON de.ma_de = cau_hoi.ma_de 
            WHERE de.loai = 1  GROUP BY de.ma_de LIMIT $per_page OFFSET $offset";

            return $this->pdoQuery($sql);
        }

        function getTotalRecords($bo_de, $cap_do, $loai) {
            $sql = '';

            if($loai === 0) {
                $sql = "SELECT COUNT(*) AS so_de FROM de WHERE
                        de.loai = $loai AND de.bo_de LIKE '%$bo_de' AND de.cap_do = '$cap_do'";
            } else {
                $sql = "SELECT COUNT(*) AS so_de FROM de WHERE
                de.loai = $loai";
            }

            return $this->pdoQueryValue($sql);
        }
    }
?>