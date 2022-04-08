<section id="contact" class="contact">
    <div class="container">

        <div class="section-title">
            <h2>Articles</h2>
            <h3><span>Add</span> an article</h3>
            <p>Sometimes, finding the right words for something and structuring the article all comes naturally, and
                sometimes just nothing comes to mind.</p>
        </div>

        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-6 mt-4 mt-md-0">

                <form action="cms_article_add.php" method="post" class="php-email-form">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <input type="text" class="form-control" name="title" id="title" placeholder="Title"
                                required>
                        </div>
                        <div class="col-md-6 form-group mt-3 mt-md-0">
                            <input type="text" class="form-control" name="slug" id="slug" placeholder="Slug" required>
                        </div>
                    </div>

                    <div class="form-group mt-3">
                        <input type="text" class="form-control" name="description" id="description"
                            placeholder="Description" required>
                    </div>

                    <div class="form-group mt-3">
                        <textarea class="form-control" name="body" rows="5" placeholder="Body" required></textarea>
                    </div>

                    <div class="form-group mt-3">
                        <input type="text" class="form-control" name="image" id="image" placeholder="Image">
                    </div>

                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="published" name="published"
                            style="height: 15px;"> Published
                    </div>

                    <h5>Tags</h5>
                    <div class="form-group form-check">
                        <?php
                        require_once "./models/tag.php";
                        require_once "./models/article.php";
                        require_once "./models/utils.php";

                        $tags = Tag::getTags();
                        foreach ($tags as $tag) {
                            echo "<input type=\"checkbox\" class=\"form-check-input\" id=\"tags[]\" name=\"tags[]\" value=\"$tag->id\" style=\"height: 15px;\">" . $tag->title . "<br>";
                        }
                        ?>
                    </div>

                    <div class="text-center"><button name="submit" type="submit" value="Add Article">Add Article</button></div>
                </form>

                <?php
if (isset($_POST['submit'])) {
    if ($_POST['title'] != '' && $_POST['slug'] != '' && $_POST['description'] != '' && $_POST['body'] != '') {
        if (Article::getBySlug($_POST['slug']) !== false) {
            echo "<p>Article with this slug already exists!</p>";
        }
        else {
            $article = new Article(Utils::nextId("articles"), $_SESSION['project_id'], $_SESSION['user_id'], $_POST['title'], $_POST['slug'], $_POST['description'], $_POST['body'], $_POST['image'], isset($_POST['published']) ? 1 : 0, date("Y-m-d H:i:s"), date("Y-m-d H:i:s"));
            $success;
            
            try {
                $article->insert();
                $success = true;
            }
            catch (PDOException $th) {
                $success = false;
                echo $th;
            }

            $tags = $_POST['tags'];
            foreach ($tags as $tag) {
                try {
                    $article->addTag($tag);
                    $success = true;
                }
                catch (PDOException $th) {
                    $success = false;
                    echo $th;
                }
            }

            if ($success) {
                echo "<script>window.location.href = './index.php';</script>";
            }
        }
    }
}
?>
            </div>
        </div>

    </div>
</section>