echo off
cls
REM ##################################################################################
REM ##     				  Systemstats © 2016-2018 Göteborgs Stad  					##
REM ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					##
REM ##################################################################################

REM S„tter r„tt codepage
REM chcp 1252
Title Systemstats Admin - BBS - %username%@%computername%


REM ---------------------------------------------------------------------------------
REM Anger sökväg för bbs-filerna. Måste vara en utdelad resurs.
REM Tilldela lämpliga rättigheter. OBS! Ange ej \\ före servernamnet.
REM ---------------------------------------------------------------------------------
set bbs_path=\\%stssrv%\logs$\Uptime_Export\BBS
set bbs_archive_path=%stslog%\BBS-Archive



cls
:start
color 1f
set "bbs="
cls
echo Vilken anslagstavla vill du hantera?
echo.
echo Tryck 1 f”r Gul         (Generell beh”righet f”r alla p† IT)
echo Tryck 2 f”r Bl†         (Kr„ver beh”righet)
echo Tryck 3 f”r Gr”n        (Kr„ver beh”righet)
echo Tryck 4 f”r Rosa        (Kr„ver beh”righet)
echo Tryck 5 f”r IPDok       (Kr„ver beh”righet)
echo Tryck 6 f”r Ansvar      (Generell beh”righet f”r alla p† IT)
echo Tryck 7 f”r Nummer      (Generell beh”righet f”r alla p† IT)
echo Tryck 8 f”r Receptionen (Generell beh”righet f”r alla p† IT)
echo Tryck 9 f”r Safebox     (Kr„ver beh”righet)
echo.
set /p bbs=Ditt val: 



IF DEFINED bbs (
    goto :bbs-set
 ) ELSE ( 
    echo -Du m†ste ange ett val!
    pause >NUL
	cls
    goto :start
 )
 
:bbs-set
IF /I "%bbs%"=="avbryt" goto :exit
IF /I "%bbs%"=="1" goto :bbs1
IF /I "%bbs%"=="2" goto :bbs2
IF /I "%bbs%"=="3" goto :bbs3
IF /I "%bbs%"=="4" goto :bbs4
IF /I "%bbs%"=="5" goto :bbs5
IF /I "%bbs%"=="6" goto :bbs6
IF /I "%bbs%"=="7" goto :bbs7
IF /I "%bbs%"=="8" goto :bbs8
IF /I "%bbs%"=="9" goto :bbs9
IF /I "%bbs%"=="history" goto :history

echo -Felaktigt val!
pause >NUL
set "bbs="
goto :start

:bbs1
notepad "%bbs_path%\Yellow.txt"
set hour=%time:~0,2%
set minute=%time:~3,2%
set second=%time:~6,2%
copy %bbs_path%\Yellow.txt "%bbs_archive_path%\Yellow   %date%   %hour%.%minute%.%second%   Modifierad av %username%@%computername%.txt" >NUL 2>NUL
set "bbs="
set "hour="
set "minute="
set "second="
goto :start

:bbs2
notepad "%bbs_path%\Blue.txt"
set hour=%time:~0,2%
set minute=%time:~3,2%
set second=%time:~6,2%
copy %bbs_path%\Blue.txt "%bbs_archive_path%\Blue     %date%   %hour%.%minute%.%second%   Modifierad av %username%@%computername%.txt" >NUL 2>NUL
set "bbs="
set "hour="
set "minute="
set "second="
goto :start

:bbs3
notepad "%bbs_path%\Green.txt"
set hour=%time:~0,2%
set minute=%time:~3,2%
set second=%time:~6,2%
copy %bbs_path%\Green.txt "%bbs_archive_path%\Green    %date%   %hour%.%minute%.%second%   Modifierad av %username%@%computername%.txt" >NUL 2>NUL
set "bbs="
set "hour="
set "minute="
set "second="
goto :start

:bbs4
notepad "%bbs_path%\Pink.txt"
set hour=%time:~0,2%
set minute=%time:~3,2%
set second=%time:~6,2%
copy %bbs_path%\Pink.txt "%bbs_archive_path%\Pink     %date%   %hour%.%minute%.%second%   Modifierad av %username%@%computername%.txt" >NUL 2>NUL
set "bbs="
set "hour="
set "minute="
set "second="
goto :start

:bbs5
notepad "%bbs_path%\IPDOC.txt"
set hour=%time:~0,2%
set minute=%time:~3,2%
set second=%time:~6,2%
copy %bbs_path%\IPDOC.txt "%bbs_archive_path%\IPDOC    %date%   %hour%.%minute%.%second%   Modifierad av %username%@%computername%.txt" >NUL 2>NUL
set "bbs="
set "hour="
set "minute="
set "second="
goto :start

:bbs6
notepad "%bbs_path%\Ansvar.txt"
set hour=%time:~0,2%
set minute=%time:~3,2%
set second=%time:~6,2%
copy %bbs_path%\Ansvar.txt "%bbs_archive_path%\Ansvar    %date%   %hour%.%minute%.%second%   Modifierad av %username%@%computername%.txt" >NUL 2>NUL
set "bbs="
set "hour="
set "minute="
set "second="
goto :start

:bbs7
notepad "%bbs_path%\Nummer.txt"
set hour=%time:~0,2%
set minute=%time:~3,2%
set second=%time:~6,2%
copy %bbs_path%\Nummer.txt "%bbs_archive_path%\Nummer    %date%   %hour%.%minute%.%second%   Modifierad av %username%@%computername%.txt" >NUL 2>NUL
set "bbs="
set "hour="
set "minute="
set "second="
goto :start

:bbs8
notepad "%bbs_path%\Receptionen.txt"
set hour=%time:~0,2%
set minute=%time:~3,2%
set second=%time:~6,2%
copy %bbs_path%\Receptionen.txt "%bbs_archive_path%\Receptionen    %date%   %hour%.%minute%.%second%   Modifierad av %username%@%computername%.txt" >NUL 2>NUL
set "bbs="
set "hour="
set "minute="
set "second="
goto :start

:bbs9
notepad "%bbs_path%\Safebox.php"
set "bbs="
goto :start

:history
REM --------------------------------
REM Listar borttagningsloggar om man
REM skriver "history" som val.
REM --------------------------------
color 3f
cls
echo Systemstats redigeringshistorik f”r BBS:
echo.
dir %bbs_archive_path%\
echo.

:histchoice
REM --------------------------------
REM Ställer frågan om man vill öppna
REM mappen för borttagsloggar. eller
REM återvända till :start
REM --------------------------------
set choice2=""
echo.
echo Tryck 1 f”r att ”ppna loggmappen
echo Tryck 2 f”r att †terv„nda till huvudmenyn
echo.
set /p choice2=Ange ditt val och tryck ENTER: 

IF DEFINED choice2 (
   goto :choice2def
   
 ) ELSE ( 
    cls
    set "choice2="
	cls
    goto :history
 )
 
:choice2def
REM --------------------------------
REM Om ja öppnas mappen för
REM borttagsloggar. Om nej skickas 
REM man tillbaka till :start.
REM --------------------------------
if %choice2% == 1 goto :openhistpath
if %choice2% == 2 goto :start
cls
goto :history

:openhistpath
REM --------------------------------
REM Öppnar mappen för borttagsloggar
REM --------------------------------
start %bbs_archive_path%\
goto :history

:exit
set "bbs="
goto :start
