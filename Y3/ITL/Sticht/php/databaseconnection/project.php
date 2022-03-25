<?php

class Project extends Database
{
    public $id;
    public $title;
    public $descripton;
    public $color_main;
    public $color_secondary;

    function __construct($id = null, $title = null, $description = null, $color_main = null, $color_secondary = null)
    {
        $this->id = $id;
        $this->title = $title;
        $this->description = $description;
        $this->color_main = $color_main;
        $this->color_secondary = $color_secondary;
    }

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
}
