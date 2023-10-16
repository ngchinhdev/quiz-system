<?php 
    class PDOModel {
        private $host = 'localhost';
        private $username = 'root';
        private $password = '';
        private $dbname = 'quiz_system';
        private $conn;

        public function __construct(){
            $this->connect();
        }

        private function connect() {
            try {
                $conn = new PDO("mysql:host=$this->host;dbname=$this->dbname", $this->username, $this->password);
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $this->conn = $conn;
            } catch(PDOException $e) {
                echo "Connection failed: " . $e->getMessage();
            }
        }

        public function closeConnection() {
            $this->conn = null;
        }

        public function getCountRecords($table, $id, $type) {
            if(isset($type)) {
                $sql = "SELECT COUNT($id) AS `totalPages` FROM $table WHERE loai = $type";
            } else {
                $sql = "SELECT COUNT($id) AS `totalPages` FROM $table";
            }

            return $this->pdoQueryValue($sql);
        }

        public function pdoExecute($sql){
            $sql_args = array_slice(func_get_args(), 1);

            try {
                $stmt = $this->conn->prepare($sql);
                $stmt->execute($sql_args);

                return $this->conn->lastInsertId();
            } catch(PDOException $e) {
                throw $e;
            }
        }
        
        public function pdoQuery($sql){
            $sql_args = array_slice(func_get_args(), 1);

            try {
                $stmt = $this->conn->prepare($sql);
                $stmt->execute($sql_args);
                $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
                return $rows;
            } catch(PDOException $e) {
                throw $e;
            }
        }
        
        public function pdoQueryOne($sql){
            $sql_args = array_slice(func_get_args(), 1); 

            try {
                $stmt = $this->conn->prepare($sql);
                $stmt->execute($sql_args);
                $row = $stmt->fetch(PDO::FETCH_ASSOC);
                return $row;
            } catch(PDOException $e) {
                throw $e;
            }
        }
       
        public function pdoQueryValue($sql){
            $sql_args = array_slice(func_get_args(), 1);           

            try {
                $stmt = $this->conn->prepare($sql);
                $stmt->execute($sql_args);
                $row = $stmt->fetch(PDO::FETCH_ASSOC);
                return array_values($row)[0];
            } catch(PDOException $e) {
                throw $e;
            }
        }
    }
?>