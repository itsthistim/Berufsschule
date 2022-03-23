<?php
echo "<h1>Rechenergebnis</h1>";
if (isset($_POST["mal"])) {
    $ergebnis = $_POST["zahl1"] * $_POST["zahl2"];
    echo "<p>" . $_POST["zahl1"] . " mal " . $_POST["zahl2"] . " ist gleich $ergebnis.</p>";
}
if (isset($_POST["plus"])) {
    $ergebnis = $_POST["zahl1"] + $_POST["zahl2"];
    echo "<p>" . $_POST["zahl1"] . " plus " . $_POST["zahl2"] . " ist gleich $ergebnis.</p>";
}
