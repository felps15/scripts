<#	
	.NOTES
	===========================================================================
	 Created with: 	Script de automação L5 Networks
	 Created on:   	30/03/2023 12:59
	 Created by:   	manoel.silva
	 Organization: 	L5 Networks
	 Filename:     	hibernate-l5.ps1
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

#Liberações Sistema Operacional
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -force

#Liberações do Windows Defender para execuções de Scripts
Add-MpPreference -ExclusionPath "C:\Program Files (x86)\Advanced Monitoring Agent\scripts" -Force
Add-MpPreference -ExclusionPath "C:\Program Files (x86)\Advanced Monitoring Agent" -Force
Add-MpPreference -ExclusionPath "C:\rmm\scripts\programas\" -Force
Add-MpPreference -ExclusionPath "C:\rmm\scripts" -Force
Add-MpPreference -ExclusionPath "C:\rmm\" -Force
Add-MpPreference -ExclusionExtension vbs
Add-MpPreference -ExclusionExtension bat
Add-MpPreference -ExclusionExtension ps1
Add-MpPreference -ExclusionExtension .bat
Add-MpPreference -ExclusionExtension .vbs
Add-MpPreference -ExclusionExtension .ps1

#Envio do Report por E-mail
$Serial = (Get-WMIObject -Class WIN32_SystemEnclosure -ComputerName $env:ComputerName).SerialNumber
$CS = Gwmi Win32_ComputerSystem -Comp "localhost"
$User = $CS.UserName
$QT = Get-Process qtservices -IncludeUserName
$QTUSER = $QT.UserName
$userName = 'reports.l5networks@gmail.com'
$password = 'iekvxmebtqbfkzwv'
[SecureString]$securepassword = $password | ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $securepassword
$From = "reports.l5networks@l5.com.br"
$To = "manoel.silva@l5.com.br"
$Attachment = "C:\rmm\energy-plan-OFF.txt"
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
Start-Sleep -s 5

#Alterar plano de Energia
powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 0

powercfg /change monitor-timeout-ac 30
powercfg /change monitor-timeout-dc 10

#Desativar Hibernação
powercfg.exe /hibernate off

#Parametros de Hibernação AC
powercfg -setacvalueindex SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0

#Parametros de Hibernação DC
powercfg -setdcvalueindex SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0

#Parametros de Hibernação AC
powercfg -setacvalueindex SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0

#Parametros de Hibernação DC
powercfg -setdcvalueindex SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0

#Parametros de Hibernação AC (Desligar Disco)
powercfg -setacvalueindex SCHEME_CURRENT 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0

#Parametros de Hibernação AC (Desligar Disco)
powercfg -setdcvalueindex SCHEME_CURRENT 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0

#Desativar Ação Fechamento da Tampa AC
powercfg -setacvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
powercfg -setacvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0

#Desativar Ação Fechamento da Tampa DC
powercfg -setdcvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
powercfg -setdcvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0

#Aplicar configurações ao Esquema atual
powercfg -SetActive SCHEME_CURRENT

#Report de configurações de energia
powercfg /query > C:\rmm\energy-plan-OFF.txt


$Body = "

<h2> Report Energy </h2>
<h3> Hostname Maquina: L5NB-$Serial <br>
Usuario Logado: $QTUSER <br>
<br>
<h3> Todos os parametros de hibernacao e desligamento foram desativados temporariamente. <h3>
<h3> Botoes Desligar, Reiniciar e Suspender, estao desativados ate o fim da atualizacao.
</h3>
"

Send-MailMessage -From $From -to $To  -Subject "Report de opcoes de Energia - Desligando Servicos" -Body $Body -BodyAsHtml -SmtpServer $SMTPServer -Port $SMTPPort -UseSsl -Credential $credential -Attachments $Attachment

