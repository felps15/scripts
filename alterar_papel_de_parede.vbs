'//Criação de Instância do Shell
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set WshShell=CreateObject("Wscript.Shell")
dNow = Now

'//Verifica se a pasta Wallpaper Existe, caso contrário a cria e continua a execução do código
If Not objFSO.FolderExists("C:\Wallpaper") Then
NewFolder = "C:\Wallpaper" 
objFSO.CreateFolder NewFolder
End If
'//Verifica se a pasta Wallpaper Existe, caso contrário a cria e continua a execução do código


'//Download da Imagem a ser usada como Wallpaper 
dim xHttp: Set xHttp = createobject("Microsoft.XMLHTTP")
dim bStrm: Set bStrm = createobject("Adodb.Stream")
'//xHttp.Open "GET", "https://img.olhardigital.com.br/uploads/acervo_imagens/2018/06/r16x9/20180607182403_1200_675_-_android_go.jpg" , False
xHttp.Open "GET", "https://i.ibb.co/DQ0gffT/original.jpg", False
xHttp.Send

with bStrm
    .type = 1 '//binary
    .open
    .write xHttp.responseBody
    .savetofile "C:\Wallpaper\Wallpaper.jpg", 2 '//overwrite
end with
'//Download da Imagem a ser usada como Wallpaper 
WScript.Sleep 2000

'//Executar Script de Efetivação do Papel de Parede
Set shell = WScript.CreateObject("WScript.Shell")
wallpaper = "C:\Wallpaper\Wallpaper.jpg"
shell.RegWrite "HKCU\Control Panel\Desktop\Wallpaper", wallpaper
WScript.Sleep 1000
shell.Run "%windir%\System32\RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters", 2, True
shell.Run "%windir%\System32\RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters", 1, True
'//Executar Script de Efetivação do Papel de Parede

'//Executar Script de Efetivação do Papel de Parede
set wshell = createObject("Wscript.Shell")
wshell.sendkeys "{F5}"
WScript.Sleep 0000
'//Executar Script de Efetivação do Papel de Parede

