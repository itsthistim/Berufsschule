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
    $db = new Database();

    $db->getArticles();
    ?>
    <hr>
    <form action="./index.php" method="post">
        <label>User:
            <select id="user">
                <?= $db->getProjects(); ?>
            </select>
        </label><br><br>
        <label>User:
            <select id="user">
                <option selected>admin</option>
            </select>
        </label><br><br>
        <label>Title: <input type="text" name="title" id="" required></label><br><br>
        <label>Slug: <input type="text" name="slug" required></label><br><br>
        <label>Body: <textarea name="body" id="textbody" cols="30" rows="10" required></textarea></label><br><br>
        <label>Created: <input type="datetime-local" id="published" name="published" value="<?= date("Y-m-d h:i:sa") ?>" max="<?= date("Y-m-d h:i:sa") ?>" required></label><br><br>
        <label>Modifed: <input type="datetime-local" id="published" name="published" value="<?= date("Y-m-d h:i:sa") ?>" max="<?= date("Y-m-d h:i:sa") ?>"></label><br><br>
        <label>Published: <input type="checkbox"> </label><br><br>
        <input type="submit" name="create" value="Create">
        <?php
        if (isset($_POST['create'])) {
            $article = new Article();
            
        }
        ?>
    </form>
</body>

</html>