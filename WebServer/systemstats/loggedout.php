<?php
require_once('systemstats_config.php');
?>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="refresh" content="6;url=./login.php">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/ico" href="./assets/systemstats/systemstats-fav.ico">
<link href="./vendor/bootstrap/3.3.7/css/bootstrap.min.css?v=3.3.7" rel="stylesheet" type="text/css" />
<title> Systemstats: Logout! </title>
</head>
<body>
<div class="container">
<div style="padding-top:4px;padding-right:5px;">
<br />
<img src="assets/systemstats/systemstats.png" width="275" hight="225px">
<br />
<h1> Du har loggats ut från Systemstats! </h1>
<h3> Du borde nu stänga webbläsaren/denna fliken, eller vänta ca 5 sekunder för att komma till <a href="login.php"> inloggningen </a> igen. <br />
<hr/> 
<div style="text-align:center;"> <h4>  Systemstats version <?php echo $version ?> </h4>  </div>
</div>
</div>
</body>
</html>
