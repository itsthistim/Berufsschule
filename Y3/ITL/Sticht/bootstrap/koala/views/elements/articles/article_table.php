<section id="articles cta">
    <div class="container">
        <div class="text-center">
            <table class="article-table">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Slug</th>
                        <th>Author</th>
                        <th>Created</th>
                        <th>Modified</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    require_once "./models/article.php";

                    $articles = Article::getArticles();
                    foreach ($articles as $article): ?>
                    <tr>
                        <td><a href="./cms_article_update.php?id=<?= $article->id ?>" style="display:block; width:100%;"><?php echo $article->id; ?></a></td>
                        <td><a href="./cms_article_update.php?id=<?= $article->id ?>" style="display:block; width:100%;"><?php echo $article->title; ?></a></td>
                        <td><a href="./cms_article_update.php?id=<?= $article->id ?>" style="display:block; width:100%;"><?php echo $article->slug; ?></a></td>
                        <td><a href="./cms_article_update.php?id=<?= $article->id ?>" style="display:block; width:100%;"><?php echo $article->user_id; ?></a></td>
                        <td><a href="./cms_article_update.php?id=<?= $article->id ?>" style="display:block; width:100%;"><?php echo $article->created; ?></a></td>
                        <td><a href="./cms_article_update.php?id=<?= $article->id ?>" style="display:block; width:100%;"><?php echo $article->modified; ?></a></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            <a class="table-button" href="./cms_article_add.php">New Article</a>
        </div>
    </div>
</section>