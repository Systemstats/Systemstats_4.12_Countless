@echo off
cls
title Systemstats
REM ***************************************************************************
REM Anropar scriptet
REM Denna kod k�rs vid inloggning och anropar skriptet. P� s� vis k�r datorn
REM alltid den senaste versionen av skriptet vid inloggning.
REM ***************************************************************************

call %stsscr%\Systemstats.cmd