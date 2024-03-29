<?php
require_once "db.php";
class Project extends DB
{
    #region ctor
    public $id;
    public $title;
    public $description;
    public $image;
    public $color_main;
    public $color_secondary;

    function __construct($id = null, $title = null, $description = null, $image = null, $color_main = null, $color_secondary = null)
    {
        parent::__construct();
        $this->id = $id;
        $this->title = $title;
        $this->description = $description;
        $this->image = $image;
        $this->color_main = $color_main;
        $this->color_secondary = $color_secondary;
    }
    #endregion

    public function insert()
    {
        $stmt = $this->pdo->prepare("INSERT INTO projects(id, title, description, image, color_main, color_secondary) VALUES (?,?,?,?,?,?)");
        $stmt->execute([$this->id, $this->title, $this->description, $this->image, $this->color_main, $this->color_secondary]);
    }

    public function delete()
    {
        $stmt = $this->pdo->prepare("DELETE FROM projects WHERE id = ?");
        $stmt->execute([$this->id]);
    }

    #region statics
    public static function getProjects()
    {
        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT * FROM projects");
        $stmt->execute();
        $data = array();

        for ($i = 0; $i < $stmt->rowCount(); $i++) {
            $row = $stmt->fetch();
            $data[$i] = new Project($row['id'], $row['title'], $row['description'], $row['image'], $row['color_main'], $row['color_secondary']);
        }

        return $data;
    }
#endregion
}