REM ##################################################################################
REM ##     				  Systemstats © 2016-2022 Göteborgs Stad  					##
REM ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					##
REM ##################################################################################

REM ---------------------------------------------------------------------------------
REM Nedan körs verksamhetsspecifika moduler. Här kan du lägga till egen kod.
REM Det finns även flera moduler du kan finna intressanta, men som inte är påslagna 
REM som standard. Dessa kan kopieras in från filen %stsmod%\CustomerExtraModules.cmd
REM ---------------------------------------------------------------------------------

REM ******************************************************************************************************
REM HAMster-modul - för att läsa ut leveransdatum och stöldskyddsnummer samt räkna ut
REM status för datorns garanti.
REM ******************************************************************************************************
REM if "%username%" == "tester" goto :ThereIsAHAMster
REM goto :ThereIsNoHAMster 
:ThereIsAHAMster
REM *********************************************************************************
REM Läser in datorns leveransdatum från filen "Lev.txt" till variabeln %levdate%
REM *********************************************************************************
FOR /F "usebackq tokens=2" %%s IN (`findstr "%computername% " "%stslog%\HAMster\Lev.txt"`) DO (
    SET levdate=%%s
)
REM *********************************************************************************
REM Räknar fram datumet när garantin går ut
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
REM Lägger på tre år på variablen %levyear% och sparar den som %waryear% 
REM *********************************************************************************
set /A waryear=levyear+3
REM *********************************************************************************
REM Slår ihop variablerna %waryear%, %levmonth% och %levday% till %warexp% (Garantins
REM utgångsdatum) och lägger till skiljetecken (-)
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
REM Slår ihop variablerna %warexpyear%, %warexpmonth% och %warexpday% till 
REM %warexpheltal% (Garantins utgångsdatum) så att det blir ett heltal utan
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
REM Slår ihop variablerna %cyear%, %cmonth% och %cday% till %cdatestampheltal% 
REM (Dagens datum) så att det blir ett heltal utan skiljetecken (-)
REM *********************************************************************************
SET cdatestampheltal=%cyear%%cmonth%%cday%
REM *********************************************************************************
REM Sätter variabeln %garanti% till "ja" om %warexpheltal% är större än eller lika
REM stor som %cdatestampheltal%.
REM *********************************************************************************
if %warexpheltal% GEQ %cdatestampheltal% SET garanti=ja
REM *********************************************************************************
REM Sätter variabeln %garanti% till "nej" om %warexpheltal% är mindre än 
REM %cdatestampheltal%.
REM *********************************************************************************
if %warexpheltal% LSS %cdatestampheltal% SET garanti=nej
REM *********************************************************************************
REM Går vidare till :EndOfWarrantyCheck om variabeln %garanti% är "ja" eller "nej".
REM *********************************************************************************
if %garanti% == ja goto :EndOfWarrantyCheck
if %garanti% == nej goto :EndOfWarrantyCheck
REM *********************************************************************************
REM Sätter variabeln %garanti% till "nej" om datorns leveransdatum är odefinierat
REM Dvs. om datorns inköpsdatum saknas.
REM *********************************************************************************
SET garanti=nej
:EndOfWarrantyCheck
REM *********************************************************************************
REM Läser in datorns stöldskyddsnummer från filen "Theaft.txt" till variabeln %theaftno%
REM *********************************************************************************
FOR /F "usebackq tokens=2" %%s IN (`findstr "%computername% " "%stslog%\HAMster\Theaft.txt"`) DO (
    SET theaftno=%%s
)
:ThereIsNoHAMster


REM *********************************************************************************
REM Sätter dator i lager ifall filen "ITLAGER.txt" finns på skrivbordet.
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
REM Sätter dator i leverans ifall filen "ITLEVERANS.txt" finns på skrivbordet.
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
    echo -Du m†ste ange ett namn!
    pause >NUL
    goto :leverans
 )
:levdef

cls
echo -------------------------------------------------------------------------------
echo Fyll i n„r medarbetaren b”rjar/n„r datorn skall h„mtas ut. Anv„nd formatet
echo 2017-XX-XX. Kan „ven l„mnas blank.
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
REM Den här rapporten tas ut på samma sätt som huvudrapporten, men sparar filerna i
REM undermappen "Public". Syftet är att lista FK:s publika datorer för att få bättre
REM koll på dessa.
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
REM Kontrollerar om datorn är satt som i lager och skickar den i så fall till
REM en egen rapportfunktion som ändrar färgen för texten på beskrivning till grön.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if "%fullname%" == "LAGER" goto :publiclager
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Kontrollerar om datorn är markerad för leverans och skickar den i så fall till
REM en egen rapportfunktion som ändrar färgen för texten på beskrivning till orange.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if "%levtrue%" == "yuu" goto :publiclev
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Om datorn varken är markerad som i lager eller för leverans skickas den till
REM standardrapportfunktionen för publika datorer.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
goto :publicexport
:publiclager
echo "<a href=£data/details/%computername%.txt£ target=£blank£><font color=£CC3399£>%computername%</font></a>;<font color=£04B404£>%publicdesc%</font>;%cdatestamp%;<a href=£data/details/%username%.txt£ title=£%fullname% | Signatur: %ank%£ target=£blank£>%username%</a>;%model%"> %log_path%\Public\%computername%.csv
goto :notpublic
:publiclev
echo "<a href=£data/details/%computername%.txt£ target=£blank£><font color=£CC3399£>%computername%</font></a>;<font color=£FFBF00£>%publicdesc%</font>;%cdatestamp%;<a href=£data/details/%username%.txt£ title=£%fullname% | Signatur: %ank%£ target=£blank£>%username%</a>;%model%"> %log_path%\Public\%computername%.csv
goto :notpublic
:publicexport
echo "<a href=£data/details/%computername%.txt£ target=£blank£><font color=£CC3399£>%computername%</font></a>;%publicdesc%;%cdatestamp%;<a href=£data/details/%username%.txt£ title=£%fullname% | %rum%| Ank: %ank%£ target=£blank£>%username%</a>;%model%"> %log_path%\Public\%computername%.csv
:notpublic


REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM EXPORTERAR RAPPORT - Specialdatorer
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Den här rapporten tas ut på samma sätt som huvudrapporten, men sparar filerna i
REM undermappen "Special". Syftet är att lista FK:s specialdatorer för att få bättre
REM koll på dessa.
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM if "%computername%" == "XXXXXXXX" goto :special
goto :notspecial
:special
echo %computername%;%special%;%username%;%model%;%serial%;%adm%> %log_path%\Special\%computername%.csv
:notspecial

