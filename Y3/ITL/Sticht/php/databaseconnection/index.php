<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    require_once './db.php';
    require_once './article.php';
    require_once './project.php';
    require_once './user.php';

    $db = new Database();
    $article = new Article();
    $project = new Project();
    $user = new User();
    ?>
    <hr>
    <form action="./index.php" method="post">
        <label>Project:
            <select id="project" name="project">
                <?php
                $projects = $project->getProjects();
                foreach ($projects as $project) {
                    echo "<option value=" . $project['id'] . ">" . $project['title'] . "</option>";
                }
                ?>
            </select>
        </label><br><br>
        <label>User:
            <select id="user" name="user">
                <?php
                $users = $user->getUsers();
                foreach ($users as $user) {
                    echo "<option value=" . $user['id'] . ">" . $user['email'] . "</option>";
                }
                ?>
            </select>
        </label><br><br>
        <label>Title: <input type="text" name="title" id="" required></label><br><br>
        <label>Slug: <input type="text" name="slug" required></label><br><br>
        <label>Body: <textarea name="body" id="textbody" cols="30" rows="10" required></textarea></label><br><br>
        <label>Published: <input type="checkbox" id="published" name="published"> </label><br><br>
        <input type="submit" name="submit" value="Create Article">
        <hr>
        <?php
        // insert new article
        if (isset($_POST['submit'])) {
            try {
                $article->insert($_POST['project'], $_POST['user'], $_POST['title'], $_POST['slug'], $_POST['body'], isset($_POST['published']) ? 0 : 1, date("Y-m-d H-i-s"), date("Y-m-d H-i-s"));
                echo "<p style=\"color: green\">Inserted new article.</p>";
            } catch (PDOException $e) {
                echo "<p style=\"color: red\">" . $e->getMessage() . "</p>";
            }
        }
        ?>
        <hr>
        <?php
        // show articles
        $articles = $article->getArticles();
        foreach ($articles as $element) {
            echo "<h1>" . $element['title'] . "</h1>";
            echo "<p>" . $element['project_id'] . " " . $element['user_id'] . " " . $element['slug'] . "</p>";
            echo "<p>" . $element['body'] . "</p>";
            echo "<p>Created: " . $element['created'] . " Modified: " . $element['modified'] . "</p>";
            echo "<p>" . $element['published'] . "</p>";
        }
        ?>
    </form>
</body>

</html>