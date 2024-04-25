
$Folder = 'C:\RMM\Wallpaper'
if (Test-Path -Path $Folder) {
    Write-Host "A pasta [$Folder] já existe."
} else {
    New-Item $Folder -ItemType Directory
	Write-Host "A pasta [$Folder] foi criada."
}

$scripturl = "https://l5networks.com.br/ti/rmm/l5networks/screensaver/L5-tela-de-bloqueio.ps1"
$downloadPath2 = "C:\rmm\Wallpaper\L5-tela-de-bloqueio.ps1"
Invoke-WebRequest -Uri $scripturl -OutFile $downloadPath2

$imageUrl = "https://l5networks.com.br/ti/rmm/l5networks/wallpaper/00lock.png"
$downloadPath = "C:\rmm\Wallpaper\00lock.png"
Invoke-WebRequest -Uri $imageUrl -OutFile $downloadPath

# Caminho completo para o diretório do script
$ScriptDirectory = 'C:\RMM\Wallpaper'

# Adiciona o diretório do script ao caminho do sistema
$env:PATH += ";$ScriptDirectory"

# Agora você pode chamar o script sem o prefixo ".\"
L5-tela-de-bloqueio.ps1 -LockScreenSource "C:\rmm\Wallpaper\00lock.png"


