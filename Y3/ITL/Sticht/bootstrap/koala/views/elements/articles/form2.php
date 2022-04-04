<?php
// include "models/Tag.php";
?>
<section id="contact" class="contact section-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-6 mt-4 mt-md-0">
                <form action="cms_articles_add.php" method="post" role="form" class="php-email-form">
                    <div class="col-mt-3">
                        <input type="text" class="form-control" name="article_title" id="article_title" placeholder="Titel" required>
                    </div>
                    <div class="form-group mt-3">
                        <input type="text" class="form-control" name="article_slug" id="article_slug" placeholder="Slug">
                    </div>
                    <div class="form-group mt-3">
                        <textarea class="form-control" name="article_body" rows="5" placeholder="Body"></textarea>
                    </div>
                    <div class="form-group mt-3">
                        <input type="checkbox" name="article_published"> Publish
                    </div>
                    <div class="form-group mt-3">
                        <?php
                            //$tags = Tag::getTags();
                            //while($tag = $tags)
                            //{
                        ?>
                        <input type="checkbox" name="tag_<?='$tag[\'title\']'?>"><?='$tag[\'title\']'?>
                        <input type="checkbox" name="tag_<?='$tag[\'title\']'?>"><?='$tag[\'title\']'?>
                        <input type="checkbox" name="tag_<?='$tag[\'title\']'?>"><?='$tag[\'title\']'?>
                        <?php
                        //}
                        ?>
                    </div>
                    
                    <div class="text-center"><button type="submit" name="insert_article">Insert Article</button></div>
                </form>
            </div>
        </div>
    </div>
</section>

<section id="contact" class="contact">
    <div class="container">

        <!-- <div class="section-title">
            <h2>Articles</h2>
            <h3><span>Add</span> an article</h3>
            <p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis est adipisci expedita at voluptas atque
                vitae autem.</p>
        </div> -->