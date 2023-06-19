<!-- 
    Tim Hofmann
    13.06.2023
    Rezeptverwaltung
 -->

<?php
include 'lib\functions.php';
$conn = include_once './modules/db.php';

$rezept_name = null;
$zutatenByName_sql = null;
$zutatenById_sql = null;
$rezepte = null;
$schritte_sql = null;

$schrittZutatenByZubId_sql = "SELECT zubeh.menge AS `Menge`, e.name AS `Einheit`, zut.name AS `Zutat`
    FROM zubereitung z,
         zubereitung_einheit zubeh,
         zutat_einheit zuteh,
         zutat zut,
         einheit e
   WHERE z.id = zubeh.zubereitung_id
     AND zubeh.zutat_einheit_id = zuteh.id
     AND zuteh.zutat_id = zut.id
     AND zuteh.einheit_id = e.id
     AND z.id = ?;";

$schritte = null;

if (isset($_POST['save'])) {

    $rezept_name = $_POST['rezept_name'];

    // Zubereitungs-Schritte aus der Datenbank holen
    $schritte_sql = "SELECT z.id AS `Zubereitung-ID`, z.beschreibung AS `Zubereitung`, z.bereitgestellt AS `Bereitgestellt`
    FROM zubereitung z,
         rezeptname r
   WHERE z.rezept_id = r.id
     AND r.name LIKE ?;";

    $schritte = $conn->prepare($schritte_sql);
    $schritte->execute(['%' . $rezept_name . '%']);
    $schritte = $schritte->fetchAll(PDO::FETCH_ASSOC);

    // alle Rezepte mit dem Namen aus der Datenbank holen
    $rezepte_sql = "SELECT *
                      FROM rezeptname
                     WHERE name LIKE ?;";

    $rezepte = $conn->prepare($rezepte_sql);
    $rezepte->execute(['%' . $rezept_name . '%']);

    $rezepte = $rezepte->fetchAll(PDO::FETCH_ASSOC);

    // alle Rezepte mit dem Namen aus der Datenbank holen
    $rezepte_sql = "SELECT *
                      FROM rezeptname
                     WHERE name LIKE ?;";

    $rezepte = $conn->prepare($rezepte_sql);
    $rezepte->execute(['%' . $rezept_name . '%']);

    $rezepte = $rezepte->fetchAll(PDO::FETCH_ASSOC);
}

?>

<div class="formbold-main-wrapper">
    <div class="formbold-form-wrapper">

        <form method="POST">
            <div class="formbold-form-title">
                <h2 class="">Rezeptsuche</h2>
                <p>
                    Geben Sie den Namen eines Rezepts ein, um danach zu suchen und die Zutaten einsehen zu können.
                </p>
            </div>

            <div class="formbold-input-flex">
                <div>
                    <label for="rezept_name" class="formbold-form-label">Rezeptname</label>
                    <input type="text" name="rezept_name" id="rezept_name" class="formbold-form-input" />
                </div>
                <button type="submit" name="save" id="save" class="formbold-btn"
                    style="height: 50px; margin-top: 35px;">Suche</button>
            </div>
        </form>

        <div class="mx-auto">
            <?php
            if ($rezept_name && $rezepte && count($rezepte) > 1) {
                echo "Es wurden " . count($rezepte) . " Rezepte gefunden.";
                echo "Wählen Sie ein Rezept aus, um die Zutaten einzusehen.";
                ?>
                <br>
                <form method="POST">
                    <div class="formbold-input-flex">
                        <div>
                            <select name="rezept_id" id="rezept_id" class="formbold-form-input">
                                <?php
                                foreach ($rezepte as $rezept) {
                                    echo "<option value='" . $rezept['id'] . "'>" . $rezept['name'] . "</option>";
                                }
                                ?>
                            </select>
                        </div>
                        <button type="submit" name="choose" id="choose" class="formbold-btn"
                            style="height: 50px; margin-top: 35px;">Anzeigen</button>
                    </div>
                </form>
                <?php
            } else if ( /*$rezept_name && */$rezepte && count($rezepte) == 1) {
                foreach ($schritte as $schritt) {
                    echo $schritt['Zubereitung'] . "<br>";
                    makeTable($schrittZutatenByZubId_sql, [$schritt['Zubereitung-ID']]);
                }
            } else if ( /*$rezept_name && */$rezepte && count($rezepte) == 0) {
                echo "Es wurde kein Rezept gefunden.";
            }
            if (isset($_POST['choose'])) {
                $rezept_id = $_POST['rezept_id'];

                echo $rezept_id;

                // Zubereitungs-Schritte aus der Datenbank holen
                $schritte_sql = "SELECT z.id AS `Zubereitung-ID`, z.beschreibung AS `Zubereitung`, z.bereitgestellt AS `Bereitgestellt`
                FROM zubereitung z,
                     rezeptname r
                WHERE z.rezept_id = r.id
                    AND r.id = ?;";

                $schritte = $conn->prepare($schritte_sql);
                $schritte->execute([$rezept_id]);
                $schritte = $schritte->fetchAll(PDO::FETCH_ASSOC);

                foreach ($schritte as $schritt) {
                    echo $schritt['Zubereitung'] . "<br>";
                    makeTable($schrittZutatenByZubId_sql, [$schritt['Zubereitung-ID']]);
                }
            }
            ?>
        </div>
    </div>
</div>