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


'//Download do Aplicativo Suporte L5 a ser instalado na máquina
dim img00: Set img00 = createobject("Microsoft.XMLHTTP")
dim img_00: Set img_00 = createobject("Adodb.Stream")
img00.Open "GET", "https://l5networks.com.br/ti/rmm/allclients/block-w11/block-w11.bat", False
img00.Send

with img_00
    .type = 1 '//binary
    .open
    .write img00.responseBody
    .savetofile "C:\RMM\block-w11.bat", 2 '//overwrite
end with

'//Download do Aplicativo Suporte L5 a ser instalado na máquina
dim img01: Set img01 = createobject("Microsoft.XMLHTTP")
dim img_01: Set img_01 = createobject("Adodb.Stream")
img01.Open "GET", "https://l5networks.com.br/ti/rmm/allclients/block-w11/patch-block-w11.reg", False
img01.Send

with img_01
    .type = 1 '//binary
    .open
    .write img01.responseBody
    .savetofile "C:\RMM\patch-block-w11.reg", 2 '//overwrite
end with

Wscript.Sleep 3000



'//Executar o Script para iniciar a instalação
dim shell
set shell=createobject("wscript.shell")
shell.run "C:\RMM\block-w11.bat"
set shell=nothing
'//Executar o Script para iniciar a instalação