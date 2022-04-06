<?php
session_start();
$_SESSION['project_id'] = 1;
$_SESSION['user_id'] = 1;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
<?php

require_once "./models/utils.php";
require_once "./models/article.php";

$article = new Article(Utils::nextId("articles"), $_SESSION['project_id'], $_SESSION['user_id'], '$_POST[\'title\']', '$_POST[\'slug\']', '$_POST[\'description\']', '$_POST[\'body\']', '$_POST[\'image\']', 1, date("Y-m-d H:i:s"), date("Y-m-d H:i:s"));
try {
    $article->insert();
    echo "Inserted article ";
}
catch (PDOException $th) {
    echo $th;
}

include './views/elements/articles/article_table.php';

?>
</body>
</html>