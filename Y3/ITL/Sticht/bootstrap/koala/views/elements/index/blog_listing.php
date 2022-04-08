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

        <!-- search form -->
        <div class="row">
            <div class="col-md-4"></div>
            <div class="article-search-form col-md-4">
                <form action="./index.php#blog_listing" method="post">
                    <?php
                      $searchtext = isset($_POST["anrede"]) ? $_POST["anrede"] : '';
                    ?>
                    <input type="text" name="search" value="<?=$searchtext?>">
                    <button type="submit"><i class="bi bi-search"></i></button>

                    <?php
                      if(isset($_POST["search"])) {
                        $_SESSION["search_text"] = $_POST["search"];
                      } else {
                        $_SESSION["search_text"] = '';
                      }
                    ?>
                </form>
            </div>
            <div class="col-md-4"></div>
        </div>

        <br>
        <div class="row">
            <div class="col-lg-12">
                <ul id="portfolio-flters">
                    <li data-filter="*" class="filter-active">All</li>
                    <?php
                      $tags = Tag::getTags();
                      foreach ($tags as $tag) {
                        echo "<li data-filter='.filter-$tag->title'>$tag->title</li>";
                      }
                    ?>
                </ul>
            </div>
        </div>

        <div class="row portfolio-container">

            <?php
      foreach ($articles as $article) {
        $tags = Tag::getTagsByArticle($article->id);
        
        $tags_string = "";
        foreach ($tags as $tag) {
          $tags_string .= "filter-$tag->title ";
        }
        
        ?>
            <div class="col-lg-4 col-md-6 portfolio-item <?php echo "$tags_string"; ?>">
                <div class="portfolio-wrap">
                    <figure>
                        <img src="<?php echo "assets/img/portfolio/$article->image"; ?>" class="img-fluid" alt="">
                        <a href="<?php echo "assets/img/portfolio/$article->image"; ?>" class="link-preview"
                            data-lightbox="portfolio" data-title="<?php echo $article->title; ?>" title="Preview"><i
                                class="ion ion-eye"></i></a>
                        <a href="<?php echo "./views/$article->slug.php"; ?>" class="link-details"
                            title="More Details"><i class="ion ion-android-open"></i></a>
                    </figure>

                    <div class="portfolio-info">
                        <h4><a href="<?php echo "./views/$article->slug.php"; ?>"><?php echo $article->title; ?></a>
                        </h4>
                        <p><?php echo $article->description ?></p>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>

    </div>
</section>