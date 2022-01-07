<?php session_start();

if(!isset($_SESSION['UserData']['Username'])){
	header("location:login.php");
	exit;
}
?>

<?php
$file = $_GET['computer'];
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> Installerade Program </title>
<link rel="icon" type="image/ico" href="./assets/systemstats/systemstats-fav.ico">
<script type="text/javascript" src="./scripts/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="./scripts/jquery.tablesorter.min.js"></script>
<link href="./vendor/bootstrap/3.3.7/css/bootstrap.min.css?v=3.3.7" rel="stylesheet" type="text/css" />
<link href="./assets/css/systemstats.css?v=2.0" rel="stylesheet" type="text/css" />
</head>
<body>
    <noscript>Your browser does not support JavaScript!</noscript> 
    <style>
    /* VIKTIGT för att inte bootstrap ska förstöra tabellen */
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
        <br/>
<button class="btn btn-danger" style="color:;padding-bottom:5px;padding-top:3px;" onclick="self.close()">Stäng denna flik/fönster!</button> <button class="btn btn-success" style="color:;padding-bottom:5px;padding-top:3px;" onclick="window.location.href='systemstats.php'">Tillbaks!</button>
<h4> Modul under utveckling </h4>
<h4> Den här modulen listar installerade program på datorn, informationen hämtas ur registret och visar inte alla installerade program än! </h4>
<h1> Program Installerade på <?php echo $file ?> </h1>

<?php
// Tabell header
$tabellApps = '<table class="fulltable tablesorter log-apps" style="width: 1100px;"><thead><tr></td><th>Program</th><th>Installerad</th><th>Version</th></td></thead><tbody>';

?>

<script type="text/javascript">
	$(document).ready(function() { $(".log-apps").tablesorter(); }); 
</script>

<?Php
// Tabel för publika datorer 
// Hämta %COMPUERNAME%.csv data och lägg i tabell, bygg tabell utifrån $tabell
echo $tabellApps;
$f = fopen("data/Apps/$file", "r");
$fr = fread($f, filesize("data/Apps/$file"));
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

<center> <?php echo $version; ?> </center>
</div>
</body>
</html>