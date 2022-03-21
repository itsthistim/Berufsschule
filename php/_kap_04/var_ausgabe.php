<?php
$stadt = "Göttingen";
$uni = "Georg-August-Universität";
$jahr = 1736;
$heute = 2016;

// Wert der Variablen werden angezeigt
echo "<p>$jahr wurde die $uni in $stadt gegründet.</p>";

// Name der Variablen werden angezeigt
echo '<p>$jahr wurde die $uni in $stadt gegründet.</p>';

// Ausgabe von Berechnungen mit Variablen sowie Zeichenketten
echo "<p>Die Gründung der $uni in $stadt erfolgte vor " . ($heute - $jahr) . " Jahren.</p>";
