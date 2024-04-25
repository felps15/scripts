:: Origem da Imagem a ser utilizada"

REG ADD "HKCU\Control Panel\Desktop" /V Wallpaper /T REG_SZ /F /D "C:\Wallpaper\Wallpaper.jpg"

:: Aplicar Alterações na Area de Trabalho

%SystemRoot%\System32\RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters

pause