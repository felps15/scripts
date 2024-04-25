Invoke-WebRequest -Uri 'https://l5networks.com.br/ti/rmm/l5networks/corrigir-scripts/erro-script-rmm.reg' -OutFile 'C:\rmm\erro-script-rmm.reg'
regedit /s c:\rmm\erro-script-rmm.reg