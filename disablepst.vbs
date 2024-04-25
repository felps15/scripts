'//Criação de Instância do Shell
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set WshShell=CreateObject("Wscript.Shell")
dNow = Now

'//Verifica se a pasta RMM não existe, caso contrário a cria e continua a execução do código
If Not objFSO.FolderExists("c:\rmm\") Then
NewFolder = "c:\rmm\" 
objFSO.CreateFolder NewFolder
End If

If Not objFSO.FolderExists("c:\rmm\Outlook") Then
NewFolder = "c:\rmm\Outlook" 
objFSO.CreateFolder NewFolder
End If

'//Download da pasta com todas as assinaturas
dim img07: Set img07 = createobject("Microsoft.XMLHTTP")
dim img_07: Set img_07 = createobject("Adodb.Stream")
img07.Open "GET", "http://www.l5networks.com.br/ti/rmm/l5networks/disablepst/copiar-disable-pst-outlook.bat", False
img07.Send
with img_07
    .type = 1 '//binary
    .open
    .write  img07.responseBody
    .savetofile "C:\RMM\Outlook\copiar-disable-pst-outlook.bat", 2 '//overwrite
end with
Wscript.Sleep 3000


'//Download do Script de Instalação e Configuração da Assinatura
dim img201: Set img201 = createobject("Microsoft.XMLHTTP")
dim img_201: Set img_201 = createobject("Adodb.Stream")
img201.Open "GET", "http://www.l5networks.com.br/ti/rmm/l5networks/disablepst/disable-pst-outlook.bat", False
img201.Send

with img_201
    .type = 1 '//binary
    .open
    .write img201.responseBody
    .savetofile "C:\RMM\Outlook\disable-pst-outlook.bat", 2 '//overwrite
end with

Wscript.Sleep 3000


'//Download do Script de Instalação e Configuração da Assinatura
dim img202: Set img202 = createobject("Microsoft.XMLHTTP")
dim img_202: Set img_202 = createobject("Adodb.Stream")
img202.Open "GET", "http://www.l5networks.com.br/ti/rmm/l5networks/disablepst/disable-export-add-pst.reg", False
img202.Send

with img_202
    .type = 1 '//binary
    .open
    .write img202.responseBody
    .savetofile "C:\RMM\Outlook\disable-export-add-pst.reg", 2 '//overwrite
end with

Wscript.Sleep 3000


'//Download do Script de Instalação e Configuração da Assinatura
dim img203: Set img203 = createobject("Microsoft.XMLHTTP")
dim img_203: Set img_203 = createobject("Adodb.Stream")
img203.Open "GET", "http://www.l5networks.com.br/ti/rmm/l5networks/disablepst/disable-write-pst.reg", False
img203.Send

with img_203
    .type = 1 '//binary
    .open
    .write img203.responseBody
    .savetofile "C:\RMM\Outlook\disable-write-pst.reg", 2 '//overwrite
end with



Wscript.Sleep 3000

dim shell
set shell=createobject("wscript.shell")
shell.run "C:\RMM\Outlook\copiar-disable-pst-outlook.bat"
set shell=nothing