echo off
cls
REM ##################################################################################
REM ##     				  Systemstats © 2016-2018 Göteborgs Stad  					##
REM ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					##
REM ##################################################################################

REM S„tter r„tt codepage
REM chcp 1252
Title Systemstats Admin - Publika datorer - %username%@%computername%

cls
:start

color 1f
set "pub="
set "comp="
set "desc="
set "change="
set "delete="

cls
echo Hantera publik dator
echo Vad vill du g”ra?
echo.
echo Tryck 1 f”r att markera en dator som publik
echo Tryck 2 f”r att avmarkera en dator som publik
echo Tryck 3 f”r att „ndra beskrivning f”r en publik dator
echo.
set /p pub=Ditt val: 

IF DEFINED pub (
    goto :pub-set
 ) ELSE ( 
    echo -Du m†ste ange ett val!
    pause >NUL
	cls
    goto :start
 )
 
:pub-set
IF /I "%pub%"=="avbryt" goto :exit
IF /I "%pub%"=="1" goto :pub1
IF /I "%pub%"=="2" goto :pub2
IF /I "%pub%"=="3" goto :pub3

echo -Felaktigt val!
pause >NUL
set "pub="
goto :start


:pub1
echo.
set /p comp=Ange datorns namn: 
IF DEFINED comp (
    goto :comp-pub1-set
 ) ELSE ( 
    echo -Du m†ste ange en dator!
    pause >NUL
	cls
    goto :start
 )

:comp-pub1-set
IF EXIST %stsmod%\PUBLIC\%comp%.txt (
goto :comp-pub1-exist
) ELSE (
goto :comp-pub1-comment-check
) 

:comp-pub1-exist
echo.
echo Datorn du angav „r redan markerad som publik!
pause >NUL
goto :start


:comp-pub1-comment-check
IF EXIST %stsmod%\COMMENTS\%comp%.txt (
goto :comp-pub1-comment-exist
) ELSE (
goto :comp-pub1-not-exist
) 


:comp-pub1-comment-exist
echo.
echo Det finns en kommentar angiven f”r datorn. Du m†ste ta bort den innan datorn kan markeras som publik.
pause >NUL
goto :start

:comp-pub1-not-exist
echo.
set /p desc=Ange datorns beskrivning: 
IF DEFINED desc (
    goto :desc-pub1-set
 ) ELSE ( 
    echo -Du m†ste ange en beskrivning!
    pause >NUL
	cls
    goto :start
 )

:desc-pub1-set
echo %desc%> %stsmod%\PUBLIC\%comp%.txt
echo.
echo Datorn „r nu markerad som publik och kommer att dyka upp i tabellen f”r publika datorer vid n„sta inloggning!
REM echo En publik dators beskrivning ers„tter en eventuell kommentar i tabellen.
pause >NUL
goto :start


:pub2
echo.
set /p comp=Ange datorns namn: 
IF DEFINED comp (
    goto :comp-pub2-set
 ) ELSE ( 
    echo -Du m†ste ange en dator!
    pause >NUL
	cls
    goto :start
 )

:comp-pub2-set
IF EXIST %stsmod%\PUBLIC\%comp%.txt (
goto :comp-pub2-exist
) ELSE (
goto :comp-pub2-not-exist
) 

:comp-pub2-not-exist
echo.
echo Datorn du angav „r inte markerad som publik!
pause >NUL
goto :start

:comp-pub2-exist
set /p desc=<"%stsmod%\PUBLIC\%comp%.txt"
echo.
echo Datorn du angav „r idag markerad som:
echo %desc%
echo.
echo Vill du avmarkera den som publik?
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
del /Q %stsmod%\PUBLIC\%comp%.txt >NUL 2>NUL
del /Q %stslog%\Public\%comp%.csv >NUL 2>NUL

:desc-pub2-set
echo.
echo Datorn „r nu borttagen som publik!
pause >NUL
goto :start


:pub3
echo.
set /p comp=Ange datorns namn: 
IF DEFINED comp (
    goto :comp-pub3-set
 ) ELSE ( 
    echo -Du m†ste ange en dator!
    pause >NUL
	cls
    goto :start
 )

:comp-pub3-set
IF EXIST %stsmod%\PUBLIC\%comp%.txt (
goto :comp-pub3-exist
) ELSE (
goto :comp-pub3-not-exist
) 

:comp-pub3-not-exist
echo.
echo Datorn du angav „r inte markerad som publik!
pause >NUL
goto :start

:comp-pub3-exist
set /p desc=<"%stsmod%\PUBLIC\%comp%.txt"
echo.
echo Datorn du angav „r idag markerad som:
echo %desc%
echo.
echo Vill du „ndra detta?
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
set /p desc=Ange datorns nya beskrivning: 
IF DEFINED desc (
    goto :desc-pub3-set
 ) ELSE ( 
    echo -Du m†ste ange en beskrivning!
    pause >NUL
	cls
    goto :start
 )

:desc-pub3-set
echo %desc%> %stsmod%\PUBLIC\%comp%.txt
echo.
echo Datorns beskrivning „r nu „ndrad!
pause >NUL
goto :start


:exit
goto :start
