<?php

require_once "./db.php";
class Article extends Database
{
    public function insert($user_id, $title, $slug, $body, $published, $created, $modified)
    {
        $stmt = $this->pdo->prepare("INSERT INTO articles (user_id, title, slug, body, published, created, modified) VALUES (?,?,?,?,?,?,?)");
        $stmt->execute([$user_id, $title, $slug, $body, $published, $created, $modified]);
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
