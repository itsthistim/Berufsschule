<?php
include './session_vars.php';

require_once "./models/db.php";
require_once "./models/utils.php";
require_once "./models/user.php";
require_once "./models/article.php";
require_once "./models/project.php";
require_once "./models/tag.php";
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>koala</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <?php include "./views/elements/index/body_begin.php" ?>
  </head>

  <body>
    <?php include "./views/elements/index/header.php" ?>

    <?php include "./views/elements/index/hero.php" ?>
    
    <main id="main">
      <?php include "./views/elements/index/about.php" ?>

      <?php include "./views/elements/index/blog_listing.php" ?>
      <?php //include "./views/elements/index/blog_features.php" ?>
      <?php include "./views/elements/index/topFive.php" ?>
    </main>

    <?php include './views/elements/index/footer.php'; ?>
    
    <?php include './views/elements/index/body_end.php'; ?>

  </body>
</html>