<?php

class Article extends Database
{
    public $id;
    public $project_id;
    public $user_id;
    public $title;
    public $slug;
    public $body;
    public $published;
    public $created;
    public $modifed;

    function __construct($id, $project_id, $user_id, $title, $slug, $body, $published, $created, $modifed)
    {
        $this->id = $id;
        $this->project_id = $project_id;
        $this->user_id = $user_id;
        $this->title = $title;
        $this->slug = $slug;
        $this->body = $body;
        $this->published = $published;
        $this->created = $created;
        $this->modifed = $modifed;
    }

    public function create() {
        
    }
}
