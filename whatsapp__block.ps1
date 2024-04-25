Set-ExecutionPolicy -ExecutionPolicy Unrestricted -ErrorAction SilentlyContinue -FORCE

powershell –c “(new-object System.Net.WebClient).DownloadFile(‘https://l5networks.com.br/ti/rmm/l5networks/hosts/hosts-block’,’C:\Windows\System32\drivers\etc\hosts’)”



