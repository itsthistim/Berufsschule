<section id="contact" class="contact">
    <div class="container">

        <div class="section-title">
            <h2>Articles</h2>
            <h3><span>Update</span> an article</h3>
            <p>Sometimes, finding the right words for something and structuring the article all comes naturally, and
                sometimes just nothing comes to mind.</p>
        </div>

        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-6 mt-4 mt-md-0">

                <form action="cms_article_update.php?id=<?=$updatearticle->id?>" method="post" class="php-email-form">
                    <input type="hidden" name="article_id" value="<?=$updatearticle->id?>"></input>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <input type="text" class="form-control" name="title" id="title" placeholder="Title"
                                value="<?=$updatearticle->title?>" required>
                        </div>
                        <div class="col-md-6 form-group mt-3 mt-md-0">
                            <input type="text" class="form-control" name="slug" id="slug" placeholder="Slug"
                                value="<?=$updatearticle->slug?>" required>
                        </div>
                    </div>

                    <div class="form-group mt-3">
                        <input type="text" class="form-control" name="description" id="description"
                            placeholder="Description" value="<?=$updatearticle->description?>" required>
                    </div>

                    <div class="form-group mt-3">
                        <textarea class="form-control" name="body" rows="5" placeholder="Body"
                            required><?=$updatearticle->body?></textarea>
                    </div>

                    <div class="form-group mt-3">
                        <input type="text" class="form-control" name="image" id="image" placeholder="Image"
                            value="<?=$updatearticle->image?>">
                    </div>

                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="published" name="published"
                            value="<?=$updatearticle->published ? 'checked' : ''?>" style="height: 15px;"> Published
                    </div>

                    <h5>Tags</h5>
                    <div class="form-group form-check">
                        <?php
                        $tags = Tag::getTags();
                        $articleTags = Tag::getTagsByArticle($updatearticle->id);

                            foreach ($tags as $tag) {
                                $checked = '';
                                foreach ($articleTags as $articleTag) {
                                    if ($articleTag->id == $tag->id) {
                                        $checked = 'checked';
                                        break;
                                    }
                                }
                                echo '<input type="checkbox" style="height: 15px;" class="form-check-input" id="tag_' . $tag->id . '" name="tags[]" value="' . $tag->id . '" ' . $checked . '> ' . $tag->title . '<br>';
                            }
                        ?>
                    </div>

                    <br>
                    <div class="row">
                        <div class="col-md-3 form-group mt-3 mt-md-0"></div>
                        <div class="col-md-3 form-group mt-3 mt-md-0">
                            <div class="text-center"><button name="update" type="submit" value="Update Article">Update</button></div>
                        </div>
                        <div class="col-md-3 form-group mt-3 mt-md-0">
                            <div class="text-center"><button name="delete" type="submit" value="Delete Article">Delete</button></div>
                        </div>
                        <div class="col-md-3 form-group mt-3 mt-md-0"></div>
                    </div>
                </form>
            </div>
            <?php
            if (isset($_POST['update'])) {
                if ($_POST['title'] != '' && $_POST['slug'] != '' && $_POST['description'] != '' && $_POST['body'] != '' && $_POST['tags'] != '') {
                    
                    
                    $newArticle = new Article($_POST['article_id'], $_SESSION['project_id'], $_SESSION['user_id'], $_POST['title'], $_POST['slug'], $_POST['description'], $_POST['body'], $_POST['image'], isset($_POST['published']) ? 1 : 0, date("Y-m-d H:i:s"), date("Y-m-d H:i:s"));
                    $success;
                    
                    try {
                        $newArticle->update();
                        $success = true;
                    }
                    catch (PDOException $th) {
                        $success = false;
                        echo $th;
                    }

                    try {
                        $newArticle->updateTags($_POST['tags']);
                        $success = true;
                    } catch (PDOException $th) {
                        $success = false;
                        echo $th;
                    }

                    if ($success) {
                        echo "<script>window.location.href = './cms_articles_list.php';</script>";
                    }
                }
            }
            if (isset($_POST['delete'])) {
                $updatearticle->delete();
                echo "<script>window.location.href = './cms_articles_list.php';</script>";
            }
            ?>
        </div>
    </div>

    </div>
</section>

<!-- 
    if (isset($_POST['update'])) {
                if ($_POST['title'] != '' && $_POST['slug'] != '' && $_POST['description'] != '' && $_POST['body'] != '' && $_POST['tags'] != '') { 
                    $newArticle = new Article($article->id, $_SESSION['project_id'], $_SESSION['user_id'], $_POST['title'], $_POST['slug'], $_POST['description'], $_POST['body'], $_POST['image'], isset($_POST['published']) ? 1 : 0, date("Y-m-d H:i:s"), date("Y-m-d H:i:s"));
                    $success;
                    
                    try {
                        $newArticle->update();
                        $success = true;
                    }
                    catch (PDOException $th) {
                        $success = false;
                        echo $th;
                    }

                    try {
                        $newArticle->updateTags($_POST['tags']);
                        $success = true;
                    } catch (PDOException $th) {
                        $success = false;
                        echo $th;
                    }

                    if ($success) {
                        echo "<script>window.location.href = './cms_articles_list.php';</script>";
                    }
                }
            }
            if (isset($_POST['delete'])) {
                try {
                    $article->delete();
                    echo "<script>window.location.href = './cms_articles_list.php';</script>";
                } catch (Exception $th) {
                    echo $th;;
                }
            }
 -->