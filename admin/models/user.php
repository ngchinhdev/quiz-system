<?php
    require_once ("../../configs/pdoModel.php");

    class User extends PDOModel {

        public function getUser($limit, $offset) {
            $sql = "SELECT * FROM nguoi_dung LIMIT $limit OFFSET $offset";

            return $this->pdoQuery($sql);
        }
    }
?>