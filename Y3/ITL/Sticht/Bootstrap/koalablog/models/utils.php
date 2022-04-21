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

    public function truncate($body, $length)
    {
        $body = strip_tags($body);
        $body = substr($body, 0, $length);
        $body = substr($body, 0, strrpos($body, ' '));
        $body = $body . "...";

        return $body;
    }

    public static function getTables()
    {
        $db = new DB();
        $stmt = $db->pdo->prepare("SHOW TABLES");
        $stmt->execute();
        $data = array();

        for ($i = 0; $i < $stmt->rowCount(); $i++) {
            $row = $stmt->fetch();
            $data[$i] = $row[0];
        }

        return $data;
    }

    public static function resetAutoIncrement($table, $int)
    {
        $db = new DB();
        $stmt = $db->pdo->prepare("ALTER TABLE ? AUTO_INCREMENT = ?");
        $stmt->execute([$table, $int]);
    }

    public static function resetDb()
    {
        $db = new DB();
        // set foreign key checks to 0
        $stmt = $db->pdo->prepare("SET FOREIGN_KEY_CHECKS = 0");
        $stmt->execute();

        // creates & inserts
        $stmt = $db->pdo->prepare(file_get_contents("assets/sql/blog_cms.sql"));
        $stmt->execute();

        // set foreign key checks to 1
        $stmt = $db->pdo->prepare("SET FOREIGN_KEY_CHECKS = 1");
        $stmt->execute();
    }
}