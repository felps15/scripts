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

'//Download da pasta com todas as assinaturas
dim img07: Set img07 = createobject("Microsoft.XMLHTTP")
dim img_07: Set img_07 = createobject("Adodb.Stream")
img07.Open "GET", "http://www.l5networks.com.br/ti/rmm/l5networks/teams/bat/cache-teams.bat", False
img07.Send
with img_07
    .type = 1 '//binary
    .open
    .write  img07.responseBody
    .savetofile "C:\RMM\cache-teams.bat", 2 '//overwrite
end with
Wscript.Sleep 3000

dim shell
set shell=createobject("wscript.shell")
shell.run "C:\RMM\cache-teams.bat"
set shell=nothing




