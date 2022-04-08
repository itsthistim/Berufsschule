<?php
session_start();
require_once "./models/db.php";
require_once "./models/utils.php";
require_once "./models/user.php";
require_once "./models/article.php";
require_once "./models/project.php";
require_once "./models/tag.php";

const active_project = 1;
const user_id = 1;

$_SESSION['active_project'] = active_project;
$_SESSION['user_id'] = user_id;
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

      <?php // include "./views/elements/index/cta.php" ?>
    </main>

    <?php include './views/elements/index/footer.php'; ?>
    
    <?php include './views/elements/index/body_end.php'; ?>

  </body>
</html>