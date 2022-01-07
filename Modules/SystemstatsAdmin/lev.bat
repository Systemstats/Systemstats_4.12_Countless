echo off
cls
REM ##################################################################################
REM ##     				  Systemstats © 2016-2018 Göteborgs Stad  					##
REM ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					##
REM ##################################################################################

echo "ver1.0" > %userprofile%\Desktop\itleverans.txt
%~d1
cd "%~p1"
call \\sn200af01\scripts$\UPTIME\MODULES\SystemstatsAdmin\RunSystemstats.bat