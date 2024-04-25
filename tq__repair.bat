taskkill /F /IM L5Agent.exe

ping localhost 


cd C:\Users
dir /b > C:\RMM\NewAgent\Users.txt

 for /F "tokens=*" %%A in (C:\RMM\NewAgent\Users.txt) do (
	
	if exist "C:\Users\%%A\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\L5Agent.exe" (
        xcopy "C:\Users\%%A\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\L5Agent.exe" "C:\RMM\NewAgent\" /Y /c /q
		DEL "C:\Users\%%A\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\L5Agent.exe" /s /q
        
    )
    else (

		SCHTASKS /delete /tn "Abrir QT - %%A" /F
		schtasks /create /tn "Abrir QT - %%A" /tr "C:\RMM\NewAgent\L5Agent.exe" /sc daily /st 11:00 /RU L5\%%A  /RL HIGHEST
		SCHTASKS /run /tn "Abrir QT - %%A"
		TIMEOUT 10
		SCHTASKS /delete /tn "Abrir QT - %%A" /F
    
    )
		)
	
