Set-ExecutionPolicy -ExecutionPolicy Unrestricted -ErrorAction SilentlyContinue -FORCE
 
$path = "C:\RMM\Scripts" 
If(!(test-path $path)) 
{
      New-Item -ItemType Directory -Force -Path $path

}

#Parar Qt Install
Stop-Process -Name qtinstall -Force -ErrorAction SilentlyContinue
Stop-Process -Name qtservices -Force -ErrorAction SilentlyContinue
Stop-Process -Name qtserviceupdate -Force -ErrorAction SilentlyContinue
#Baixar Qt Atualizado
powershell.exe -Command {
	
	[Net.ServicePointManager]::SecurityProtocol +='tls12';$wc = New-object System.Net.WebClient; $wc.DownloadFile('https://dev-api.qualitime.com.br/uploads/clients/1/qualitimeClient.zip', "c:\RMM\qualitimeClient.zip")
	
	} 


#Descompactar QT


Expand-Archive -LiteralPath "C:\RMM\qualitimeClient.zip" -DestinationPath "C:\RMM\" -FORCE -ErrorAction SilentlyContinue

#Iniciar Qt Install
Start-Process -FilePath "C:\RMM\qtinstall.exe" -ErrorAction SilentlyContinue