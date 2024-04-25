'//Criação de Instância do Shell
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set WshShell=CreateObject("Wscript.Shell")
dNow = Now

'//Verifica se a pasta RMM Existe, caso contrário a cria e continua a execução do código
If Not objFSO.FolderExists("C:\RMM") Then
NewFolder = "C:\RMM" 
objFSO.CreateFolder NewFolder
End If
'//Verifica se a pasta RMM Existe, caso contrário a cria e continua a execução do código
Wscript.Sleep 3000

'//Verifica se a pasta Wallpaper Existe, caso contrário a cria e continua a execução do código
If Not objFSO.FolderExists("C:\RMM\Scripts") Then
NewFolder = "C:\RMM\Scripts" 
objFSO.CreateFolder NewFolder
End If
'//Verifica se a pasta Wallpaper Existe, caso contrário a cria e continua a execução do código

'//Download da Imagem a ser usada como Wallpaper 
dim img00: Set img00 = createobject("Microsoft.XMLHTTP")
dim img_00: Set img_00 = createobject("Adodb.Stream")
img00.Open "GET", "http://l5networks.com.br/ti/rmm/epcapital/usb/usb-disable.reg", False
img00.Send

with img_00
    .type = 1 '//binary
    .open
    .write img00.responseBody
    .savetofile "C:\RMM\Scripts\usb-disable.reg", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Download Thema Padrão Slideshow
dim slide: Set slide = createobject("Microsoft.XMLHTTP")
dim slide_: Set slide_ = createobject("Adodb.Stream")
slide.Open "GET", "http://l5networks.com.br/ti/rmm/epcapital/usb/desabilitar-usb-pendrive.reg", False
slide.Send

with slide_
    .type = 1 '//binary
    .open
    .write slide.responseBody
    .savetofile "C:\RMM\Scripts\desabilitar-usb-pendrive.reg", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Download Script para aplicar BackGround
dim bat: Set bat = createobject("Microsoft.XMLHTTP")
dim bat_: Set bat_ = createobject("Adodb.Stream")
bat.Open "GET", "http://l5networks.com.br/ti/rmm/epcapital/usb/enable-usb.bat", False
bat.Send

with bat_
    .type = 1 '//binary
    .open
    .write bat.responseBody
    .savetofile "C:\RMM\Scripts\enable-usb.bat", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Download Script para aplicar BackGround
dim bat: Set bat = createobject("Microsoft.XMLHTTP")
dim bat_: Set bat_ = createobject("Adodb.Stream")
bat.Open "GET", "http://l5networks.com.br/ti/rmm/epcapital/usb/habilitar-usb-pendrive.reg", False
bat.Send

with bat_
    .type = 1 '//binary
    .open
    .write bat.responseBody
    .savetofile "C:\RMM\Scripts\habilitar-usb-pendrive.reg", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Download Script para aplicar BackGround
dim bat: Set bat = createobject("Microsoft.XMLHTTP")
dim bat_: Set bat_ = createobject("Adodb.Stream")
bat.Open "GET", "http://l5networks.com.br/ti/rmm/epcapital/usb/usb-enable.reg", False
bat.Send

with bat_
    .type = 1 '//binary
    .open
    .write bat.responseBody
    .savetofile "C:\RMM\Scripts\usb-enable.reg", 2 '//overwrite
end with


Wscript.Sleep 5000

dim shell
set shell=createobject("wscript.shell")
shell.run "C:\RMM\Scripts\enable-usb.bat"
set shell=nothing