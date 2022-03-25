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
    $article = new Article($db);
    $project = new Project($db);
    $user = new User($db);
    $articles = $article->getArticles();

    foreach ($articles as $article) {
        echo "<h1>" . $article['title'] . "</h1>";
    }

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
        <?php
        if (isset($_POST['submit'])) {
            $new_article = new Article($_POST['project_id'], $_POST['user'], $_POST['title'], $_POST['slug'], $_POST['body'], isset($_POST['published']) ? 0 : 1, date("Y-m-d H-i-s"), date("Y-m-d H-i-s"));
            $new_article->insert();
        }
        ?>
    </form>
</body>

</html>