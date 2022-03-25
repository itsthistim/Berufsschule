<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <?php
        require_once './STdb.php';
        require_once './STArticle.php';
        require_once './STProject.php';
        require_once './STUser.php';
        $article = new STArticle();
        $project = new STProject();
        $user = new STUser();
    ?>
</head>
<body>
    <form action="./index.php" method="post">
        <label>User: <select name="user">
                <?php
                    $users = $user->getAllUsers();
                    while ($row = $users->fetch())
                    {
                        echo "<option value=".$row['id'].">".$row['email']."</option>";
                    }
                ?></select>
        </label>
        <br><br>
        <label>Projekt: <select name="project">
                <?php
                $projects = $project->getAllProjects();
                while ($row = $projects->fetch())
                {
                    echo "<option value=".$row['id'].">".$row['title']."</option>";
                }

                

                ?></select>
        </label><br><br>
        <label>Titel: <input type="text" name="title"></label><br><br>
        <label>Slug: <input type="text" name="slug"></label><br><br>
        <label>Body: <input type="text" name="body"></label><br><br>
        <label><input type="checkbox" name="published"> Publish</label><br><br>
        <input type="submit" name="submit">
    </form>
    <hr>
    <?php
        if (isset($_POST['submit']))
        {
            if ($_POST['user'] != '' && $_POST['project'] != '' && $_POST['title'] != '' && $_POST['slug'] != '')
            {
                echo "insert";
                $article->insertArticle($_POST['project'], $_POST['user'], $_POST['title'], $_POST['slug'], $_POST['body'], isset($_POST['published'])?1:0);
            }
            else
            {
                echo "nicht alle Pflichtfelder befüllt!";
            }
        }

    $article->getAllArticles();
    ?>
</body>
</html>