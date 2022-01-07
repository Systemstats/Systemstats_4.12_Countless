echo off
cls
REM ##################################################################################
REM ##     				  Systemstats © 2016-2018 Göteborgs Stad  					##
REM ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					##
REM ##################################################################################

REM S„tter r„tt codepage
REM chcp 1252
Title Systemstats Admin - Ta bort dator - %username%@%computername%
REM ---------------------------------------------------------------------------------
REM Sätter sökväg för rappoterna skriptet genererar. Måste vara en utdelad resurs. 
REM Till den behöver vanliga användare ha ändra-behörighet. OBS! Ange ej \\ före 
REM servernamnet.
REM ---------------------------------------------------------------------------------
cls

:start
color 1f
set n=""
cls
REM echo Ta bort dator fr†n Systemstats
echo Vilken dator vill du ta bort? Skriv 1 f”r %computername% (den h„r datorn).
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
if %n% == 1 goto :localhost
if %n% == history goto :history
if %n% == History goto :history
if %n% == HISTORY goto :history
goto :nohistory

REM --------------------------------
REM Anger datorn man kör ifrån som
REM datorn skall tas bort. Körs om
REM man väljer 1 i menyn.
REM --------------------------------
:localhost
set "n=%computername%"
goto :nohistory

:history
REM --------------------------------
REM Listar borttagningsloggar om man
REM skriver "history" som datornamn.
REM --------------------------------
color 3f
cls
echo Systemstats borttagningshistorik f”r datorer:
echo.
dir %stslog%\Details\Deleted\
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
    goto :histchoice
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
start %stslog%\Details\Deleted
goto :history

:nohistory
REM --------------------------------
REM Kollar om datorn som angetts
REM finns i Systemstats-databasen.
REM --------------------------------

IF EXIST "%stslog%\%n%.csv" (
goto :areyousure
) ELSE (
goto :dontexist
)

:dontexist
REM --------------------------------
REM Om datorn som angetts inte
REM finns i Systemstats-databasen.
REM skickas man tillbaka till :start
REM --------------------------------
color cf
cls
echo Datorn du angav finns inte eller har redan tagits bort. T„nk p† att ange det exakta datornamnet utan blanksteg.
pause >NUL
goto :start

:starconfirmed
REM --------------------------------
REM Om man anger * som datornamn tas
REM alla datorer i databasen bort!
REM Denna funktion hindrar en från
REM att göra det och återvänder till
REM :start.
REM --------------------------------
color cf
cls
echo Du f†r inte ta bort alla datorer!
pause >NUL
goto :start

:areyousure
REM --------------------------------
REM Ställer frågan om man verklien
REM vill ta bort datorn.
REM --------------------------------
set choice1=""
cls
echo Vill du verkligen ta bort %n% fr†n Systemstats?
echo.
set /p choice1=J/N: 

IF DEFINED choice1 (
   goto :choice1def
   
 ) ELSE ( 
    cls
    set "choice1="
    goto :areyousure
 )
 
:choice1def
REM --------------------------------
REM Ställer frågan om man verklien
REM vill ta bort datorn.
REM --------------------------------
if %choice1% == J goto :delcsv
if %choice1% == j goto :delcsv
if %choice1% == N goto :start
if %choice1% == n goto :start
goto :areyousure

:delcsv
REM --------------------------------
REM Raderar samtliga loggar på
REM datorn förutom huvudloggen.
REM --------------------------------
color 2f
cls
del /Q "%stslog%\%n%.csv" >NUL 2>NUL
REM del /Q "%stslog%\UI-2\%n%.csv" >NUL 2>NUL
del /Q "%stslog%\Public\%n%.csv" >NUL 2>NUL
del /Q "%stslog%\Special\%n%.csv" >NUL 2>NUL
del /Q "%stslog%\Apps\%n%.csv" >NUL 2>NUL
REM --------------------------------
REM Skapar logg vid borttag av dator
REM från huvudloggen. Tar sedan bort
REM huvudloggen.
REM --------------------------------
copy "%stslog%\Details\%n%.txt" "%stslog%\Details\Deleted\%date%   %n%   Borttagen av %username%.txt" >NUL 2>NUL
del /Q "%stslog%\Details\%n%.txt" >NUL 2>NUL
goto :deleted

:deleted
REM --------------------------------
REM Bekräftar att datorn tagits bort
REM och återvänder till :start.
REM --------------------------------
echo Datorn %n% „r nu borttagen ur Systemstats!
pause >NUL
color 8f
cls
echo T„nk p† att datorn „ven m†ste markeras f”r borttag i Mina Verktyg f”r att parkeras fr†n licenskostnader.
echo Vid skrotning beh”ver datorn „ven markeras som avyttrad i HAMster. Observera att datorn kommer att l„ggas 
echo till i Systemstats p† nytt om en inloggning g”rs (om den inte tagits bort i Mina Verktyg).
pause >NUL
goto :start
