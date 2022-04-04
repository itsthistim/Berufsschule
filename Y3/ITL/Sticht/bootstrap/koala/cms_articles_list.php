<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>List articles</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- ======= Favicons ======= -->
    <link href="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/twitter/53/koala_1f428.png"
      rel="icon">
    <link href="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/twitter/53/koala_1f428.png"
      rel="apple-touch-icon">

    <!-- ======= Body Begin ======= -->
    <?php include "./views/elements/index/body_begin.php" ?>
  </head>

  <body>
    <!-- ======= Header ======= -->
    <?php include "./views/elements/articles/header.php" ?>
    
    <!-- ======= Main ======= -->
    <main id="main">
        <?php include "./views/elements/articles/article_table.php" ?>
    </main>

    <!-- ======= Footer ======= -->
    <?php include './views/elements/index/footer.php'; ?>
    
    <!-- ======= Body End ======= -->
    <?php include './views/elements/index/body_end.php'; ?>
  </body>

</html>