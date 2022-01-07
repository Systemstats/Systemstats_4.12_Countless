# Detta script rensar csv-filerna från blankrader samt fixar nordiska tecken och specialtecken. Sedan dumpas det nya csv-filer på www-rooten. /MF170503
# OBS! Filen måste vara i encodingen "UTF-8-BOM"!

# Publika & delade datorer
# Följande rad fixar ÅÄÖ/specialtecken problematiken från CMD/BATCH.
##Get-Content "C:\Systemstats\Export\Public.csv" | % {$_ -replace '"', ''}  | % {$_ -replace '£', '"'} | % {$_ -replace '†', "å"} | % {$_ -replace '„', "ä"} | % {$_ -replace '”', "ö"} | % {$_ -replace 'Ã¶', "ö"} | % {$_ -replace '', "Å"} | % {$_ -replace 'Ž', "Ä"} | % {$_ -replace '™', "Ö"} | % {$_ -replace '', "ü"} | % {$_ -replace "‚", 'é'} | Out-File "C:\Systemstats\Export\Public-Nordic.csv" -en UTF8
# Följande rad tar bort specialtecknet som skapas i slutet av csv-filen.
##Get-Content "C:\Systemstats\Export\Public-Nordic.csv" | Where{$_ -notmatch ""} | Out-File "C:\Systemstats\Web\htdocs\data\Public.csv" -en UTF8
#Get-Content "C:\Systemstats\Export\Public-Nordic.csv" | Where{$_ -notmatch ""} | Out-File "\\sn200af01\dev$\SystemstatsFK\new-version-lnx\data\PUBLIC.csv" -en UTF8
# Följande rader tar bort den sista blankraden.
##$File = 'C:\Systemstats\Web\htdocs\data\Public.csv'
##$Newtext = (Get-Content -Path $File -Raw) -replace "(?s)`r`n\s*$"
##[system.io.file]::WriteAllText($File,$Newtext)

# Verksamhetens samtliga ADM-datorer
# Följande rad fixar ÅÄÖ/specialtecken problematiken från CMD/BATCH.
Get-Content "C:\Systemstats\Export\Systemstats.csv" | % {$_ -replace '"', ''}  | % {$_ -replace '£', '"'} | % {$_ -replace '†', "å"} | % {$_ -replace 'Ã¥', "å"} | % {$_ -replace '„', "ä"} | % {$_ -replace 'Ã¤', "ä"} | % {$_ -replace '”', "ö"} | % {$_ -replace 'Ã¶', "ö"} | % {$_ -replace '', "Å"} | % {$_ -replace 'Ž', "Ä"} | % {$_ -replace '™', "Ö"} | % {$_ -replace 'Ã–', "Ö"} | % {$_ -replace '', "ü"} | % {$_ -replace "‚", 'é'} | % {$_ -replace "Ã©", 'é'} | Out-File "C:\Systemstats\Export\Systemstats-Nordic.csv" -en UTF8
# Följande rad tar bort specialtecknet som skapas i slutet av csv-filen.
Get-Content "C:\Systemstats\Export\Systemstats-Nordic.csv" | Where{$_ -notmatch ""} | Out-File "C:\Systemstats\Web\htdocs\data\Systemstats.csv" -en UTF8
# Följande rader tar bort den sista blankraden.
$File = 'C:\Systemstats\Web\htdocs\data\Systemstats.csv'
$Newtext = (Get-Content -Path $File -Raw) -replace "(?s)`r`n\s*$"
[system.io.file]::WriteAllText($File,$Newtext)

# Specialdatorer & servrar 
# Följande rad fixar ÅÄÖ/specialtecken problematiken från CMD/BATCH.
##Get-Content "C:\Systemstats\Export\Special.csv" | % {$_ -replace '"', ''}  | % {$_ -replace '£', '"'} | % {$_ -replace '†', "å"} | % {$_ -replace '„', "ä"} | % {$_ -replace '”', "ö"} | % {$_ -replace '', "Å"} | % {$_ -replace 'Ž', "Ä"} | % {$_ -replace '™', "Ö"} | % {$_ -replace '', "ü"} | % {$_ -replace "‚", 'é'} | Out-File "C:\Systemstats\Export\Special-Nordic.csv" -en UTF8
# Följande rad tar bort specialtecknet som skapas i slutet av csv-filen.
##Get-Content "C:\Systemstats\Export\Special-Nordic.csv" | Where{$_ -notmatch ""} | Out-File "C:\Systemstats\Web\htdocs\data\Special.csv" -en UTF8
#Get-Content "C:\Systemstats\Export\Special-Nordic.csv" | Where{$_ -notmatch ""} | Out-File "\\sn200af01\dev$\SystemstatsFK\new-version-lnx\data\SPECIAL.csv" -en UTF8
# Följande rader tar bort den sista blankraden.
##$File = 'C:\Systemstats\Web\htdocs\data\Special.csv'
##$Newtext = (Get-Content -Path $File -Raw) -replace "(?s)`r`n\s*$"
##[system.io.file]::WriteAllText($File,$Newtext)

# Monitors (Skärminventering lager)
# Följande rad fixar ÅÄÖ/specialtecken problematiken från CMD/BATCH.
##Get-Content "C:\Systemstats\Export\Monitors.csv" | % {$_ -replace '"', ''}  | % {$_ -replace '£', '"'} | % {$_ -replace '†', "å"} | % {$_ -replace '„', "ä"} | % {$_ -replace '”', "ö"} | % {$_ -replace '', "Å"} | % {$_ -replace 'Ž', "Ä"} | % {$_ -replace '™', "Ö"} | % {$_ -replace '', "ü"} | % {$_ -replace "‚", 'é'} | % {$_ -replace 'Antal=', ''} | Out-File "C:\Systemstats\Export\Monitors-Nordic.csv" -en UTF8
# Följande rad tar bort specialtecknet som skapas i slutet av csv-filen.
##Get-Content "C:\Systemstats\Export\Monitors-Nordic.csv" | Where{$_ -notmatch ""} | Out-File "C:\Systemstats\Web\htdocs\data\inventory\Monitors.csv" -en UTF8
# Följande rader tar bort den sista blankraden.
##$File = 'C:\Systemstats\Web\htdocs\data\inventory\Monitors.csv'
##$Newtext = (Get-Content -Path $File -Raw) -replace "(?s)`r`n\s*$"
##[system.io.file]::WriteAllText($File,$Newtext)

# Test
# Följande rad fixar ÅÄÖ/specialtecken problematiken från CMD/BATCH.
##Get-Content "C:\Systemstats\Export\Test.csv" | % {$_ -replace '"', ''}  | % {$_ -replace '£', '"'} | % {$_ -replace '†', "å"} | % {$_ -replace '„', "ä"} | % {$_ -replace '”', "ö"} | % {$_ -replace '', "Å"} | % {$_ -replace 'Ž', "Ä"} | % {$_ -replace '™', "Ö"} | % {$_ -replace '', "ü"} | % {$_ -replace "‚", 'é'} | Out-File "C:\Systemstats\Export\Test-Nordic.csv" -en UTF8
# Följande rad tar bort specialtecknet som skapas i slutet av csv-filen.
##Get-Content "C:\Systemstats\Export\Test-Nordic.csv" | Where{$_ -notmatch ""} | Out-File "C:\Systemstats\Web\htdocs\data\Test.csv" -en UTF8
#Get-Content "C:\Systemstats\Export\Test-Nordic.csv" | Where{$_ -notmatch ""} | Out-File "\\sn200af01\dev$\SystemstatsFK\new-version-lnx\data\TEST.csv" -en UTF8

# Size
# Följande rad fixar ÅÄÖ/specialtecken problematiken från CMD/BATCH.
##Get-Content "C:\Systemstats\Export\Size.csv" | % {$_ -replace '"', ''}  | % {$_ -replace '£', '"'} | % {$_ -replace '†', "å"} | % {$_ -replace '„', "ä"} | % {$_ -replace '”', "ö"} | % {$_ -replace '', "Å"} | % {$_ -replace 'Ž', "Ä"} | % {$_ -replace '™', "Ö"} | % {$_ -replace '', "ü"} | % {$_ -replace "‚", 'é'} | Out-File "C:\Systemstats\Export\Size-Nordic.csv" -en UTF8
# Följande rad tar bort specialtecknet som skapas i slutet av csv-filen.
##Get-Content "C:\Systemstats\Export\Size-Nordic.csv" | Where{$_ -notmatch ""} | Out-File "C:\Systemstats\Web\htdocs\data\Size.csv" -en UTF8
# Följande rader tar bort den sista blankraden.
##$File = 'C:\Systemstats\Web\htdocs\data\Size.csv'
##$Newtext = (Get-Content -Path $File -Raw) -replace "(?s)`r`n\s*$"
##[system.io.file]::WriteAllText($File,$Newtext)

# Subnets
# Följande rad rensar subnets filen från översta raden och skickar den till www-rooten.
##Get-Content "C:\Systemstats\Export\Network\Subnet.csv" | % {$_ -replace '"', ''} | % {$_ -replace 'Site', ''} | % {$_ -replace 'Name', ''} | % {$_ -replace 'Location', ''} | Out-File "C:\Systemstats\Export\Network\Subnet-Clean.csv" -en UTF8
##Get-Content "C:\Systemstats\Export\Network\Subnet-Clean.csv" | Where{$_ -notmatch "#TYPE Selected.Microsoft.ActiveDirectory.Management.ADReplicationSubnet"} | Out-File "C:\Systemstats\Web\htdocs\data\network\Subnet.csv" -en UTF8
# Följande rader tar bort den sista blankraden.
##$File = 'C:\Systemstats\Web\htdocs\data\network\Subnet.csv'
##$Newtext = (Get-Content -Path $File -Raw) -replace "(?s)`r`n\s*$"
##[system.io.file]::WriteAllText($File,$Newtext)

# SuperSearch
# Följande rad gör om SuperSearch.xml till UTF8 encoding, rensar bort "Postgatan 10, " och "Extern arbetsplats" och skickar den till www-rooten.
Get-Content "C:\Systemstats\Export\SuperSearch.xml" | % {$_ -replace 'Postgatan 10, ', ''} | % {$_ -replace 'Extern arbetsplats', 'Ext'} | Out-File "C:\Systemstats\Web\htdocs\data\SuperSearch.xml" -en UTF8

