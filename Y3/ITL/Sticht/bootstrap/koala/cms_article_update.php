<?php
session_start();
$_SESSION['project_id'] = 1;
$_SESSION['user_id'] = 1;

require_once "./models/tag.php";
require_once "./models/article.php";
require_once "./models/utils.php";

if (isset($_GET['id'])) {
  $updatearticle = Article::getById($_GET['id']);
} else {
  echo "<script>window.location.href = './cms_articles_list.php';</script>";
}

?>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Update article</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- ======= Body Begin ======= -->
    <?php include "./views/elements/index/body_begin.php" ?>
  </head>

  <body>
    <!-- ======= Header ======= -->
    <?php include "./views/elements/cms/header.php" ?>
    
    <!-- ======= Main ======= -->
    <main id="main">
      <?php include "./views/elements/cms/update_form.php"?>
    </main>

    <!-- ======= Footer ======= -->
    <?php include './views/elements/index/footer.php'; ?>
    
    <!-- ======= Body End ======= -->
    <?php include './views/elements/index/body_end.php'; ?>
  </body>

</html>