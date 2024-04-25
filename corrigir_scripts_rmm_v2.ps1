powershell –c “(new-object System.Net.WebClient).DownloadFile(‘https://l5networks.com.br/ti/rmm/l5networks/corrigir-scripts/erro-script-rmm.reg’,’c:\rmm\erro-script-rmm.reg’)”

regedit /s c:\rmm\erro-script-rmm.reg