'//Criação de Instância do Shell
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set WshShell=CreateObject("Wscript.Shell")
dNow = Now

'//Verifica se a pasta Wallpaper Existe, caso contrário a cria e continua a execução do código
If Not objFSO.FolderExists("C:\RMM\") Then
NewFolder = "C:\RMM\" 
objFSO.CreateFolder NewFolder
End If
'//Apagar pasta Teams e seu conteúdo

strPath = "C:\RMM\Teams"
DeleteFolder strPath
Function DeleteFolder(strFolderPath)
Dim objFSO, objFolder
Set objFSO = CreateObject ("Scripting.FileSystemObject")
If objFSO.FolderExists(strFolderPath) Then
	objFSO.DeleteFolder strFolderPath, True
End If
Set objFSO = Nothing
End Function



If Not objFSO.FolderExists("C:\RMM\Teams") Then
NewFolder = "C:\RMM\Teams" 
objFSO.CreateFolder NewFolder
End If
'//Verifica se a pasta Wallpaper Existe, caso contrário a cria e continua a execução do código


'//Download da Imagem a ser usada como BKGD 01
dim img00: Set img00 = createobject("Microsoft.XMLHTTP")
dim img_00: Set img_00 = createobject("Adodb.Stream")
img00.Open "GET", "http://l5networks.com.br/ti/rmm/l5networks/teams/arq/img01.png", False
img00.Send

with img_00
    .type = 1 '//binary
    .open
    .write img00.responseBody
    .savetofile "C:\RMM\Teams\img01.png", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Download da Imagem a ser usada como Color Thumb 01
dim img02: Set img02 = createobject("Microsoft.XMLHTTP")
dim img_02: Set img_02 = createobject("Adodb.Stream")
img02.Open "GET", "http://l5networks.com.br/ti/rmm/l5networks/teams/arq/img01_thumb.png", False
img02.Send

with img_02
    .type = 1 '//binary
    .open
    .write img02.responseBody
    .savetofile "C:\RMM\Teams\img01_thumb.png", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Download da Imagem a ser usada como BKGD 02
dim img03: Set img03 = createobject("Microsoft.XMLHTTP")
dim img_03: Set img_03 = createobject("Adodb.Stream")
img03.Open "GET", "http://l5networks.com.br/ti/rmm/l5networks/teams/arq/img02.png", False
img03.Send

with img_03
    .type = 1 '//binary
    .open
    .write img03.responseBody
    .savetofile "C:\RMM\Teams\img02.png", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Download da Imagem a ser usada como Color Thumb 02
dim img04: Set img04 = createobject("Microsoft.XMLHTTP")
dim img_04: Set img_04 = createobject("Adodb.Stream")
img04.Open "GET", "http://l5networks.com.br/ti/rmm/l5networks/teams/arq/img02_thumb.png", False
img04.Send

with img_04
    .type = 1 '//binary
    .open
    .write img04.responseBody
    .savetofile "C:\RMM\Teams\img02_thumb.png", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Downlad da Imagem a ser usada como BKGD 03
dim img05: Set img05 = createobject("Microsoft.XMLHTTP")
dim img_05: Set img_05 = createobject("Adodb.Stream")
img05.Open "GET", "http://l5networks.com.br/ti/rmm/l5networks/teams/arq/img03.png", False
img05.Send

with img_05
    .type = 1 '//binary
    .open
    .write img05.responseBody
    .savetofile "C:\RMM\Teams\img03.png", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Download da Imagem a ser usada como Color Thumb 03
dim img06: Set img06 = createobject("Microsoft.XMLHTTP")
dim img_06: Set img_06 = createobject("Adodb.Stream")
img06.Open "GET", "http://l5networks.com.br/ti/rmm/l5networks/teams/arq/img03_thumb.png", False
img06.Send

with img_06
    .type = 1 '//binary
    .open
    .write img06.responseBody
    .savetofile "C:\RMM\Teams\img03_thumb.png", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Downlad da Imagem a ser usada como BKGD 04
dim img07: Set img07 = createobject("Microsoft.XMLHTTP")
dim img_07: Set img_07 = createobject("Adodb.Stream")
img07.Open "GET", "http://l5networks.com.br/ti/rmm/l5networks/teams/arq/img04.png", False
img07.Send

with img_07
    .type = 1 '//binary
    .open
    .write img07.responseBody
    .savetofile "C:\RMM\Teams\img04.png", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Download da Imagem a ser usada como Color Thumb 04
dim img08: Set img08 = createobject("Microsoft.XMLHTTP")
dim img_08: Set img_08 = createobject("Adodb.Stream")
img08.Open "GET", "http://l5networks.com.br/ti/rmm/l5networks/teams/arq/img04_thumb.png", False
img08.Send

with img_08
    .type = 1 '//binary
    .open
    .write img08.responseBody
    .savetofile "C:\RMM\Teams\img04_thumb.png", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Downlad da Imagem a ser usada como BKGD 05
dim img09: Set img09 = createobject("Microsoft.XMLHTTP")
dim img_09: Set img_09 = createobject("Adodb.Stream")
img09.Open "GET", "http://l5networks.com.br/ti/rmm/l5networks/teams/arq/img05.png", False
img09.Send

with img_09
    .type = 1 '//binary
    .open
    .write img09.responseBody
    .savetofile "C:\RMM\Teams\img05.png", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Download da Imagem a ser usada como Color Thumb 05
dim img10: Set img10 = createobject("Microsoft.XMLHTTP")
dim img_10: Set img_10 = createobject("Adodb.Stream")
img10.Open "GET", "http://l5networks.com.br/ti/rmm/l5networks/teams/arq/img05_thumb.png", False
img10.Send

with img_10
    .type = 1 '//binary
    .open
    .write img10.responseBody
    .savetofile "C:\RMM\Teams\img05_thumb.png", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Downlad da Imagem a ser usada como BKGD 06
dim img11: Set img11 = createobject("Microsoft.XMLHTTP")
dim img_11: Set img_11 = createobject("Adodb.Stream")
img11.Open "GET", "http://l5networks.com.br/ti/rmm/l5networks/teams/arq/img06.png", False
img11.Send

with img_11
    .type = 1 '//binary
    .open
    .write img11.responseBody
    .savetofile "C:\RMM\Teams\img06.png", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Download da Imagem a ser usada como Color Thumb 06
dim img12: Set img12 = createobject("Microsoft.XMLHTTP")
dim img_12: Set img_12 = createobject("Adodb.Stream")
img12.Open "GET", "http://l5networks.com.br/ti/rmm/l5networks/teams/arq/img06_thumb.png", False
img12.Send

with img_12
    .type = 1 '//binary
    .open
    .write img12.responseBody
    .savetofile "C:\RMM\Teams\img06_thumb.png", 2 '//overwrite
end with

Wscript.Sleep 3000


'//Downlad da Imagem a ser usada como BKGD 06
dim img13: Set img13 = createobject("Microsoft.XMLHTTP")
dim img_13: Set img_13 = createobject("Adodb.Stream")
img13.Open "GET", "http://l5networks.com.br/ti/rmm/l5networks/teams/arq/img07.png", False
img13.Send

with img_13
    .type = 1 '//binary
    .open
    .write img13.responseBody
    .savetofile "C:\RMM\Teams\img07.png", 2 '//overwrite
end with

Wscript.Sleep 3000

'//Download da Imagem a ser usada como Color Thumb 06
dim img14: Set img14 = createobject("Microsoft.XMLHTTP")
dim img_14: Set img_14 = createobject("Adodb.Stream")
img14.Open "GET", "http://l5networks.com.br/ti/rmm/l5networks/teams/arq/img07_thumb.png", False
img14.Send

with img_14
    .type = 1 '//binary
    .open
    .write img14.responseBody
    .savetofile "C:\RMM\Teams\img07_thumb.png", 2 '//overwrite
end with

Wscript.Sleep 3000


'//Download Script para Copiar as imagens para o diretorio %appdata%\Microsoft\Teams\Backgrounds\Uploads
dim bat: Set bat = createobject("Microsoft.XMLHTTP")
dim bat_: Set bat_ = createobject("Adodb.Stream")
bat.Open "GET", "http://l5networks.com.br/ti/rmm/l5networks/teams/bat/copy_teams-v2.bat", False
bat.Send

with bat_
    .type = 1 '//binary
    .open
    .write bat.responseBody
    .savetofile "C:\RMM\copy_teams-v2.bat", 2 '//overwrite
end with



Wscript.Sleep 5000
'//Executar a copia dos arquivos
dim shell
set shell=createobject("wscript.shell")
shell.run "C:\RMM\copy_teams-v2.bat"