<?php $conn = include_once './modules/db.php';

if (isset($_POST['save'])) {
    $current_street_id = $_POST['current_street'];
    $new_street = $_POST['street_name'];

    $sql_update_street = 'UPDATE strasse SET str_name = ? WHERE str_id = ?';

    try {
        // update street
        $stmt = $conn->prepare($sql_update_street);
        $stmt->execute([$new_street, $current_street_id]);

        echo '<br /><br /><br /><br /><div class="alert alert-success" role="alert">
        <h4 class="alert-heading">Well done!</h4>
        <p>You successfully updated the street.</p>
        </div>';
    } catch (Exception $e) {
        echo "Error - Tabelle Adressen: " . $e->getCode() . $e->getMessage();
    }
} else {
    ?>

    <div class="formbold-main-wrapper">
        <div class="formbold-form-wrapper">

            <!-- <img src="your-image-url-here.jpg"> -->

            <form method="POST">
                <div class="formbold-form-title">
                    <h2 class="">Update Address</h2>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
                        eiusmod tempor incididunt.
                    </p>
                </div>

                <div class="formbold-input-flex">
                    <div>
                        <label for="current_street" class="formbold-form-label">Street to update</label>
                        <?php
                        $sql = 'SELECT str_id, str_name as "Street" from strasse;';
                        $stmt = $conn->prepare($sql);
                        $stmt->execute();

                        echo '<select name="current_street" id="current_street" class="formbold-form-input">';
                        echo '<option value="" disabled selected>Select street</option>';
                        while ($row = $stmt->fetch(PDO::FETCH_NUM)) {
                            echo '<option value="' . $row[0] . '">' . $row[1];
                        }
                        echo '</select>';
                        ?>
                    </div>

                    <div>
                        <label for="street_name" class="formbold-form-label">New street name</label>
                        <input type="text" name="street_name" id="street_name" class="formbold-form-input" />
                    </div>

                </div>




                <!--
            <div class="formbold-input-flex">
                <div>
                    <label for="country" class="formbold-form-label"> Country </label>
                    <select name="country" id="country" class="formbold-form-input">
                        <option value="" disabled selected>Select your country</option>
                        <option value="AT">Austria</option>
                        <option value="DE">Germany</option>
                        <option value="CH">Switzerland</option>
                        <option value="LU">Luxembourg</option>
                    </select>
                </div>
                <div>
                    <label for="education" class="formbold-form-label"> Education </label>
                    <select name="education" id="education" class="formbold-form-input">
                        <option value="" disabled selected>Select your education</option>
                        <option value="highschool">High School</option>
                        <option value="bachelors">Bachelors</option>
                        <option value="masters">Masters</option>
                        <option value="phd">PhD</option>
                    </select>
                </div> 
            </div> -->

                <!-- <div class="formbold-mb-3">
                <label for="address2" class="formbold-form-label">
                    Which of the following books did you enjoy most?<br>
                    <input type="radio" name="book" value="harrypotter" id="harrypotter"
                        style="margin-right: 10px;" /><label for="harrypotter"> Harry Potter</label><br>
                    <input type="radio" name="book" value="pjackson" id="pjackson" style="margin-right: 10px;" /><label
                        for="pjackson"> Percy Jackson</label><br>
                    <input type="radio" name="book" value="lotr" id="lotr" style="margin-right: 10px;" /><label
                        for="lotr"> Lord of the Rings</label><br>
                    <input type="radio" name="book" value="none" id="none" style="margin-right: 10px;" /><label
                        for="none"> None of the above</label>
                </label>
            </div>

            <div class="formbold-checkbox-wrapper">
                <label for="supportCheckbox" class="formbold-checkbox-label">
                    <div class="formbold-relative">
                        <input type="checkbox" id="supportCheckbox" class="formbold-input-checkbox" />
                        <div class="formbold-checkbox-inner">
                            <span class="formbold-opacity-0">
                                <svg width="11" height="8" viewBox="0 0 11 8" fill="none"
                                    class="formbold-stroke-current">
                                    <path
                                        d="M10.0915 0.951972L10.0867 0.946075L10.0813 0.940568C9.90076 0.753564 9.61034 0.753146 9.42927 0.939309L4.16201 6.22962L1.58507 3.63469C1.40401 3.44841 1.11351 3.44879 0.932892 3.63584C0.755703 3.81933 0.755703 4.10875 0.932892 4.29224L0.932878 4.29225L0.934851 4.29424L3.58046 6.95832C3.73676 7.11955 3.94983 7.2 4.1473 7.2C4.36196 7.2 4.55963 7.11773 4.71406 6.9584L10.0468 1.60234C10.2436 1.4199 10.2421 1.1339 10.0915 0.951972ZM4.2327 6.30081L4.2317 6.2998C4.23206 6.30015 4.23237 6.30049 4.23269 6.30082L4.2327 6.30081Z"
                                        stroke-width="0.4"></path>
                                </svg>
                            </span>
                        </div>
                    </div>
                    I want to sign up to the newsletter.
                </label>
            </div> -->

                <button type="submit" name="save" value="save" class="formbold-btn">Save</button>
            </form>
        </div>
    </div>

    <?php
}
?>