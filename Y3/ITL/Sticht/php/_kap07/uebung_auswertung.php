<!DOCTYPE html>
<html lang="en">

<head>
    <title>Übung (Kapitel 7)</title>
</head>

<body>
    <h1>Auswertung des Formulars</h1>
    <p>Vielen Dank für die Teilnahme an userer Umfrage. Sie haben folgende Daten übermittelt:</p>
    <?php

    $firstname = $_POST["firstname"];
    $lastname = $_POST["lastname"];
    $address = $_POST["address"];
    $home = $_POST["home"];
    $tvshow = $_POST["tvshow"];
    $nachricht = $_POST["nachricht"] ? $_POST["nachricht"] : "keine";

    echo "<p>Vorname: $firstname" . "<br>";
    echo "Nachname: $lastname" . "<br>";
    echo "Wohnort: $address" . "<br>";
    echo "Wohnart: $home" . "<br>";
    echo "Beliebte TV-Sendungen: " . implode(", ", $_POST["tvshow"]) . "<br>";
    echo "Nachricht: <span style=\"font-style: italic\">$nachricht</span>" . "<br></p>";
    ?>
</body>

</html>