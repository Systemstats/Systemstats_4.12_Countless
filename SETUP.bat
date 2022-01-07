REM ##################################################################################
REM ##   Systemstats Version 4.12-Countless-2022-01-01 © 2016-2022 Göteborgs Stad.  ##
REM ##  	   Utvecklad av Eddy Hebib och Mattias From för FK-IT. 		  			##
REM ##################################################################################
echo off
title Systemstats Server Setup
color 1f
cls

cd %~dp0


echo V„lkommen till installationsprogrammet f”r Systemstats Server!
echo.
echo T„nk p† att du m†ste k”ra installationen fr†n en lokal plats samt som admin.
echo.
echo Varning: Undvik att fr†ng† standards”kv„garna om du inte m†ste!
echo.
echo Tryck [ENTER] f”r att p†b”rja installationen...
pause >NUL


:instval
set "installation="
cls
echo V„lj installation och tryck [ENTER]
echo.

echo 1 - Systemstats Web Server
echo 2 - Systemstats Script Server
echo 3 - Ange milj”variabler (p† klienter)

echo.
set /p installation=Ditt val: 

IF DEFINED installation (
    goto :installation-set
 ) ELSE ( 
    echo -Du m†ste ange ett val!
    pause >NUL
	cls
    goto :instval
 )
 
:installation-set
IF /I "%installation%"=="1" goto :inst01
IF /I "%installation%"=="2" goto :inst02
IF /I "%installation%"=="3" goto :inst03

echo -Felaktigt val!
pause >NUL
goto :instval


:inst01
cls
echo Systemstats Web Server
echo.
echo Innan du installerar Systemstats Web Server m†ste IIS och PHP vara installerat!
echo.
if exist "c:\inetpub" goto :inetpubexistweb
echo IIS verkar inte vara installerat!
echo.
echo Du beh”ver installera IIS och PHP innan du installerar Systemstats Web Server.
echo Se kapitel 1 i installationsmanalen för mer info.
echo.
:iisweb
set /P iis=Vill du forts„tta?[J/N]?
if /I "%iis%" EQU "J" goto :inetpubexistweb
if /I "%iis%" EQU "N" goto :instval
goto :iisweb
echo.

:inetpubexistweb
echo Ange s”kv„g f”r Systemstats Web Server:
echo.
set "web_path=C:\inetpub\wwwroot"
set /p "web_path=Web-root - [ENTER] f”r standard [%web_path%]: "
echo Vald s”kv„g: %web_path%
echo.

echo Tryck [ENTER] f”r att installera Systemstats Web Server p† angiven s”kv„g...
pause >NUL
robocopy.exe "%~dp0WebServer" %web_path% /MIR

echo Kopiering utf”rd!

echo.
:shareweb
set /P shareweb=Vill du dela ut webbs”kv„gen i n„tverket?[J/N]?
if /I "%shareweb%" EQU "J" goto :sharewebconfirmed
if /I "%shareweb%" EQU "N" goto :webfinish
goto :shareweb

:sharewebconfirmed
echo.
echo Tryck [ENTER] f”r att p†b”rja mapputdelning...
pause >NUL
net share wwwroot$=%web_path% /GRANT:alla,FULL


:webfinish
echo.
echo Installation av Systemstats Web Server klar!
pause >NUL
"%~dp0Dok\AfterSetupWeb.txt"

goto :instval


:inst02
cls
echo Systemstats Script Server
echo.
if exist "c:\inetpub" goto :inetpubexistscr

echo Systemstats Web Server verkar inte vara installerad!
echo.
echo Vi rekommenderar att du installerar den innan du installerar Systemstats Script Server.
echo.
:iisscr
set /P iis=Vill du forts„tta?[J/N]?
if /I "%iis%" EQU "J" goto :inetpubexistscr
if /I "%iis%" EQU "N" goto :instval
goto :iisscr

:inetpubexistscr
echo Ange s”kv„gar f”r:
echo.

set "script_path=C:\Systemstats\Scripts"
set /p "script_path=Skript - [ENTER] f”r standard [%script_path%]: "
echo Vald s”kv„g: %script_path%
echo.
set "module_path=C:\Systemstats\Scripts\Modules"
set /p "module_path=Moduler - [ENTER] f”r standard [%module_path%]: "
echo Vald s”kv„g: %module_path%
echo.
set "log_path=C:\Systemstats\Logs"
set /p "log_path=Loggar - [ENTER] f”r standard [%log_path%]: "
echo Vald s”kv„g: %log_path%
echo.
set "export_path=C:\Systemstats\Export"
set /p "export_path=Export av loggar - [ENTER] f”r standard [%export_path%]: "
echo Vald s”kv„g: %export_path%
echo.

echo Tryck [ENTER] f”r att installera Systemstats p† ovan angivna s”kv„gar...
pause >NUL
robocopy.exe "%~dp0Scripts" %script_path% /MIR
robocopy.exe "%~dp0Modules" %module_path% /MIR
robocopy.exe "%~dp0Logs" %log_path% /MIR
robocopy.exe "%~dp0Export" %export_path% /MIR
echo Installation utf”rd!
echo.

echo Tryck [ENTER] f”r att p†b”rja utdelning av mappar...
pause >NUL
echo.
net share scripts$=%script_path% /GRANT:alla,FULL
net share logs$=%log_path% /GRANT:alla,FULL
net share export$=%export_path% /GRANT:alla,FULL

echo Tryck [ENTER] f”r att ange milj”variabler p† servern...
pause >NUL
echo.

echo Ange kundens namn (ej mellanslag eller specialtecken)
set /p cst=Ditt val: 
echo.

echo Ange ditt kundnummer (frivilligt)
set /p cnr=Ditt val: 
echo.

set "web=C:\inetpub\wwwroot\systemstats"
echo Ange s”kv„gen till systemstasts mappen i web-roten
set /p "web=Web-root - [ENTER] f”r standard [%web%]: "
echo Vald s”kv„g: %web%

echo.

echo S„tter variabeln stsscr till \\%computername%\scripts$
setx stsscr \\%computername%\scripts$ /M
echo.

echo S„tter variabeln stsmod till \\%computername%\scripts$\Modules
setx stsmod \\%computername%\scripts$\Modules /M
echo.

echo S„tter variabeln stslog till \\%computername%\logs$
setx stslog \\%computername%\logs$ /M
echo.

echo S„tter variabeln stsexp till \\%computername%\export$
setx stsexp \\%computername%\export$ /M
echo.

echo S„tter variabeln stsadm till \\%computername%\scripts$\Modules\SystemstatsAdmin
setx stsadm \\%computername%\scripts$\Modules\SystemstatsAdmin /M
echo.

echo S„tter variabeln stsweb till %web%
setx stsweb %web% /M
echo.

echo S„tter variabeln stssrv till %computername%
setx stssrv %computername% /M
echo.

echo S„tter variabeln stscst till %cst%
setx stscst %cst% /M
echo.

echo S„tter variabeln stscnr till %cnr%
setx stscnr %cnr% /M
echo.

echo Byter namn p† filen Customer.cmd till %cst%.cmd
ren %module_path%\Customer.cmd %cst%.cmd 
echo.

echo Installation av Systemstats Script Server klar!
pause >NUL
"%~dp0Dok\AfterSetup.txt"

goto :instval


:inst03
cls
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

goto :instval