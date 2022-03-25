<?php

class User extends Database
{
    public $id;
    public $email;
    public $password;
    public $created;
    public $modified;

    function __construct($id = null, $email = null, $password = null, $created = null, $modified = null)
    {
        $this->id = $id;
        $this->email = $email;
        $this->password = $password;
        $this->created = $created;
        $this->modified = $modified;
    }

    public function getUsers()
    {
        $stmt = $this->pdo->prepare("SELECT * FROM users");
        $stmt->execute();
        $users = array();

        while ($row = $stmt->fetch()) {
            $users[] = $row;
        }

        return $users;
    }
}
