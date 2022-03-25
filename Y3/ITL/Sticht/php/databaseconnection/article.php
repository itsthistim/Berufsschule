<?php

require_once "./db.php";
class Article extends Database
{
    public function insert($project_id, $user_id, $title, $slug, $body, $published, $created, $modified)
    {
        $stmt = $this->pdo->prepare("INSERT INTO articles (project_id, user_id, title, slug, body, published, created, modified) VALUES (?,?,?,?,?,?,?,?)");
        $stmt->execute([$project_id, $user_id, $title, $slug, $body, $published, $created, $modified]);
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
