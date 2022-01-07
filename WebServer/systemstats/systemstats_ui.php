<!DOCTYPE html>
<html>
<head>
<?php

$default = './assets/css/app.css'; // define stylesheets
$darkcss = './assets/css/app_dark.css';

$expire = time()+60*60*24*30; // how long to remember css choice (60*60*24*30 = 30 days)

if ( (isset($_GET['css'])) && ($_GET['css'] == $darkcss) ) { // set cookie for dark css
    $_SESSION['css'] = $_GET['css']; 
    setcookie('css', $_GET['css'], $expire); 
}

if ( (isset($_GET['css'])) && ($_GET['css'] == $default) ) { // set cookie for default css
    $_SESSION['css'] = $_GET['css']; 
    setcookie('css', $_GET['css'], $expire); 
} 

if (isset($_COOKIE['css'])) { // check for css stored in cookie
    $savedcss = $_COOKIE['css']; 
} else {
    $savedcss = $default;
}

if (isset($_SESSION['css'])) { // use session css else use cookie css
    $css = $_SESSION['css'];
} else {
    $css = $savedcss;
} 
// the filename of the stylesheet is now stored in $css

echo '<link rel="stylesheet" href="'.$css.'">';

?> 
<script src="./vendor/js-cookie@beta/dist/js.cookie.min.js"></script>
<title>
     <?php echo $title ?>   
</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="icon" type="image/ico" href="./assets/systemstats/systemstats-fav.ico">
<link href="./vendor/bootstrap/3.3.7/css/bootstrap.min.css?v=3.3.7" rel="stylesheet" type="text/css" />
<link id="pagestyle" href="./assets/css/app.css" rel="stylesheet" type="text/css" title='default'/>
<link  href="./assets/css/app_dark.css" rel="alternate stylesheet" type="text/css" title='alternate'/><!--tema--> 

     <script>
        function swapStyleSheet(sheet){
	          document.getElementById('pagestyle').setAttribute('href', sheet);
        }
      </script>
<!-- Load this first -->
<script src="./scripts/jquery-3.2.1.min.js"></script>
<script src="./vendor/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./scripts/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="./scripts/systemstats.main.js"></script>
<script type="text/javascript" src="./scripts/clock.js"></script>
<script type="text/javascript" src="./vendor/modernizr/2.8.3/modernizr.min.js"></script>

<?php // include('assets/cookies-notice.html'); ?>

</head>
<?php include('assets/noscript.html'); ?>

<body id="body"> 
<span id="nav-links"><?php echo $navbar_links; ?></span>
   <div id="mySidenav" class="sidenav">
       <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
      <h4>Teman</h4>
<p>    
  <a class="stylebtn" href="?css=<?php echo $default;?>">Standard</a> 
  <a class="stylebtn" href="?css=<?php echo $darkcss;?>">Dark</a>
</p>
<!-- reload checkbox-->
<h4>Omladdningstid</h4>
<div>
<p class="timebtn" style= "color:black;"><!--Ladda om sida efter:-->
<input type="radio"  name="reload" class="timebtn reload" id="autoRefreshCheckbox1" value="val1" /> 1 min <br />
<input type="radio"   name="reload" class="timebtn reload" id="autoRefreshCheckbox5" value="val2" /> 5 min <br />
<input type="radio"  name="reload" class="timebtn reload" id="autoRefreshCheckbox10" value="val3"  /> 10 min <br />
<input type="radio"  name="reload" class="timebtn reload" id="autoRefreshCheckbox30" value="val4"  /> 30 min <br />
<input type="radio" name="reload" class="timebtn reload" id="autoRefreshCheckboxav" value="val4"  /> Inaktiverad  </p>
</div>
<div class="bbsCon">
<h4>Visa/dölj bbs</h4>
<p class="timebtn" style="color: black;">
<input type="button" name="bbsH" class="bbsBtn" id="hide-button" value="Dölj bbs"  />  
<input type="button" name="bbss" class="bbsBtn" id="show-button" value="Visa bbs"  /> </p>
</div>

<div>
<h4>Visa/dölj publik tabell</h4>
<p class="timebtn" style="color: black;">
<input type="button" name="publicD" class="publicBtn" id="hide-t" value="Dölj"  />  
<input type="button" name="publicS" class="publicBtn" id="show-t" value="Visa"  /> </p>
<h4><a href="logout.php">Logga ut!</a></h4>
</div>

	</div>
  <script>
  if( screen.height < 1000) {    
    $("a","#mySidenav").css("fontSize", '85%');
    $("a","#mySidenav").css("padding", '0%');
    $("h4","#mySidenav").css("fontSize", '90%');
    $(".timebtn").css("fontSize", '75%');
  }
  if( screen.height < 1100) {    
    $("a","#mySidenav").css("fontSize", '80%');
    $("#mySidenav").css("marginTop", '0%');
    $(".sidenav").css("paddingTop", '0%');
    $("#mySidenav").css("marginBottom", '0%');
    $("a","#mySidenav").css("padding", '0%');
    $("h4","#mySidenav").css("fontSize", '85%');
    $(".timebtn").css("fontSize", '65%');
  }
  </script>
  
<script>
//remember reload
$(function() {
	$("input[type=\"radio\"]").click(function(){
		var thisElem = $(this);
		var value = thisElem.val();
        $(".box").hide();
		$("."+value).show();
		//localStorage:
		localStorage.setItem("option", value);
		//Cookies:
		document.cookie="option="+value;
    });
	//localStorage:
	var itemValue = localStorage.getItem("option");
	if (itemValue !== null) {
		$("input[value=\""+itemValue+"\"]").click();
	}
    //Cookies:
    /*Load the page with the correct input checked based off cookies*/
});

$(document).ready(function($){

if (Modernizr.localstorage) {

  $('#hide-button').click(function(e){
    localStorage.setItem('subscribed',true);
      $('.notes,#hide-button').hide();
      $('#hide-button').hide();
      $('#show-button').show();
  });

  $('#show-button').click(function(e){
      localStorage.setItem('subscribed',true);
      localStorage.clear();
      $('.notes,#hide-button').show();
      $('#show-button').hide();
  });
   
  var is_subscribed = localStorage.getItem('subscribed');
   
  if(is_subscribed){
    console.log('localStorage')
    $('.notes,#hide-button').hide();
  }
    
  if(!is_subscribed){
    console.log('no localStorage');
    $('.notes').show();
    $('#show-button').hide();
  }
    
} 

});

$(document).ready(function($){

if (Modernizr.localstorage) {

  $('#hide-t').click(function(e){
    localStorage.setItem('public',true);
      $('#publicTable,#hide-t').hide();
      $('#hide-t').hide();
      $('#show-t').show();
  });

  $('#show-t').click(function(e){
      localStorage.setItem('public',true);
      localStorage.clear();
      $('#publicTable,#hide-t').show();
      $('#show-t').hide();
  });
   
  var is_public = localStorage.getItem('public');
   
  if(is_public){
    console.log('localStorage')
    $('#publicTable,#hide-t').hide();
  }
    
  if(!is_public){
    console.log('no localStorage');
    $('#publicTable').show();
    $('#show-t').hide();
  }
    
} 

});
</script>
  
<script language="javascript">
setInterval(function ()
{
    if (document.getElementById('autoRefreshCheckbox1').checked)
    {
        window.location.reload();
    }
}, 60000); // interval is in milliseconds

setInterval(function ()
{
    if (document.getElementById('autoRefreshCheckbox5').checked)
    {
        location.reload();
    }
}, 300000); // interval is in milliseconds
setInterval(function ()
{
    if (document.getElementById('autoRefreshCheckbox10').checked)
    {
        location.reload();
    }
}, 600000); // interval is in milliseconds
setInterval(function ()
{
    if (document.getElementById('autoRefreshCheckbox30').checked)
    {
        location.reload();
    }
}, 180000); // interval is in milliseconds

</script>

  
<script>
  function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
  }

  function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
  }
  $( document ).on( 'keydown', function ( e ) {
      if ( e.keyCode === 27 ) { // ESC
          document.getElementById('mySidenav').style.width = "0";
      }
  });
</script>
  
<script> 
// Sökfunktion för tabell, söker i HTML koden genererad av index.php 
$(document).ready(function(){  
           $('#search').keyup(function(){  
                search_table($(this).val());  
           });  
           function search_table(value){  
                $('#maintbl tr').each(function(){  
                     var found = 'false';  
                     $(this).each(function(){  
                          if($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0)  
                          {  
                               found = 'true';  
                          }  
                     });  
                     if(found == 'true')  
                     {  
                          $(this).show();  
                     }  
                     else  
                     {  
                          $(this).hide();  
                     }  
                });  
           }  
      });  
</script> 


<style>
body {
    font-family: 'Open Sans', sans-serif;
    padding-left:5px;
}
textarea {
    overflow-y: scroll;
    height: 300px;
    resize: none;
}
pre {
  overflow: auto;
  word-wrap: normal;
  white-space: pre;
}
/* Viktigt! Ska alltid finnas i /systemstats_ui.php */
.font1 {
/*	font-family:Arial, Helvetica, sans-serif; */ 
}
.apps {float:right;}
.topnav {width:840px;}
.topnav a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-size: 17px;
}
/* Fix för tabeller + bootstrap 3 */ 
table, th, td {
  border: 1px solid black;
}
table.fulltable {
  border-collapse: separate;
  border-spacing: 2px;
}
</style>
<!--Anger bredden på huvudtabellen-->
<div class="" style="width:2600px;" >

<table style="" border="0">
<tr>
<td>
<div class="header">
<a href="./systemstats.php">
<?php
if ( (isset($_GET['css'])) && ($_GET['css'] == $darkcss) ) {
  echo '<img src="assets/systemstats/' . $systemstats_logo_dark_gif . '" width="275" hight="225px">';
} elseif ( (isset($_GET['css'])) && ($_GET['css'] == $default) ) {
  echo '<img src="assets/systemstats/' . $systemstats_logo_gif . '" width="275" hight="225px">';
} else {
  echo '<img src="assets/systemstats/' . $systemstats_logo_gif . '" width="275" hight="225px">';
}
?>
</a>


<div class="font1">
<h2> Verksamhet: <?php echo $forvaltning ?> </h2>
<!--<p>Listar status över verksamhetens datorer. Ladda om sidan var 10:e minut: <input type="checkbox" onclick="toggleAutoRefresh(this);" id="reloadCB"></p>-->
<!--möjligheten att stänga av auto refresh. auto refresh avstängd by default. bocka i checkbox startas auto refresh. Skapad av Gustav Aldenbratt 190131-->
<script>
var reloading;
function checkReloading() {
    if (window.location.hash=="#autoreload") {
        reloading=setTimeout("window.location.reload();", 600000);
        document.getElementById("reloadCB").checked=true;
    }
}
function toggleAutoRefresh(cb) {
    if (cb.checked) {
        window.location.replace("#autoreload");
        reloading=setTimeout("window.location.reload();", 600000);
    } else {
        window.location.replace("#");
        clearTimeout(reloading);
    }
}
window.onload=checkReloading;
    
</script>
   
<!--[if IE]>
  <h4 style="color:red;"> Verkar som du använder Internet Explorer. För bästa prestanda rekomenderar vi Microsoft Edge, Mozilla Filrefox eller Google Chrome/Chromium </h4> 
<![endif]--> 

</div>
</td>

<td valign="top">
<br />
<!-- klocka från clock.js --> 
<div class="clock-date-frame" style="border-style:solid;border-color:grey;height:100px;text-align:center;background-color:#F0F0F0;width:140px; color:black;">
<style>
.clock {
  font-size:30px;
}
.date {
    font-size:20px;
}
</style>
<br />
<script>
  var date = new Date();
  var n = date.toDateString();
  var time = date.toLocaleTimeString();
</script>
<div class="clock"> 00:00:00</div>
<div class="date"> <p></p>
<?php
echo date("Y-m-d", time());	 ?>	
</div>
</div>
<script>
  function getStyle()
  {
      var temp = document.getElementById("secret").style.visibility;

      return temp;
  }
 
 function switchMain()
  {
    let password = prompt("Systemstats Safebox - Ange lösenord:","");
    let formData = new FormData();

    formData.append('password', password);

    fetch(`SafeBox.php`, {
      method: "POST",
      body: formData
    }).then(response => response.json()
    ).then(r => {
      if(r.access)
        return location.reload();

      if(!r.access)
        return location.reload();
    })
  }
 
</script>

</td>
<td valign="top" colspan="1" rowspan="3">
          <br />
    <div  id="secret-con" > 
	<center> 
		<a href="#" id="secret-link" onclick="switchMain();"><img src="assets/images/safebox.png"></a>
    </center>
		<font color="FFFFFF">
		Systemstats Safebox
		<span id="secret">  
		<?php  include('data/bbs/Safebox.php');   ?></span>
		</font>
    </div>
            
</td>
<br>
<td  colspan="1" rowspan="3" style="padding-top: 13px;">

<div class="notes" style="padding-left:15px;padding-top:7px;">
<pre style="background-color:lightgreen;height:300px;width:400px;">
<?php  include('data/bbs/Green.txt');   ?>

</pre>
</div>

</td>

</tr>
<tr>
<td colspan="2">
<div class="topnav" id="systemstats-topnav-global">
<a href="#" onclick="javascript:showHelpDiv();"> Om </a>
<a href="#" onclick="javascript:showAppStats();"> Statistik </a>
<a href="#" onclick="javascript:showSysReport();"> Rapporter </a>
<a href="#" onclick="javascript:ITDocs();"> Dokument </a>
<a href="#" onclick="javascript:StartInventoryForm();"> Ext arb. plats </a>
<a href="#" onclick="javascript:StartSerarchForm();" > Sök anv/dator </a>
</div>
</td>
</tr>

<tr>
<td colspan="2">


<!-- next kort statistik om antalet klinter -->

<div id="appstats" style="background-color:#ffc0c0;">
	<div id="appstats-contents">
	
<table>
<tr>
<td width="350" valign="top" colspan="2">
<button class="btn btn-danger" style="padding-top:5px;" onclick="javascript:HideAppStats();">Stäng</button>
<h3> Systemstats | Statistik </h3>
<h3> Antal klienter med Systemstats installerat: <?php echo count($NumberOfADMcomputers); ?> <a href="./index.php#ADM"> gå till-> </a> </h3>
<h3> Av dessa är: <?php echo count($NumberOfPublicComputers); ?> publika datorer <a href="./index.php#public"> gå till-> </a>  </h3>
<h3> Antal Specialdatorer med Systemstats installerat: <?php echo count($NumberOfSpecialcomputers); ?> <a href="./index.php#special"> gå till -> </a> </h3>
</td>
</tr>
<tr>
<td>

<h4>
<!-- flyttas ut till en typ mod/fk_computer_stats.php -->
<!-- Denna får anpassas för rspektive förvaltning / maskinpark osv /E -->
<!--Lite OS statistik! Infört /MF170707-->
<!--<h4>-->
	<?php
     include('mod/mod_fk_computerstats.php');
	?>
	</div>
</div>

<!-- next hjälpmeny -->
<div id="infobox">
    <div id="infobox-content">
<button class="btn btn-danger" style="padding-top:5px;" onclick="javascript:HideHelpDiv();">Stäng</button> 
<p style="color:#000;">
<h3> Systemstats | Om </h3>
<p>
<h4>Bakgrund</h4>
Systemstats är ett Open-source ITAM-system som levererar data från Windows-klienter i realtid via ett webbgränssnitt. Det är 
skapat och utvecklas av Eddy Hebib och Mattias From på Fastighetskontoret, Göteborgs Stad. Första versionen kom ut under hösten 2016
och sedan dess har fler funktioner lagts till och verktyget utvecklas successivt. Den data Systemstats samlar in är publik information 
(alltså ingen känslig data). Datainsamlingen görs med hjälp av ett inloggningsskript som anropas från klienten varje gång en 
använadare loggar in samt genom schemalagda körningar mot Active Directory. Systemstats är skräddarsytt för plattformen, men
kan även sättas upp i andra Windows-nätverk utan att behöva ändra något i den existerande os/domänmiljön. </br >
</p>

<h4> Hjälpfiler </h4>
<p> <a class="btn btn-success" href="#" onclick="javascript:StartHelpForm();" > Tabellförklaring  </a> |  <b> <a class="btn btn-warning" href="#" onclick="javascript:StartConfigForm()"> Konfigurationsfil </a> | <a class="btn btn-info" href="webhelp.php?htmlhelp=docs/ver.htm"> Versionshistorik </a> </b> <br /> </p>
<h4> Systemkrav webbklient</h4>
*Webbläsare med stöd för HTML5. Microsoft Edge (rekommenderas), Internet Explorer 11, Mozilla Firefox eller Google Chrome. <br />
*Javascript måste vara aktiverat i webbläsaren. </br >
*Cookies måste tillåtas för att du inte skall behöva logga in på nytt när sidan laddas om. <br />

<h4>Versionsinformation </h4>
   <b>  Version: <?php echo $version; ?> </b> <br />
   <b>  Serverns DNS-namn: <?php echo $server; ?> </b> <br />
  </div> 
</div>
<!--Dokument.html inkluderas här -->
<div id="docs" style="background-color:#ccffBB;display:nones;">
<button class="btn btn-danger" style="padding-top:5px;" onclick="javascript:HideITDocs()">Stäng</button>
<?php include('data/docs/Dokument.html'); ?> 
</div>
<!-- Klientinstallation 
Inte aktuell i 2.22 
-->
<div id="client-install">
	<div id="clientinstall">
	<button class="btn btn-danger" style="padding-top:5px;" onclick="javascript:HideInstallClient();">Stäng</button>
	<p style="color:#000;">
<h3> Systemstats | Installation </h3>
<p> Här kan du ladda ner och installera Systemstats-klienten på datorn. Klienten innehåller sökvägen till inloggningsskriptet och måste kopieras till
	autostart-mappen. Efter att skriptet körts vid inloggning dyker datorn upp i tabellen. Klienten kan även kan paketeras och skjutas
	ut via SCCM/Intune. Den kan även skjutas ut automatiskt till verksamhetens alla datorer samt vid F12:ning.<br /><br />
	Ladda ner <a href="mod/setup/download.php?file=Systemstats_client.zip"> Systemstats_client.zip </a> och extrahera Systemstats.exe till "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp" 
	(kräver administratörsrättigheter på datorn). </p>
	<br />
	</p>
	</div>
</div>
<div id="reports">

<button class="btn btn-danger" style="padding-top:5px;" onclick="javascript:hideSysReport();">Stäng</button>
<h3> Systemstats | Rapporter </h3> 
<p>  Rapporterna genereras varje dag kl. 06:30. </p>
<h3> <a href="data/accounts/Accounts.txt" target="blank"> Användarkonton </a> </h3>
<p>
Listar organisation användarkonton (ej admin och funktionskonton). Tar ut en txt-fil med: <br />
Datumet kontot skapades, AD-konto och visningsnamn.
</p>
<h3> <a href="data/accounts/Accounts-Rooms.csv" target="blank"> Användarkonton (utökad)</a> </h3>
<p>
Listar organisation användarkonton (ej admin och funktionskonton). Tar ut en csv-tabell med:  <br />
Aktiveringsstatus, AD-konto, visningsnamn, rumsnummer, 031-anknytning, mobilnummer, <br />
e-postadress samt info om vem som är chef för respektive medarbetare.
</p>
<h3> <a href="data/accounts/Accounts-Disabled.txt"  target="blank"> Inaktiverade Användarkonton </a> </h3>
<p>
Listar organisation inaktiverade användarkonton (ej admin och funktionskonton). <br /><br />
Ett användarkonto kan vara inaktiverat av olika anledningar. Orsaken kan vara: <br />
*Kontot har inaktiverats manuellt. <br />
</p>
<h3> <a href="data/accounts/Accounts-Admin.txt"  target="blank"> Admin & funktionskonton </a> </h3>
<p> 
Listar organisation administrativa konton. <br />
</p>
<h3> <a href="data/computers/Computers.txt" target="blank"> Datorer </a> </h3>
<p>
Listar organisation klienter efter datornamn (ej servrar). <br />
</p>
<h3> <a href="data/computers/Computers-Disabled.txt"  target="blank"> Inaktiverade Datorer </a> </h3>
<p>
Listar organisation inaktiverade klienter (ej servrar). <br />
</p>

</div>
<style>

</style>
<div id="inventory" style="">
<button class="btn btn-danger" style="padding-top:5px;" onclick="javascript:hideInv();">Stäng</button>
<h3> Systemstats | Extern arbetsplats  </h3>
<p> <b> Utrustning utlånad för externt kontor, eller för hemarbetsplats.</b> </p> 
<?php
// Tabell header för inventory
$tabellInv = '<table class="fulltable tablesorter log-inv" style="width: 800px;"><thead><tr></td><th>Utl-datum</th><th><a title="Corona (C). Anger om lånet avser hemarbete under Corona-krisen."><font color="#FFFFFF">C</font></a></th><th>Användare</th><th>AD-konto</th><th><a title="Ursprung (U). Anger var skärmen kommer ifrån. L för lager eller K för användarens kontor."><font color="#FFFFFF">U</font></th><th>Modell</th><th>Serienummer</th></td></thead><tbody>';
?>
<p>Hanteras från knappen "Extern arbetsplats" i Systemstats Admin. <font color="#FF0000">Glöm inte att ta bort återlämnade enheter!</font></p>
<script>
$(document).ready(function() { $(".log-inv").tablesorter(); });
</script>

<?Php  
// Tabel för skärmar 
echo $tabellInv;
$f = fopen("data/inventory/Monitors.csv", "r");
$fr = fread($f, filesize("data/inventory/Monitors.csv"));
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

<br />
<br />
</div>
<!-- next tabeller från systemstats_tabeller.php -->
<!-- <h1> Publika & delade datorer | <a href="data/Public.CSV">CSV-Fil</a> | <button   type="button" value="open" onclick="javascript:tbl1show()" class="btn btn-primary">Visa Tabell</button> | <button type="button" value="close" onclick="javascript:tbl1hide()" class="btn btn-danger">Dölj Tabell</button> </h1>  -->
<h1> Publika & delade datorer | <a class="btn btn-success" role="button" href="data/Public.CSV">DB-Fil</a> <!--| <button id="tableSH" type="button" value="open"  class="btn btn-primary">Visa/dölj Tabell</button> | <button onclick='CheckCookieAndHideDiv();' style="background-color:lightgreen; color:black" id="bbsSH" type="button" value="toggle" class="btn ">Visa/dölj bbs</button>--> </h1> 

</td>
</tr>
</table>

<table border="0">
<tr>
<td>
<div id="tbl1">
<div id="publictbl" style="padding-top:0px;">

<!--public tabell cookie-->


<script type="text/javascript">
	$(document).ready(function() { $(".tbl-public").tablesorter(); }); 
</script>

<?Php  
// Tabel för publika datorer 
// Hämta Public.csv data och lägg i tabell, bygg tabell utifrån $tabell
// echo "<table border=1>";
echo $tabellPublic;
$f = fopen("data/Public.csv", "r");
$fr = fread($f, filesize("data/Public.csv"));
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
</div>
</td>

<td>
<div class="notes" style="padding-left:15px;padding-top:7px;"> 
<pre style="background-color:lightyellow;height:450px;width:400px;">
 <?php  include('data/bbs/Yellow.txt');   ?> 

</pre>
</div>
</td>
<td>
<div class="notes" style="padding-left:15px;padding-top:7px;">
<pre style="background-color:lightblue;height:450px;width:400px;">
<?php  include('data/bbs/Blue.txt');   ?>

</pre>
</div>
</td>

</pre>
</div>

</td>
</tr>
</table>

<!-- inkludera modulen för ITAM-tabeller -->

<?php

include('mod/systemstats_ui_tabeller.php');
?>

<!-- ITAM tabeller end / -->