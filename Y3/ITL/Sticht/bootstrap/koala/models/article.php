<?php
require "./db.php";
class Article extends DB
{
    #region ctor
    public $article_id;
    public $project_id;
    public $user_id;
    public $title;
    public $slug;
    public $body;
    public $published;
    public $created;
    public $modified;

    function __construct($userId = null, $firstName = null, $lastName = null, $nickName = null, $password = null, $guest = null)
    {
        parent::__construct();
        $this->userId = $userId;
        $this->firstName = $firstName;
        $this->lastName = $lastName;
        $this->nickName = $nickName;
        $this->password = $password;
        $this->guest = $guest;
    }
    #endregion

    public function insert()
    {
        $stmt = $this->pdo->prepare("INSERT INTO articles (project_id, user_id, title, slug, body, published, created, modified) VALUES (?,?,?,?,?,?,?,?)");
        $stmt->execute([$this->project_id, $this->user_id, $this->title, $this->slug, $this->body, $this->published, $this->created, $this->modified]);
    }

    public function delete()
    {
        $stmt = $this->pdo->prepare("DELETE FROM articles WHERE article_id = ?");
        $stmt->execute([$this->article_id]);
    }

    public function exists()
    {
        try {
            $stmt = $this->pdo->prepare("SELECT * FROM user where userId = ?");
            $stmt->execute([$this->userId]);

            if ($stmt->rowCount() > 0) {
                return true;
            }
            return false;
        }
        catch (Error $th) {
            return false;
        }
    }

    #region statics
    public static function getUsers()
    {
        $db = new Database();
        $stmt = $db->pdo->prepare("SELECT * FROM user");
        $stmt->execute();
        $data = array();

        for ($i = 0; $i < $stmt->rowCount(); $i++) {
            $row = $stmt->fetch();
            $data[$i] = new User($row["userId"], $row["firstName"], $row["lastName"], $row["nickName"], $row["password"], $row["guest"]);
        }

        return $data;
    }

    public static function getUserById($id)
    {

        $db = new Database();
        $stmt = $db->pdo->prepare("SELECT * FROM user WHERE userId = ?");
        $stmt->execute([$id]);
        $res = $stmt->fetch();

        if ($res) {
            return new User($res["userId"], $res["firstName"], $res["lastName"], $res["nickName"], $res["password"], $res["guest"]);
        }
        else {
            return false;
        }
    }

    public static function getUserByNickName($nickName)
    {
        $db = new Database();
        $stmt = $db->pdo->prepare("SELECT * FROM user WHERE nickName = ?");
        $stmt->execute([$nickName]);
        $res = $stmt->fetch();

        if ($res) {
            return new User($res["userId"], $res["firstName"], $res["lastName"], $res["nickName"], $res["password"], $res["guest"]);
        }
        else {
            return false;
        }
    }

    public static function nickNameExists($nickName)
    {
        $db = new Database();
        $stmt = $db->pdo->prepare("SELECT * FROM user where nickName = ?");
        $stmt->execute([$nickName]);

        if ($stmt->rowCount() > 0) {
            return true;
        }
        return false;
    }

    public static function idExists($id)
    {
        $db = new Database();
        $stmt = $db->pdo->prepare("SELECT * FROM user where userId = ?");
        $stmt->execute([$id]);

        if ($stmt->rowCount() > 0) {
            return true;
        }
        return false;
    }
#endregion
}
