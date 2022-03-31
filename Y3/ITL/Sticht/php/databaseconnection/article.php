<?php

require_once "./db.php";
class Article extends Database
{
    public function insert($project_id, $user_id, $title, $slug, $description, $image, $body, $published, $created_at, $updated_at)
    {
        $stmt = $this->pdo->prepare("INSERT INTO articles (project_id, user_id, title, slug, description, image, body, published, created, modified) VALUES (?,?,?,?,?,?,?,?,?,?)");
        return $stmt->execute([$project_id, $user_id, $title, $slug, $description, $image, $body, $published, $created_at, $updated_at]);
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
