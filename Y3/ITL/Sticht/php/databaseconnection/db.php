<?php

class Database
{
    public $db_host = "127.0.0.1";
    public $db_user = "root";
    public $db_password = "";
    public $db_database = "blog_cms";
    public $pdo;

    function __construct()
    {
        $dsn = "mysql:host=$this->db_host;dbname=$this->db_database;charset=utf8";
        $opt = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ];

        $this->pdo = new PDO($dsn, $this->db_user, $this->db_password, $opt);
    }

    function getArticles()
    {
        $stmt = $this->pdo->prepare("SELECT * FROM articles");
        $stmt->execute();

        while ($row = $stmt->fetch()) {
            echo "<h1>" . $row["title"] . "</h1>";
        }
    }

    function getProjects()
    {
        $stmt = $this->pdo->prepare("SELECT title FROM projects");
        $stmt->execute();

        while ($row = $stmt->fetch()) {
            echo "<option>" . $row["title"] . "</option>";
        }
    }
}
