echo off
cls
REM ##################################################################################
REM ##     				  Systemstats © 2016-2018 Göteborgs Stad  					##
REM ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					##
REM ##################################################################################

REM S„tter r„tt codepage
REM chcp 1252
Title Systemstats Admin - Kommentarer - %username%@%computername%

cls
:start

color 1f
set "com="
set "comp="
set "desc="
set "change="
set "delete="

cls
echo Hantera kommentar f”r dator
echo Vad vill du g”ra?
echo.
echo Tryck 1 f”r att skapa en kommentar
echo Tryck 2 f”r att ta bort en kommentar
echo Tryck 3 f”r att „ndra en kommentar
echo.
set /p com=Ditt val: 

IF DEFINED com (
    goto :com-set
 ) ELSE ( 
    echo -Du m†ste ange ett val!
    pause >NUL
	cls
    goto :start
 )
 
:com-set
IF /I "%com%"=="avbryt" goto :exit
IF /I "%com%"=="1" goto :com1
IF /I "%com%"=="2" goto :com2
IF /I "%com%"=="3" goto :com3

echo -Felaktigt val!
pause >NUL
set "com="
goto :start


:com1
echo.
set /p comp=Ange datorns namn: 
IF DEFINED comp (
    goto :comp-com1-set
 ) ELSE ( 
    echo -Du m†ste ange en dator!
    pause >NUL
	cls
    goto :start
 )

:comp-com1-set
IF EXIST %stsmod%\COMMENTS\%comp%.txt (
goto :comp-com1-exist
) ELSE (
goto :comp-com1-public-check
) 

:comp-com1-exist
echo.
echo Datorn du angav har redan en kommentar!
pause >NUL
goto :start


:comp-com1-public-check
IF EXIST %stsmod%\PUBLIC\%comp%.txt (
goto :comp-com1-public-exist
) ELSE (
goto :comp-com1-not-exist
) 


:comp-com1-public-exist
echo.
echo Datorn du angav „r markerad som publik. Du m†ste avmarkera den som publik om du vill l„gga till en kommentar.
pause >NUL
goto :start

:comp-com1-not-exist
echo.
set /p desc=Ange datorns kommentar: 
IF DEFINED desc (
    goto :desc-com1-set
 ) ELSE ( 
    echo -Du m†ste ange en kommentar!
    pause >NUL
	cls
    goto :start
 )

:desc-com1-set
echo %desc%> %stsmod%\COMMENTS\%comp%.txt
echo.
echo Datorns kommentar „r nu inlagd. Den kommer att dyka upp i tabellen vid n„sta inloggning!
REM echo En publik dators beskrivning ers„tter en eventuell kommentar i tabellen.
pause >NUL
goto :start


:com2
echo.
set /p comp=Ange datorns namn: 
IF DEFINED comp (
    goto :comp-com2-set
 ) ELSE ( 
    echo -Du m†ste ange en dator!
    pause >NUL
	cls
    goto :start
 )

:comp-com2-set
IF EXIST %stsmod%\COMMENTS\%comp%.txt (
goto :comp-com2-exist
) ELSE (
goto :comp-com2-not-exist
) 

:comp-com2-not-exist
echo.
echo Datorn du angav har ingen kommentar!
pause >NUL
goto :start

:comp-com2-exist
set /p desc=<"%stsmod%\COMMENTS\%comp%.txt"
echo.
echo Datorn du angav har f”ljande kommentar:
echo %desc%
echo.
echo Vill ta bort kommentaren?
echo.
echo Tryck 1 f”r ja
echo Tryck 2 f”r att †terg† till huvudmenyn
echo.
set /p delete=Ditt val: 

IF DEFINED delete (
    goto :delete-set
 ) ELSE ( 
    echo -Du m†ste ange ett val!
    pause >NUL
	cls
    goto :start
 )

:delete-set

IF /I "%delete%"=="avbryt" goto :exit
IF /I "%delete%"=="1" goto :delete
IF /I "%delete%"=="2" goto :start

echo -Felaktigt val!
pause >NUL

goto :start

:delete
del /Q %stsmod%\COMMENTS\%comp%.txt >NUL 2>NUL

:desc-com2-set
echo.
echo Kommentaren „r nu borttagen fr†n datorn!
pause >NUL
goto :start


:com3
echo.
set /p comp=Ange datorns namn: 
IF DEFINED comp (
    goto :comp-com3-set
 ) ELSE ( 
    echo -Du m†ste ange en dator!
    pause >NUL
	cls
    goto :start
 )

:comp-com3-set
IF EXIST %stsmod%\COMMENTS\%comp%.txt (
goto :comp-com3-exist
) ELSE (
goto :comp-com3-not-exist
) 

:comp-com3-not-exist
echo.
echo Datorn du angav har ingen kommentar!
pause >NUL
goto :start

:comp-com3-exist
set /p desc=<"%stsmod%\COMMENTS\%comp%.txt"
echo.
echo Datorn du angav har f”ljande kommentar:
echo %desc%
echo.
echo Vill du „ndra denna?
echo.
echo Tryck 1 f”r ja
echo Tryck 2 f”r att †terg† till huvudmenyn
echo.
set /p change=Ditt val: 

IF DEFINED change (
    goto :change-set
 ) ELSE ( 
    echo -Du m†ste ange ett val!
    pause >NUL
	cls
    goto :start
 )

:change-set

IF /I "%change%"=="avbryt" goto :exit
IF /I "%change%"=="1" goto :change
IF /I "%change%"=="2" goto :start

echo -Felaktigt val!
pause >NUL
set "change="
goto :start

:change
echo.
set /p desc=Ange datorns nya kommentar: 
IF DEFINED desc (
    goto :desc-com3-set
 ) ELSE ( 
    echo -Du m†ste ange en kommentar!
    pause >NUL
	cls
    goto :start
 )

:desc-com3-set
echo %desc%> %stsmod%\COMMENTS\%comp%.txt
echo.
echo Datorns kommentar „r nu „ndrad!
pause >NUL
goto :start


:exit
goto :start
