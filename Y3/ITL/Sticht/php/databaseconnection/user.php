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
}
