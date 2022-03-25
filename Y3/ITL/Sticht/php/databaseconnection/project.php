<?php

class Project extends Database
{
    public $id;
    public $title;
    public $descripton;
    public $color_main;
    public $color_secondary;
    
    function __construct($pdo, $id = null, $title = null, $description = null, $color_main = null, $color_secondary = null)
    {
        $this->id = $id;
        $this->title = $title;
        $this->description = $description;
        $this->color_main = $color_main;
        $this->color_secondary = $color_secondary;

        $this->pdo = $pdo;
    }
}
