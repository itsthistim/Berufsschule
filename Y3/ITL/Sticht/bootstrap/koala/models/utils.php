<?php
require_once "db.php";
class Utils extends DB
{
    public static function nextId($table)
    {
        $db = new DB();
        $stmt = $db->pdo->prepare("SELECT AUTO_INCREMENT FROM information_schema.tables WHERE lower(table_name) = lower(?) AND table_schema = DATABASE()");
        $stmt->execute([$table]);

        return $stmt->fetch()["AUTO_INCREMENT"];
    }
}
