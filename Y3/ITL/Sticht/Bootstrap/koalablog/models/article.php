<?php
require_once "db.php";
class Article extends DB
{
    #region ctor
    public $id;
    public $project_id;
    public $user_id;
    public $title;
    public $slug;
    public $description;
    public $body;
    public $image;
    public $published;
    public $created;
    public $modified;

    function __construct($id = null, $project_id = null, $user_id = null, $title = null, $slug = null, $description = null, $body = null, $image = null, $published = null, $created = null, $modified = null)
    {
        parent::__construct();
        $this->id = $id;
        $this->project_id = $project_id;
        $this->user_id = $user_id;
        $this->title = $title;
        $this->slug = $slug;
        $this->description = $description;
        $this->body = $body;
        $this->image = $image;
        $this->published = $published;
        $this->created = $created;
        $this->modified = $modified;
    }
    #endregion

    #region insert, delete, update
    public function insert()
    {
        $stmt = $this->pdo->prepare("INSERT INTO articles (id, project_id, user_id, title, slug, description, body, image, published, created, modified) VALUES (?,?,?,?,?,?,?,?,?,?,?);");
        $stmt->execute([$this->id, $this->project_id, $this->user_id, $this->title, $this->slug, $this->description, $this->body, $this->image, $this->published, $this->created, $this->modified]);
    }

    public function delete()
    {
        $stmt = $this->pdo->prepare("DELETE FROM articles_tags WHERE article_id = ?");
        $stmt->execute([$this->id]);

        $stmt = $this->pdo->prepare("DELETE FROM articles WHERE id = ?;");
        $stmt->execute([$this->id]);
    }

    public function update()
    {
        $stmt = $this->pdo->prepare("UPDATE articles SET project_id = ?, user_id = ?, title = ?, slug = ?, description = ?, body = ?, image = ?, published = ?, created = ?, modified = ? WHERE id = ?");
        $stmt->execute([$this->project_id, $this->user_id, $this->title, $this->slug, $this->description, $this->body, $this->image, $this->published, $this->created, $this->modified, $this->id]);
    }
    #endregion

    #region tags
    public function updateTags($tags)
    {
        $stmt = $this->pdo->prepare("DELETE FROM articles_tags WHERE article_id = ?");
        $stmt->execute([$this->id]);

        foreach ($tags as $tag) {
            $stmt = $this->pdo->prepare("INSERT INTO articles_tags (article_id, tag_id) VALUES (?,?)");
            $stmt->execute([$this->id, $tag]);
        }
    }

    public function getTags()
    {
        $stmt = $this->pdo->prepare("SELECT t.id, t.title FROM tags t INNER JOIN articles_tags at ON t.id = at.tag_id WHERE at.article_id = ?");
        $stmt->execute([$this->id]);
        return $stmt->fetchAll();
    }

    public function addTag($tag_id)
    {
        $stmt = $this->pdo->prepare("INSERT INTO articles_tags (article_id, tag_id) VALUES (?,?);");
        $stmt->execute([$this->id, $tag_id]);
    }
    #endregion

    public static function getArticles()
    {
        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT * FROM articles");
        $stmt->execute();
        $data = array();

        for ($i = 0; $i < $stmt->rowCount(); $i++) {
            $row = $stmt->fetch();
            $data[$i] = new Article($row['id'], $row['project_id'], $row['user_id'], $row['title'], $row['slug'], $row['description'], $row['body'], $row['image'], $row['published'], $row['created'], $row['modified']);
        }

        return $data;
    }

    public static function getBySearch($search, $tag)
    {
        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT a.id, a.project_id, a.user_id, a.title, a.slug, a.description, a.body, a.image, a.published, a.created, a.modified FROM articles a INNER JOIN articles_tags at ON a.id = at.article_id INNER JOIN tags t ON at.tag_id = t.id WHERE a.title LIKE ? OR a.slug LIKE ? OR a.description LIKE ? OR a.body like ? AND t.title LIKE ?;");
        $stmt->execute(["%$search%", "%$search%", "%$search%", "%$search%", "%$tag%"]);
        $data = array();

        for ($i = 0; $i < $stmt->rowCount(); $i++) {
            $row = $stmt->fetch();
            $data[$i] = new Article($row['id'], $row['project_id'], $row['user_id'], $row['title'], $row['slug'], $row['description'], $row['body'], $row['image'], $row['published'], $row['created'], $row['modified']);
        }

        return $data;
    }

    public static function getMostRecent($amount)
    {
        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT * FROM articles ORDER BY created DESC LIMIT ?");
        $stmt->bindParam(1, $amount, PDO::PARAM_INT);
        $stmt->execute();
        $data = array();

        for ($i = 0; $i < $stmt->rowCount(); $i++) {
            $row = $stmt->fetch();
            $data[$i] = new Article($row['id'], $row['project_id'], $row['user_id'], $row['title'], $row['slug'], $row['description'], $row['body'], $row['image'], $row['published'], $row['created'], $row['modified']);
        }

        return $data;
    }

    public static function getById($id)
    {

        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT * FROM articles WHERE id = ?");
        $stmt->execute([$id]);
        $row = $stmt->fetch();

        if ($row) {
            return new Article($row["id"], $row["project_id"], $row["user_id"], $row["title"], $row["slug"], $row["description"], $row["body"], $row["image"], $row["published"], $row["created"], $row["modified"]);
        }
        else {
            return false;
        }
    }

    public static function getBySlug($slug)
    {
        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT * FROM articles WHERE slug = ?");
        $stmt->execute([$slug]);
        $row = $stmt->fetch();
        return new Article($row["id"], $row["project_id"], $row["user_id"], $row["title"], $row["slug"], $row["description"], $row["body"], $row["image"], $row["published"], $row["created"], $row["modified"]);
    }

    public static function slugExists($slug) {
        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT * FROM articles WHERE slug = ?");
        $stmt->execute([$slug]);
        $row = $stmt->fetch();
        
        if($row) {
            return true;
        }
        else {
            return false;
        }
    }

    public function getAuthor() {
        $stmt = $this->pdo->prepare("SELECT * FROM users WHERE id = ?");
        $stmt->execute([$this->user_id]);
        $row = $stmt->fetch();
        return new User($row["id"], $row["username"], $row["email"], $row["password"], $row["bio"], $row["created"], $row["modified"]);
    }

    public function getByProjectId()
    {
        $stmt = $this->pdo->prepare("SELECT * FROM articles WHERE project_id = ?");
        $stmt->execute([$this->project_id]);
        return $stmt->fetchAll();
    }

    public function getByUserId()
    {
        $stmt = $this->pdo->prepare("SELECT * FROM articles WHERE user_id = ?");
        $stmt->execute([$this->user_id]);
        return $stmt->fetchAll();
    }
}