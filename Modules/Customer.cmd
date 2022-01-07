REM ##################################################################################
REM ##     				  Systemstats � 2016-2022 G�teborgs Stad  					##
REM ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					##
REM ##################################################################################

REM ---------------------------------------------------------------------------------
REM Nedan k�rs verksamhetsspecifika moduler. H�r kan du l�gga till egen kod.
REM Det finns �ven flera moduler du kan finna intressanta, men som inte �r p�slagna 
REM som standard. Dessa kan kopieras in fr�n filen %stsmod%\CustomerExtraModules.cmd
REM ---------------------------------------------------------------------------------

REM ******************************************************************************************************
REM HAMster-modul - f�r att l�sa ut leveransdatum och st�ldskyddsnummer samt r�kna ut
REM status f�r datorns garanti.
REM ******************************************************************************************************
REM if "%username%" == "tester" goto :ThereIsAHAMster
REM goto :ThereIsNoHAMster 
:ThereIsAHAMster
REM *********************************************************************************
REM L�ser in datorns leveransdatum fr�n filen "Lev.txt" till variabeln %levdate%
REM *********************************************************************************
FOR /F "usebackq tokens=2" %%s IN (`findstr "%computername% " "%stslog%\HAMster\Lev.txt"`) DO (
    SET levdate=%%s
)
REM *********************************************************************************
REM R�knar fram datumet n�r garantin g�r ut
REM *********************************************************************************
REM if "%username%" == "tester" goto :WarrantyCheck
REM goto :EndOfWarrantyCheck
:WarrantyCheck
REM *********************************************************************************
REM Delar upp variabeln %levdate% i %levyear%, %levmonth% och %levday% samt tar bort
REM skiljetecken (-)
REM *********************************************************************************
SET levyear=%levdate:~0,4%
SET levmonth=%levdate:~5,2%
SET levday=%levdate:~8,2%
REM *********************************************************************************
REM L�gger p� tre �r p� variablen %levyear% och sparar den som %waryear% 
REM *********************************************************************************
set /A waryear=levyear+3
REM *********************************************************************************
REM Sl�r ihop variablerna %waryear%, %levmonth% och %levday% till %warexp% (Garantins
REM utg�ngsdatum) och l�gger till skiljetecken (-)
REM *********************************************************************************
SET warexp=%waryear%-%levmonth%-%levday%
REM *********************************************************************************
REM Delar upp variabeln %warexp% i %warexpyear%, %warexpmonth% och %warexpday% samt 
REM tar bort skiljetecken (-)
REM *********************************************************************************
SET warexpyear=%warexp:~0,4%
SET warexpmonth=%warexp:~5,2%
SET warexpday=%warexp:~8,2%
REM *********************************************************************************
REM Sl�r ihop variablerna %warexpyear%, %warexpmonth% och %warexpday% till 
REM %warexpheltal% (Garantins utg�ngsdatum) s� att det blir ett heltal utan
REM skiljetecken (-)
REM *********************************************************************************
SET warexpheltal=%warexpyear%%warexpmonth%%warexpday%
REM *********************************************************************************
REM Delar upp variabeln %cdatestamp% (current datestamp) i %cyear%, %cmonth% och 
REM %cday% samt tar bort skiljetecken (-)
REM *********************************************************************************
SET cyear=%cdatestamp:~0,4%
SET cmonth=%cdatestamp:~5,2%
SET cday=%cdatestamp:~8,2%
REM *********************************************************************************
REM Sl�r ihop variablerna %cyear%, %cmonth% och %cday% till %cdatestampheltal% 
REM (Dagens datum) s� att det blir ett heltal utan skiljetecken (-)
REM *********************************************************************************
SET cdatestampheltal=%cyear%%cmonth%%cday%
REM *********************************************************************************
REM S�tter variabeln %garanti% till "ja" om %warexpheltal% �r st�rre �n eller lika
REM stor som %cdatestampheltal%.
REM *********************************************************************************
if %warexpheltal% GEQ %cdatestampheltal% SET garanti=ja
REM *********************************************************************************
REM S�tter variabeln %garanti% till "nej" om %warexpheltal% �r mindre �n 
REM %cdatestampheltal%.
REM *********************************************************************************
if %warexpheltal% LSS %cdatestampheltal% SET garanti=nej
REM *********************************************************************************
REM G�r vidare till :EndOfWarrantyCheck om variabeln %garanti% �r "ja" eller "nej".
REM *********************************************************************************
if %garanti% == ja goto :EndOfWarrantyCheck
if %garanti% == nej goto :EndOfWarrantyCheck
REM *********************************************************************************
REM S�tter variabeln %garanti% till "nej" om datorns leveransdatum �r odefinierat
REM Dvs. om datorns ink�psdatum saknas.
REM *********************************************************************************
SET garanti=nej
:EndOfWarrantyCheck
REM *********************************************************************************
REM L�ser in datorns st�ldskyddsnummer fr�n filen "Theaft.txt" till variabeln %theaftno%
REM *********************************************************************************
FOR /F "usebackq tokens=2" %%s IN (`findstr "%computername% " "%stslog%\HAMster\Theaft.txt"`) DO (
    SET theaftno=%%s
)
:ThereIsNoHAMster


REM *********************************************************************************
REM S�tter dator i lager ifall filen "ITLAGER.txt" finns p� skrivbordet.
REM *********************************************************************************
IF EXIST "%userprofile%\Desktop\itlager.txt" goto :lager
goto :nolager
:lager
del "%userprofile%\Desktop\itlager.txt"
SET fullname=LAGER
SET acc=
SET ank=
if "%username%" == "matfro0825" SET ank=MF
:nolager


REM *********************************************************************************
REM S�tter dator i leverans ifall filen "ITLEVERANS.txt" finns p� skrivbordet.
REM *********************************************************************************
IF EXIST "%userprofile%\Desktop\itleverans.txt" goto :leverans
goto :noleverans
:leverans
del "%userprofile%\Desktop\itleverans.txt"

color a
cls
echo -------------------------------------------------------------------------------
echo Fyll i vem datorn skall till (undvik specialtecken)
echo Tryck sedan ENTER
echo -------------------------------------------------------------------------------
set /p levname=Namn: 

IF DEFINED levname (
    goto :levdef
 ) ELSE ( 
    echo -Du m�ste ange ett namn!
    pause >NUL
    goto :leverans
 )
:levdef

cls
echo -------------------------------------------------------------------------------
echo Fyll i n�r medarbetaren b�rjar/n�r datorn skall h�mtas ut. Anv�nd formatet
echo 2017-XX-XX. Kan �ven l�mnas blank.
echo Tryck sedan ENTER
echo -------------------------------------------------------------------------------
set /p levdatum=Datum: 

SET lev=LEVERANS

SET fullname=%lev% - %levname%
SET acc=%levdatum%
SET ank=
SET levtrue=yuu
if "%username%" == "matfro0825" SET ank=MF
color 1f
:noleverans


REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM EXPORTERAR RAPPORT - Datorinformation
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
start %module_path%\Dator.vbs


REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM EXPORTERAR RAPPORT - Kontoinformation 
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
start %module_path%\Konto.vbs


REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM EXPORTERAR RAPPORT - Installerade applikationer 
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM wmic product get name > \\%log_path%\Apps\%computername%.csv
start %module_path%\Apps.vbs


REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM EXPORTERAR RAPPORT - Delade datorer
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Den h�r rapporten tas ut p� samma s�tt som huvudrapporten, men sparar filerna i
REM undermappen "Public". Syftet �r att lista FK:s publika datorer f�r att f� b�ttre
REM koll p� dessa.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

REM *********************************************************************************
REM Sparar datorns beskrivning i variabeln %publicdesc%
REM *********************************************************************************
IF EXIST "%module_path%\PUBLIC\%computername%.txt" (
set /p publicdesc=<"%module_path%\PUBLIC\%computername%.txt"
) ELSE (
goto :notpublic
)

REM echo %publicdesc%
REM pause

:public
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Kontrollerar om datorn �r satt som i lager och skickar den i s� fall till
REM en egen rapportfunktion som �ndrar f�rgen f�r texten p� beskrivning till gr�n.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if "%fullname%" == "LAGER" goto :publiclager
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Kontrollerar om datorn �r markerad f�r leverans och skickar den i s� fall till
REM en egen rapportfunktion som �ndrar f�rgen f�r texten p� beskrivning till orange.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if "%levtrue%" == "yuu" goto :publiclev
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Om datorn varken �r markerad som i lager eller f�r leverans skickas den till
REM standardrapportfunktionen f�r publika datorer.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
goto :publicexport
:publiclager
echo "<a href=�data/details/%computername%.txt� target=�blank�><font color=�CC3399�>%computername%</font></a>;<font color=�04B404�>%publicdesc%</font>;%cdatestamp%;<a href=�data/details/%username%.txt� title=�%fullname% | Signatur: %ank%� target=�blank�>%username%</a>;%model%"> %log_path%\Public\%computername%.csv
goto :notpublic
:publiclev
echo "<a href=�data/details/%computername%.txt� target=�blank�><font color=�CC3399�>%computername%</font></a>;<font color=�FFBF00�>%publicdesc%</font>;%cdatestamp%;<a href=�data/details/%username%.txt� title=�%fullname% | Signatur: %ank%� target=�blank�>%username%</a>;%model%"> %log_path%\Public\%computername%.csv
goto :notpublic
:publicexport
echo "<a href=�data/details/%computername%.txt� target=�blank�><font color=�CC3399�>%computername%</font></a>;%publicdesc%;%cdatestamp%;<a href=�data/details/%username%.txt� title=�%fullname% | %rum%| Ank: %ank%� target=�blank�>%username%</a>;%model%"> %log_path%\Public\%computername%.csv
:notpublic


REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM EXPORTERAR RAPPORT - Specialdatorer
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Den h�r rapporten tas ut p� samma s�tt som huvudrapporten, men sparar filerna i
REM undermappen "Special". Syftet �r att lista FK:s specialdatorer f�r att f� b�ttre
REM koll p� dessa.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM if "%computername%" == "XXXXXXXX" goto :special
goto :notspecial
:special
echo %computername%;%special%;%username%;%model%;%serial%;%adm%> %log_path%\Special\%computername%.csv
:notspecial

