<?php
$a = 7;
$b = "30 Euro";
$c = "!";

echo 'echo $a . $b . $c;' . "<br>";
echo $a . $b . $c . "<br><br>";

echo 'echo ""Text"";' . "<br>";
echo 'syntax error, unexpected \'Text\'' . "<br><br>";

echo 'echo "Text" . $a;' . "<br>";
echo "Text" . $a . '<br><br>';

echo 'echo "Text" $a . $b;' . "<br>";
echo 'syntax error, unexpected \'$a\'' . '<br><br>';

echo 'echo $a + $b + $c;' . "<br>";
echo $a + $b + $c . '<br><br>';

echo 'echo $a * $b / $c;' . "<br>";
echo $a * $b / $c . '<br><br>';

echo 'echo (\'<strong>\'Text\'</strong>\' . $a ." Text " . $b);' . "<br>";
echo ('<strong>\'Text\'</strong>' . $a ." Text " . $b) . '<br><br>';