<?php

if (!isset($_SESSION["ID"])&&$_SESSION["STATUS"] !="ACTIEF") {
    echo "<script>
    alert('U heeft geen toegang tot deze pagina.');
    location.href='../index.php';
    </scirpt>";
}

?>
<!--This is a search engine-->
<script src="js/webshop.js"></script>
<div class="content">
    <form name="search" id="search" action="" method="POST">
        <div style="background-color: #C2F98E; height: 25px; margin-top: 5%; padding:0;">
            <input type="text" style="float: left; width: 70%;" id="patroon" name="patroon" placeholder="Zoek albums"/>
            <input type="submit" style="float: none; width: 10%; font-size: 1.2rem;" id="zoeken" name="zoeken" value="&#128270"/><br>
        </div>
    </form>
</div>
<?php

//Here will the action be create
if (isset($_POST["zoeken"])&& !empty($_POST["patroon"])) {
    $patroon = htmlspecialchars($_POST["patroon"]);
    $sql = "SELECT * FROM album WHERE titel LIKE '%$patroon%' || artiest LIKE '%$patroon%' || genre LIKE '%$patroon%'";
}else{
    $sql = "SELECT * FROM album LIMIT 3";
}
?>

<div class="content">
    <form name="webshop" id="webshop" action="index.php?page=bestellen" method="POST">
        <?php
        $stmt = $verbinding->prepare($sql);
        $stmt->execute();
        $albums = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $lus = 0;
        foreach($albums as $album){
            echo "<img width '100px' src='img/" . $album['cover']. "'/>";
            echo "<input type='hidden' name= 'id[$lus]' id= 'id[$lus]' value= '" . $album['ID'] . "'/>";
            echo "<input type='hidden' name= 'titel[$lus]' id= 'titel[$lus]' value= '" . $album['titel'] . "'/>";
            echo "<input type='hidden' name= 'artiest[$lus]' id= 'artiest[$lus]' value= '" . $album['artiest'] . "'/>";
            echo "<input type='hidden' name= 'genre[$lus]' id= 'genre[$lus]' value= '" . $album['genre'] . "'/>";
            echo "<input type='hidden' name= 'prijs[$lus]' id= 'prijs[$lus]' value= '" . $album['prijs'] . "'/>";
            echo "<br> Titel: " . $album["titel"] . " prijs: " . $album["prijs"];
            echo "<br> Vooraad: " . $album["voorraad"];
            echo "<br> Aantal: ";
            echo "<input class='aantal' type='text' style='width 10%;' name='aantal[$lus]' id='aantal[$lus]' value='0' />";
            $lus++;
        }
        echo "<input type='hidden' name='lus' id='lus' value='".$lus."'/>";
        ?>
    </form>
</div>