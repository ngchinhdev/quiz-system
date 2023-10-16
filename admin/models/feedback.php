<?php
    require_once ("../../configs/pdoModel.php");

    class Feedback extends PDOModel {

        public function getFeedbackRows($limit, $offset) {
            $sql = "SELECT ph.*, nd.ten_nguoi_dung FROM phan_hoi ph JOIN nguoi_dung nd 
                    ON ph.ma_nguoi_dung = nd.ma_nguoi_dung
                    ORDER BY nd.ten_nguoi_dung LIMIT $limit OFFSET $offset";

            return $this->pdoQuery($sql);
        }

        public function getFeedbackEdit($feedback_id) {
            $sql = "SELECT ph.*, nd.ten_nguoi_dung FROM phan_hoi ph JOIN nguoi_dung nd 
                    ON ph.ma_nguoi_dung = nd.ma_nguoi_dung WHERE ma_phan_hoi = $feedback_id";

            return $this->pdoQueryOne($sql);
        }

        public function updateFeedbackStatus($feedback_id, $status) {
            $sql = "UPDATE phan_hoi SET trang_thai = $status WHERE ma_phan_hoi = $feedback_id";

            return $this->pdoExecute($sql);
        }

        public function deleteFeedback($feedback_id) {
            $sql = "DELETE FROM phan_hoi WHERE ma_phan_hoi = $feedback_id";

            return $this->pdoExecute($sql);
        }
    }
?>