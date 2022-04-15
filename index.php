<?php

session_start();
$_SESSION["STATUS"] = "INACTIEF";
include_once("DBconfig.php");
//$db = new Database();
include_once("header.html");
if (isset($_GET["page"])) {
    $page = $_GET["page"];
}else{
    $page = "home";
}
if ($page) {
    include("pages/" . $page . ".php");
}
//mis een footer page
?>