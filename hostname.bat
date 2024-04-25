@echo off
cls
::Coletar SerialNumber da máquina - ServiceTAG
FOR /F "tokens=2 delims='='" %%A in ('wmic Bios Get SerialNumber /value') do SET serialnumber=%%A

wmic computersystem where name="%computername%" rename "L5NB-%serialnumber%"

