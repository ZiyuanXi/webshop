<?php

if (!isset($_SESSION["ID"])&&$_SESSION["STATUS"] !="ACTIEF") {
    echo "<script>
    alert('U heeft geen toegang tot deze pagina.');
    location.href='../index.php';
    </scirpt>";
}
unset($_SESSION["ID"]);
unset($_SESSION["USER_ID"]);
unset($_SESSION["USER_NAAM"]);
unset($_SESSION["STATUS"]);
unset($_SESSION["E-MAIL"]);
unset($_SESSION["ROL"]);

//Session canclet
session_destroy();

//Database connection canclet
$verbingding = null;
echo "<script> location.href='" . $_SERVER["PHP_SELF"]. "'</script>";

?>