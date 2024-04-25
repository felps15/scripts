$Serial = (Get-WMIObject -Class WIN32_SystemEnclosure -ComputerName $env:ComputerName).SerialNumber
$userName = 'reports.l5networks@gmail.com'
$password = '@l5_suporte'
[SecureString]$securepassword = $password | ConvertTo-SecureString -AsPlainText -Force 
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $securepassword
$From = "reports.l5networks@gmail.com"
$To = "kleber.adriano@l5.com.br"
$Cc = "manoel.silva@l5.com.br"
$Attachment = "C:\RMM\Log\L5NB-$Serial.7z"
$Body = "<h2>Segue anexo Relat&oacute;rio de Arquivos XLSX e DOCX encontrados!</h2><br><h3>Hostname: L5NB-$Serial</h3><br>"
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
Send-MailMessage -From $From -to $To -Cc $Cc   -Subject "Relatorio de Arquivos" -Body $Body -BodyAsHtml -SmtpServer $SMTPServer -Port $SMTPPort -UseSsl -Credential $credential -Attachments $Attachment

Start-Sleep -s 5

Remove-Item C:\RMM\Log\* -Recurse -Force



