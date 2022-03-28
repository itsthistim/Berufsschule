<?php
$utils = new Utils();
$tag = new Tag($utils->nextId("tags"), "API", );

?>

<section id="blog" class="portfolio">
        <div class="container">

          <div class="section-title">
            <h2>Blog Entries</h2>
          </div>

          <div class="row">
            <div class="col-lg-12">
              <ul id="portfolio-flters">
                <li data-filter="*" class="filter-active">All</li>
                <li data-filter=".filter-app">API</li>
                <li data-filter=".filter-card">Categories</li>
                <li data-filter=".filter-web">Commands</li>
              </ul>
            </div>
          </div>

          <div class="row portfolio-container">

            <div class="col-lg-4 col-md-6 portfolio-item filter-app">
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

            <div class="col-lg-4 col-md-6 portfolio-item filter-app">
              <div class="portfolio-wrap">
                <img src="assets/img/portfolio/messages_blue.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h3><a href="assets/img/portfolio/messages_blue.jpg" data-gallery="portfolioGallery"
                      class="portfolio-lightbox" title="Message Intents">Message Intents</a></h3>
                  <div>
                    <a href="assets/img/portfolio/messages_blue.jpg" data-gallery="portfolioGallery"
                      class="portfolio-lightbox" title="Message Intents"><i class="bi bi-plus"></i></a>
                    <a href="./views/blog-message-intents.php" title="Message Intents"><i
                        class="bi bi-link"></i></a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="assets/img/portfolio/music.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h3><a href="assets/img/portfolio/music.jpg" data-gallery="portfolioGallery"
                      class="portfolio-lightbox" title="Music System">Music System</a></h3>
                  <div>
                    <a href="assets/img/portfolio/music.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"
                      title="Music System"><i class="bi bi-plus"></i></a>
                    <a href="./views/blog-music-system.php" title="Music System"><i class="bi bi-link"></i></a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 portfolio-item filter-web">
              <div class="portfolio-wrap">
                <img src="assets/img/portfolio/internationalization.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h3><a href="assets/img/portfolio/internationalization.jpg" data-gallery="portfolioGallery"
                      class="portfolio-lightbox" title="Internationalization & Languages">Internationalization & Languages</a></h3>
                  <div>
                    <a href="assets/img/portfolio/internationalization.jpg" data-gallery="portfolioGallery"
                      class="portfolio-lightbox" title="Internationalization & Languages"><i class="bi bi-plus"></i></a>
                    <a href="./views/blog-internationalization-languages.php"
                      title="Internationalization & Languages"><i class="bi bi-link"></i></a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="assets/img/portfolio/art.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h3><a href="assets/img/portfolio/art.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"
                      title="Image Manipulation">Image Manipulation</a></h3>
                  <div>
                    <a href="assets/img/portfolio/art.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"
                      title="Image Manipulation"><i class="bi bi-plus"></i></a>
                    <a href="./views/blog-image-manipulation.php" title="Image Manipulation"><i
                        class="bi bi-link"></i></a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 portfolio-item filter-web">
              <div class="portfolio-wrap">
                <img src="assets/img/portfolio/street.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h3><a href="assets/img/portfolio/street.jpg" data-gallery="portfolioGallery"
                      class="portfolio-lightbox" title="Web 1">Rewrite & Optimization</a></h3>
                  <div>
                    <a href="assets/img/portfolio/street.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"
                      title="Web 1"><i class="bi bi-plus"></i></a>
                    <a href="./views/blog-rewrite-optimization.php" title="Rewrite & Optimization"><i class="bi bi-link"></i></a>
                  </div>
                </div>
              </div>
            </div>

          </div>

        </div>
      </section>