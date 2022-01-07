<?php session_start();

if(!isset($_SESSION['UserData']['Username'])){
	header("location:login.php");
	exit;
}
?>

<?php
include('license_header.php');
?>

<?php
//config
require_once('systemstats_config.php');
?>

<!DOCTYPE html>
<html>
    <head>
        <title> Systemstats Dokumentation </title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="./vendor/bootstrap/5.1.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link rel="icon" type="image/ico" href="./assets/systemstats/systemstats-fav.ico">

        <!-- för test av STS UI 5.0 Inter font --> 
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter" rel="stylesheet">
    <script>
function ShowSysInfo() {
window.open("mod/show_config.php", "_blank", "toolbar=no,scrollbars=no,resizable=no,top=500,left=500,width=450,height=485"); 
}
function ShowOSS() {
window.open("webhelp.php?htmlhelp=docs/oss.html", "_blank", "toolbar=no,scrollbars=no,resizable=no,top=500,left=500,width=450,height=485"); 
}
function StartHelpForm() {
window.open("webhelp.php?htmlhelp=docs/systemstats_UI_tables.htm", "_blank", "toolbar=no,scrollbars=no,resizable=no,top=500,left=500,width=450,height=485"); 
}
    </script> 
</head>
<body>
<style>
      body {
        text-align:center;
        font-family: 'Inter', sans-serif;
      }

      .logo {
        padding-left:5px;
        padding-top:5px; 
        padding: bottom 10px;
        text-align:left;
      }
    </style>
<span id="nav-links"><?php echo $navbar_links; ?></span>

<div class="container"> <!-- content --> 

<div class="logo">
<a href="./">
<img src="./assets/systemstats/systemstats.png" width="300" hight="225px" alt="Tillbaks till dashboard">
    </a> </div> 
  <br />
 
  <nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="docs.php">Dokumentation</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Versionsinfo</a>
          </li>
          <li class="nav-item">
          <a class="nav-link" href="#" onclick="javascript:StartHelpForm();">Tabellförklaring</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" onclick="javascript:ShowOSS();" >Öppen Källkod</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" onclick="javascript:ShowSysInfo();">Systeminfo</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>

<!-- content -->

<div class="container" style="text-align:center;"> 
<br/>
<br/>
<h4> Systemstats Versionsinformation </h4> 
<p> Den här informationen finns också alltid uppdaterad på https://systemstats.se/docs </p> 

<!-- embedd docs/ver.htm --> 

<?php
$verdoc = "ver.htm"; 

include('docs/ver.htm');

?>


<script src="./vendor/bootstrap/5.1.0/js/bootstrap.bundle.min.js"></script>

</div> <!-- content -->  


<?php 

include('footer.php');

?>


