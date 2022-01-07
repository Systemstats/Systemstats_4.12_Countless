echo off
cls
REM ##################################################################################
REM ##     				  Systemstats © 2016-2018 Göteborgs Stad  					##
REM ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					##
REM ##################################################################################

REM S„tter r„tt codepage
REM chcp 1252
Title Systemstats Admin - Felhistorik - %username%@%computername%

cls
:start
color 1f
set "n="
cls
echo Vilken dator vill du hantera? Skriv 1 f”r %computername% (den h„r datorn).
echo.
set /p n=Datornamn: 

IF DEFINED n (
    goto :starcheck
 ) ELSE ( 
    echo -Du m†ste ange ett datornamn!
    pause >NUL
    goto :start
 )

:starcheck
if %n% == * goto :starconfirmed

if %n% == 1 set "n=%computername%"
IF EXIST "%stslog%\History\%n%.txt" (
goto :exist
) ELSE (
goto :dontexist
)

:exist
color 2f
cls
echo Det finns en fellogg p† datorn.
echo Vad vill du g”ra?
echo.
echo 1. ™ppna loggen
echo 2. Ta bort loggen

set /p logexist=Ditt val: 

IF DEFINED logexist (
    goto :logexistset
 ) ELSE ( 
    color cf
    echo -Du m†ste ange ett val!
    pause >NUL
	cls
    goto :exist
 )

:logexistset
IF /I "%logexist%"=="1" goto :openlog
IF /I "%logexist%"=="2" goto :deletelog
goto :badlogchoice

:badlogchoice
color cf
echo -Felaktigt val!
pause >NUL
set "create="
set "logexist="
goto :exist

:openlog
notepad "%stslog%\History\%n%.txt"
set "create="
set "logexist="
call %stsscr%\Systemstats.cmd
goto :start

:deletelog
del "%stslog%\History\%n%.txt"
call %stsscr%\Systemstats.cmd
cls
echo Loggen borttagen!
Timeout 3 >NUL
set "create="
set "logexist="
goto :start

:dontexist
color e0
cls
echo Datorn du angav finns inte i felhistoriken. T„nk p† att ange det exakta datornamnet utan blanksteg.
echo Vill du skapa en fellogg p† dator: %n%? J/N
echo.
set /p create=Ditt val: 

IF DEFINED create (
    goto :createset
 ) ELSE ( 
    color cf
    echo -Du m†ste ange ett val!
    pause >NUL
	cls
    goto :dontexist
 )

:createset
IF /I "%create%"=="J" goto :createconfirmed
IF /I "%create%"=="j" goto :createconfirmed
IF /I "%create%"=="Y" goto :createconfirmed
IF /I "%create%"=="y" goto :createconfirmed
IF /I "%create%"=="N" goto :dontcreate
IF /I "%create%"=="n" goto :dontcreate
goto :badchoice


:dontcreate
set "create="
set "logexist="
goto :start


:badchoice
color cf
echo -Felaktigt val!
pause >NUL
set "create="
set "logexist="
goto :dontexist

:createconfirmed
copy "%stslog%\History\Mall.txt" "%stslog%\History\%n%.txt"
notepad "%stslog%\History\%n%.txt"
set "create="
set "logexist="
call %stsscr%\Systemstats.cmd
goto :start

:starconfirmed
color cf
cls
echo Du kan inte välja alla datorer!
pause >NUL
set "create="
set "logexist="
goto :start
