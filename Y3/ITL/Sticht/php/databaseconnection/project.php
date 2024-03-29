<?php

class Project extends Database
{
    public function getProjects()
    {
        $stmt = $this->pdo->prepare("SELECT * FROM projects");
        $stmt->execute();
        $projects = array();

        while ($row = $stmt->fetch()) {
            $projects[] = $row;
        }

        return $projects;
    }

    public function getProjectById($id)
    {
        $stmt = $this->pdo->prepare("SELECT * FROM projects WHERE id = ?");
        $stmt->execute([$id]);

        return $stmt->fetch();
    }
}
