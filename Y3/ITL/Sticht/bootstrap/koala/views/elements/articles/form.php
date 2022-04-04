<section id="contact" class="contact">
    <div class="container">

        <!-- <div class="section-title">
            <h2>Articles</h2>
            <h3><span>Add</span> an article</h3>
            <p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis est adipisci expedita at voluptas atque
                vitae autem.</p>
        </div> -->

        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-6 mt-4 mt-md-0">

                <form action="./form.php" method="post" role="form" class="php-email-form">
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
                        <textarea class="form-control" name="message" rows="5" placeholder="Body" required></textarea>
                    </div>

                    <div class="form-group mt-3">
                        <input type="text" class="form-control" name="image" id="image" placeholder="Image" required>
                    </div>

                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="published" style="height: 15px;">
                        <label class="form-check-label" for="published">Published</label>
                    </div>

                    <div class="text-center"><button type="submit">Send Message</button></div>
                </form>

            </div>
        </div>

    </div>
</section>