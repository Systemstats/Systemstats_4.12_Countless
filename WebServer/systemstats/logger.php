<?php

# Sätt datum region
date_default_timezone_set("Europe/Stockholm");
$isDateDaily = false;

# Ger datumet.
function getCurrentDate()
{
	if($isDateDaily)
		return date("Y-m-d");
	else
		return date("Y-m");
}

function getYearMonthDay()
{
	return date("Y-m-d");
}

# Ger tid
function getCurrentTime()
{
    return date("H:i:s");
}

# Skapar en ny fil
function createFile()
{
    $currentDate = getCurrentDate();
    fopen(__DIR__ . "/data/logs/" . $currentDate . ".txt", "w");
}

# Skriver in ny data i filen.
function writeToFile($txt)
{
    $currentDate = getCurrentDate();
    $logFile = fopen(__DIR__ . "/data/logs/" . $currentDate . ".txt", "a++") or createFile();

    # Get the old content
    $oldData = file_get_contents($logFile);

	# Wrie the old content.
    fwrite($logFile, $oldData . "\n");

    # Write date
    fwrite($logFile, getYearMonthDay() . " - " . getCurrentTime() . " - ");

    # Write the txt
    fwrite($logFile, $txt);

    fclose($logFile);
}

# Kalla den här funktionen för att logga.
function Logging($body)
{
    writeToFile($body);
}
?>