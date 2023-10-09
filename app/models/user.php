<?php
    include_once ("pdoModel.php");

    class User extends PDOModel {

        public function getUser($email) {
            $sql = "SELECT * FROM nguoi_dung WHERE email = '$email'";

            return $this->pdoQueryOne($sql);
        }

        public function addUser($name, $email, $avatar) {
            $sql = "INSERT INTO nguoi_dung VALUES
                    (null, '$name', '$email', '$avatar', 1)";

            return $this->pdoExecute($sql);
        }
        
    }
?>