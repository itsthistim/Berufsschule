<?php
require_once "./models/user.php";
require_once "./models/utils.php";
require_once "./models/tag.php";
require_once "./models/article.php";

session_unset();
?>

<section id="blog_listing" class="portfolio">
    <div class="container">

        <div class="section-title">
            <h2>Blog Entries</h2>
        </div>

        <!-- search form -->
        <div class="row">
            <div class="col-md-4"></div>
            <form action="./index.php#blog_listing" method="post">
                <div class="article-search-form col-md-4 center">
                    <?php
                        if(!isset($_SESSION["search_text"]) || empty($_SESSION["search_text"]))
                        {
                            $_SESSION["search_text"] = isset($_POST["search"]) ? $_POST["search"] : '';
                        }

                        if(!isset($_SESSION["active_tag"]) || empty($_SESSION["active_tag"]))
                        {
                            $_SESSION["active_tag"] = isset($_POST["activetag"]) ? $_POST["activetag"] : '';
                        }
                    ?>
                    <input type="text" name="search" placeholder="Search" value="<?=$_SESSION["search_text"]?>">
                    <button type="submit"><i class="bi bi-search"></i></button>
                </div>
                
                <div class="article-search-form col-md-4 center" id="tag-search">
                    <br>
                    <select class="form-select" name="activetag">
                        <option value="">All Tags</option>
                        <?php
                            $tags = Tag::getTags();
                            foreach ($tags as $tag) {
                                $selected = '';
                                if($tag->title == $_SESSION["active_tag"]) {
                                    $selected = 'selected';
                                }
                                echo '<option name="' . $tag->title . '" ' . $selected . '>' . $tag->title . '</option>';
                            }
                        ?>
                    </select>
                </div>
            </form>
            <div class="col-md-4"></div>
        </div>
        <!-- end search form -->
        <br>

        <!-- original tag filtering -->
        <script>
            document.getElementById("tag-search").style.display = "none";
        </script>
        <div class="row">
            <div class="col-lg-12">
                <ul id="portfolio-filters">
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
                $articles = Article::getBySearch($_SESSION["search_text"], $_SESSION["active_tag"]);
                foreach ($articles as $article) {
                    $tags = Tag::getTagsByArticle($article->id);
                    $tags_string = "";
                    
                    foreach ($tags as $tag) {
                        $tags_string .= "filter-$tag->title ";
                    }
            ?>
            <div class="col-lg-4 col-md-6 portfolio-item <?php echo $tags_string; ?>">
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
                        <h4><a href="<?php echo "./views/blog.php?page=$article->slug"; ?>"><?php echo $article->title; ?></a>
                        </h4>
                        <p><?php echo $article->description ?></p>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>

    </div>
</section>