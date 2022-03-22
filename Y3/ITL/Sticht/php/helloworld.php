<?php
$var = 'Hello World!';
$arr = ['Headline1', 'Headline2', 'Headline3']
?>
<html>

<body>
    <h1><?= $var ?></h1>

    <?php foreach ($arr as $value) { ?>
        <p><?= $value ?></p>
    <?php } ?>
</body>

</html>