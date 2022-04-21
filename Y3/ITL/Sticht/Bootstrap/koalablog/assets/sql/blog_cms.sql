-- -----------------------------------------------------
-- Table `blog_cms`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_cms`.`users`;
CREATE TABLE IF NOT EXISTS `blog_cms`.`users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(45) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `bio` TEXT NULL DEFAULT NULL,
    `created` DATETIME NULL DEFAULT NULL,
    `modified` DATETIME NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
ALTER TABLE `blog_cms`.`users` AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `blog_cms`.`projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_cms`.`projects`;
CREATE TABLE IF NOT EXISTS `blog_cms`.`projects` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `image` VARCHAR(255) NULL DEFAULT NULL,
    `color_main` CHAR(8) NULL DEFAULT NULL,
    `color_secondary` CHAR(8) NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
ALTER TABLE `blog_cms`.`projects` AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `blog_cms`.`articles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_cms`.`articles`;
CREATE TABLE IF NOT EXISTS `blog_cms`.`articles` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `project_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NULL DEFAULT NULL,
    `body` TEXT NULL DEFAULT NULL,
    `image` VARCHAR(255) NULL DEFAULT NULL,
    `published` TINYINT(1) NULL DEFAULT '0',
    `created` DATETIME NULL DEFAULT NULL,
    `modified` DATETIME NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `slug` (`slug` ASC) VISIBLE,
    INDEX `user_key` (`user_id` ASC) VISIBLE,
    INDEX `project_key` (`project_id` ASC) VISIBLE,
    CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `blog_cms`.`users` (`id`),
    CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `blog_cms`.`projects` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
ALTER TABLE `blog_cms`.`articles` AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `blog_cms`.`tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_cms`.`tags`;
CREATE TABLE IF NOT EXISTS `blog_cms`.`tags` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NULL DEFAULT NULL,
    `created` DATETIME NULL DEFAULT NULL,
    `modified` DATETIME NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `title` (`title` ASC) VISIBLE
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
ALTER TABLE `blog_cms`.`tags` AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `blog_cms`.`articles_tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_cms`.`articles_tags`;
CREATE TABLE IF NOT EXISTS `blog_cms`.`articles_tags` (
    `article_id` INT NOT NULL,
    `tag_id` INT NOT NULL,
    PRIMARY KEY (`article_id`, `tag_id`),
    INDEX `tag_key` (`tag_id` ASC) VISIBLE,
    CONSTRAINT `articles_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `blog_cms`.`tags` (`id`),
    CONSTRAINT `articles_tags_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `blog_cms`.`articles` (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
ALTER TABLE `blog_cms`.`articles_tags` AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Inserts
-- -----------------------------------------------------


INSERT INTO
    users (username, email, password, bio, created, modified)
VALUES
    ("Tim Hofmann", "timhofmann01@gmail.com", "12345", "<p>I am in an apprenticeship for application development and coding for 3 years now and have been working on <strong>koala</strong> in my free time. I've been a user of Discord for multiple years and created <strong>koala</strong> to improve small aspects of Discord and built ontop of it.</p>", NOW(), NOW());

INSERT INTO
    projects (title, description)
VALUES
    ("Discord Bot", "koala discord bot");

INSERT INTO
    articles(
        project_id,
        user_id,
        title,
        slug,
        description,
        body,
        image,
        published,
        created,
        modified
    )
VALUES
    (
        1,
        1,
        "Image Manipulation",
        "image-manipulation",
        "How to make custom images with koala",
        "Creating funny images has never been this easy. With koala you can now change your friends profile pictures to your liking!",
        "image-manipulation.jpg",
        1,
        NOW(),
        NOW()
    );

INSERT INTO
    articles(
        project_id,
        user_id,
        title,
        slug,
        description,
        body,
        image,
        published,
        created,
        modified
    )
VALUES
(
        1,
        1,
        "Internationalization & Languages",
        "internationalization-languages",
        "Use koala with nearly any language",
        "We're including most spoken languages from around the globe including English, Chinese, French, Spanish, Polish, Russian and more! You can even help us translating if your language is not available yet!",
        "internationalization.jpg",
        1,
        NOW(),
        NOW()
    );

INSERT INTO
    articles(
        project_id,
        user_id,
        title,
        slug,
        description,
        body,
        image,
        published,
        created,
        modified
    )
VALUES
(
        1,
        1,
        "Message Intents",
        "message-intents",
        "What are Message Intents?",
        "If your bot or app is not approved for message content, the following fields of the message object in Gateway and API payloads will be empty—either an empty string or empty array, depending on the data type—when you receive a message: content, embeds, attachments, components.",
        "message-intents.jpg",
        1,
        NOW(),
        NOW()
    );

INSERT INTO
    articles(
        project_id,
        user_id,
        title,
        slug,
        description,
        body,
        image,
        published,
        created,
        modified
    )
VALUES
(
        1,
        1,
        "Music System",
        "music-system",
        "Playing music to your friends the easy way",
        "Play high quality music in your Discord server for free. If it' s on YouTube, then koala can find it!",
        "music-system.jpg",
        1,
        NOW(),
        NOW()
    );

INSERT INTO
    articles(
        project_id,
        user_id,
        title,
        slug,
        description,
        body,
        image,
        published,
        created,
        modified
    )
VALUES
(
        1,
        1,
        "Logging & Moderation",
        "logging-moderation",
        "How logging and moderation makes a better community",
        "Discord moderation bots help organize your server, act as a welcome bot for new members, and work as a Discord anti spam bot for troublemakers. koala fills all these roles and if you are working as a Discord moderator, then you try it for yourself ! ",
        "logging-moderation.jpg",
        1,
        NOW(),
        NOW()
    );

INSERT INTO
    articles(
        project_id,
        user_id,
        title,
        slug,
        description,
        body,
        image,
        published,
        created,
        modified
    )
VALUES
(
        1,
        1,
        "Slash Commands",
        "slash-commands",
        "Why / will soon be your most used key",
        "Slash Commands are an extremely powerful way to provide rich interactivity for members of your Discord server, all you have to do is type / and you 're ready to use your favorite bot. You can easily see all the bot' s commands, input validation, and error handling help you get the command right the first time.",
        "slash-commands.jpg",
        1,
        NOW(),
        NOW()
    );

INSERT INTO
    tags (title, created, modified)
VALUES
    ("API", NOW(), NOW());

INSERT INTO
    tags (title, created, modified)
VALUES
    ("Categories", NOW(), NOW());

INSERT INTO
    tags (title, created, modified)
VALUES
    ("Misc", NOW(), NOW());

INSERT INTO
    articles_tags (article_id, tag_id)
VALUES
    (1, 2);

INSERT INTO
    articles_tags (article_id, tag_id)
VALUES
    (2, 3);

INSERT INTO
    articles_tags (article_id, tag_id)
VALUES
    (3, 1);

INSERT INTO
    articles_tags (article_id, tag_id)
VALUES
    (4, 2);

INSERT INTO
    articles_tags (article_id, tag_id)
VALUES
    (5, 2);

INSERT INTO
    articles_tags (article_id, tag_id)
VALUES
    (6, 1);