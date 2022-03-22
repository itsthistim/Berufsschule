<?php
/*
 Peter hat zu Hause noch amerikanische Dollar (USD) gefunden.
 Welchen Wert (in Euro) hat sein Fund?
*/

$dollar = 1240.45;
$kurs = 1.25; // Umrechnungskurs Dollar-Euro
$bezeichnung_dollar = "US Dollar (USD)";
$bezeichnung_euro = "EURO";

$euro = $dollar / $kurs;
$ausgabe = "<p>Peter sagt: 'Meine " . $dollar . " " . $bezeichnung_dollar;
$ausgabe .= " sind " . $euro . " " . $bezeichnung_euro . " wert.'</p>";
echo $ausgabe;
echo "<p>Peter sagt: 'Meine $dollar $bezeichnung_dollar sind $euro $bezeichnung_euro wert.'</p>";
echo '<p>Peter sagt: \'Meine $dollar $bezeichnung_dollar sind $euro $bezeichnung_euro wert.\'</p>';
