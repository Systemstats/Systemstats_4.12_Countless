<?php
//config
require_once('../systemstats_config.php');
?>

<?php
include('../license_header.php');
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/ico" href="../assets/systemstats/systemstats-fav.ico">
<script type="text/javascript" src="../scripts/jquery-3.2.1.min.js"></script>
<link href="../assets/css/systemstats.css?v=All" rel="stylesheet" type="text/css" />
<link href="../vendor/bootstrap/3.3.7/css/bootstrap.min.css?v=3.3.7" rel="stylesheet" type="text/css" />

    <script>
function showResult(str) {
  if (str.length==0) { 
    document.getElementById("livesearch").innerHTML="";
    document.getElementById("livesearch").style.border="0px";
    return;
  }
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else {  // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
      document.getElementById("livesearch").innerHTML=this.responseText;
      document.getElementById("livesearch").style.border="1px solid #A5ACB2";
    }
  }
  xmlhttp.open("GET","livesearch.php?q="+str,true);
  xmlhttp.send();
}
</script>
</head>
<body>
    <div class="container" style="padding-left:2px">
    <style> body {background-color:#F5F5F5;} </style>
    <h3> Sök detaljer om användare och datorer! </h3>
	<p> Ange AD-konto eller datornamn! </p>
       <form>
<input type="text" size="30" onkeyup="showResult(this.value)">
<div id="livesearch"></div>
</form>
       <p> <code> Systemstats version <?php echo $version; ?> </code> </p>
       </div>
</body>
</html>