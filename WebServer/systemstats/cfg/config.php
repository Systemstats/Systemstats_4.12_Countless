<?php
//error config 
//ini_set('error_reporting', E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE); // Show all errors minus STRICT, DEPRECATED and NOTICES
//ini_set('display_errors', 0); // disable error display
//ini_set('log_errors', 0); // disable error logging

// ITAM_Tabell apps för /apps.php
$tabellApps = '<table class="fulltable tablesorter log-apps" style="width: 1100px;"><thead><td>Program</td><td>Installerad</td></thead><tbody>';

// Kund Konfiguration
$org = 'C001 Customer'; // Organisation som är kunden 
$orgshort = 'TEST'; // Kort namn på org typ FK,KV
$forvaltning = 'C001 Customer'; // Namn på förvaltningen som är kund
$title = 'Systemstats C001'; // Titel för HTML filer, titel på /systemstats.php sidan

$uptime_dir = __DIR__ . '/../Server_uptime.html';

// tabell variabler för publika datorer, hämtar från FKPUBLIC.csv
$tabellPublic = '<table  id="publicTable" class="fulltable tablesorter tbl-public" style="width: 840px;"><thead><tr></td><th><!--Datornamn--><img src="assets/images/computer.png"> Datornamn</th><th>Beskrivning</th><th>Inloggad</th><th><!--AD-konto--><img src="assets/images/ad-account.png"> AD-konto</th><th>Modell</th></tr>
</thead><tbody>';

// tabell variabler för samtliga användares datorer, hämtar från FKUPTIME.csv 
$tabellADM = '<table class="fulltable tablesorter tbl-adm" id="myTable"><thead><tr></td><th><!--Startdatum--><a title="Datumet då datorn senast startades om."><img src="assets/images/date.png"></a>Startad</th><th><!--Starttid--><a title="Tid då Windows startades."><img src="assets/images/clock.png"></a></th><th><!--Inloggningsdatum--><a title="Datumet då den senaste inloggningen gjordes."><img src="assets/images/date.png"></a>Inlogg</th><th><!--Tid--><a title="Tid då senaste inloggning gjordes."><img src="assets/images/clock.png"></a></th><th><!--Användare--><a title="Visningsnamnet för användaren som senast loggade in på datorn."><img src="assets/images/user.png"></a>Användare  <a style="margin-left: 60px;" title="Antal inloggningar för aktuell dator: 5 eller fler"><img src="./assets/images/ffff99.png"></a><a title="Antal inloggningar för aktuell dator: 25 eller fler"><img src="./assets/images/ffff00.png"></a><a title="Antal inloggningar för aktuell dator: 100 eller fler"><img src="./assets/images/80ff80.png"></a><a title="Antal inloggningar för aktuell dator: 250 eller fler"><img src="./assets/images/1aff1a.png"></a><a title="Antal inloggningar för aktuell dator: 500 eller fler"><img src="./assets/images/80ffff.png"></a><a title="Antal inloggningar för aktuell dator: 750 eller fler"><img src="./assets/images/00e6e6.png"></a><a title="Antal inloggningar för aktuell dator: 1000 eller fler"><img src="./assets/images/ff3333.png"></a><a title="Antal inloggningar för aktuell dator: 1250 eller fler"><img src="./assets/images/e60000.png"></a><a title="Publika datorer"><img src="./assets/images/cc3399.png"></a></th><th><!--AD-konto--><a title="Användarens inloggningskonto i domänen."><img src="assets/images/ad-account.png"></a>AD-konto</th><th><!--Ank--><a title="Användarens 031-anknytning (extra modul för vissa förvaltningar). Innehåller även signatur för vilken tekniker som markerat en dator som i lager."><img src="assets/images/ank.png"></a></th><th><!--Datornamn--><a title="Datorns hostname."><img src="assets/images/computer.png"></a>Datornamn</th><th>Modell</th><th>Serienummer</th><th><!--OS--><a title="Datorns operativsystem."><img src="assets/images/os.png"></a>OS</th><th style="padding-right:5px;">MB kvar C:</th><th>Installerad</th><th><a title=" Version av Microsoft Office som datorn kör."><img src="assets/images/office.jpg"></a> Office</th><th>Inköpt</th><th style="padding-right:5px;">Stöld nr</th><th><!--RAM--><a title="Datorns totala mängd arbetsminne (RAM)."><img src="assets/images/ram.png"></a></th><th><!--CPU--><a title="Datorns processor. Visar modell och klockfrekvens."><img src="assets/images/cpu.png"></a>CPU</th><th><!--Kärnor--><a title="Processorns totala antal kärnor."><img src="assets/images/core.png"></a></th><th><!--Trådar--><a title="Antal logiska processorer (trådar)."><img src="assets/images/thread.png"></a></th><!--<th>Kommentar<img src="assets/images/comment.png"> Kommentar</th>--></tr>
</thead><tbody id="maintbl">';

// tabell variabler för specialla datorer 
$tabellSpesh = '<table class="fulltable tablesorter tbl-special" style="width: 1100px;"><thead><tr></td><th><!--Datornamn--><img src="assets/images/computer.png"> Datornamn</th><th>Beskrivning</th><th><!--Konto--><img src="assets/images/user.png"> Konto</th><th>Modell</th><th>Serienummer</th><th>Domän</th></tr>
</thead><tbody>';

// tabell variabler för mobila enheter 
$tabellMobile = '<table class="fulltable tablesorter tbl-special" style="width: 2500px;"><thead><tr></td><th><!--IMEI-Nummer--><img src="assets/images/mob.png"> IMEI-Nummer</th><th>Serienummer</th><th><!--Användare--><a title="Visningsnamnet för användaren som innehar enheten."><img src="assets/images/user.png"></a>Användare</th><th><!--AD-konto--><a title="Användarens inloggningskonto i domänen."><img src="assets/images/ad-account.png"></a>AD-konto</th><!--<th>Märke</th>--><th><!--Datum&signatur--><a title="Datumsignatur för in/utlämning. Exempelvis: Utlämnad! /MF190825"><img src="assets/images/datesign.png"></a></th><th>Modell</th><th><!--Minne--><a title="Enhetens totala lagringsutrymme."><img src="assets/images/ram.png"></a></th><th><!--Färg--><a title="Enhetens färg."><img src="assets/images/color.png"></a></th><th>MDM</th><th>Inköpt</th><th>Lev.</th><th>Ordernr</th><th>Leasing nr</th><th>Stöld nr</th><th>Tidigare ägare</th><th>Skick (max 100 tecken!)</th></tr>
</thead><tbody>';

// tabell variabler för testdatorer, hämtar från FKTEST.csv 
$tabellTest = '<table class="fulltable tablesorter tbl-tst"><thead><tr></td><th>Startad</th><th></th><th>Inloggad</th><th></th><th>Användare</th><th>AD-konto</th><th>Ank</th><th>Datornamn</th><th>Modell</th><th>Serienummer</th><th>OS</th><th>MB kvar C:</th><th>F12:ad</th><th>Office</th><th>MARKIS</th><th>FABO</th><th>RAM</th><th>CPU</th><th>Kärnor</th><th>Trådar</th><th>Kommentar</th></tr>
</thead><tbody>';

// Länkar top left, html kod för länkar i top left på Systemstats.php
$navbar_links = '<div class="top-left-links" style="text-align:right; padding-right:20px;"> 
<a <a <a class="nav-links" href="/" target="blank">Länk</a> | <a <a class="nav-links" href="/" target="blank">Länk</a> | <a <a class="nav-links" href="/" target="blank">Länk</a> | 
<a <a class="nav-links" href="/" target="blank">Länk</a> | <a <a class="nav-links"  href="/" target="blank">Länk</a> | <a <a class="nav-links" href="/" target="blank">Länk</a> | <a <a class="nav-links" href="/" target="blank">Länk</a> | <a <a class="nav-links" target="_blank" href="/">Länk</a> | <font color="red">  </font><span style="cursor:pointer" onclick="openNav()"><img src="assets/images/login.png"></span>  </div>';
//<a href="logout.php">Logga ut!</a>


?>