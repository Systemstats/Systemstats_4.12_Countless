<?php session_start();
//session
if(!isset($_SESSION['UserData']['Username'])){
	header("location:../login.php");
	exit;
}
?>

<?php
//konfiguration
require_once('../systemstats_config.php'); // kommentera bort om modul körs fristående 
?>

<!-- 
Det här är en systemstats modul. 
-->
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Network Tools</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/ico" href="../assets/systemstats/systemstats-fav.ico">
<!-- 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
-->
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link href="../vendor/bootstrap/3.3.7/css/bootstrap.min.css?v=3.3.7" rel="stylesheet" type="text/css" />
  <link href="../assets/css/systemstats.css?v=All" rel="stylesheet" type="text/css" /> 
  <script type="text/javascript" src="../scripts/bootstrap.min.js"></script>
  <script type="text/javascript" src="../scripts/jquery.tablesorter.min.js"></script>

</head>
<body>

<style> 
/* VIKTIGT för att inte boostrap ska förstöra tabellen */
table, th, td {
border: 1px solid black;
}
table.fulltable {
border-collapse: separate;
border-spacing: 2px;
}
.container {
padding-top:90px; 
padding-left:5px;
}
body {
  margin:0;
  color:#000;
    }
.top-nav {
  overflow: hidden;
  background-color:black;
  color:white;
  position: fixed;
  top: 0;
  width: 100%;
  height: 35px; 
}

.top-nav a {
  float: left;
  display: block;
  color: #FFF;
  text-align: center;
  padding: ;
  text-decoration: none;
  font-size:;
}
.s2 {
  color:red;
}
.s1 {
}
.main {
  padding: 16px;
  margin-top: 30px;
  height: 1500px; 
}
    </style>

<div class="top-nav">
<a class="btn btn-success" href="../"> <--  tillbaks </a> <button class="btn btn-danger" onclick="self.close()">Stäng</button> 
<b>  Klient IP: <?php echo $clientip ?> | Version: <?php echo $version ?> </b> 
</div>

<div class="container">

<div class="">
<a href="./">
<img src="../assets/systemstats/systemstats.png" width="300" hight="225px" alt="Tillbaks till dashboard">
    </a> </div> 
  <br />

  <h4>Systemstats Network Tools</h4>
  <br />
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
    <li><a data-toggle="tab" href="#uptime-monitor">Server Uptime Monitor</a></li>
    <li><a data-toggle="tab" href="#subnets">Subnets (From AD-Sites)</a></li>
    <li><a data-toggle="tab" href="#ipdoc">IP Dok</a></li>
    <li><a data-toggle="tab" href="#subnet-calc">Subnet Calc</a></li>
  </ul>
<!-- TAB: Home  --> 
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
    <br>
    <br>
    <div class="jumbotron" style="background-color:;padding-top:10px;">
    <h4>
       Fliken "Server Uptime Monitor" innehåller ett verktyg som vid varje refresh pingar servrar definerade i konfigurationsfil och presenterar om de är "up" eller "down" i en tabell <br/>
       Fliken "Subnets from AD-Sites" inehåller en tabell med alla IP-Subnät och "Sites" (Hämtas från AD-Sites). <br/>
       Fliken "IP-Dok" inehåller IP-Dokumentation från Systemstats IP-Dok modul <br/>
       Fliken "Subnet Calc" är ett verktg för att beräkna subnätmask osv, liknar <code> $ ipcalc </code>  i Linux  </h4> 
  </div >
    </div>
    
    <!-- TAB: uptime monitor --> 
    <div id="uptime-monitor" class="tab-pane fade">
      <h3 style="text-align:center;"> Server Uptime Monitor </h3> <br />

    <?php
// Git/sts-dev-private/mod/network-tools    
$system = ini_get('system');
$win  = is_bool($system);
$count = 1;

// -------------------------
// Type in the name of the servers inside the quotation marks. 
// Add or remove as many as you want but make sure they have an added "services" entry.
// -------------------------
$host[1] = "192.168.8.1";
$host[2] = "192.168.1.1";
$host[3] = "1.1.1.1";
$host[4] = "8.8.8.8";
$host[5] = "8.8.4.4";
 $host[6] = "pool.ntp.org";
 $host[7] = "kernel.org";
 $host[8] = "idg.se";
 $host[9] = "google.se";
 $host[10] = "riksdagen.se";
  
// -------------------------
// Type in the function of each server inside the quotation marks.
// -------------------------
$services[1] = "INTERNET";
$services[2] = "AAAAAAA";  // Av nån anledning är det denna som kommer upp som kommentar enbart
$services[3] = "BBBBBBB";
$services[4] = "CCCCCCC";
$services[5] = "RRRRRRR";
$services[6] = "dfghjklö";
$services[7] = "sdfghjklö";
$services[8] = "dfghjkl";
$services[9] = "dsfghjklö";
$services[10] = "dfghjklöä";

// You don't need to edit anything beyond here
echo "<table border=\"0\" align=\"center\">";
foreach ($host as $value) 
{
	 $counter = $count + 1;
	  echo "<tr><td width=120>$value</td>"; 
      echo '<body bgcolor="#FFFFFF" text="#000000"></body>';       
      //check target IP or domain
	  $pingreply = exec("ping -n $count $value");
	  if ( substr($pingreply, -2) == 'ms')
  		{
			echo "<td width=60><strong><font color='#006600'>UP</font></strong></td>";
			echo "<td width=60><img src='up.png'></td>";
			echo "<td width=230>". $services[$counter] . "</td>";
		    echo "<td>Reply Speed ";
		    echo substr($pingreply, -13);
		}
	  else 
		{
			echo "<td width=60><strong><font color='#990000'>DOWN</font></strong></td>";
			echo "<td width=60><img src='down.jpg'></td>";
			echo "<td width=230>". $services[$counter] . "</td>";
		    echo "<td>";
			echo "Timeout...";
		}
}
echo "</td></tr></table>";
?>
    </div>
    <!-- TAB: uptime monitor --> 
    <!-- Subnät från AD-Sites läses in från CSV fil genererad av Powershell Script --> 
    <div id="subnets" class="tab-pane fade">
    <h3> Organisationens Subnät och Siter (Från AD-Sites) </h3> 

<?php
// Tabell header
$tabellApps = '<table class="fulltable tablesorter log-apps" style="width: 1100px;"><thead><tr></td><th>Plats</th><th>Namn</th><th>Site</th></td></thead><tbody>';

?>

<script type="text/javascript">
	$(document).ready(function() { $(".log-apps").tablesorter(); }); 
</script>

<?Php  
        // Tabel för publika datorer 
        // Hämta %COMPUERNAME%.csv data och lägg i tabell, bygg tabell utifrån $tabell
       // echo "<table border=1>";
echo $tabellApps;
$f = fopen("../data/network/subnet.csv", "r");
$fr = fread($f, filesize("../data/network/subnet.csv"));
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
</div>

    <!-- TAB: IP Doc --> 
    <div id="ipdoc" class="tab-pane fade in fade">
      <h3> IP Dokumentation, uppdateras från Systemstats Admin   </h3>
      <br/>
      <div class="notes" style="padding-left:0px;padding-top:0px;"> 
       <pre style="background-color:lightgrey;height:230px;width:1100px;">
    <?php  include('../data/bbs/IPDOC.txt');   ?>

       </pre>
    </div> 

    </div>
    
    
     <!-- TAB: Subnet calc --> 
    <div id="subnet-calc" class="tab-pane fade">
     <br />
     <br /> 
    <iframe src="subnet_calc.php" height="500" width="500"></iframe> 
    </div>


</div> <!-- End tabbed content --> 
</div> <!-- End container --> 

</body>
</html>
