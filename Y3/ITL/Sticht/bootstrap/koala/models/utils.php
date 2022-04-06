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

    public static function resetDB()
    {
        $db = new DB();

        #region drop tables, recreate tables, reset increment
        $stmt = $db->pdo->prepare("SET GLOBAL information_schema_stats_expiry = 0;");
        $stmt->execute();
        
        // drop tables
        $stmt = $db->pdo->prepare("SET FOREIGN_KEY_CHECKS = 0;");
        $stmt->execute();

        $stmt = $db->pdo->prepare("DROP TABLE `articles`;");
        $stmt->execute();

        $stmt = $db->pdo->prepare("DROP TABLE `users`;");
        $stmt->execute();

        $stmt = $db->pdo->prepare("DROP TABLE `tags`;");
        $stmt->execute();

        $stmt = $db->pdo->prepare("DROP TABLE `articles_tags`;");
        $stmt->execute();

        $stmt = $db->pdo->prepare("DROP TABLE `projects`;");
        $stmt->execute();

        // create tables
        $stmt = $db->pdo->prepare("CREATE TABLE IF NOT EXISTS `users` ( 
            id INT AUTO_INCREMENT PRIMARY KEY, 
            email VARCHAR(255) NOT NULL, 
            password VARCHAR(255) NOT NULL, 
            created DATETIME, 
            modified DATETIME 
        );");
        $stmt->execute();

        $stmt = $db->pdo->prepare("CREATE TABLE IF NOT EXISTS `projects` ( 
            id INT AUTO_INCREMENT PRIMARY KEY, 
            title VARCHAR(255) NOT NULL, 
            description TEXT NOT NULL,
            image VARCHAR(255),
            color_main char(8), 
            color_secondary char(8)   
        );");
        $stmt->execute();

        $stmt = $db->pdo->prepare("CREATE TABLE IF NOT EXISTS `articles` ( 
            id INT AUTO_INCREMENT PRIMARY KEY, 
            project_id INT NOT NULL,  
            user_id INT NOT NULL, 
            title VARCHAR(255) NOT NULL, 
            slug VARCHAR(255) NOT NULL, 
            description VARCHAR(255),
            body TEXT,
            image VARCHAR(255),
            published BOOLEAN DEFAULT FALSE, 
            created DATETIME, 
            modified DATETIME, 
            UNIQUE KEY (slug), 
            FOREIGN KEY user_key (user_id) REFERENCES users(id), 
            FOREIGN KEY project_key (project_id) REFERENCES projects(id) 
        );");
        $stmt->execute();

        $stmt = $db->pdo->prepare("CREATE TABLE IF NOT EXISTS `tags` ( 
            id INT AUTO_INCREMENT PRIMARY KEY, 
            title VARCHAR(191), 
            created DATETIME, 
            modified DATETIME, 
            UNIQUE KEY (title) 
        ) CHARSET=utf8mb4;");
        $stmt->execute();

        $stmt = $db->pdo->prepare("CREATE TABLE IF NOT EXISTS `articles_tags` ( 
            article_id INT NOT NULL, 
            tag_id INT NOT NULL, 
            PRIMARY KEY (article_id, tag_id), 
            FOREIGN KEY tag_key(tag_id) REFERENCES tags(id), 
            FOREIGN KEY article_key(article_id) REFERENCES articles(id) 
        );");
        $stmt->execute();

        $stmt = $db->pdo->prepare("SET FOREIGN_KEY_CHECKS = 1;");
        $stmt->execute();
        #endregion

        #region insert data
        // users
        $stmt = $db->pdo->prepare("INSERT INTO users (email, password, created, modified) VALUES (\"tim\", \"1234\", NOW(), NOW());");
        $stmt->execute();

        // projects
        $stmt = $db->pdo->prepare("INSERT INTO projects (title, description) VALUES (\"Discord Bot\", \"koala discord bot\");");
        $stmt->execute();

        // articles
        $stmt = $db->pdo->prepare("INSERT INTO articles(project_id, user_id, title, slug, description, body, image, published, created, modified) VALUES(1, 1, \"Image Manipulation\", \"image-manipulation\", \"How to make custom images with koala\", \"Creating funny images has never been this easy. With koala you can now change your friends profile pictures to your liking!\", \"image-manipulation.jpg\", 1, NOW(), NOW());");
        $stmt->execute();

        $stmt = $db->pdo->prepare("INSERT INTO articles(project_id, user_id, title, slug, description, body, image, published, created, modified) VALUES(1, 1, \"Internationalization & Languages\", \"internationalization-languages\", \"Use koala with nearly any language\", \"We're including most spoken languages from around the globe including English, Chinese, French, Spanish, Polish, Russian and more! You can even help us translating if your language is not available yet!\", \"internationalization.jpg\", 1, NOW(), NOW());");
        $stmt->execute();

        $stmt = $db->pdo->prepare("INSERT INTO articles(project_id, user_id, title, slug, description, body, image, published, created, modified) VALUES(1, 1, \"Message Intents\", \"message-intents\", \"What are Message Intents?\", \"If your bot or app is not approved for message content, the following fields of the message object in Gateway and API payloads will be empty—either an empty string or empty array, depending on the data type—when you receive a message: content, embeds, attachments, components.\", \"message-intents.jpg\", 1, NOW(), NOW());");
        $stmt->execute();

        $stmt = $db->pdo->prepare("INSERT INTO articles(project_id, user_id, title, slug, description, body, image, published, created, modified) VALUES(1, 1, \"Music System\", \"music-system\", \"Playing music to your friends the easy way\", \"Play high quality music in your Discord server for free. If it's on YouTube, then koala can find it!\", \"music-system.jpg\", 1, NOW(), NOW());");
        $stmt->execute();

        $stmt = $db->pdo->prepare("INSERT INTO articles(project_id, user_id, title, slug, description, body, image, published, created, modified) VALUES(1, 1, \"Logging & Moderation\", \"logging-moderation\", \"How logging and moderation makes a better community\", \"Discord moderation bots help organize your server, act as a welcome bot for new members, and work as a Discord anti spam bot for troublemakers. koala fills all these roles and if you are working as a Discord moderator, then you try it for yourself!\", \"logging-moderation.jpg\", 1, NOW(), NOW());");
        $stmt->execute();

        $stmt = $db->pdo->prepare("INSERT INTO articles(project_id, user_id, title, slug, description, body, image, published, created, modified) VALUES(1, 1, \"Slash Commands\", \"slash-commands\", \"Why / will soon be your most used key\", \"Slash Commands are an extremely powerful way to provide rich interactivity for members of your Discord server, all you have to do is type / and you're ready to use your favorite bot. You can easily see all the bot's commands, input validation, and error handling help you get the command right the first time.\", \"slash-commands.jpg\", 1, NOW(), NOW());");
        $stmt->execute();

        // tags
        $stmt = $db->pdo->prepare("INSERT INTO tags (title, created, modified) VALUES (\"API\", NOW(), NOW());");
        $stmt->execute();

        $stmt = $db->pdo->prepare("INSERT INTO tags (title, created, modified) VALUES (\"Categories\", NOW(), NOW());");
        $stmt->execute();

        $stmt = $db->pdo->prepare("INSERT INTO tags (title, created, modified) VALUES (\"Misc\", NOW(), NOW());");
        $stmt->execute();

        // articles_tags
        $stmt = $db->pdo->prepare("INSERT INTO articles_tags (article_id, tag_id) VALUES (1, 2);");
        $stmt->execute();

        $stmt = $db->pdo->prepare("INSERT INTO articles_tags (article_id, tag_id) VALUES (2, 3);");
        $stmt->execute();

        $stmt = $db->pdo->prepare("INSERT INTO articles_tags (article_id, tag_id) VALUES (3, 1);");
        $stmt->execute();

        $stmt = $db->pdo->prepare("INSERT INTO articles_tags (article_id, tag_id) VALUES (4, 2);");
        $stmt->execute();

        $stmt = $db->pdo->prepare("INSERT INTO articles_tags (article_id, tag_id) VALUES (5, 2);");
        $stmt->execute();

        $stmt = $db->pdo->prepare("INSERT INTO articles_tags (article_id, tag_id) VALUES (6, 1);");
        $stmt->execute();
    #endregion
    }
}