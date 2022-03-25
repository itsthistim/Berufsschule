<?php

class Database
{
    public $db_host = "127.0.0.1";
    public $db_user = "root";
    public $db_database = "blog_cms";
    public $db_password = "";
    public $pdo;

    function __construct()
    {
        try {
            $this->pdo = new PDO("mysql:host=$this->db_host;dbname=$this->db_database", $this->db_user, $this->db_password);
        } catch (\Throwable $e) {
            die($e);
        }
    }

    function getProjects()
    {
        $stmt = $this->pdo->prepare("SELECT * FROM projects");
        $stmt->execute();
        $projects = array();

        while ($row = $stmt->fetch()) {
            $projects[] = $row;
        }

        return $projects;
    }
}
