<?php

require_once "./models/db.php";
require_once "./models/utils.php";
require_once "./models/user.php";
require_once "./models/article.php";
require_once "./models/project.php";
require_once "./models/tag.php";

const active_project = 1;
// $newArticle = new Article(Utils::nextId("articles"), active_project, 1, "TEST TITLE", "blog", "This is a test article", "This is the body of the test article", "message-intents.jpg", 1, date("Y-m-d H:i:s"), date("Y-m-d H:i:s"));
// $newArticle->insert();

// Utils::resetDB();
?>

<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>koala</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/twitter/53/koala_1f428.png"
      rel="icon">
    <link href="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/twitter/53/koala_1f428.png"
      rel="apple-touch-icon">

    <!-- ======= Body Begin ======= -->
    <?php include "./views/elements/index/body_begin.php" ?>

  </head>

  <body>

    <!-- ======= Header ======= -->
    <?php include "./views/elements/index/header.php" ?>

    <!-- ======= Hero Section ======= -->
    <?php include "./views/elements/index/hero.php" ?>

    <!-- ======= Main ======= -->
    <main id="main">
      <?php // phpinfo(); ?>

      <!-- ======= About Section ======= -->
      <?php include "./views/elements/index/about.php" ?>

      <!-- ======= Blog ======= -->
      <?php include "./views/elements/index/blog_listing.php" ?>
      <?php //include "./views/elements/index/blog_features.php" ?>
      <?php include "./views/elements/index/topFive.php" ?>

      <!-- ======= Cta Section ======= -->
      <?php // include "./views/elements/index/cta.php" ?>
    </main>

    <!-- ======= Footer ======= -->
    <?php include './views/elements/index/footer.php'; ?>
    
    <!-- ======= Body End ======= -->
    <?php include './views/elements/index/body_end.php'; ?>

  </body>

</html>