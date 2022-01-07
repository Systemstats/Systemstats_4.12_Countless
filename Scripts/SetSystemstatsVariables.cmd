echo off
title Systemstats Variables Setup
color 1f
cls

echo V„lkommen till installationsprogrammet f”r Systemstats Variabler!
echo.
echo T„nk p† att du m†ste k”ra installationen fr†n en lokal plats samt som administrat”r.
echo.
echo Dessa variabler beh”ver anges f”r alla klient-datorer.
echo.

echo Ange Systemstats Sript Serverns hostname 
set /p server=Ditt val: 
echo.

echo Ange kundens namn (ej mellanslag eller specialtecken)
set /p cst=Ditt val: 
echo.

echo Ange ditt kundnummer
set /p cnr=Ditt val: 
echo.

echo S„tter variabeln stsscr till \\%server%\scripts$
setx stsscr \\%server%\scripts$ /M
echo.

echo S„tter variabeln stsmod till \\%server%\scripts$\Modules
setx stsmod \\%server%\scripts$\Modules /M
echo.

echo S„tter variabeln stslog till \\%server%\logs$
setx stslog \\%server%\logs$ /M
echo.

echo S„tter variabeln stssrv till %server%
setx stssrv %server% /M
echo.

echo S„tter variabeln stscst till %cst%
setx stscst %cst% /M
echo.

echo S„tter variabeln stscnr till %cnr%
setx stscnr %cnr% /M
echo.

echo Tryck ENTER f”r att avsluta...
pause >NUL