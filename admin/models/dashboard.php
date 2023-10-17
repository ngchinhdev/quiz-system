<?php
    require_once ("../../configs/pdoModel.php");

    class Dashboard extends PDOModel {

        public function getNumberUser() {
            $sql = "SELECT COUNT(ma_nguoi_dung) so_luong FROM nguoi_dung";

            return $this->pdoQueryValue($sql);
        }

        public function getNumberHistory() {
            $sql = "SELECT COUNT(ma_lich_su) so_luong FROM lich_su_lam_bai";

            return $this->pdoQueryValue($sql);
        }

        public function getNumberFeedback() {
            $sql = "SELECT COUNT(ma_phan_hoi) so_luong FROM phan_hoi";

            return $this->pdoQueryValue($sql);
        }

        public function getNumberExam($type) {
            if(isset($type)) {
                $sql = "SELECT COUNT(ma_de) so_luong FROM de WHERE loai = $type";
            } else {
                $sql = "SELECT COUNT(ma_de) so_luong FROM de";
            }

            return $this->pdoQueryValue($sql);
        }
    }
?>