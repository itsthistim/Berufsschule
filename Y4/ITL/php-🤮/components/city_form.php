<?php $conn = include_once './modules/db.php';
include 'lib\functions.php';


if (isset($_POST['modal'])) {
    $city_name = $_POST['city_name'];
    ?>

    <div class="container">
        <div class="mx-auto">
            <form method="POST">
                <?php echo '<h2>Are you sure you want to insert ' . $city_name . '?</h2>'; ?>
                <div class="formbold-input-flex">

                    <input type="hidden" name="city_name" id="city_name" value="<?php echo $city_name; ?>" />

                    <button type="submit" name="cancel" value="cancel" class="formbold-btn"
                        style="height: 50px; margin-top: 35px;">Cancel</button>

                    <button type="submit" name="save" value="save" class="formbold-btn"
                        style="height: 50px; margin-top: 35px;">Save</button>
                </div>
            </form>
        </div>
    </div>


    <?php
} else if (isset($_POST['save'])) {

    $city_name = $_POST['city_name'];
    $sql_city = "INSERT INTO ort (ort_name) VALUES (?)";

    try {
        $stmt = $conn->prepare($sql_city);
        $stmt->execute([$city_name]);
        ?>
            <div class="container mx-auto">
                <div style="text-align: center;">
                    <h3>Saved <strong><?php echo $city_name; ?></strong> to the database.</h3>
                </div>
                <div style="margin: 50px 0px 50px 0px; text-align: center;">
                <?php makeTable("SELECT * FROM ort ORDER BY 1", $city_name); ?>
                </div>
            </div>
        <?php
    } catch (Exception $e) {
        ?>

            <div class="container mx-auto">
                <div style="text-align: center;">
                    <h3>Failed to save <strong><?php echo $city_name; ?></strong> to the database.</h3>
                </div>
                <div style="margin: 50px 0px 50px 0px; text-align: center;">
                <?php makeTable("SELECT * FROM ort ORDER BY 1"); ?>
                </div>
            </div>

        <?php
    }
} else {
    ?>
        <div class="formbold-main-wrapper">
            <div class="formbold-form-wrapper">

                <!-- <img src="your-image-url-here.jpg"> -->

                <form method="POST">
                    <div class="formbold-form-title">
                        <h2 class="">New City</h2>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
                            eiusmod tempor incididunt.
                        </p>
                    </div>

                    <div class="formbold-input-flex">
                        <div>
                            <label for="city_name" class="formbold-form-label">City name</label>
                            <input type="text" name="city_name" id="city_name" class="formbold-form-input" />
                        </div>
                        <button type="submit" name="modal" value="modal" class="formbold-btn"
                            style="height: 50px; margin-top: 35px;">Save</button>
                    </div>
                </form>

                <?php
                makeTable("SELECT * FROM ort ORDER BY 1");
                ?>

            </div>
        </div>
    <?php
}
?>