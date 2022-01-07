<?php
// (C) 2017-2018 Eddy Hebib. Detta är konfigurations filen för Systemstats.
// Först inluderar vi konfigurationsfil för kund anpassning
include('cfg/config.php')
// Sen databas (Om det ska användas). 
// include('cfg/dbconfig.php')
?>

<?php
// UI 
$systemstats_logo = 'systemstats_2.png'; //  ikon 
$systemstats_logo_gif = 'systemstats.gif'; //  ikon 
$systemstats_logo_dark_gif = 'systemstats_a.gif'; // ikon 
$systemstats_favicon = 'systemstats-fav.ico'; // favicon  
$env_name ="Customer";   // namnet på "AD-miljön" som Systemstats körs i, visas över huvud tabellen.
// Sökväg till <webroot>/data/details här finns alla %USERNAME%.txt och %COMPUTERNAME%.csv filer. Variablel används för sök funktionen 
// Full sökväg http eller https till ./data/details/ mappen. 
$data_details_path = __DIR__ . '/data/details/'; 

// System 
$version = '4.12'; // Systemstats version 
$codename = '"Countless"'; // Versionens kodnamn
$clientip =  $_SERVER['REMOTE_ADDR']; 
$serverip = $_SERVER['SERVER_ADDR'];  
$server = $_SERVER['HTTP_HOST'];  
$srv_os = 'WINDOWS';  // server os WINDOWS eller LINUX
$httpserver = $_SERVER['SERVER_SOFTWARE']; 
$useragent = $_SERVER['HTTP_USER_AGENT'];
?>

<?php
// Funktion för att räkna antal datorer i databasen
$NumberOfADMcomputers = file(__DIR__ . '/data/Systemstats.csv');
$NumberOfPublicComputers = file(__DIR__ . '/data/Public.csv');
$NumberOfSpecialcomputers = file(__DIR__ . '/data/Special.csv');
$NumberOfTSTcomputers = file(__DIR__ . '/data/Test.csv');
?>