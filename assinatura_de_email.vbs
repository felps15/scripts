'//Criação de Instância do Shell
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set WshShell=CreateObject("Wscript.Shell")
dNow = Now

'//Verifica se a pasta RMM não existe, caso contrário a cria e continua a execução do código
If Not objFSO.FolderExists("C:\RMM\") Then
NewFolder = "C:\RMM\" 
objFSO.CreateFolder NewFolder
End If
'//Verifica se a pasta RMM  não existe, caso contrário a cria e continua a execução do código

'//Verifica se a pasta Sigantures não existe, caso contrário a cria e continua a execução do código
If Not objFSO.FolderExists("C:\RMM\Signatures") Then
NewFolder = "C:\RMM\Signatures" 
objFSO.CreateFolder NewFolder
End If
'//Verifica se a pasta Temp não existe, caso contrário a cria e continua a execução do código

'//Verifica se a pasta RMM\OpenVPN\Certificados não existe, caso contrário a cria e continua a execução do código
If Not objFSO.FolderExists("C:\RMM\Signatures\Temp") Then
NewFolder = "C:\RMM\Signatures\Temp" 
objFSO.CreateFolder NewFolder
End If
'//Verifica se a pasta RMM\OpenVPN\Certificados não existe, caso contrário a cria e continua a execução do código

'//Verifica se a pasta RMM\OpenVPN\Certificados não existe, caso contrário a cria e continua a execução do código
If Not objFSO.FolderExists("C:\RMM\Signatures\Signatures") Then
NewFolder = "C:\RMM\Signatures\Signatures" 
objFSO.CreateFolder NewFolder
End If
'//Verifica se a pasta RMM\OpenVPN\Certificados não existe, caso contrário a cria e continua a execução do código


'//Download da pasta com todas as assinaturas
dim img07: Set img07 = createobject("Microsoft.XMLHTTP")
dim img_07: Set img_07 = createobject("Adodb.Stream")
img07.Open "GET", "http://www.l5networks.com.br/ti/rmm/l5networks/signature/Assinaturas.zip", False
img07.Send
with img_07
    .type = 1 '//binary
    .open
    .write  img07.responseBody
    .savetofile "C:\RMM\Signatures\Temp\Assinaturas.zip", 2 '//overwrite
end with
Wscript.Sleep 3000

Set objFSO = CreateObject("Scripting.FileSystemObject")

Dim objShell, objFSO, fullPathToZip, objShellApp
Set objShell = WScript.CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

Const ForReading = 1, ForWriting = 2, ForAppending = 8

'# Descompacta
UnzipFiles "C:\RMM\Signatures\Temp\", "Assinaturas.zip"

'# Função para descompactar arquivos
Sub UnzipFiles(strFolderName, strFileName)
    fullPathToZip = objFSO.GetAbsolutePathName(strFolderName & "" & strFileName)
    Set objShellApp = CreateObject("Shell.Application")
    If Not objfso.FolderExists(strFolderName) Then objfso.CreateFolder strFolderName
    objShellApp.NameSpace(strFolderName).CopyHere objShellApp.NameSpace(fullPathToZip).Items
End Sub



'//Download do Script de Instalação e Configuração da Assinatura
dim img201: Set img201 = createobject("Microsoft.XMLHTTP")
dim img_201: Set img_201 = createobject("Adodb.Stream")
img201.Open "GET", "http://www.l5networks.com.br/ti/rmm/l5networks/signature/scripts/instalar_signature-outlook-v2.bat", False
img201.Send

with img_201
    .type = 1 '//binary
    .open
    .write img201.responseBody
    .savetofile "C:\RMM\Signatures\instalar_signature-outlook-v2.bat", 2 '//overwrite
end with

Wscript.Sleep 3000


'//Download do Script de Inserção no outlook
dim img301: Set img301 = createobject("Microsoft.XMLHTTP")
dim img_301: Set img_301 = createobject("Adodb.Stream")
img301.Open "GET", "http://www.l5networks.com.br/ti/rmm/l5networks/signature/scripts/signatures/Assinatura L5.htm", False
img301.Send

with img_301
    .type = 1 '//binary
    .open
    .write img301.responseBody
    .savetofile "C:\RMM\Signatures\Signatures\Assinatura L5.htm", 2 '//overwrite
end with

Wscript.Sleep 3000

dim shell
set shell=createobject("wscript.shell")
shell.run "C:\RMM\Signatures\instalar_signature-outlook-v2.bat"
set shell=nothing




