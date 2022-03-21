<?php
$bezeichnung_tisch = "Schreibtisch";
$bezeichnung_stuhl = "Bürostuhl";
$bezeichnung_lampe = "Lampe";
$bezeichnung_pctisch = "Computertisch";

const EURO = 'Euro';
$preis_tisch = 1999.00;
$preis_stuhl = 589.00;
$preis_lampe = 29.00;
$preis_pctisch = 999.00;

$netto_gesamt = $preis_tisch + $preis_stuhl + $preis_lampe + $preis_pctisch;
const MWST = 1.19;

$brutto_gesamt = getBrutto($netto_gesamt, MWST);
$brutto_tisch = getBrutto($preis_tisch, MWST);
$brutto_stuhl = getBrutto($preis_stuhl, MWST);
$brutto_lampe = getBrutto($preis_lampe, MWST);
$brutto_pctisch = getBrutto($preis_pctisch, MWST);

function getBrutto($preis, $mwst)
{
    return $preis * $mwst;
}

?>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aufgabe 2</title>
</head>

<body>
    <h1>Mit Variablen, Operatorn und Konstanten arbeiten</h1>
    <p>Netto-Gesamtpreis der eingekauften Artikel: <?= $netto_gesamt . " " . EURO ?></p>
    <p>Brutto-Gesamtpreis der eingekauften Artikel: <?= $brutto_gesamt . " " . EURO ?></p>
    <hr>
    <p>Brutto-Preis <strong><?=$bezeichnung_tisch?></strong>: <?= $brutto_tisch . " " . EURO ?></p>
    <p>Brutto-Preis <strong><?=$bezeichnung_stuhl?></strong>: <?= $brutto_stuhl . " " . EURO ?></p>
    <p>Brutto-Preis <strong><?=$bezeichnung_lampe?></strong>: <?= $brutto_lampe . " " . EURO ?></p>
    <p>Brutto-Preis <strong><?=$bezeichnung_pctisch?></strong>: <?= $brutto_pctisch . " " . EURO ?></p>
</body>

</html>