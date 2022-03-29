<?php
require_once "db.php";
class User extends DB
{
    #region ctor

    public $id;
    public $emaiL;
    public $password;
    public $created;
    public $modified;

    function __construct($id = null, $email = null, $password = null, $created = null, $modified = null)
    {
        parent::__construct();
        $this->id = $id;
        $this->email = $email;
        $this->password = $password;
        $this->created = $created;
        $this->modified = $modified;
    }

    #endregion

    public function insert()
    {
        $stmt = $this->pdo->prepare("INSERT INTO users(id, email, password, created, modified) VALUES (?,?,?,?,?)");
        $stmt->execute([$this->id, $this->email, $this->password, $this->created, $this->modified]);
    }

    public function delete()
    {
        $stmt = $this->pdo->prepare("DELETE FROM users WHERE id = ?");
        $stmt->execute([$this->id]);
    }

    #region statics
    public static function getUsers()
    {
        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT * FROM users");
        $stmt->execute();
        $data = array();

        for ($i = 0; $i < $stmt->rowCount(); $i++) {
            $row = $stmt->fetch();
            $data[$i] = new User($row["id"], $row["email"], $row["password"], $row["created"], $row["modified"]);
        }

        return $data;
    }

    public static function getUserById($id)
    {

        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT * FROM users WHERE id = ?");
        $stmt->execute([$id]);
        $res = $stmt->fetch();

        if ($res) {
            return new User($res["id"], $res["email"], $res["password"], $res["created"], $res["modified"]);
        }
        else {
            return false;
        }
    }
#endregion
}
