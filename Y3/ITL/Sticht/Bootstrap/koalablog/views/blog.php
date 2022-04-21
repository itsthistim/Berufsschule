<?php
session_start();

require_once "../models/db.php";
require_once "../models/article.php";

if (!isset($_POST["page"])) {
	header("Location: ../index.php");
} else {
	$page = $_POST["page"];
	$article = Article::getBySlug($page); 
}
?>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title><?= $article->title ?></title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="../assets/img/favicon.png" rel="icon">
        <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    </head>

    <body>
        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top header-inner-pages">
            <div class="container d-flex align-items-center justify-content-between">

                <a href="index.php" class="logo"><img
                        src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/twitter/53/koala_1f428.png"
                        alt="" class="img-fluid"> koala</a>

                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a class="nav-link scrollto " href="#">Blog Entries</a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav>
                <!-- .navbar -->

            </div>
        </header>
        <!-- End Header -->

        <main id="main">

            <!-- ======= Breadcrumbs ======= -->
            <section id="breadcrumbs" class="breadcrumbs">
                <div class="container">

                    <ol>
                        <li><a href="index.php">Home</a></li>
                        <li>Blog Entries</li>
                    </ol>
                    <h2><?= $article->title ?></h2>

                </div>
            </section>
            <!-- End Breadcrumbs -->

            <!-- ======= Blog Single Section ======= -->
            <section id="blog" class="blog">
                <div class="container" data-aos="fade-up">

                    <div class="row">

                        <div class="col-lg-8 entries">

                            <article class="entry entry-single">

                                <!-- <div class="entry-img">
									<img src="../assets/img/blog/blog-1.jpg" alt="" clas  s="img-fluid">
								</div> -->

                                <!-- ======= Portfolio Details Section ======= -->
                                <section id="portfolio-details" class="portfolio-details">
                                    <div class="container">

                                        <div class="row gy-4">
                                            <div class="col-lg-12">
                                                <div class="portfolio-details-slider swiper">
                                                    <div class="swiper-wrapper align-items-center">

                                                        <div class="swiper-slide">
                                                            <img src="../assets/img/portfolio/portfolio-details-1.jpg"
                                                                alt="">
                                                        </div>

                                                        <div class="swiper-slide">
                                                            <img src="../assets/img/portfolio/portfolio-details-2.jpg"
                                                                alt="">
                                                        </div>

                                                        <div class="swiper-slide">
                                                            <img src="../assets/img/portfolio/portfolio-details-3.jpg"
                                                                alt="">
                                                        </div>

                                                    </div>
                                                    <div class="swiper-pagination"></div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </section>
                                <!-- End Portfolio Details Section -->

                                <h2 class="entry-title">
                                    <a href="blog.php">blog-title-long</a>
                                </h2>

                                <div class="entry-meta">
                                    <ul>
                                        <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a
                                                href="blog.php">blog-author-name</a></li>
                                        <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a
                                                href="blog.php"><time datetime="blog-date">blog-date</time></a></li>
                                        <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a
                                                href="blog.php">0 Comments</a></li>
                                    </ul>
                                </div>

                                <div class="entry-content">
                                    <p>
                                        Similique neque nam consequuntur ad non maxime aliquam quas. Quibusdam animi
                                        praesentium. Aliquam et
                                        laboriosam eius aut nostrum quidem aliquid dicta.
                                        Et eveniet enim. Qui velit est ea dolorem doloremque deleniti aperiam unde
                                        soluta. Est cum et quod
                                        quos aut ut et sit sunt. Voluptate porro consequatur assumenda perferendis
                                        dolore.
                                    </p>

                                    <blockquote>
                                        <p>
                                            Et vero doloremque tempore voluptatem ratione vel aut. Deleniti sunt animi
                                            aut. Aut eos aliquam
                                            doloribus minus autem quos.
                                        </p>
                                    </blockquote>

                                    <p>
                                        Sed quo laboriosam qui architecto. Occaecati repellendus omnis dicta inventore
                                        tempore provident
                                        voluptas mollitia aliquid. Id repellendus quia. Asperiores nihil magni dicta est
                                        suscipit
                                        perspiciatis. Voluptate ex rerum assumenda dolores nihil quaerat.
                                        Dolor porro tempora et quibusdam voluptas. Beatae aut at ad qui tempore corrupti
                                        velit quisquam
                                        rerum. Omnis dolorum exercitationem harum qui qui blanditiis neque.
                                        Iusto autem itaque. Repudiandae hic quae aspernatur ea neque qui. Architecto
                                        voluptatem magni. Vel
                                        magnam quod et tempora deleniti error rerum nihil tempora.
                                    </p>

                                    <h3>Et quae iure vel ut odit alias.</h3>
                                    <p>
                                        Officiis animi maxime nulla quo et harum eum quis a. Sit hic in qui quos fugit
                                        ut rerum atque. Optio
                                        provident dolores atque voluptatem rem excepturi molestiae qui. Voluptatem
                                        laborum omnis ullam
                                        quibusdam perspiciatis nulla nostrum. Voluptatum est libero eum nesciunt aliquid
                                        qui.
                                        Quia et suscipit non sequi. Maxime sed odit. Beatae nesciunt nesciunt accusamus
                                        quia aut ratione
                                        aspernatur dolor. Sint harum eveniet dicta exercitationem minima. Exercitationem
                                        omnis asperiores
                                        natus aperiam dolor consequatur id ex sed. Quibusdam rerum dolores sint
                                        consequatur quidem ea.
                                        Beatae minima sunt libero soluta sapiente in rem assumenda. Et qui odit
                                        voluptatem. Cum quibusdam
                                        voluptatem voluptatem accusamus mollitia aut atque aut.
                                    </p>
                                    <img src="../assets/img/blog/blog-inside-post.jpg" class="img-fluid" alt="">

                                    <h3>Ut repellat blanditiis est dolore sunt dolorum quae.</h3>
                                    <p>
                                        Rerum ea est assumenda pariatur quasi et quam. Facilis nam porro amet nostrum.
                                        In assumenda quia
                                        quae a id praesentium. Quos deleniti libero sed occaecati aut porro autem.
                                        Consectetur sed excepturi
                                        sint non placeat quia repellat incidunt labore. Autem facilis hic dolorum
                                        dolores vel.
                                        Consectetur quasi id et optio praesentium aut asperiores eaque aut. Explicabo
                                        omnis quibusdam esse.
                                        Ex libero illum iusto totam et ut aut blanditiis. Veritatis numquam ut illum ut
                                        a quam vitae.
                                    </p>
                                    <p>
                                        Alias quia non aliquid. Eos et ea velit. Voluptatem maxime enim omnis ipsa
                                        voluptas incidunt. Nulla
                                        sit eaque mollitia nisi asperiores est veniam.
                                    </p>

                                </div>

                                <div class="entry-footer">
                                    <i class="bi bi-folder"></i>
                                    <ul class="cats">
                                        <li><a href="#">project-name</a></li>
                                    </ul>

                                    <i class="bi bi-tags"></i>
                                    <ul class="tags">
                                        <li><a href="#">API</a></li>
                                        <li><a href="#">Commands</a></li>
                                        <li><a href="#">Categories</a></li>
                                    </ul>
                                </div>

                            </article>
                            <!-- End blog entry -->

                            <div class="blog-author d-flex align-items-center">
                                <img src="../assets/img/blog/blog-author.jpg" class="rounded-circle float-left" alt="">
                                <div>
                                    <h4>blog-author-name</h4>
                                    <div class="social-links">
                                        <a href="https://twitter.com/#"><i class="bi bi-twitter"></i></a>
                                        <a href="https://facebook.com/#"><i class="bi bi-facebook"></i></a>
                                        <a href="https://instagram.com/#"><i class="biu bi-instagram"></i></a>
                                    </div>
                                    <p>
                                        blog-author-bio
                                    </p>
                                </div>
                            </div>
                            <!-- End blog author bio -->

                            <!-- Start blog comments -->
                            <?php // include "./elements/blog/comments.php" ?>
                            <!-- End blog comments -->

                        </div>

                        <!-- Start blog sidebar -->
                        <div class="col-lg-4">

                            <div class="sidebar">

                                <h3 class="sidebar-title">About this post</h3>
                                <div class="sidebar-item categories">
                                    <p>
                                        Autem ipsum nam porro corporis rerum. Quis eos dolorem eos itaque inventore
                                        commodi labore quia
                                        quia.
                                        Exercitationem repudiandae officiis neque suscipit non officia eaque itaque
                                        enim. Voluptatem officia
                                        accusantium nesciunt est omnis tempora consectetur dignissimos. Sequi nulla at
                                        esse enim cum
                                        deserunt eius.
                                    </p>
                                </div>
                                <!-- End sidebar categories-->

                                <h3 class="sidebar-title">Search</h3>
                                <div class="sidebar-item search-form">
                                    <form action="">
                                        <input type="text">
                                        <button type="submit"><i class="bi bi-search"></i></button>
                                    </form>
                                </div>
                                <!-- End sidebar search formn-->

                                <h3 class="sidebar-title">Other Posts</h3>
                                <div class="sidebar-item recent-posts">

                                    <div class="post-item clearfix">
                                        <img src="../assets/img/blog/blog-recent-1.jpg" alt="">
                                        <h4><a href="blog.php">other-blog-1</a></h4>
                                        <time datetime="other-blog-1-date">other-blog-1-date</time>
                                    </div>

                                    <div class="post-item clearfix">
                                        <img src="../assets/img/blog/blog-recent-2.jpg" alt="">
                                        <h4><a href="blog.php">other-blog-2</a></h4>
                                        <time datetime="other-blog-2-date">other-blog-2-date</time>
                                    </div>

                                    <div class="post-item clearfix">
                                        <img src="../assets/img/blog/blog-recent-3.jpg" alt="">
                                        <h4><a href="blog.php">other-blog-3</a></h4>
                                        <time datetime="other-blog-3-date">other-blog-3-date</time>
                                    </div>

                                    <div class="post-item clearfix">
                                        <img src="../assets/img/blog/blog-recent-4.jpg" alt="">
                                        <h4><a href="blog.php">other-blog-4</a></h4>
                                        <time datetime="other-blog-4-date">other-blog-4-date</time>
                                    </div>

                                    <div class="post-item clearfix">
                                        <img src="../assets/img/blog/blog-recent-5.jpg" alt="">
                                        <h4><a href="blog.php">other-blog-5</a></h4>
                                        <time datetime="other-blog-5-date">other-blog-5-date</time>
                                    </div>

                                </div>
                                <!-- End sidebar recent posts-->

                                <h3 class="sidebar-title">Tags</h3>
                                <div class="sidebar-item tags">
                                    <ul>
                                        <li><a href="#">API</a></li>
                                        <li><a href="#">Commands</a></li>
                                        <li><a href="#">Categories</a></li>
                                    </ul>
                                </div>
                                <!-- End sidebar tags-->

                            </div>
                            <!-- End sidebar -->

                        </div>
                        <!-- End blog sidebar -->

                    </div>

                </div>
            </section>
            <!-- End Blog Single Section -->

        </main>
        <!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer">

            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 col-md-6 footer-contact">
                            <h3>koala</h3>
                            <p>
                                Wiener Straße 181 <br>
                                Linz, 4020<br>
                                Austria <br><br>
                                <strong>Phone:</strong> +43(0)732 7720 35800<br>
                                <strong>Email:</strong> bs-linz2.post@ooe.gv.at<br>
                            </p>
                        </div>

                        <div class="col-lg-2 col-md-6 footer-links">
                            <h4>Useful Links</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Categories</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Our Categories</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-4 col-md-6 footer-newsletter">
                            <h4>Join Our Newsletter</h4>
                            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
                            <form action="" method="post">
                                <input type="email" name="email"><input type="submit" value="Subscribe">
                            </form>
                        </div>

                    </div>
                </div>
            </div>

            <div class="container d-md-flex py-4">

                <div class="me-md-auto text-center text-md-start">
                    <div class="copyright">
                        &copy; Copyright <strong><span>koala</span></strong>. All Rights Reserved
                    </div>
                    <div class="credits">
                        <!-- All the links in the footer should remain intact. -->
                        <!-- You can delete the links only if you purchased the pro version. -->
                        <!-- Licensing information: https://bootstrapmade.com/license/ -->
                        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/tempo-free-onepage-bootstrap-theme/ -->
                        Designed by <a href="https://bootstrapmade.com/">BootstrapMade & Tim</a>
                    </div>
                </div>
                <div class="social-links text-center text-md-right pt-3 pt-md-0">
                    <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                    <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                    <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                    <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                    <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                </div>
            </div>
        </footer>
        <!-- End Footer -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

    </body>

</html>