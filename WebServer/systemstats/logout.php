<?php session_start(); /* Starts the session */
$userIp = $_SERVER['REMOTE_ADDR'];
require("logger.php");
Logging($userIp . " har loggat ut med användarnamn: " . $_SESSION['UserData']['Username']);
session_destroy(); /* Destroy started session */
header("location: loggedout.php");
exit;
?>

