<!-- 
    Tim Hofmann
    13.06.2023
    Rezeptverwaltung
 -->

<?php
$server = "localhost:3306";
$username = "root";
$password = "root";
$schema = "rezept";

// create connection
try {
    $conn = new PDO('mysql:host=' . $server . ';dbname=' . $schema . ';charset=utf8', $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
} catch (Exception $e) {
    echo "Connection failed (other): " . $e->getMessage();
}

// export connection
return $conn;
?>