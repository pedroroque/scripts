[string[]]$appList=
    'nodejs',
    'notepadplusplus',
    'python',
    'ruby',
    'jekyll', 
    'googlechrome', 
    'firefox', 
    'microsoft-edge',
    'microsoft-windows-terminal',
    'git', 
    vscode',
    @'
visualstudio2019professional --package-parameters "--allWorkloads --includeRecommended --includeOptional --passive --locale en-US"
'@
    ,'docker-desktop'

try {
    choco config get cachelocation
} catch {
    Write-Output "Chocolatey parece não estar instalado. Tentando instalar"
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

foreach ($app in $appList) {
    Write-Output "Instalando   $($app)"
    & choco install $app /y 
    Write-Output "================================================================================"
    Write-Output "$($app) Instalado "
    Write-Output "================================================================================"
}

# Executar em powershell, como administrador
# Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/pedroroque/scripts/master/chocolatey/devmachine.ps1'))
