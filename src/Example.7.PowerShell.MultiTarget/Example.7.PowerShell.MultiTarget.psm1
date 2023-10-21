using namespace System.Net

# Import the module based on PowerShell version (which tells us the .NET version)
# https://learn.microsoft.com/en-us/powershell/scripting/install/powershell-support-lifecycle#release-history
if ($PSVersionTable['PSVersion'] -ge [version]'7.2') {
    Add-Type -Path (Join-Path $PSScriptRoot 'net6.0/*.dll')
} else {
    Add-Type -Path (Join-Path $PSScriptRoot 'net471/*.dll')
}

function Write-PEURandomColorMessage {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )

    # $PSStyle was added in PowerShell 7.2
    # In lower versions we need to write the ANSI string ourselves
    $escapeChar = [char]27
    Write-Output "$escapeChar[38;5;$([LoremNET.Lorem]::Integer(1, 255))m$Message $escapeChar[0m"
}
