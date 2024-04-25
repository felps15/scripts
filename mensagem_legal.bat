@echo 

chcp 65001
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System  /v legalnoticecaption /f
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System  /v legalnoticetext /f
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System   /v legalnoticecaption /t REG_SZ /d "Atenção"
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System   /v legalnoticetext /t REG_SZ /d "O uso deste dispositivo, serviços de rede e/ou sistema é especifico para usuário autorizado pela L5 Networks. As atividades poderão ser monitoradas e ação legal instaurada em caso de uso não autorizado"