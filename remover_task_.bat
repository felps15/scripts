@echo off

cd C:\Users
dir /b > C:\RMM\Users.txt

 for /F "tokens=*" %%A in (C:\RMM\Users.txt) do (
	
	
	schtasks /delete /tn “Abrir QT” /F
	schtasks /delete /tn “Install QT” /F
		
		)