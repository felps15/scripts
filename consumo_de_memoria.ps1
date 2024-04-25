#Liberar Execução atual do script
Set-ExecutionPolicy Bypass -Scope Process -Force

#Baixar arquivo RAMMap.exe do FTP da L5 Networks
Invoke-WebRequest -Uri 'https://l5networks.com.br/ti/rmm/l5networks/consumo-de-memoria/RAMMap.exe' -OutFile 'C:\rmm\RAMMap.exe'

# Definindo a memória máxima em porcentagem
$MemoriaMaxima = 50

$Folder = 'C:\RMM\Logs'
if (Test-Path -Path $Folder) {
    Write-Host "A pasta [$Folder] já existe."
} else {
    New-Item $Folder -ItemType Directory
	Write-Host "A pasta [$Folder] foi criada."
}

Start-Sleep -Seconds 2

# Loop contínuo para verificar o consumo de memória
while ($true) {
    # Obtendo a informação sobre a memória do sistema
    $InfoMemoria = Get-WmiObject -Class Win32_OperatingSystem
    
    # Calculando a porcentagem de memória em uso
    $PorcentagemMemoria = [math]::Round((($InfoMemoria.TotalVisibleMemorySize - $InfoMemoria.FreePhysicalMemory) / $InfoMemoria.TotalVisibleMemorySize * 100), 2)

    # Verificando se a porcentagem de memória em uso é superior ao limite definido
    if ($PorcentagemMemoria -gt $MemoriaMaxima) {
        Write-Host "A porcentagem de memória em uso ($PorcentagemMemoria%) está acima do padrão definido ($MemoriaMaxima%)"
        
        # Iniciando o processo para limpar a memória
        Start-Process -FilePath "C:\rmm\RAMMap.exe" -ArgumentList "-ew" -ErrorAction SilentlyContinue
        Start-Process -FilePath "C:\rmm\RAMMap.exe" -ArgumentList "-es" -ErrorAction SilentlyContinue
        Start-Process -FilePath "C:\rmm\RAMMap.exe" -ArgumentList "-em" -ErrorAction SilentlyContinue
        Start-Process -FilePath "C:\rmm\RAMMap.exe" -ArgumentList "-et" -ErrorAction SilentlyContinue
        Start-Process -FilePath "C:\rmm\RAMMap.exe" -ArgumentList "-e0" -ErrorAction SilentlyContinue
		
		Start-Sleep -Seconds 150
        

        # Nome do processo a ser verificado
        $appPattern = '^RAMMAP'

        # Obtém todos os processos que correspondem ao padrão
        $processos = Get-Process | Where-Object { $_.ProcessName -match $appPattern }

        # Verifica se foram encontrados processos correspondentes ao padrão
        if ($processos) {
            # Para cada processo encontrado, encerra-o
            foreach ($processo in $processos) {
                taskkill /F /PID $processo.Id
                Write-Host "O processo $($processo.ProcessName) (PID: $($processo.Id)) foi encerrado."
            }
        } else {
            # Se nenhum processo correspondente ao padrão foi encontrado, exibe uma mensagem
            
        }

        # Aguardando um tempo antes de verificar a memória novamente
        Start-Sleep -Seconds 600

        
        # Registro de log quando a memória está acima do máximo
        $LogAcima = "$(Get-Date) - A porcentagem de memória em uso é superior ao padrão definido ($MemoriaMaxima%) | Porcentagem de memória em uso: $([math]::Round($PorcentagemMemoria, 2))%"
        Add-Content -Path "C:\rmm\Logs\log-rammap.txt" -Value $LogAcima
        
        # Obtendo a informação sobre a memória do sistema após a limpeza
        $InfoMemoriaApos = Get-WmiObject -Class Win32_OperatingSystem
        $PorcentagemMemoriaApos = [math]::Round((($InfoMemoriaApos.TotalVisibleMemorySize - $InfoMemoriaApos.FreePhysicalMemory) / $InfoMemoriaApos.TotalVisibleMemorySize * 100), 2)
        
        # Registro de log após a limpeza de memória
        $LogDepois = "$(Get-Date) - Limpeza de memória concluída - Porcentagem de memória em uso após limpeza: $PorcentagemMemoriaApos%"
        Add-Content -Path "C:\rmm\Logs\log-rammap.txt" -Value $LogDepois
    }
    else {
        Write-Host "A porcentagem de memória em uso ($PorcentagemMemoria%) está dentro do padrão definido ($MemoriaMaxima%)"
        
        # Registro de log quando a memória está dentro do máximo
        $LogDentro = "$(Get-Date) - A porcentagem de memória em uso é inferior ao padrão definido ($MemoriaMaxima%) | Porcentagem de memória em uso: $([math]::Round($PorcentagemMemoria, 2))%"
        Add-Content -Path "C:\rmm\Logs\log-rammap.txt" -Value $LogDentro
        
        # Nome do processo a ser verificado
        $appPattern = '^RAMMAP'

        # Obtém todos os processos que correspondem ao padrão
        $processos = Get-Process | Where-Object { $_.ProcessName -match $appPattern }

        # Verifica se foram encontrados processos correspondentes ao padrão
        if ($processos) {
            # Para cada processo encontrado, encerra-o
            foreach ($processo in $processos) {
                taskkill /F /PID $processo.Id
                Write-Host "O processo $($processo.ProcessName) (PID: $($processo.Id)) foi encerrado."
            }
        } else {
            # Se nenhum processo correspondente ao padrão foi encontrado, exibe uma mensagem
            
        }

        # Aguardando um tempo antes de verificar a memória novamente
        Start-Sleep -Seconds 600

    }
}

