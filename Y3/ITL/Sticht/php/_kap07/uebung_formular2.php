<!DOCTYPE html>
<html lang="en">

<head>
    <title>Übung (Kapitel 7)</title>
</head>

<body>
    <h1>Bewerbung, Newsletter oder Infomaterial</h1>
    <p>Bitte nennen Sie uns Ihr Anliegen:</p>
    <form action="./uebung_formular2.php" method="post">

        <?php
        $anrede = isset($_POST["anrede"]) ? $_POST["anrede"] : '';
        $firstname = isset($_POST["firstname"]) ? $_POST["firstname"] : '';
        $lastname = isset($_POST["lastname"]) ? $_POST["lastname"] : '';
        $mail = isset($_POST["email"]) ? $_POST["email"] : '';
        ?>

        <p>Anrede
            <input type="radio" name="anrede" value="Herr" <?= $anrede == "Herr" ? 'checked' : '' ?>> Herr
            <input type="radio" name="anrede" value="Frau" <?= $anrede == "Frau" ? 'checked' : '' ?>> Frau
        </p>

        <p>Vorname: <input type="text" name="firstname" <?= $firstname ? "value=$firstname" : '' ?>></p>
        <p>Nachname: <input type="text" name="lastname" <?= $lastname ? "value=$lastname" : '' ?>></p>
        <p>Mailadresse: <input type="text" name="email" <?= $mail ? "value=$mail" : '' ?>></p>
        
        <p>
            <input type="submit" name="bewerben" value="bei Ihnen bewerben">
            <input type="submit" name="abo" value="Newsletter abonnieren">
            <input type="submit" name="anfordern" value="Infomaterial anfordern">
        </p>
    </form>
</body>

</html>