<?php
    require_once ("../../configs/pdoModel.php");

    class Exam extends PDOModel {

        public function getExam($limit, $offset, $type) {
            $sql = "SELECT * FROM de WHERE loai = $type LIMIT $limit OFFSET $offset";

            return $this->pdoQuery($sql);
        }
    }
?>