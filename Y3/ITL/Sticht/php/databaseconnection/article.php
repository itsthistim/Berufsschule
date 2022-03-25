<?php

require_once "./db.php";
class Article extends Database
{
    public $project_id;
    public $user_id;
    public $title;
    public $slug;
    public $body;
    public $published;
    public $created;
    public $modified;

    function __construct($db, $project_id = null, $user_id = null, $title = null, $slug = null, $body = null, $published = null, $created = null, $modified = null)
    {
        $this->project_id = $project_id;
        $this->user_id = $user_id;
        $this->title = $title;
        $this->slug = $slug;
        $this->body = $body;
        $this->published = $published;
        $this->created = $created;
        $this->modified = $modified;
        $this->pdo = $db;
    }

    public function insert()
    {
        $stmt = $this->pdo->prepare("INSERT INTO articles (user_id, title, slug, body, published, created, modified) VALUES (?,?,?,?,?,?,?)");
        $stmt->execute([$this->user_id, $this->title, $this->slug, $this->body, $this->published, $this->created, $this->modified]);
    }

    public function getArticles()
    {
        $stmt = $this->pdo->prepare("SELECT * FROM articles");
        $stmt->execute();
        $articles = array();

        while ($row = $stmt->fetch()) {
            $articles[] = $row;
        }

        return $articles;
    }
}
