REM ##################################################################################
REM ##     				  Systemstats © 2016-2022 Göteborgs Stad  					##
REM ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					##
REM ##################################################################################

REM ---------------------------------------------------------------------------------
REM Nedan körs specifika kommandon för verksamhetens IT-enhet.
REM ---------------------------------------------------------------------------------


REM *********************************************************************************
REM Kopierar Internetgenvägarna "Systemstats FK", "Systemstats Admin" samt 
REM "Systemstats Uppdatera" till skrivbordet för alla på IT.
REM *********************************************************************************
IF EXIST "%userprofile%\Desktop\Systemstats.url" goto :SystemstatsExist
IF EXIST "%userprofile%\Desktop\Systemstats.url" goto :SystemstatsExist
copy "%module_path%\Systemstats.url" "%userprofile%\Desktop\Systemstats.url" >NUL 2>NUL
:SystemstatsExist
IF EXIST "%userprofile%\Desktop\Systemstats Admin.lnk" goto :SystemstatsAdminExist
copy "%module_path%\Systemstats Admin.lnk" "%userprofile%\Desktop\Systemstats Admin.lnk" >NUL 2>NUL
:SystemstatsAdminExist
IF EXIST "%userprofile%\Desktop\Systemstats Uppdatera.lnk" goto :UpdateExist
copy "%module_path%\Systemstats Uppdatera.lnk" "%userprofile%\Desktop\Systemstats Uppdatera.lnk" >NUL 2>NUL
:UpdateExist


REM *********************************************************************************
REM Nedan är endast aktuellt om man har en Systemstats Mobile/Numb3rs server!
REM Kopierar Internetgenvägarna "Systemstats Mobile" och "Systemstats Numb3rs" till
REM skrivbordet för utvalda användare (telefoniadministratörer). /MF200122
REM *********************************************************************************
if "%username%" == "teladm001" goto :mobilforteckning
goto :exit
:mobilforteckning
IF EXIST "%userprofile%\Desktop\Systemstats Mobile.url" goto :StsmobileExist
copy "%module_path%\Systemstats Mobile.url" "%userprofile%\Desktop\Systemstats Mobile.url" >NUL 2>NUL
:StsmobileExist
IF EXIST "%userprofile%\Desktop\Systemstats Numb3rs.url" goto :Stsnumb3rsExist
copy "%module_path%\Systemstats Numb3rs.url" "%userprofile%\Desktop\Systemstats Numb3rs.url" >NUL 2>NUL
:Stsnumb3rsExist

:exit