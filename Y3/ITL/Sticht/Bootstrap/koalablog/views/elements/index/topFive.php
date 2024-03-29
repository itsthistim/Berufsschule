<section id="cta" class="cta">
    <div class="container">

        <div class="text-center">
            <h3>Most Recent</h3>
            <p>It is important to <strong>stay up to date</strong>! And this is why you can see the five most recent articles here.</p>
            <div class="row">
                <div class="col-lg-4 col-md-3"></div>

                <div id="topFiveCarousel" class="carousel slide col-lg-4 col-md-6" data-bs-ride="carousel">
                    <div class="carousel-indicators">

                        <?php
                $articles = Article::getMostRecent(5);
                $i = 0;
                foreach ($articles as $article) {
                    ?>
                        <button type="button" data-bs-target="#topFiveCarousel" data-bs-slide-to="<?php echo $i; ?>"
                            aria-label="<?php echo "Slide $i"; ?>" class="<?php if ($i == 0) {echo "active"; }?>"
                            <?php if ($i == 0) {echo " aria-current=\"true\""; }?>></button>
                        <?php
                    $i++;
                }
                ?>
                    </div>
                    <div class="carousel-inner">

                        <?php
                $i = 0;
                foreach ($articles as $article) {
                    ?>
                        <div class="carousel-item <?php if ($i == 0) {echo "active"; }?>">
                            <a href=<?php echo "./views/$article->slug.php"?>>
                                <img src="<?php echo "assets/img/portfolio/$article->image"; ?>" class="d-block w-100"
                                    alt="<?=$article->image?>">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5><?php echo $article->title; ?></h5>
                                    <p><?php echo $article->description ?></p>
                                </div>
                            </a>
                        </div>
                        <?php
                    $i++;
                }
                ?>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#topFiveCarousel"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#topFiveCarousel"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                <div class="col-lg-4 col-md-3"></div>
            </div>

        </div>

    </div>
</section>