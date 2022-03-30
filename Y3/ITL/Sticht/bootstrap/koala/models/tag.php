<?php
require_once "db.php";
class Tag extends DB {
    #region ctor
    public $id;
    public $title;
    public $created;
    public $modified;

    function __construct($id = null, $title = null, $created = null, $modified = null) {
        parent::__construct();
        $this->id = $id;
        $this->title = $title;
        $this->created = $created;
        $this->modified = $modified;
    }
    #endregion

    public function insert() {
        $stmt = $this->pdo->prepare("INSERT INTO tags(id, title, created, modified) VALUES (?,?,?,?)");
        $stmt->execute([$this->id, $this->title, $this->created, $this->modified]);
    }

    public function delete() {
        $stmt = $this->pdo->prepare("DELETE FROM tags WHERE id = ?");
        $stmt->execute([$this->id]);
    }

    #region statics
    public static function getTags() {
        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT * FROM tags");
        $stmt->execute();
        $data = array();

        for ($i = 0; $i < $stmt->rowCount(); $i++) {
            $row = $stmt->fetch();
            $data[$i] = new Tag($row["id"], $row["title"], $row["created"], $row["modified"]);
        }

        return $data;
    }

    public static function getTagsByArticle($article_id) {
        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT tags.id, tags.title, tags.created, tags.modified FROM tags INNER JOIN articles_tags ON tags.id = articles_tags.tag_id WHERE articles_tags.article_id = ?");
        $stmt->execute([$article_id]);
        $data = array();

        for ($i = 0; $i < $stmt->rowCount(); $i++) {
            $row = $stmt->fetch();
            $data[$i] = new Tag($row["id"], $row["title"], $row["created"], $row["modified"]);
        }

        return $data;
    }
    #endregion
}