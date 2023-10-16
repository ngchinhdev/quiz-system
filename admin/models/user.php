<?php
    require_once ("../../configs/pdoModel.php");

    class User extends PDOModel {

        public function getUser($limit, $offset) {
            $sql = "SELECT * FROM nguoi_dung LIMIT $limit OFFSET $offset";

            return $this->pdoQuery($sql);
        }

        public function deleteFeedback($user_id) {
            $sql = "DELETE FROM phan_hoi WHERE ma_nguoi_dung = $user_id";

            return $this->pdoExecute($sql);
        }

        public function deleteHistory($user_id) {
            $sql = "DELETE FROM lich_su_lam_bai WHERE ma_nguoi_dung = $user_id";

            return $this->pdoExecute($sql);
        }

        public function deleteChoseAnswers($user_id) {
            $sql = "DELETE FROM dap_an_chon WHERE ma_lich_su IN (
                SELECT ma_lich_su FROM lich_su_lam_bai WHERE ma_nguoi_dung = $user_id
            )";

            return $this->pdoExecute($sql);
        }

        public function deleteUser($user_id) {
            $sql = "DELETE FROM nguoi_dung WHERE ma_nguoi_dung = $user_id";

            return $this->pdoExecute($sql);
        }
    }
?>