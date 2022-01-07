<?php
require_once('systemstats_config.php');
?>

<!DOCTYPE html>
<html><head>
<title>Search Error!</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head><body>
<style>body {background-color:#F5F5F5;font-family:Arial, Helvetica, sans-serif;}
</style>
<h1>Inga matchningar! :(</h1>
<p> Detta kan bero på att du angivit ett felaktigt AD-konto eller datornamn. Det kan också bero på att datorn/användaren inte finns med i databasen ännu. </p>
<hr>
<code>Client IP: <?php echo $clientip ?> <br />  </code>
<code>Systemstats Web Server at <strong> <?php echo $serverip; ?> </strong> Port 80, </code>
</body></html>
