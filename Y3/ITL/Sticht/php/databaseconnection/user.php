<?php

class User extends Database
{
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

    public function getUserById($id)
    {
        $stmt = $this->pdo->prepare("SELECT * FROM users WHERE id = ?");
        $stmt->execute([$id]);

        return $stmt->fetch();
    }
}
