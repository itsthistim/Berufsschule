<?php
require_once "./models/user.php";
require_once "./models/utils.php";
require_once "./models/tag.php";
require_once "./models/article.php";

?>

<section id="blog_listing" class="portfolio">
  <div class="container">

    <div class="section-title">
      <h2>Blog Entries</h2>
    </div>

    <div class="row">
      <div class="col-lg-12">
        <ul id="portfolio-flters">
          <li data-filter="*" class="filter-active">All</li>
          <!-- todo: get tags from db -->
          <li data-filter=".filter-api">API</li>
          <li data-filter=".filter-categories">Categories</li>
          <li data-filter=".filter-commands">Commands</li>
        </ul>
      </div>
    </div>

    <div class="row portfolio-container">

      <?php
      $articles = Article::getArticles();
      foreach ($articles as $article) {
        $tags = Tag::getTagsByArticle($article->id);
        
        $tags_string = "";
        
        foreach ($tags as $tag) {
          $tags_string .= $tag->title . " ";
        }
        
        ?>
        <div class="col-lg-4 col-md-6 portfolio-item filter-<?php echo $tags_string; ?>">
          <div class="portfolio-wrap">
            <figure>
              <img src="<?php echo "assets/img/portfolio/$article->image"; ?>" class="img-fluid" alt="">
              <a href="<?php echo "assets/img/portfolio/$article->image"; ?>" class="link-preview" data-lightbox="portfolio" data-title="<?php echo $article->title; ?>" title="Preview"><i class="ion ion-eye"></i></a>
              <a href="<?php echo "./views/$article->slug.php"; ?>" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
            </figure>

            <div class="portfolio-info">
              <h4><a href="<?php echo "./views/$article->slug.php"; ?>"><?php echo $article->title; ?></a></h4>
              <p><?php echo $article->body ?></p>
            </div>
          </div>
        </div>
      <?php } ?>

<!--
       <div class="col-lg-4 col-md-6 portfolio-item filter-api">
        <div class="portfolio-wrap">
          <img src="assets/img/portfolio/slashcommands.jpg" class="img-fluid" alt="">
          <div class="portfolio-info">
            <h3><a href="assets/img/portfolio/slashcommands.jpg" data-gallery="portfolioGallery"
                class="portfolio-lightbox" title="Slash Commands">Slash Commands</a></h3>
            <div>
              <a href="assets/img/portfolio/slashcommands.jpg" data-gallery="portfolioGallery"
                class="portfolio-lightbox" title="Slash Commands"><i class="bi bi-plus"></i></a>
              <a href="./views/blog-slash-commands.php" title="Slash Commands"><i class="bi bi-link"></i></a>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-4 col-md-6 portfolio-item filter-api">
        <div class="portfolio-wrap">
          <img src="assets/img/portfolio/messages_blue.jpg" class="img-fluid" alt="">
          <div class="portfolio-info">
            <h3><a href="assets/img/portfolio/messages_blue.jpg" data-gallery="portfolioGallery"
                class="portfolio-lightbox" title="Message Intents">Message Intents</a></h3>
            <div>
              <a href="assets/img/portfolio/messages_blue.jpg" data-gallery="portfolioGallery"
                class="portfolio-lightbox" title="Message Intents"><i class="bi bi-plus"></i></a>
              <a href="./views/message-intents.php" title="Message Intents"><i class="bi bi-link"></i></a>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-4 col-md-6 portfolio-item filter-categories">
        <div class="portfolio-wrap">
          <img src="assets/img/portfolio/music.jpg" class="img-fluid" alt="">
          <div class="portfolio-info">
            <h3><a href="assets/img/portfolio/music.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"
                title="Music System">Music System</a></h3>
            <div>
              <a href="assets/img/portfolio/music.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"
                title="Music System"><i class="bi bi-plus"></i></a>
              <a href="./views/music-system.php" title="Music System"><i class="bi bi-link"></i></a>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-4 col-md-6 portfolio-item filter-commands">
        <div class="portfolio-wrap">
          <img src="assets/img/portfolio/internationalization.jpg" class="img-fluid" alt="">
          <div class="portfolio-info">
            <h3><a href="assets/img/portfolio/internationalization.jpg" data-gallery="portfolioGallery"
                class="portfolio-lightbox" title="Internationalization & Languages">Internationalization & Languages</a>
            </h3>
            <div>
              <a href="assets/img/portfolio/internationalization.jpg" data-gallery="portfolioGallery"
                class="portfolio-lightbox" title="Internationalization & Languages"><i class="bi bi-plus"></i></a>
              <a href="./views/internationalization-languages.php" title="Internationalization & Languages"><i
                  class="bi bi-link"></i></a>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-4 col-md-6 portfolio-item filter-categories">
        <div class="portfolio-wrap">
          <img src="assets/img/portfolio/art.jpg" class="img-fluid" alt="">
          <div class="portfolio-info">
            <h3><a href="assets/img/portfolio/art.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"
                title="Image Manipulation">Image Manipulation</a></h3>
            <div>
              <a href="assets/img/portfolio/art.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"
                title="Image Manipulation"><i class="bi bi-plus"></i></a>
              <a href="./views/image-manipulation.php" title="Image Manipulation"><i class="bi bi-link"></i></a>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-4 col-md-6 portfolio-item filter-commands">
        <div class="portfolio-wrap">
          <img src="assets/img/portfolio/street.jpg" class="img-fluid" alt="">
          <div class="portfolio-info">
            <h3><a href="assets/img/portfolio/street.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"
                title="Web 1">Rewrite & Optimization</a></h3>
            <div>
              <a href="assets/img/portfolio/street.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"
                title="Web 1"><i class="bi bi-plus"></i></a>
              <a href="./views/rewrite-optimization.php" title="Rewrite & Optimization"><i
                  class="bi bi-link"></i></a>
            </div>
          </div>
        </div>
      </div> -->

    </div>

  </div>
</section>