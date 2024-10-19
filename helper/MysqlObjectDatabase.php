<?php
class MysqlObjectDatabase
{
    private $conn;
    public function __construct($host, $port, $username, $password, $database)
    {
        $this->conn = new mysqli($host, $username, $password, $database, $port);
    }

    public function query($sql){
        $result = $this->conn->query($sql);
        return  $result->fetch_all( MYSQLI_ASSOC );
    }

    public function execute($sql){
        $this->conn->query($sql);
        return $this->conn->affected_rows;
    }
    public function __destruct()
    {
        $this->conn->close();
    }
    public function prepare($sql) {
        return $this->conn->prepare($sql); // Asume que $this->conn es una instancia de PDO
    }


}
