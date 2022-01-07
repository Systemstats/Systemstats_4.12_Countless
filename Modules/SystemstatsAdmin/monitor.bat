echo off
cls
REM ##################################################################################
REM ##     				  Systemstats © 2016-2020 Göteborgs Stad  					##
REM ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					##
REM ##################################################################################

REM Skript för att inventera skärmar! /MF180215
REM Omgjort för Corona-krisen! /MF200403
REM Justerat för att täcka hela hemarbetsplatsen. /MF200427
REM Justerat för att täcka alla externa arbetsplatser. /MF200526
REM Lagt till en borttagsfunktion (val 2). Även lagt till kontrollfunktion för serienumret. /MF200904
REM S„tter r„tt codepage
REM chcp 1252
Title Systemstats Admin - Extern arbetsplats - %username%@%computername%


REM ---------------------------------------------------------------------------------
REM Anger sökväg för monitor-filerna. Måste vara en utdelad resurs.
REM Tilldela lämpliga rättigheter. OBS! Ange ej \\ före servernamnet.
REM ---------------------------------------------------------------------------------
set monitor_path=%stslog%\Monitor
set ssa_path=%stsmod%\SystemstatsAdmin


cls
:start
color 1f
set "inout="
set "corona="
set "displayname="
set "account="
set "model="
set "serial="
set "theaft="
set "remserial="
set "remconfirm="
cls


echo Systemstats Admin - Extern arbetsplats
echo.
echo Vad vill du g”ra?
echo.
echo Tryck 1 f”r att registrera en enhet f”r l†n
echo Tryck 2 f”r att ta bort en †terl„mnad enhet
echo.
set /p inout=Ditt val: 

IF DEFINED inout (
    goto :inout-set
 ) ELSE ( 
    echo -Du m†ste ange ett val!
	pause >NUL
	cls
    goto :start
 )
 
:inout-set
IF /I "%inout%"=="avbryt" goto :exit
IF /I "%inout%"=="1" goto :begin
IF /I "%inout%"=="2" goto :remove

echo -Felaktigt val!
pause >NUL
goto :start

:begin


:corona
cls
echo Systemstats Admin - Extern arbetsplats - Registrera enhet f”r l†n
echo.
set /p corona=G„ller det hemarbete under Corona-krisen? (Ja/Nej): 

IF DEFINED corona (
    goto :corona-set
 ) ELSE ( 
    echo -Du m†ste svara p† fr†gan!
    pause >NUL
	cls
    goto :corona
 )
:corona-set

:displayname
cls
echo Systemstats Admin - Extern arbetsplats - Registrera enhet f”r l†n
echo.
set /p displayname=Ange anv„ndarens namn: 

IF DEFINED displayname (
    goto :displayname-set
 ) ELSE ( 
    echo -Du m†ste ange en anv„ndare!
    pause >NUL
	cls
    goto :displayname
 )
:displayname-set

:account
cls
echo Systemstats Admin - Extern arbetsplats - Registrera enhet f”r l†n
echo.
set /p account=Ange anv„ndarens AD-konto: 

IF DEFINED account (
    goto :account-set
 ) ELSE ( 
    echo -Du m†ste ange ett AD-konto!
    pause >NUL
	cls
    goto :account
 )
:account-set

:source
cls
echo Systemstats Admin - Extern arbetsplats - Registrera enhet f”r l†n
echo.
echo Ange ett av f”ljande alternativ:
echo.
echo Tryck 1 f”r att v„lja en enhet fr†n v†rt lager
echo Tryck 2 f”r att v„lja en enhet fr†n anv„ndarens kontor

echo.
set /p source=Ditt val: 

IF DEFINED source (
    goto :source-set
 ) ELSE ( 
    echo -Du m†ste ange ett val!
	pause >NUL
	cls
    goto :source
 )
 
:source-set
IF /I "%source%"=="avbryt" goto :exit
IF /I "%source%"=="1" goto :source1
IF /I "%source%"=="2" goto :source2

echo -Felaktigt val!
pause >NUL
goto :source

:source1
set source="L"
goto :sourceend

:source2
set source="K"
goto :sourceend

:sourceend

:model
cls
echo Systemstats Admin - Extern arbetsplats - Registrera enhet f”r l†n
echo.
set /p model=Ange enhetens modell: 

IF DEFINED model (
    goto :model-set
 ) ELSE ( 
    echo -Du m†ste ange en modell!
    pause >NUL
	cls
    goto :model
 )
:model-set

:serial
set "serial="
cls
echo Systemstats Admin - Extern arbetsplats - Registrera enhet f”r l†n
echo.
set /p serial=Ange enhetens serienummer: 

IF DEFINED serial (
    goto :serial-set
 ) ELSE ( 
    echo -Du m†ste ange ett serienummer!
    pause >NUL
	cls
    goto :serial
 )
:serial-set
IF EXIST "%stslog%\Monitor\%serial%.csv" (
echo -Enheten finns redan i f”rteckningen! Kontrollera serienumret.
pause >NUL
goto :serial
) ELSE (
goto :theaft
) 

:theaft
REM Nedan rad hoppar över stöldnummer-funktionen
goto :theaft-set

cls
echo Systemstats Admin - Extern arbetsplats - Registrera enhet f”r l†n
echo.
set /p theaft=Ange enhetens st”ldskyddsnummer (ej obligatoriskt): 

IF DEFINED theaft (
    goto :theaft-set
 ) ELSE ( 
    goto :theaft-set
 )
:theaft-set

echo "<a title=£Utlämnad av %username%£>%date%</a>;%corona%;%displayname%;%account%;%source%;%model%;%serial%" > "%monitor_path%\%serial%.csv"
echo.
echo Registrerat!
pause 

goto :start


:remove

:remserial
set "remserial="
cls
echo Systemstats Admin - Extern arbetsplats - Ta bort †terl„mnad enhet
echo.
set /p remserial=Ange enhetens serienummer: 

IF DEFINED remserial (
    goto :remserial-set
 ) ELSE ( 
    echo -Du m†ste ange ett serienummer!
    pause >NUL
	cls
    goto :remserial
 )
:remserial-set
IF EXIST "%stslog%\Monitor\%remserial%.csv" (
goto :remconfirm
) ELSE (
echo -Enheten finns inte i f”rteckningen! Kontrollera serienumret.
pause >NUL
goto :remserial
) 

:remconfirm
set "remconfirm="
cls
echo Systemstats Admin - Extern arbetsplats - Ta bort †terl„mnad enhet
echo.
echo Bekr„fta borttag av %remserial%
echo.
echo Tryck 1 f”r att ta bort enheten
echo Tryck 2 f”r att avbryta
echo.
set /p remconfirm=Ditt val: 

IF DEFINED remconfirm (
    goto :remconfirm-set
 ) ELSE ( 
    echo -Du m†ste ange ett val!
	pause >NUL
	cls
    goto :remconfirm
 )
 
:remconfirm-set
IF /I "%remconfirm%"=="avbryt" goto :exit
IF /I "%remconfirm%"=="1" goto :remconfirmed
IF /I "%remconfirm%"=="2" goto :exit

echo -Felaktigt val!
pause >NUL
goto :remconfirm

:remconfirmed
del /Q "%stslog%\Monitor\%remserial%.csv" >NUL 2>NUL
echo Enheten med serienummer %remserial% „r nu borttagen!
pause >NUL
goto :start


:exit
goto :start
