<?php
    require_once ("../../configs/pdoModel.php");

    class Exam extends PDOModel {

        public function getExamTestRows($limit, $offset, $type) {
            $sql = "SELECT * FROM de WHERE loai = $type LIMIT $limit OFFSET $offset";

            return $this->pdoQuery($sql);
        }
        
        public function getExamEdit($exam_id) {
            $sql = "SELECT * FROM de WHERE ma_de = $exam_id";

            return $this->pdoQueryOne($sql);
        }

        public function getQuestionsEdit($exam_id) {
            $sql = "SELECT ch.noi_dung AS cau_hoi, ch.giai_thich, `at`.duong_dan FROM cau_hoi ch 
                    LEFT JOIN am_thanh `at` ON ch.ma_cau_hoi = `at`.`ma_cau_hoi` WHERE ch.ma_de = $exam_id";

            return $this->pdoQuery($sql);
        }

        public function getAnswersEdit($exam_id) {
            $sql = "SELECT pa.noi_dung AS `phuong_an`, pa.phuong_an_dung FROM phuong_an pa JOIN cau_hoi ch 
                    ON ch.ma_cau_hoi = pa.ma_cau_hoi JOIN de d ON d.ma_de = ch.ma_de WHERE d.ma_de = $exam_id";

            return $this->pdoQuery($sql);
        }

        public function addExam($exam_name, $exam_kit, $time) {
            $sql = "INSERT INTO de (loai, ten_de, bo_de, thoi_gian_lam_bai, nguoi_tham_gia)
                    VALUES(1, '$exam_name', '$exam_kit', $time, 0)";

            return $this->pdoExecute($sql);
        }

        public function addTest($exam_name, $exam_kit, $level) {
            $sql = "INSERT INTO de (loai, ten_de, bo_de, cap_do, nguoi_tham_gia)
                    VALUES(0, '$exam_name', '$exam_kit', '$level', 0)";

            return $this->pdoExecute($sql);
        }

        public function addQuestion($content, $explain, $exam_id) {
            $sql = "INSERT INTO cau_hoi (noi_dung, giai_thich, ma_de)
                    VALUES('$content', '$explain', $exam_id)";

            return $this->pdoExecute($sql);
        }

        public function addAudio($link, $question_id) {
            $sql = "INSERT INTO am_thanh (duong_dan, ma_cau_hoi)
                    VALUES('$link', $question_id)";

            return $this->pdoExecute($sql);
        }

        public function addAnswer($content, $correct, $question_id) {
            $sql = "INSERT INTO phuong_an (noi_dung, phuong_an_dung, ma_cau_hoi)
                    VALUES('$content', '$correct', $question_id)";

            return $this->pdoExecute($sql);
        }

        public function deleteExam($exam_id) {
            $sql = "DELETE FROM de WHERE ma_de = $exam_id";

            return $this->pdoExecute($sql);
        }

        public function deleteQuestion($exam_id) {
            $sql = "DELETE FROM cau_hoi WHERE ma_de = $exam_id";

            return $this->pdoExecute($sql);
        }

        public function deleteAudio($exam_id) {
            $sql = "DELETE FROM am_thanh WHERE ma_cau_hoi IN (
                    SELECT ma_cau_hoi FROM cau_hoi WHERE ma_de  = $exam_id)";

            return $this->pdoExecute($sql);
        }

        public function deleteAnswer($exam_id) {
            $sql = "DELETE FROM phuong_an WHERE ma_cau_hoi IN (
                    SELECT ma_cau_hoi FROM cau_hoi WHERE ma_de = $exam_id)";

            return $this->pdoExecute($sql);
        }
    }
?>