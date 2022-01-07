copy "%stslog%\*.csv" "%stsexp%\Systemstats.csv"
copy "%stslog%\Public\*.csv" "%stsexp%\Public.csv"
copy "%stslog%\Special\*.csv" "%stsexp%\Special.csv"
copy "%stslog%\Monitor\*.csv" "%stsexp%\Monitors.csv"
REM copy "%stslog%\Test\*.csv" "%stsexp%\Test.csv"
REM copy "%stslog%\Size\*.csv" "%stsexp%\Size.csv"



powershell -executionPolicy bypass -file "c:\Systemstats\Export\PrepCSV.ps1" 
call "%stsexp%\export-details-to-web.cmd"