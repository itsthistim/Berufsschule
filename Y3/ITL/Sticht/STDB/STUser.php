<?php
class STUser extends STDB
{
    public $id;
    public $email;
    public $password;
    public $created;
    public $modified;

    public function getAllUsers()
    {
        try {
            $sql = $this->pdo->prepare("SELECT * FROM users");
            $sql->execute();
            return $sql;
        } catch (Exception $e)
        {
            echo $e;
        }
    }
}