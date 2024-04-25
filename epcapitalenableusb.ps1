$path = "C:\RMM\Scripts"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}
#Baixar Registro para desabilitar USB
powershell –c “(new-object System.Net.WebClient).DownloadFile(‘http://l5networks.com.br/ti/rmm/epcapital/usb/usb-disable.reg’,’C:\RMM\Scripts\usb-disable.reg’)”

#Baixar Registro para habilitar USB
powershell –c “(new-object System.Net.WebClient).DownloadFile(‘http://l5networks.com.br/ti/rmm/epcapital/usb/usb-disable.reg’,’C:\RMM\Scripts\usb-enable.reg’)”

#Baixar Script Bat para efetivar o bloqueio USB
regedit /s  C:\RMM\Scripts\usb-enable.reg


