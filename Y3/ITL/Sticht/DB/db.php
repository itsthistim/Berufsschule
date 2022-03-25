<?php
class DB
{
    private $host = 'localhost';
    private $dbname = "blog_cms";
    private $user = "root";
    private $pwd = "";
    public $pdo;

    public function __construct()
    {
        try {
            $this->pdo = new PDO("mysql:host=$this->host;dbname=$this->dbname", $this->user, $this->pwd);
        }catch (Exception $e)
        {
            echo $e;
        }
    }



}