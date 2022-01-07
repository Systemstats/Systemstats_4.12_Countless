<?php session_start(); /* Starts the session */

if(!isset($_SESSION['UserData']['Username'])){
	header("location:login.php");
	exit;
}
?>

<?php
// Licens Header
include('license_header.php');
?>

<?php
// Systemstats Config
require_once('systemstats_config.php');
?>

<?php 
// The UI
include('systemstats_ui.php');
?>



<?php
// Systemstats_UI.php -> footer
include('footer.php');

?>




