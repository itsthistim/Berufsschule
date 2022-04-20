<?php
class DB
{
    private $db_host = '127.0.0.1';
    private $db_name = "blog_cms";
    private $db_user = "root";
    private $db_password = "";

    protected $pdo;

    public function __construct()
    {
        $pdo = new PDO("mysql:host=$this->db_host;dbname=$this->db_name", $this->db_user, $this->db_password);
        $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $this->pdo = $pdo;
    }
}
