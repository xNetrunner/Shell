@echo off

set logfile="C:\Awacs.txt"
echo %date% %time% >>%logfile%

net stop "Awacs" >>%logfile%

ping -n 16 localhost>Nul
echo %date% %time% >>%logfile%

net start "Awacs" >>%logfile%

ping -n 61 localhost>Nul
SetLocal EnableExtensions

Set ProcessName=Awacs

TaskList /FI "ImageName EQ %ProcessName%" | Find /I "%ProcessName%"
If %ErrorLevel% NEQ 0 net start "Awacs"

exit