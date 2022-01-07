<?php session_start(); /* Starts the session */

if(!isset($_SESSION['UserData']['Username'])){
	header("../location:login.php");
	exit;
}
?>

<?php
//config
require_once('../systemstats_config.php');
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Systemstats: Sök </title>
        <link rel="icon" type="image/ico" href="../assets/systemstats/systemstats-fav.ico">
        <link href="../assets/css/systemstats.css?v=All" rel="stylesheet" type="text/css" />
        <link href="../vendor/bootstrap/3.3.7/css/bootstrap.min.css?v=3.3.7" rel="stylesheet" type="text/css" />
        </head>
    <body>
        <style>
         body {padding-top:5px;padding-left:7px;background-color:#F5F5F5;font-family:Arial, Helvetica, sans-serif;}
         .menu-header {height:25px;padding-bottom:7px;}
        </style>
        <div class="menu-header"> <button class="btn btn-danger" style="padding-bottom:5px;" onclick="self.close()">Stäng</button> <button class="btn btn-success" style="padding-bottom:5px;" Onclick="window.location.href='search_frame.php'">Ny sökning</button> </div> 
   <div class="frame" style="padding-top:15px;"> <iframe src="search_ou.php" width="420" height="420" frameborder="0" > </div>
   <br/>
   <hr/>
   <div style="text-align:center;">
   <?php echo $version; ?>
</div> 
    </body>
</html>
