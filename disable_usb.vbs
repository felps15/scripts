'=====================================
'  DESATIVA CHAVE DE ARMAZENAMENTO USB

Dim WSHShell
Set WSHShell = WScript.CreateObject("WScript.Shell")

WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR\Start",4 ,"REG_DWORD"


Set WSHShell = nothing

'FIM DO SCRIPT PARA DESATIVAR USB
'=====================================