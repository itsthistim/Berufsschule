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
                foreach ($projects as $projectelement) {
                    echo "<option value=" . $projectelement['id'] . ">" . $projectelement['title'] . "</option>";
                }
                ?>
            </select>
        </label><br><br>
        <label>User:
            <select id="user" name="user">
                <?php
                $users = $user->getUsers();
                foreach ($users as $userelement) {
                    echo "<option value=" . $userelement['id'] . ">" . $userelement['email'] . "</option>";
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
                if ($article->insert($_POST['project'], $_POST['user'], $_POST['title'], $_POST['slug'], "", "", $_POST['body'], isset($_POST['published']) ? 0 : 1, date("Y-m-d H-i-s"), date("Y-m-d H-i-s"))) {
                    echo "<p style=\"color: green\">Inserted new article.</p>";
                }
                else {
                    throw new PDOException("Insert failed.");
                }
            } catch (Exception $e) {
                echo "<p style=\"color: red\">" . $e->getMessage() . "</p>";
            }
        }
        ?>
        <hr>
        <?php
        // show articles
        $articles = $article->getArticles();


        foreach ($articles as $articleelement) {
            $projectTitle = $project->getProjectById($articleelement['project_id'])['title'];
            $userEmail = $user->getUserById($articleelement['user_id'])['email'];

            echo "<h1>" . $articleelement['title'] . "</h1>";
            echo "<p>" . $projectTitle . " | " . $userEmail . " | " . $articleelement['slug'] . "</p>";
            echo "<p>" . $articleelement['body'] . "</p>";
            echo "<p>Created: " . $articleelement['created'] . " | Modified: " . $articleelement['modified'] . "</p>";
            echo "<p>" . $articleelement['published'] = 1 ? "Published" : "Not Published" . "</p>";
        }
        ?>
    </form>
</body>

</html>