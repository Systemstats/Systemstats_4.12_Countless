echo off
cls
REM ---------------------------------------------------------------------------------
REM St�nger av echo och rensar sk�rmen
REM ---------------------------------------------------------------------------------

REM #################################################################################
REM ## 			Systemstats Version 4.12 "Countless" - 2022-01-07 				   ##
REM ## 						  � 2016-2021 G�teborgs Stad     					   ##
REM ##   	  	  		Utvecklat av Eddy Hebib & Mattias From		   			   ##
REM ##								Med hj�lp av:								   ##
REM	##	  Jonatan Csok, Jonathan Nordgren & Gustav Aldenbratt & Matteus Westman	   ##
REM #################################################################################

REM ---------------------------------------------------------------------------------
REM S�tter skriptets f�rginst�llningar
REM ---------------------------------------------------------------------------------
color 1f
REM ---------------------------------------------------------------------------------
REM Anger verksamhetens namn och skriptets titel. Undvik specialtecken och nordiska
REM tecken. N�r denna variabel s�tts eller �ndras m�ste du �ven byta namn p� filen 
REM Forvaltning.cmd under module_path s� att den f�r samma namn. Exempelvis "FK.cmd"
REM ---------------------------------------------------------------------------------
set verksamhet=%stscst%
title Systemstats
REM ---------------------------------------------------------------------------------
REM Anger s�kv�g f�r skriptet. M�ste vara en utdelad resurs. Till den skall vanliga 
REM anv�ndare endast ha l�s-beh�righet. OBS! Ange ej \\ f�re servernamnet.
REM ---------------------------------------------------------------------------------
set script_path=%stsscr%
REM ---------------------------------------------------------------------------------
REM S�tter s�kv�g f�r verksamhetsspecifika moduler. M�ste vara en utdelad resurs. 
REM Till den skall vanliga anv�ndare endast ha l�s-beh�righet. OBS! Ange ej \\ f�re 
REM servernamnet.
REM ---------------------------------------------------------------------------------
set module_path=%stsmod%
REM ---------------------------------------------------------------------------------
REM S�tter s�kv�g f�r rappoterna skriptet genererar. M�ste vara en utdelad resurs. 
REM Till den beh�ver vanliga anv�ndare ha �ndra-beh�righet. OBS! Ange ej \\ f�re 
REM servernamnet.
REM ---------------------------------------------------------------------------------
set log_path=%stslog%
REM ---------------------------------------------------------------------------------


REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
REM Laddningsm�tare 33%
REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cls
echo V�lkommen till %verksamhet%!
echo .


REM *********************************************************************************
REM Sparar datorns starttid i variablerna %datestamp% och %timestamp%
REM *********************************************************************************
for /f "tokens=2 delims==" %%a in ('wmic OS Get lastbootuptime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
REM *********************************************************************************
REM Tar bort sekunderna som standard (nyhet i Systemstats 3.0)
REM *********************************************************************************
REM set "datestamp=%YYYY%-%MM%-%DD%" & set "timestamp=%HH%.%Min%.%Sec%" & set "fullstamp=%YYYY%-%MM%-%DD% %HH%.%Min%.%Sec%"
set "datestamp=%YYYY%-%MM%-%DD%" & set "timestamp=%HH%.%Min%" & set "fullstamp=%YYYY%-%MM%-%DD% %HH%.%Min%.%Sec%"


REM *********************************************************************************
REM Sparar tiden rapporten genererades i variablerna %cdatestamp% och %ctimestamp%
REM *********************************************************************************
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
REM *********************************************************************************
REM Tar bort sekunderna som standard (nyhet i Systemstats 3.0)
REM *********************************************************************************
REM set "cdatestamp=%YYYY%-%MM%-%DD%" & set "ctimestamp=%HH%.%Min%.%Sec%" & set "fullstamp=%YYYY%-%MM%-%DD% %HH%.%Min%.%Sec%"
set "cdatestamp=%YYYY%-%MM%-%DD%" & set "ctimestamp=%HH%.%Min%" & set "fullstamp=%YYYY%-%MM%-%DD% %HH%.%Min%.%Sec%"


REM *********************************************************************************
REM Sparar anv�ndarens fullst�ndiga namn i variabeln %fullname%
REM *********************************************************************************
for /f "tokens=2 delims==" %%a in ('wmic netlogin get fullname /value') do (
  set fullname=%%a
)


REM *********************************************************************************
REM Sparar datumet OS installerades i variablerna %instdatestamp% och %insttimestamp%
REM *********************************************************************************
for /f "tokens=2 delims==" %%a in ('wmic OS Get InstallDate /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "instdatestamp=%YYYY%-%MM%-%DD%" & set "insttimestamp=%HH%.%Min%.%Sec%" & set "fullstamp=%YYYY%-%MM%-%DD% %HH%.%Min%.%Sec%"


REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
REM Laddningsm�tare 66%
REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cls
echo V�lkommen till %verksamhet%!
echo ..


REM *********************************************************************************
REM Sparar datorns modell och serienummer i variablerna %model% och %serial%
REM *********************************************************************************
for /F "skip=1 delims=" %%j in ('wmic csproduct get name') do (
  set model=%%j
  goto :DONE2
)
:DONE2
for /F "skip=1 delims=" %%j in ('wmic bios get serialnumber') do (
  set serial=%%j
  goto :DONE
)
:DONE


REM *********************************************************************************
REM Kollar vilken version av Office som �r installerat p� datorn och skriver detta 
REM till variabeln %msover%. Kontrollen utg�r fr�n vilken version av Word som �r
REM installerad. Med andra ord kommer en dator som har Word 2016 men Access 2007
REM att rapporteras in som Office 365.
REM *********************************************************************************
REM IF EXIST "%ProgramFiles(x86)%\Microsoft Office\Office11\WINWORD.exe" SET msover=2003
IF EXIST "%ProgramFiles(x86)%\Microsoft Office\Office12\WINWORD.exe" SET msover=Office 2007
IF EXIST "%ProgramFiles(x86)%\Microsoft Office\Office14\WINWORD.exe" SET msover=Office 2010
IF EXIST "%ProgramFiles(x86)%\Microsoft Office\Office15\WINWORD.exe" SET msover=Office 2013
IF EXIST "%ProgramFiles(x86)%\Microsoft Office\root\Office16\WINWORD.exe" SET msover=Office 365


REM *********************************************************************************
REM Sparar OS-version i variabeln %osver%
REM OBS! V�rdet som anges i variabeln osver f�r inte inneh�lla blanksteg!
REM Testat med citattecken, men d� f�ljer dessa med i csv-filen... :S /MF161208
REM *********************************************************************************
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" set osver=Windows_10
if "%osver%" == "Windows_10" goto :Win-10-ver
if "%version%" == "6.3" set osver=Windows_8.1
if "%version%" == "6.2" set osver=Windows_8
if "%version%" == "6.1" set osver=Windows_7
if "%version%" == "6.0" set osver=Windows_Vista
if "%version%" == "5.2" set osver=Windows_Server_2003
if "%version%" == "5.1" set osver=Windows_XP
if "%version%" == "5.0" set osver=Windows_2000
REM if "%version%" == "4.0" set osver=Windows_NT_4.0
REM if "%version%" == "3.51" set osver=Windows_NT_3.51
REM if "%version%" == "3.5" set osver=Windows_NT_3.5
REM if "%version%" == "3.1" set osver=Windows_NT_3.1
goto :endofversioncheck
REM *********************************************************************************
REM Om Windows 10: F�rtydligar vilken version av Windows 10 datorn k�r.
REM *********************************************************************************
:Win-10-ver
for /f "tokens=6-6 delims=. " %%i in ('ver') do set w10version=%%i
if "%w10version%" == "19044" set osver=Windows_10_21H2
if "%w10version%" == "19042" set osver=Windows_10_20H2
if "%w10version%" == "19041" set osver=Windows_10_2004
if "%w10version%" == "18363" set osver=Windows_10_1909
if "%w10version%" == "18362" set osver=Windows_10_1903
if "%w10version%" == "17763" set osver=Windows_10_1809
if "%w10version%" == "17134" set osver=Windows_10_1803
if "%w10version%" == "16299" set osver=Windows_10_1709
if "%w10version%" == "15063]" set osver=Windows_10_1703
if "%w10version%" == "14393]" set osver=Windows_10_1607
if "%w10version%" == "10586]" set osver=Windows_10_1511
if "%w10version%" == "10240]" set osver=Windows_10_1507
:endofversioncheck


REM *********************************************************************************
REM Sparar den totala m�ngen utrymme p� C: i variabeln %total_space% och avrundar det
REM sedan till GB som sparas i variabeln %total_space_gb%
REM Ny modul! /MF200116
REM *********************************************************************************
for /f "tokens=2 delims==" %%a in ('wmic logicaldisk c: get size /value') do (
  set total_space=%%a
)
SET total_space_gb=Total diskstorlek: %total_space:~0,-10% GB


REM *********************************************************************************
REM Sparar m�ngden ledigt utrymme p� C: i variabeln %free_space% och avrundar det
REM sedan till MB som sparas i variabeln %free_space_mb%
REM *********************************************************************************
FOR /F "usebackq tokens=3" %%s IN (`DIR C:\ /-C /-O /W`) DO (
    SET free_space=%%s
)
SET free_space_mb=%FREE_SPACE:~0,-6%


REM *********************************************************************************
REM Sparar datorns totala m�ng RAM i variabeln %ram_raw% och avrundar det sedan till
REM GB genom att dela med 1024. Resultatet sparas i variabeln %ram_gigabyte%
REM *********************************************************************************
for /F "skip=1" %%j in ('wmic computersystem get TotalPhysicalMemory') do (
  set ram_raw=%%j
  goto :ramchk_done
)
:ramchk_done
SET ram_divide=%ram_raw:~0,-3%
SET num2=1024
SET /a sum1=%ram_divide% / %num2%
SET ram_gigabyte=%sum1:~0,-3% GB


REM *********************************************************************************
REM Sparar datorns processormodell i variabeln %cpu_name%. Sparar �ven antalet k�rnor
REM i %cpu_cores% och antalet logiska processorer i cpu_threads.
REM *********************************************************************************
for /F "skip=1 delims=" %%j in ('wmic cpu get name') do (
  set cpu_name=%%j
  goto :CPU-NAME-DONE
)
:CPU-NAME-DONE

for /F "skip=1 delims=" %%j in ('wmic cpu get NumberOfCores') do (
  set cpu_cores=%%j
  goto :CPU-CORES-DONE
)
:CPU-CORES-DONE

for /F "skip=1 delims=" %%j in ('wmic cpu get NumberOfLogicalProcessors') do (
  set cpu_threads=%%j
  goto :CPU-THREADS-DONE
)
:CPU-THREADS-DONE


REM *********************************************************************************
REM Sparar eventuell kommentar fr�n textfil med datorns namn i variabeln %kommentar%
REM *********************************************************************************
set kommentarexist=nej
IF EXIST "%module_path%\COMMENTS\%computername%.txt" (
set /p kommentar=<"%module_path%\COMMENTS\%computername%.txt"
) ELSE (
goto :nocomments
)
set kommentarexist=yes
:nocomments


REM *********************************************************************************
REM Sparar anv�ndarnamnet i variabeln %acc%
REM *********************************************************************************
SET "acc=%username%"


REM ���������������������������������������������������������������������������������
REM Anropar det verksmahetsspecifika skriptet
REM ���������������������������������������������������������������������������������
call %module_path%\%verksamhet%.cmd
REM ���������������������������������������������������������������������������������


REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
REM Laddningsm�tare 99%
REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cls
echo V�lkommen till %verksamhet%!
echo ...


REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Skickar nedan angivna anv�ndare till testrapporten. De hoppar mao �ver den
REM vanliga rapporten f�r verksamhetens samtliga datorer och hamnar i en egen tabell.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM if "%username%" == "lulululalala" goto :testrapport


REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Kontrollerar om datorn �r satt som i lager och skickar den i s� fall till
REM en egen rapportfunktion som �ndrar f�rgen f�r texten LAGER till gr�n.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if "%fullname%" == "LAGER" goto :lager


REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Kontrollerar om datorn �r markerad f�r leverans och skickar den i s� fall till
REM en egen rapportfunktion som �ndrar f�rgen f�r texten LEVERANS till orange.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if "%levtrue%" == "yuu" goto :lev


REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Kontrollerar om datorn �r publik och skickar den i s� fall till
REM en egen rapportfunktion som �ndrar f�rgen f�r texten f�r anv�ndaren till lila.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if exist "%log_path%\Public\%computername%.csv" goto :publicinbigtable


REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Kontrollerar om det finns en fellogg p� datorn och skickar den i s� fall till
REM en egen rapportfunktion. OBS! Denna check m�ste k�ras efter kontrollerna f�r
REM lager och leverans.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if exist "%log_path%\History\%computername%.txt" goto :fault


REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM EXPORTERAR RAPPORT - Verksamhetens samtliga datorer
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Variablerna skriptet tagit fram sparas i en semikolon-
REM separerad .csv-fil p� script-servern. P� servern g�r ett schemalagt script
REM var 5:e minut. Filen sl�r ihop .csv-filerna fr�n samtliga datorer till en och 
REM skickar den till webbservern.
REM echo %rum_raw%
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if %kommentarexist% == yes goto :k1001
if %garanti% == ja echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�000000�>%fullname%</font><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Leitz Icon� onClick=�printNameLeitz('%fullname%')� class=�apps�><img src=�assets/images/Leitz1.png�></a><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Dymo Mobile Labeler� onClick=�printNameDymo('%fullname%')� class=�apps�><img src=�assets/images/Dymo.png�></a></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� target=�blank�>%computername%</a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�04B404�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
if %garanti% == nej echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�000000�>%fullname%</font><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Leitz Icon� onClick=�printNameLeitz('%fullname%')� class=�apps�><img src=�assets/images/Leitz1.png�></a><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Dymo Mobile Labeler� onClick=�printNameDymo('%fullname%')� class=�apps�><img src=�assets/images/Dymo.png�></a></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� target=�blank�>%computername%</a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�FF0000�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
goto :k1002
:k1001
if %garanti% == ja echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�000000�>%fullname%</font><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Leitz Icon� onClick=�printNameLeitz('%fullname%')� class=�apps�><img src=�assets/images/Leitz1.png�></a><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Dymo Mobile Labeler� onClick=�printNameDymo('%fullname%')� class=�apps�><img src=�assets/images/Dymo.png�></a></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%kommentar%� target=�blank�><font color=�B4AE2A�>%computername%</font></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�04B404�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
if %garanti% == nej echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�000000�>%fullname%</font><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Leitz Icon� onClick=�printNameLeitz('%fullname%')� class=�apps�><img src=�assets/images/Leitz1.png�></a><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Dymo Mobile Labeler� onClick=�printNameDymo('%fullname%')� class=�apps�><img src=�assets/images/Dymo.png�></a></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%kommentar%� target=�blank�><font color=�B4AE2A�>%computername%</font></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�FF0000�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
:k1002
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


goto :noproblems
:fault
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM EXPORTERAR RAPPORT - Verksamhetens samtliga datorer - Datorer med fellogg
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Variablerna skriptet tagit fram sparas i en semikolon-
REM separerad .csv-fil p� script-servern. P� servern g�r ett schemalagt script
REM var 5:e minut. Filen sl�r ihop .csv-filerna fr�n samtliga datorer till en och 
REM skickar den till webbservern.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if %kommentarexist% == yes goto :k1003
if %garanti% == ja echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�000000�>%fullname%</font><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Leitz Icon� onClick=�printNameLeitz('%fullname%')� class=�apps�><img src=�assets/images/Leitz1.png�></a><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Dymo Mobile Labeler� onClick=�printNameDymo('%fullname%')� class=�apps�><img src=�assets/images/Dymo.png�></a></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� target=�blank�>%computername%</a><a href=�data/history/%computername%.txt� title=�Datorn har en fellogg!� target=�blank�><img src=�assets/images/error.jpg�></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�04B404�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
if %garanti% == nej echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�000000�>%fullname%</font><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Leitz Icon� onClick=�printNameLeitz('%fullname%')� class=�apps�><img src=�assets/images/Leitz1.png�></a><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Dymo Mobile Labeler� onClick=�printNameDymo('%fullname%')� class=�apps�><img src=�assets/images/Dymo.png�></a></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� target=�blank�>%computername%</a><a href=�data/history/%computername%.txt� title=�Datorn har en fellogg!� target=�blank�><img src=�assets/images/error.jpg�></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�FF0000�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
goto :k1004
:k1003
if %garanti% == ja echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�000000�>%fullname%</font></a></span><a href=�mailto:%epost%� title=�%epost%�></span><img src=�assets/images/mail.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Leitz Icon� onClick=�printNameLeitz('%fullname%')� class=�apps�><img src=�assets/images/Leitz1.png�></a><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Dymo Mobile Labeler� onClick=�printNameDymo('%fullname%')� class=�apps�><img src=�assets/images/Dymo.png�></a></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%kommentar%� target=�blank�><font color=�B4AE2A�>%computername%</font></a><a href=�data/history/%computername%.txt� title=�Datorn har en fellogg!� target=�blank�><img src=�assets/images/error.jpg�></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�04B404�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
if %garanti% == nej echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�000000�>%fullname%</font><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Leitz Icon� onClick=�printNameLeitz('%fullname%')� class=�apps�><img src=�assets/images/Leitz1.png�></a><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Dymo Mobile Labeler� onClick=�printNameDymo('%fullname%')� class=�apps�><img src=�assets/images/Dymo.png�></a></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%kommentar%� target=�blank�><font color=�B4AE2A�>%computername%</font></a><a href=�data/history/%computername%.txt� title=�Datorn har en fellogg!� target=�blank�><img src=�assets/images/error.jpg�></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�FF0000�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
:k1004
goto :r2end

:noproblems
:r2end
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

goto :nolager
:lager
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM EXPORTERAR RAPPORT - Verksamhetens samtliga datorer - Datorer i lager
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Variablerna skriptet tagit fram sparas i en semikolon-
REM separerad .csv-fil p� script-servern. P� servern g�r ett schemalagt script
REM var 5:e minut. Filen sl�r ihop .csv-filerna fr�n samtliga datorer till en och 
REM skickar den till webbservern.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if exist "%log_path%\History\%computername%.txt" goto :lagerwithfault

if %kommentarexist% == yes goto :k1005
if %garanti% == ja echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�04B404�>%fullname%</font></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� target=�blank�>%computername%</a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�04B404�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
if %garanti% == nej echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�04B404�>%fullname%</font></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� target=�blank�>%computername%</a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�FF0000�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
goto :k1006
:k1005
if %garanti% == ja echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�04B404�>%fullname%</font></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%kommentar%� target=�blank�><font color=�B4AE2A�>%computername%</font></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�04B404�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
if %garanti% == nej echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�04B404�>%fullname%</font></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%kommentar%� target=�blank�><font color=�B4AE2A�>%computername%</font></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�FF0000�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
:k1006
goto :nolager

:lagerwithfault

if %kommentarexist% == yes goto :k1007
if %garanti% == ja echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�04B404�>%fullname%</font></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� target=�blank�>%computername%</a><a href=�data/history/%computername%.txt� title=�Datorn har en fellogg!� target=�blank�><img src=�assets/images/error.jpg�></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�04B404�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
if %garanti% == nej echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�04B404�>%fullname%</font></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� target=�blank�>%computername%</a><a href=�data/history/%computername%.txt� title=�Datorn har en fellogg!� target=�blank�><img src=�assets/images/error.jpg�></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�FF0000�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
goto :k1008
:k1007
if %garanti% == ja echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�04B404�>%fullname%</font></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%kommentar%� target=�blank�><font color=�B4AE2A�>%computername%</font></a><a href=�data/history/%computername%.txt� title=�Datorn har en fellogg!� target=�blank�><img src=�assets/images/error.jpg�></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�04B404�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
if %garanti% == nej echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�04B404�>%fullname%</font></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%kommentar%� target=�blank�><font color=�B4AE2A�>%computername%</font></a><a href=�data/history/%computername%.txt� title=�Datorn har en fellogg!� target=�blank�><img src=�assets/images/error.jpg�></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�FF0000�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
:k1008
goto :nolager

:nolager
:r3end
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
goto :nolev
:lev
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM EXPORTERAR RAPPORT - Verksamhetens samtliga datorer - Datorer f�r leverans
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Variablerna skriptet tagit fram sparas i en semikolon-
REM separerad .csv-fil p� script-servern. P� servern g�r ett schemalagt script
REM var 5:e minut. Filen sl�r ihop .csv-filerna fr�n samtliga datorer till en och 
REM skickar den till webbservern.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if exist "%log_path%\History\%computername%.txt" goto :levwithfault

if %kommentarexist% == yes goto :k1009
if %garanti% == ja echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�FFBF00�>%fullname%</font></td><td>%acc%</td><td>%ank%</td><td><a href=�data/details/%computername%.txt� target=�blank�>%computername%</a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�04B404�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
if %garanti% == nej echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�FFBF00�>%fullname%</font></td><td>%acc%</td><td>%ank%</td><td><a href=�data/details/%computername%.txt� target=�blank�>%computername%</a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�FF0000�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
goto :k1010
:k1009
if %garanti% == ja echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�FFBF00�>%fullname%</font></td><td>%acc%</td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%kommentar%� target=�blank�><font color=�B4AE2A�>%computername%</font></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�04B404�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
if %garanti% == nej echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�FFBF00�>%fullname%</font></td><td>%acc%</td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%kommentar%� target=�blank�><font color=�B4AE2A�>%computername%</font></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�FF0000�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
:k1010
goto :nolev

:levwithfault
if %kommentarexist% == yes goto :k1011
if %garanti% == ja echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�FFBF00�>%fullname%</font></td><td>%acc%</td><td>%ank%</td><td><a href=�data/details/%computername%.txt� target=�blank�>%computername%</a><a href=�data/history/%computername%.txt� title=�Datorn har en fellogg!� target=�blank�><img src=�assets/images/error.jpg�></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�04B404�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
if %garanti% == nej echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�FFBF00�>%fullname%</font></td><td>%acc%</td><td>%ank%</td><td><a href=�data/details/%computername%.txt� target=�blank�>%computername%</a><a href=�data/history/%computername%.txt� title=�Datorn har en fellogg!� target=�blank�><img src=�assets/images/error.jpg�></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�FF0000�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
goto :k1012
:k1011
if %garanti% == ja echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�FFBF00�>%fullname%</font></td><td>%acc%</td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%kommentar%� target=�blank�><font color=�B4AE2A�>%computername%</font></a><a href=�data/history/%computername%.txt� title=�Datorn har en fellogg!� target=�blank�><img src=�assets/images/error.jpg�></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�04B404�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
if %garanti% == nej echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�FFBF00�>%fullname%</font></td><td>%acc%</td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%kommentar%� target=�blank�><font color=�B4AE2A�>%computername%</font></a><a href=�data/history/%computername%.txt� title=�Datorn har en fellogg!� target=�blank�><img src=�assets/images/error.jpg�></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�FF0000�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
:k1012
goto :nolev

:nolev
:r4end
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

goto :nopublicinbigtable
:publicinbigtable
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM EXPORTERAR RAPPORT - Verksamhetens samtliga datorer - Publika datorer
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Variablerna skriptet tagit fram sparas i en semikolon-
REM separerad .csv-fil p� script-servern. P� servern g�r ett schemalagt script
REM var 5:e minut. Filen sl�r ihop .csv-filerna fr�n samtliga datorer till en och 
REM skickar den till webbservern.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if exist "%log_path%\History\%computername%.txt" goto :publicwithfault
if %garanti% == ja echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�000000�>%fullname%</font><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Leitz Icon� onClick=�printNameLeitz('%fullname%')� class=�apps�><img src=�assets/images/Leitz1.png�></a><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Dymo Mobile Labeler� onClick=�printNameDymo('%fullname%')� class=�apps�><img src=�assets/images/Dymo.png�></a></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%publicdesc%� target=�blank�><font color=�CC3399�>%computername%</font></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�04B404�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
if %garanti% == nej echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�000000�>%fullname%</font><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Leitz Icon� onClick=�printNameLeitz('%fullname%')� class=�apps�><img src=�assets/images/Leitz1.png�></a><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Dymo Mobile Labeler� onClick=�printNameDymo('%fullname%')� class=�apps�><img src=�assets/images/Dymo.png�></a></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%publicdesc%� target=�blank�><font color=�CC3399�>%computername%</font></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�FF0000�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
goto :r5end
:publicwithfault
if %garanti% == ja echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�000000�>%fullname%</font><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Leitz Icon� onClick=�printNameLeitz('%fullname%')� class=�apps�><img src=�assets/images/Leitz1.png�></a><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Dymo Mobile Labeler� onClick=�printNameDymo('%fullname%')� class=�apps�><img src=�assets/images/Dymo.png�></a></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%publicdesc%� target=�blank�><font color=�CC3399�>%computername%</font></a><a href=�data/history/%computername%.txt� title=�Datorn har en fellogg!� target=�blank�><img src=�assets/images/error.jpg�></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�04B404�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
if %garanti% == nej echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td><font color=�000000�>%fullname%</font><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Leitz Icon� onClick=�printNameLeitz('%fullname%')� class=�apps�><img src=�assets/images/Leitz1.png�></a><a id=�printButtonLabel� title=�Skriv ut namnetikett p� Dymo Mobile Labeler� onClick=�printNameDymo('%fullname%')� class=�apps�><img src=�assets/images/Dymo.png�></a></td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� title=�%publicdesc%� target=�blank�><font color=�CC3399�>%computername%</font></a><a href=�data/history/%computername%.txt� title=�Datorn har en fellogg!� target=�blank�><img src=�assets/images/error.jpg�></a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a><a id=�printButtonLabel� title=�Skriv ut h�rdvaruspecifikation p� Leitz Icon� onClick=�printDatorSpec('%computername%')� class=�apps�><img src=�assets/images/Leitz2.png�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td><font color=�FF0000�>%levdate%</font><!--Garanti%garanti%--></td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\%computername%.csv
goto :r5end

:nopublicinbigtable
:r5end
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

goto :skiptest
:testrapport
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM EXPORTERAR RAPPORT - Test
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Variablerna skriptet tagit fram sparas i en semikolon-
REM separerad .csv-fil p� script-servern. P� servern g�r ett schemalagt script
REM var 5:e minut. Filen sl�r ihop .csv-filerna fr�n samtliga datorer till en och 
REM skickar den till webbservern.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo "<td>%datestamp%</td><td>%timestamp%</td><td>%cdatestamp%</td><td>%ctimestamp%</td><td>%fullname%</td><td><a href=�data/details/%acc%.txt� target=�blank�>%acc%</a></td><td>%ank%</td><td><a href=�data/details/%computername%.txt� target=�blank�>%computername%</a><a href=�apps.php?computer=%computername%.csv� target=�blank�><img src=�assets/images/apps.jpg� class=�apps�></a></td><td>%model%</td><td>%serial%</td><td>%osver%</td><td><a title=�%total_space_gb%�><font color=�#000000�>%free_space_mb%</font></a></td><td>%instdatestamp%</td><td>%msover%</td><td>%levdate%</td><td>%theaftno%</td><td>%ram_gigabyte%</td><td>%cpu_name%</td><td>%cpu_cores%</td><td>%cpu_threads%</td>"> %log_path%\Test\%computername%.csv
:skiptest


REM ���������������������������������������������������������������������������������
REM Anropar skript f�r IT-personal. F�r utkopiering av genv�gar till Systemstats mm.
REM ���������������������������������������������������������������������������������
if "%username%" == "ittekniker" goto :IT
goto :EndOfIT
:IT
call %module_path%\IT.cmd
:EndOfIT
REM ���������������������������������������������������������������������������������


REM ���������������������������������������������������������������������������������
REM Anropar skriptet f�r eventuella uppmappningar. Detta k�rs p� slutet f�r att de
REM andra funktionerna i skriptet inte skall halta om detta steg fastnar pga fel
REM autensieringsuppgifter etc. H�r kan �ven i: och s: mappas om IS skript failar.
REM ���������������������������������������������������������������������������������
REM if "%username%" == "lulululalala" goto :Map
goto :DontMap
:Map
call %module_path%\Mappningar.cmd
:DontMap