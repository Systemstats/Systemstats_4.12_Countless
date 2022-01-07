echo off
cls
REM ##################################################################################
REM ##     				  Systemstats © 2016-2021 Göteborgs Stad  					##
REM ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					##
REM ##################################################################################

title Systemstats Admin - Enter password...
::!CARLOS_HIDE_INPUT.BAT
::Code by Carlos on AMBNT 2013-03-10
::Subject: Getkey without Display the input.
::Thread started by jeb
::Note: My edits/additions are not indented 3 spaces
::******************************************************************
::Modified for Systemstats by Mattias From & Jonatan Csok 2017-08-09
::******************************************************************


:start   
   color 1f
   cls
   :HInput
   ::Version 3.0     
   SetLocal DisableDelayedExpansion
Echo Ange l”senord:
   Set "Line="
   Rem Save 0x08 character in BS variable
   For /F %%# In (
   '"Prompt;$H&For %%# in (1) Do Rem"'
   ) Do Set "BS=%%#"
   
   :HILoop
   Set "Key="
   For /F "delims=" %%# In (
   'Xcopy /L /W "%~f0" "%~f0" 2^>Nul'
   ) Do If Not Defined Key Set "Key=%%#"
   Set "Key=%Key:~-1%"
   SetLocal EnableDelayedExpansion
   If Not Defined Key Goto :HIEnd
   If %BS%==^%Key% (Set /P "=%BS% %BS%" <Nul
   Set "Key="
   If Defined Line Set "Line=!Line:~0,-1!"
   ) Else Set /P "=***" <Nul
   If Not Defined Line (EndLocal &Set "Line=%Key%"
   ) Else For /F delims^=^ eol^= %%# In (
   "!Line!") Do EndLocal &Set "Line=%%#%Key%"
   Goto :HILoop
   
   :HIEnd
   Echo(
REM Echo Your password is '!Line!'
if !Line! == adminpass goto :accessgranted
if !Line! == swordfish goto :accessgranted
cls
color cf
cls
echo Felaktigt l”senord!
PING 1.1.1.1 -n 1 -w 7.0 >NUL
PING 1.1.1.1 -n 1 -w 7.0 >NUL
PING 1.1.1.1 -n 1 -w 7.0 >NUL
PING 1.1.1.1 -n 1 -w 7.0 >NUL
goto :start


   Goto :Eof

	:accessgranted
	echo.
	cls
	echo Startar Systemstats Admin
	echo ...
	
	title Systemstats Admin - Access granted
	echo Du kan st„nga det h„r f”nstret...
	%stsmod%\SystemstatsAdmin\SystemstatsAdmin.hta
	exit