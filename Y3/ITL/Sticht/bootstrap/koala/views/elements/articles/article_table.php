<section id="articles cta">
    <div class="container">
        <div class="text-center">
            <table class="article-table">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Title</th>
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
                        <td><?php echo $article->id; ?></td>
                        <td><?php echo $article->title; ?></td>
                        <td><?php echo $article->user_id; ?></td>
                        <td><?php echo $article->created; ?></td>
                        <td><?php echo $article->modified; ?></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            <a class="table-button" href="./cms_article_add.php">New Article</a>
        </div>
    </div>
</section>