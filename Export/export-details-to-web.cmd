echo off
cls
C:\Windows\System32\Robocopy.exe "%stslog%\Details" "%stsweb%\data\details" /MIR
C:\Windows\System32\Robocopy.exe "%stslog%\History" "%stsweb%\data\history" /MIR
C:\Windows\System32\Robocopy.exe "%stslog%\Apps" "%stsweb%\data\apps" /MIR
C:\Windows\System32\Robocopy.exe "%stsexp%\Accounts" "%stsweb%\data\accounts" /MIR
C:\Windows\System32\Robocopy.exe "%stsexp%\Computers" "%stsweb%\data\computers" /MIR
C:\Windows\System32\Robocopy.exe "%stsexp%\BBS" "%stsweb%\data\bbs" /MIR
