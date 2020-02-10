[string[]]$appList='vscode','nodejs','notepadplusplus','python','ruby','vscode-rubi','jekyll'

try {
    choco config get cachelocation
} catch {
    Write-Output "Chocolatey parece não estar instalado. Tentando instalar"
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

foreach ($app in $appList) {
    Write-Output "Instalando   $($app)"
    & choco install $app /y Write-Output
}

