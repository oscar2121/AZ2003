Start-Transcript -Path "c:\Users\oscar\OneDrive\Desktop\Bar\install.log" -Force
Write-Host "Iniciando instalacion de herramientas DevOps..." -ForegroundColor Cyan

# 1. Instalar la CLI de Azure con Chocolatey
Write-Host "Instalando Azure CLI..." -ForegroundColor Yellow
choco install azure-cli -y

# 2. Instalar Windows PowerShell con Chocolatey
Write-Host "Instalando/Actualizando Windows PowerShell..." -ForegroundColor Yellow
choco install powershell -y

# 3. Instalar el SDK de .NET 8.0 con Chocolatey
Write-Host "Instalando .NET 8.0 SDK..." -ForegroundColor Yellow
choco install dotnet-8.0-sdk -y

# Refrescar las variables de entorno para la sesion actual
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 4. Instalar la extension containerapp en la CLI de Azure
Write-Host "Instalando la extension containerapp en Azure CLI..." -ForegroundColor Yellow
az extension add --name containerapp --yes

# 5. Verificar todas las instalaciones
Write-Host "`n--- VERIFICACION DE INSTALACIONES ---" -ForegroundColor Cyan
Write-Host "Version de Chocolatey:" -ForegroundColor Green
choco --version

Write-Host "Version de Azure CLI:" -ForegroundColor Green
az --version

Write-Host "Extensiones de Azure CLI instaladas:" -ForegroundColor Green
az extension list --output table

Write-Host "Version de PowerShell:" -ForegroundColor Green
$PSVersionTable.PSVersion

Write-Host "Version de .NET SDK:" -ForegroundColor Green
dotnet --list-sdks

Write-Host "`nInstalacion y verificacion finalizadas. Puedes cerrar esta ventana." -ForegroundColor Cyan
Stop-Transcript
