<?php
//config
require_once('systemstats_config.php');
?>

<!DOCTYPE html>
<html>
<head> <title> Systemstats Dashboard </title>
<meta http-equiv="refresh" content="300">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<link href="./vendor/bootstrap/3.3.7/css/bootstrap.min.css?v=3.3.7" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="./scripts/clock.js"></script> <!-- NT Klocka --> 
<link rel="icon" type="image/ico" href="./assets/systemstats/systemstats-fav.ico">

</head>
<body>
<style>
body {
    text-align:center;
    font-family:Arial, Helvetica, sans-serif; 
}

.container {
    text-align:center;
}

</style>
<br/>

<a href="#">
<div style="float: left; margin-top: 7px;">
<img src="assets/systemstats/systemstats.png" width="300" hight="225px">
</a>
</div> 
<div style="float: right; margin-right: 15px;">
<img src="assets/systemstats/customer.png" width="300" hight="225px">
</a>
</div> 
<br />
<br>
<br>

<br/>
<br />
<hr>
<h2><b>Fördelning av operativsystem:  </b> </h2>

<?php

echo '<div class="container">';

$pathstats = "Data/Systemstats.csv"; 	
	echo " <h1 style='color:#33FF99;'> Windows 10 20H2";
	$win1020H2 = substr_count(file_get_contents($pathstats), "Windows_10_20H2");
	$sum_totalw1020H2 = $win1020H2 / count($NumberOfADMcomputers);
	$sum_totalw1020H2_final = substr($sum_totalw1020H2, 2, 2);
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "Windows_10_20H2");
    echo " st </h1>";
	
	echo " <h1 style='color:#3399FF;'> Windows 10 1909";
	$win101909 = substr_count(file_get_contents($pathstats), "Windows_10_1909");
	$sum_totalw101909 = $win101909 / count($NumberOfADMcomputers);
	$sum_totalw101909_final = substr($sum_totalw101909, 2, 2);
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "Windows_10_1909");
    echo " st </h1>";
	
	echo " <h1 style='color:#FF5079;'> Windows 10 1809";
	$win101809 = substr_count(file_get_contents($pathstats), "Windows_10_1809");
	$sum_totalw101809 = $win101809 / count($NumberOfADMcomputers);
	$sum_totalw101809_final = substr($sum_totalw101809, 2, 2);
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "Windows_10_1809");
	echo " st </h1>";

    echo '</div>';
?>


<hr />

<h2><b> Lagersaldo: <!-- <?php// echo $org; ?>--></b> </h2>

<h1 style="color:#C04CFF;"> Totalt antal klienter: <?php echo count($NumberOfADMcomputers); ?>  </h1> 
<!--<br>-->

<h1 style="color:green;">

<?php 
	$pathstats = "Data/Systemstats.csv"; 
	$pathpublic = "Data/Public.csv"; 
	
	echo "Datorer i lager";
	echo " ≈ ";
	$LAGER = substr_count(file_get_contents($pathstats), "LAGER");
	$sum_LAGER = $LAGER / count($NumberOfADMcomputers);
	$sum_LAGER_final = substr($sum_LAGER, 2, 2);
	print ($sum_LAGER_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), ">LAGER");
	echo " st";
	
	echo "</h1>";
	#echo "<br>";	
?>

<h1 style="color:orange;">

<?php	
	
	echo "Datorer för leverans";
	echo " ≈ ";
	$LEVERANS = substr_count(file_get_contents($pathstats), "LEVERANS");
	$sum_LEVERANS = $LEVERANS / count($NumberOfADMcomputers);
	$sum_LEVERANS_final = substr($sum_LEVERANS, 2, 2);
	print ($sum_LEVERANS_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), ">LEVERANS");
	echo " st";
	?>

</h1> 
<!--<br>-->
<h1 style="color:#c00a56;">

<?php	
	
	echo "Lånedatorer inne";
	$INNE = substr_count(file_get_contents($pathpublic), "INNE");
	$sum_INNE = $INNE / count($NumberOfADMcomputers);
	$sum_INNE_final = substr($sum_INNE, 2, 2);
	echo " - ";
	echo substr_count(file_get_contents($pathpublic), ">INNE");
	$LANEDATOR = substr_count(file_get_contents($pathpublic), "Lånedator");
	$sum_LANEDATOR = $LANEDATOR / count($NumberOfADMcomputers);
	$sum_LANEDATOR_final = substr($sum_LANEDATOR, 2, 2);
	echo "/";
	echo substr_count(file_get_contents($pathpublic), "Lånedator");
	echo " st";
	?>

</h1> 
<hr />

<h2> <b> Datortyper: </b> </h2>

<h1 style="color:#0042b2;">
<?php 
	$pathstats = "Data/Systemstats.csv"; 
	
echo "Bärbara & Plattor";
	echo " ≈ ";
	$BN200 = substr_count(file_get_contents($pathstats), ">BN200");
	$sum_BN200 = $BN200 / count($NumberOfADMcomputers);
	$sum_BN200_final = substr($sum_BN200, 2, 2);
	$sum_BN200_final_number = substr_count(file_get_contents($pathstats), ">BN200");
	$BA = substr_count(file_get_contents($pathstats), ">BA");
	$sum_BA = $BA / count($NumberOfADMcomputers);
	$sum_BA_final = substr($sum_BA, 2, 2);
	$sum_BN_BA = $sum_BN200_final + $sum_BA_final;
	print ($sum_BN_BA);
	echo "%";
	echo " - ";
	$sum_BA_final_number = substr_count(file_get_contents($pathstats), ">BA");
	$sum_BN_BA_final_number = $sum_BN200_final_number + $sum_BA_final_number;
	echo $sum_BN_BA_final_number;
	echo " st";
		
	echo "<br>";
	echo "<br>";
?> <font color="#6c7a86"> <?php
	echo ' Stationära & Workstation';
	echo " ≈ ";
	$WN200 = substr_count(file_get_contents($pathstats), ">WN200");
	$sum_WN200 = $WN200 / count($NumberOfADMcomputers);
	$sum_WN200_final = substr($sum_WN200, 2, 2);
	$sum_WN200_final_number = substr_count(file_get_contents($pathstats), ">WN200");
	$WA = substr_count(file_get_contents($pathstats), ">WA");
	$sum_WA = $WA / count($NumberOfADMcomputers);
	$sum_WA_final = substr($sum_WA, 2, 2);
	$sum_WN_WA = $sum_WN200_final + $sum_WA_final;
	print ($sum_WN_WA);
	echo "%";
	echo " - ";
	$sum_WA_final_number = substr_count(file_get_contents($pathstats), ">WA");
	$sum_WN_WA_final_number = $sum_WN200_final_number + $sum_WA_final_number;
	echo $sum_WN_WA_final_number;
	echo " st";
	?>
	</font>
</h1> 




<hr />




<hr />

<h4> <b> Version och servermiljö: </b> </h4> 
<h4 style="color:#5f2899;"> 
     Version: <?php echo "$version $codename | Kund: $org"; ?> <br />
     Serverns DNS-namn: <?php echo $server; ?> <br />
	 <?php include($uptime_dir); ?>
</h4> 


<!-- klocka från clock.js --> 
<center>

<div class="clock-date-frame" style="border-style:solid;border-color:grey;height:100px;text-align:center;background-color:#F0F0F0;width:140px; color:black; padding: 10px; margin-top: 15px;" >
<style>
.clock {
  font-size:30px;
}
.date {
    font-size:20px;
}
</style>

<script>
var date = new Date();
var n = date.toDateString();
var time = date.toLocaleTimeString();
</script>

<div class="clock"> 00:00:00</div>
<div class="date"> 
<?php
echo date("Y-m-d", time());	 ?>	
<br />
</div>
</div>

<center>
	<br/> 
	<br/>
</body>
</html>