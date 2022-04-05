<?php

if (!isset($_SESSION["ID"])&&$_SESSION["STATUS"] !="ACTIEF") {
    echo "<script>
    alert('U heeft geen toegang tot deze pagina.');
    location.href='../index.php';
    </scirpt>";
}

if (isset($_POST['submit'])) { //copy from regisreren.php
    $id = htmlspecialchars($_POST['id']);
    $voornaam = htmlspecialchars($_POST['voornaam']);
    $achternaam = htmlspecialchars($_POST['achternaam']);
    $straat = htmlspecialchars($_POST['straat']);
    $postcode = htmlspecialchars($_POST['postcode']);
    $woonplaats = htmlspecialchars($_POST['woonplaats']);
    $email = htmlspecialchars($_POST['e-mail']);
    $query = "UPDATE klant SET voornaam = ?, achternaam = ?, straat = ?, postcode = ?, woonplaats = ?, email = ? WHERE ID = ?";
    $stmt = $verbinding->prepare($query);
    try {
        $stmt = $stmt->execute(array(
            $voornaam, 
            $achternaam,
            $straat,
            $postcode,
            $woonplaats,
            $email,
            $id
            ));
        if ($stmt) {
            echo "<script>alert('Profiel is geupdate');
                    location.href='index.php?page=webshop';</script>";
        }else{
            echo "<script>alert('Kan geen profiel updaten');
                    location.href='index.php?page=webshop';</script>";
        }
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
}
?>