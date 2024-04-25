:: Origem da Imagem a ser utilizada"

del "%AppData%\Microsoft\Windows\Themes" /s /q /f

del "%userprofile%\appdata\local\Microsoft\Windows\Themes" /s /q /f

:: Aplicar Alterações na Area de Trabalho

%SystemRoot%\System32\RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters , 2, True
%SystemRoot%\System32\RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters , 1, True
%SystemRoot%\System32\RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters

