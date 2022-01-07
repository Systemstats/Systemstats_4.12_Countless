<?php session_start();

if(!isset($_SESSION['UserData']['Username'])){
    header("Location:../../login.php"); 
	exit;
}
?>

<?php
include('../../license_header.php');
?>

<?php
//config
require_once('../../systemstats_config.php');
?>

<?php
$file = 'Size.csv';
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> Systemstats: Diskanvändning </title>
<link rel="icon" type="image/ico" href="../../assets/systemstats/systemstats-fav.ico">
<script type="text/javascript" src="../../scripts/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../../scripts/jquery.tablesorter.min.js"></script>
<link href="../../assets/css/systemstats.css?v=All" rel="stylesheet" type="text/css" />
<link href="../../vendor/bootstrap/3.3.7/css/bootstrap.min.css?v=3.3.7" rel="stylesheet" type="text/css" />


</head>
<?php include('/assets/noscript.html'); ?>
<body>
    <style>
    /* VIKTIGT för att inte boostrap ska förstöra tabellen */
    .container {
    padding-top:6px;
    padding-left:5px;
    }
    table, th, td {
    border: 1px solid black;
    }
    table.fulltable {
    border-collapse: separate;
    border-spacing: 2px;
    }
    </style>
    <div class="container">
<button class="btn btn-danger" style="color:;padding-bottom:5px;padding-top:3px;" onclick="self.close()">Stäng</button> <button class="btn btn-success" style="color:;padding-bottom:5px;padding-top:3px;" onclick="window.location.href='../../systemstats.php'">Tillbaka</button>
<h4> Systemstats: Diskanvändning </h4>
<p> 
	<font color="FF0000">2017-12-08: Endast aktiverad för testanvändare på IT för närvarande...</font>
	<br /><br />
	Den här modulen visar hur mycket utrymme som används på användarnas hemkatalog, OneDrive och skrivbord. 
	Ingen data om vad som tar upp utrymme samlas in.
	<br />
	Syftet är att få en överblick över hur mycket vi använder OneDrive, samt om våra användare sparar sitt 
	arbete lokalt på skrivbordet (där ingen backup finns).
</p>
<?php
// Tabell header
$tabellApps = '<table class="fulltable tablesorter log-apps" style="width: 1100px;"><thead><tr></td><th>Datum</th><th>Användare</th><th>AD-konto</th></td><th>Hemkat MB</th><th>Onedrive MB</th><th>Skrivbord MB</th><th>Datornamn</th></td></thead><tbody>';

?>

<script type="text/javascript">
	$(document).ready(function() { $(".log-apps").tablesorter(); }); 
</script>

<?Php  
       // echo "<table border=1>";
echo $tabellApps;
$f = fopen("../../data/Size.csv", "r");
$fr = fread($f, filesize("../../data/Size.csv"));
fclose($f);
$lines = array();
$lines = explode("\r\n",$fr); // IMPORTANT the delimiter here just the "new line" \r\n.  

for($i=0;$i<count($lines);$i++)
{
    echo "<tr>";
    $cells = array(); 
    $cells = explode(";",$lines[$i]); // use the cell/row delimiter what u need!
    for($k=0;$k<count($cells);$k++)
    {
       echo "<td>".$cells[$k]."</td>";
    }
    // Avsluta rad ?for k end
    echo "</tr>";
}
// Avsluta tabell 
echo "</tbody></table>";
?> 
<br/>
<center> <b> Systemstats Version <?php echo $version; ?> </b> </center>
<br/>
</div>
</body>
</html>