CREATE Database blog_cms;
Use blog_cms;
CREATE TABLE users (
 id INT AUTO_INCREMENT PRIMARY KEY,
 email VARCHAR(255) NOT NULL,
 password VARCHAR(255) NOT NULL,
 created DATETIME,
 modified DATETIME
);
CREATE TABLE projects(
 id INT AUTO_INCREMENT PRIMARY KEY,
 title VARCHAR(255) NOT NULL,
 Description VARCHAR(1024) NOT NULL,
 color_main char(8),
 color_secondary char(8)
);
CREATE TABLE articles (
 id INT AUTO_INCREMENT PRIMARY KEY,
 project_id INT NOT NULL,
 user_id INT NOT NULL,
 title VARCHAR(255) NOT NULL,
 slug VARCHAR(191) NOT NULL,
 body TEXT,
 published BOOLEAN DEFAULT FALSE,
 created DATETIME,
 modified DATETIME,
 UNIQUE KEY (slug),
 FOREIGN KEY user_key (user_id) REFERENCES users(id),
 FOREIGN KEY project_key (project_id) REFERENCES projects(id)
);
CREATE TABLE tags (
 id INT AUTO_INCREMENT PRIMARY KEY,
 title VARCHAR(191),
 created DATETIME,
 modified DATETIME,
 UNIQUE KEY (title)
) CHARSET=utf8mb4;
CREATE TABLE articles_tags (
 article_id INT NOT NULL,
 tag_id INT NOT NULL,
 PRIMARY KEY (article_id, tag_id),
 FOREIGN KEY tag_key(tag_id) REFERENCES tags(id),
 FOREIGN KEY article_key(article_id) REFERENCES articles(id)
);
INSERT INTO users (email, password, created, modified)
VALUES
('admin', 'secret', NOW(), NOW());
INSERT INTO projects (title, description, color_main, color_secondary)
VALUES
('First Project', 'das ist ein Blindtext zu meinem Blogprojekt',
'#185ABD', '#D33C44');
INSERT INTO articles (project_id,user_id, title, slug, body, published,
created, modified)
VALUES
(1,1, 'First Post', 'first-post', 'This is the first post.', 1, NOW(),
NOW());