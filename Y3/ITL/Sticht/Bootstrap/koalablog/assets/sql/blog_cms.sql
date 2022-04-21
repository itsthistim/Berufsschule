SET FOREIGN_KEY_CHECKS = 0;

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
        "<h1>Et enim ratione ut dolorem quaerat! </h1><p>Lorem ipsum dolor sit amet. Et modi soluta ut neque consequuntur quo aliquam voluptas. Sed corporis galisum <strong>At voluptas</strong> nam dicta velit ea eveniet quos. Et rerum earum <em>Ut sequi eum voluptatibus accusantium aut rerum quae non deserunt accusamus</em>. Est quia ipsa et maxime minima qui fugiat recusandae est possimus nulla quo error tempora sed similique beatae. Aut quibusdam modi et ipsam voluptatem ex laboriosam Quis aut dignissimos galisum. Nam officiis quia nam nobis ipsa et laboriosam tenetur et distinctio quae. Ut deleniti voluptate ex minus nihil sit illo minima non voluptatibus corporis. </p><dl><dt><dfn>Ab earum nisi? </dfn></dt><dd>Vel laborum adipisci At eius nemo non asperiores repellendus. </dd><dt><dfn>Ut doloremque quidem. </dfn></dt><dd>Qui nisi dolorum aut ipsum asperiores et consequatur dolore. </dd></dl><h2>Eos necessitatibus omnis vel excepturi eaque ut quia quidem. </h2><p>Qui corporis quasi <em>Ut provident eos minus obcaecati et pariatur officiis</em> eos architecto iste nam sint officia. Ut internos dolor quo culpa aliquid sit deleniti architecto! Aut dolorum ipsam <strong>Nam consectetur et dolores quibusdam non aliquid quisquam</strong>. Quo officia molestiae ut dolores consequatur et fuga inventore qui obcaecati minima  odio tempore. In voluptas labore id provident blanditiis qui dolor error aut ducimus doloribus 33 natus tenetur. </p><h3>Vel culpa omnis qui officiis eius. </h3><p>Sed culpa nisi sit voluptatem nemo non ullam ipsum vel quidem rerum qui quia odio ab praesentium perspiciatis eos sunt deleniti. Est quae aspernatur <em>Est amet  exercitationem enim non itaque consectetur</em> est nostrum unde ut quidem suscipit. Quo consectetur incidunt ut blanditiis amet non quam laborum eum accusamus quis et impedit voluptas? Et galisum quaerat est iure officiis <strong>Est galisum aut blanditiis voluptatem sed molestiae sapiente et tenetur magnam</strong> et voluptas molestias. Rem dolores aspernatur in modi soluta et velit laudantium. </p><h4>A galisum laboriosam et necessitatibus laboriosam ut fuga. </h4><p>Id magnam amet aut ducimus voluptatem eos ullam voluptatem ea voluptate ipsa. Qui consequuntur possimus est sunt voluptatem <strong>33 facere qui velit dolore ut quibusdam dolorum et reprehenderit enim</strong>? Nam inventore quia et numquam numquam ut eaque soluta ut perspiciatis possimus non ipsam fugit qui illum corporis. Ut veritatis doloribus cum accusantium minimaaut doloremque quo voluptatum velit est nihil excepturi. Qui maiores galisum est cumque corporis <a href=\"https://www.loremipzum.com\" target=\"_blank\">At quisquam et illum sunt</a> qui quae minima et perspiciatis consectetur sed quam placeat. A rerum officia et dicta maxime sit iste fuga. Et dolorem impedit ut voluptates officiis ut consequuntur commodi. Sit illo itaque ut adipisci officiis vel consequuntur enim! Sed dolores iure eos consectetur eligendi sit blanditiis sequi in repudiandae  et voluptatibus aperiam sit enim commodi? </p><h5>Nam incidunt iusto ad eveniet nihil et corporis quos. </h5><p>In expedita dolore ab sunt enim est illo quia est nisi officia. Nesciunt quia id voluptatem iusto aut modi voluptatem sed dolorem optio qui dolor voluptatem. Ea molestiae eligendi <strong>Ut quae et voluptas commodi vel autem quis</strong> et explicabo perspiciatis qui dolorem culpa eum rerum dolores. Quo sint molestias ad modi magnam <a href=\"https://www.loremipzum.com\" target=\"_blank\">Quo temporibus sed quaerat possimus est quia tempore est ipsam quaerat</a> eos voluptas dolore. Eos excepturi sint et ducimus incidunt eos atque accusamus non animi voluptate est voluptatum nostrum sit numquam harum ut minus dicta! At explicabo voluptatibus ea alias numquam <em>Ab perspiciatis</em>. Sed suscipit quas At necessitatibus facilis et unde neque aut explicabo facere est provident autem et voluptatem quos et animi sapiente. Est internos debitis et quam voluptatem sed mollitia ipsa et nulla consequatur quo reiciendis assumenda eos asperiores quod. Qui rerum ducimus non esse praesentium  impedit nemo. </p>",
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
    
SET FOREIGN_KEY_CHECKS = 1;
