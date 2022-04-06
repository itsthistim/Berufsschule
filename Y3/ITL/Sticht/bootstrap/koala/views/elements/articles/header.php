<header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center justify-content-between">

        <a href="index.php" class="logo"><img
                src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/twitter/53/koala_1f428.png"
                alt="" class="img-fluid"> Koala</a>

        <!-- <h1 class="logo"><a href="index.php">Koala</a></h1> -->

        <nav id="navbar" class="navbar">
            <ul>
                <li><a class="nav-link scrollto active" href="#">Home</a></li>
                <li class="dropdown"><a href="#"><span>Tools</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="./cms_article_add.php">Add Article</a></li>
                        <li><a href="./cms_articles_list.php">List Articles</a></li>
                        <li class="dropdown"><a href="#"><span>All Articles</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <?php
                                require_once './models/article.php';
                                $articles = Article::getArticles();
                                foreach ($articles as $article) {
                                  echo "<li><a href='./views/$article->slug.php'>$article->title</a></li>";
                                }
                                ?>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a href="./cms_reset.php">Reset Database</a></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
        <!-- .navbar -->

    </div>
</header>