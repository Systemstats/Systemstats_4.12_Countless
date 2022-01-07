echo off
cls
REM ##################################################################################
REM ##     				  Systemstats © 2016-2018 Göteborgs Stad  					##
REM ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					##
REM ##################################################################################

echo "ver1.0" > %userprofile%\Desktop\itlager.txt
%~d1
cd "%~p1"

REM call \\%ssa_path%\RunSystemstats.bat
call %stsmod%\SystemstatsAdmin\RunSystemstats.bat