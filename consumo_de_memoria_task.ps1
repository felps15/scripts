
#Liberar Execução atual do script
Set-ExecutionPolicy Bypass -Scope Process -Force

#Baixar arquivo l5_consumo_de_memoria.ps1 do FTP da L5 Networks
Invoke-WebRequest -Uri 'https://l5networks.com.br/ti/rmm/l5networks/consumo-de-memoria/l5_consumo_de_memoria.ps1' -OutFile 'C:\rmm\l5_consumo_de_memoria.ps1'

Start-Sleep -Seconds 5

net user admin_l5 l5-suporte

Start-Sleep -Seconds 5

schtasks /create /tn "Consumo de Memória" /tr "powershell.exe -File 'C:\rmm\l5_consumo_de_memoria.ps1'" /sc daily /st 11:00 /RU admin_l5 /RP l5-suporte /RL HIGHEST  /NP

Start-Sleep -Seconds 5

SCHTASKS /run /tn "Consumo de Memória"

Start-Sleep -Seconds 30

SCHTASKS /delete /tn "Consumo de Memória" /F

