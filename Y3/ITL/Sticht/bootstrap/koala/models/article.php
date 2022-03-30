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
    public $image;
    public $body;
    public $published;
    public $created;
    public $modified;

    function __construct($id = null, $project_id = null, $user_id = null, $title = null, $slug = null, $body = null, $image = null, $published = null, $created = null, $modified = null)
    {
        parent::__construct();
        $this->id = $id;
        $this->project_id = $project_id;
        $this->user_id = $user_id;
        $this->title = $title;
        $this->slug = $slug;
        $this->body = $body;
        $this->image = $image;
        $this->published = $published;
        $this->created = $created;
        $this->modified = $modified;
    }
    #endregion

    public function insert()
    {
        $stmt = $this->pdo->prepare("INSERT INTO articles (id, project_id, user_id, title, slug, body, image, published, created, modified) VALUES (?,?,?,?,?,?,?,?,?)");
        $stmt->execute([$this->id, $this->project_id, $this->user_id, $this->title, $this->slug, $this->body, $this->image, $this->published, $this->created, $this->modified]);
    }

    public function delete()
    {
        $stmt = $this->pdo->prepare("DELETE FROM articles WHERE id = ?");
        $stmt->execute([$this->id]);
    }

    #region statics
    public static function getArticles()
    {
        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT * FROM articles");
        $stmt->execute();
        $data = array();

        for ($i = 0; $i < $stmt->rowCount(); $i++) {
            $row = $stmt->fetch();
            $data[$i] = new Article($row['id'], $row['project_id'], $row['user_id'], $row['title'], $row['slug'], $row['body'], $row['image'], $row['published'], $row['created'], $row['modified']);
        }

        return $data;
    }

    public static function getMostRecent($amount) {
        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT * FROM articles ORDER BY created DESC LIMIT ?");
        $stmt->execute([$amount]);
        $data = array();

        for ($i = 0; $i < $stmt->rowCount(); $i++) {
            $row = $stmt->fetch();
            $data[$i] = new Article($row['id'], $row['project_id'], $row['user_id'], $row['title'], $row['slug'], $row['body'], $row['image'], $row['published'], $row['created'], $row['modified']);
        }

        return $data;
    }

    public static function getArticleById($id)
    {

        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT * FROM articles WHERE id = ?");
        $stmt->execute([$id]);
        $res = $stmt->fetch();

        if ($res) {
            return new Article($res['id'], $res['project_id'], $res['user_id'], $res['title'], $res['slug'], $res['body'], $res['image'], $res['published'], $res['created'], $res['modified']);
        }
        else {
            return false;
        }
    }

    public static function getArticleBySlug($slug)
    {
        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT * FROM articles WHERE slug = ?");
        $stmt->execute([$slug]);
        $res = $stmt->fetch();

        if ($res) {
            return new Article($res['id'], $res['project_id'], $res['user_id'], $res['title'], $res['slug'], $res['body'], $res['image'], $res['published'], $res['created'], $res['modified']);
        }
        else {
            return false;
        }
    }
#endregion
}
