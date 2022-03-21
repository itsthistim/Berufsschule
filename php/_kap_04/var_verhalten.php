<?php
$test = "10";
echo $test . " (" . getType($test) . ")<br>";

$test = $test * 2; // Integer (20)
echo $test . " (" . gettype($test) . ")<br>";

$test = $test + 1.75; // Fließkommazahl (21.75)
echo $test . " (" . gettype($test) . ")<br>";

$test = 5 + "10 Tassen Tee"; // Integer (15)
echo $test . " (" . gettype($test) . ")<br>";

$test = $test + "Kaffeetassen: 530"; // Integer (bleibt 15)
echo $test . " (" . gettype($test) . ")<br>";