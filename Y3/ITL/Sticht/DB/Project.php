<?php
class Project extends DB
{
    public $id;
    public $title;
    public $description;
    public $color_main;
    public $color_secondary;

    public function getAllProjects()
    {
        try {
            $sql = $this->pdo->prepare("SELECT * FROM projects");
            $sql->execute();
            return $sql;
        } catch (Exception $e)
        {
            echo $e;
        }
    }

}