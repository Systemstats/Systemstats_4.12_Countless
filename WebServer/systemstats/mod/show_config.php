<?php session_start(); /* Starts the session */

if(!isset($_SESSION['UserData']['Username'])){
	header("location:../login.php");
	exit;
}
?>

<?php
//license_header.php
include('../license_header.php');
?>

<?php
//config
require_once('../systemstats_config.php');
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> Konfiguration </title>
    <link href="../assets/css/systemstats.css?v=All" rel="stylesheet" type="text/css" />
    <link href="../vendor/bootstrap/3.3.7/css/bootstrap.min.css?v=3.3.7" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/ico" href="../assets/systemstats/systemstats-fav.ico">
</head>
<body>
    <div class="container" style="padding-top:9px;">
    <button class="btn btn-danger" style="padding-top:5px;" onclick="self.close()">Stäng denna flik/fönster</button>
    <h4>  Konfiguration för <font color="blue"> <?php echo $server; ?> </font> </h4>
     Version: <?php echo $version; ?> <br />
     Kodnamn: <?php echo $codename; ?> <br />
     Webbserver: <?php echo $httpserver; ?> <br />
     Serverns operativsystem: <?php echo $srv_os; ?> <br />
     Serverns DNS-namn: <?php echo $server; ?> <br />
     PHP Version: <?php echo 'ver: ' . phpversion(); ?> <br /> 
     <?php echo $serverip; ?> <br /> 
     <p>Kundkonfiguration </p>
     Sökväg till details-mapp: <p style="color:blue;"> <?php echo $data_details_path; ?> </p> <br />
     Organisation: <?php echo $org; ?> <br /> 
    </div>
    <br />
  </div>          

</body>
</html>