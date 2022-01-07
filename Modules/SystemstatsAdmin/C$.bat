echo off
cls
REM ##################################################################################
REM ##     				  Systemstats © 2016-2018 Göteborgs Stad  					##
REM ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					##
REM ##################################################################################

REM S„tter r„tt codepage
REM chcp 1252
Title Systemstats Admin - C$ - %username%@%computername%
cls

:start
color 1f
set "comp="
cls
echo Anslut till en dators C:-disk ”ver n„tverket. Detta kr„ver V3-beh”righet samt att datorn „r ig†ng.
echo.
echo Ange namnet p† datorn du vill du ansluta till och tryck ENTER
echo.
set /p comp=Datornamn: 



IF DEFINED comp (
    goto :comp-set
 ) ELSE ( 
    echo -Du m†ste ange ett datornamn!
    pause >NUL
	cls
    goto :start
 )
 
:comp-set
start \\%comp%\c$

set "comp="
goto :start