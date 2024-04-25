param($wallpaper)
$wallpaper = "https://i.ibb.co/DQ0gffT/original.jpg"

cd\

md wp

$wc = New-Object System.Net.WebClient

$wc.DownloadFile($wallpaper, "c:\wp\wallpaper.jpg")

reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d c:\wp\wallpaper.jpg /f

Start-Sleep -s 10

rundll32.exe user32.dll, UpdatePerUserSystemParameters, 0, $false