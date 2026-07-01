Start-Transcript -Path "c:\Users\oscar\OneDrive\Desktop\Bar\install_gh.log" -Force
Write-Host "Iniciando instalacion del GitHub CLI (gh)..." -ForegroundColor Cyan

# 1. Instalar gh con Chocolatey
Write-Host "Instalando gh..." -ForegroundColor Yellow
choco install gh -y

# Refrescar las variables de entorno para la sesion actual
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 2. Verificar la instalacion
Write-Host "`n--- VERIFICACION DE GH ---" -ForegroundColor Cyan
gh --version

Write-Host "`nInstalacion y verificacion de gh finalizadas. Puedes cerrar esta ventana." -ForegroundColor Cyan
Stop-Transcript
