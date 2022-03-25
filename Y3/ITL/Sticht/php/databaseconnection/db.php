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
        $articles = array();

        while ($row = $stmt->fetch()) {
            $articles[] = $row;
        }

        return $articles;
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
