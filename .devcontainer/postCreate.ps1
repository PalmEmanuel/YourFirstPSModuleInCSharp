Write-Host -Fore Green 'Starting postCreate.ps1'

Write-Host -Fore Green 'Making pwsh our default shell'
& sudo chsh -s /usr/bin/pwsh vscode

Write-Host -Fore Green 'Perform Initial Dotnet Publish'
& dotnet build