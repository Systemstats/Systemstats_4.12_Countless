@echo off
systeminfo.exe | find "System Boot Time:" > "%stsweb%\Server_uptime.html"