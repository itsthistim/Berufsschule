<!-- 
    Tim Hofmann
    13.06.2023
    Rezeptverwaltung
 -->

<?php
include 'lib\functions.php';
$conn = include_once './modules/db.php';
?>

<div class="formbold-main-wrapper">
    <div class="formbold-form-wrapper">

        <form method="POST">
            <div class="formbold-form-title">
                <h2 class="">Nach Datum suchen</h2>
                <p>
                    Wählen Sie eine Zeitspanne aus, um Rezepte zu finden, die in dieser Zeit veröffentlicht wurden.
                </p>
            </div>

            <div class="formbold-input-flex">
                <div>
                    <label for="von" class="formbold-form-label">Von</label>
                    <input type="date" id="von" name="von" class="formbold-form-input" required>
                </div>
                <div>
                    <label for="bis" class="formbold-form-label">Bis</label>
                    <input type="date" id="bis" name="bis" class="formbold-form-input">
                </div>
            </div>

            <button type="submit" name="search_date" id="search_date" class="formbold-btn"
                style="height: 50px; margin-top: 0px;">Suche</button>
        </form>

        <hr>

        <!-- ODER, wählen Sie aus diesen vorgefertigten Zeitfiltern: -->
        <!-- DROPDOWN -->
        <!-- letzter Monat -->
        <!-- laufender Monat -->
        <!-- <input> Monat des laufenden Jahres -->

        <form method="POST">
            <div class="formbold-form-title">
                <h2 class="">Mit Zeitspanne suchen</h2>
                <p>
                    Wählen Sie eine von uns vorgefertigten Zeitfilter aus, um Rezepte zu finden, die in dieser Zeit
                    veröffentlicht wurden.
                </p>
            </div>

            <div class="formbold-input-flex">
                <div>
                    <input type="radio" id="letzter_monat" name="zeitfilter" value="letzter_monat">
                    <label for="letzter_monat">Letzter Monat</label><br>
                    <input type="radio" id="laufender_monat" name="zeitfilter" value="laufender_monat">
                    <label for="laufender_monat">Laufender Monat</label><br>

                    <div class="d-flex" style="width: 500px">
                        <div>
                            <input type="radio" id="monat_des_jahres" name="zeitfilter" value="monat_des_jahres">
                        </div>
                        <div>
                            <input type="number" id="monat_des_jahres_input" name="monat_des_jahres" min="1" max="12">
                        </div>
                        <div>
                            <label for="monat_des_jahres">. Monat des laufenden Jahres</label><br>
                        </div>
                    </div>

                </div>
            </div>

            <button type="submit" name="search_filter" id="search_filter" class="formbold-btn"
                style="height: 50px; margin-top: 0px;">Suche</button>
        </form>



        <div class="mx-auto">
            <?php
            if (isset($_POST['zeitfilter'])) {
                $zeitfilter = $_POST['zeitfilter'];
                $sql = null;

                switch ($zeitfilter) {
                    case 'letzter_monat':
                        echo "Rezepte des letzten Monats<br>";
                        $sql = "SELECT r.name AS `Rezept`, z.bereitgestellt AS `Bereitgestellt` FROM rezeptname r, zubereitung z WHERE r.id = z.rezept_id AND z.bereitgestellt BETWEEN DATE_SUB(NOW(), INTERVAL 1 MONTH) AND NOW();";
                        makeTable($sql);
                        break;

                    case 'laufender_monat':
                        echo "Rezepte des laufenden Monats<br>";
                        $sql = "SELECT r.name AS `Rezept`, z.bereitgestellt AS `Bereitgestellt` FROM rezeptname r, zubereitung z WHERE r.id = z.rezept_id AND MONTH(z.bereitgestellt) = MONTH(NOW()) AND YEAR(z.bereitgestellt) = YEAR(NOW());";
                        makeTable($sql);
                        break;

                    case 'monat_des_jahres':
                        $monat_des_jahres = $_POST['monat_des_jahres'];
                        echo "Rezepte des " . $monat_des_jahres . ". Monats des laufenden Jahres<br>";
                        $sql = "SELECT r.name AS `Rezept`, z.bereitgestellt AS `Bereitgestellt` FROM rezeptname r, zubereitung z WHERE r.id = z.rezept_id AND MONTH(z.bereitgestellt) = ? AND YEAR(z.bereitgestellt) = YEAR(NOW());";
                        makeTable($sql, [$monat_des_jahres]);
                        break;

                    default:
                        echo "Kein Zeitfilter ausgewählt";
                }
            }


            if (isset($_POST['search_date'])) {
                $von = $_POST['von'];
                $bis = $_POST['bis'];
                $sql = null;

                if ($bis) {
                    echo "Rezepte von " . $von . " bis " . $bis . "<br>";
                    $sql = "SELECT r.name AS `Rezept`, z.bereitgestellt AS `Bereitgestellt` FROM rezeptname r, zubereitung z WHERE r.id = z.rezept_id AND DATE(z.bereitgestellt) BETWEEN ? AND ?;";
                    makeTable($sql, [$von, $bis]);
                } else {
                    echo "Rezepte von " . $von . " bis " . date("Y-m-d") . "<br>";
                    $sql = "SELECT r.name AS `Rezept`, z.bereitgestellt AS `Bereitgestellt` FROM rezeptname r, zubereitung z WHERE r.id = z.rezept_id AND DATE(z.bereitgestellt) BETWEEN ? AND NOW();";
                    makeTable($sql, [$von]);
                }
            }
            ?>
        </div>
    </div>
</div>