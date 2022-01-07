@echo off
cls
title Systemstats
REM ***************************************************************************
REM Anropar scriptet
REM Denna kod körs vid inloggning och anropar skriptet. På så vis kör datorn
REM alltid den senaste versionen av skriptet vid inloggning.
REM ***************************************************************************

call %stsscr%\Systemstats.cmd