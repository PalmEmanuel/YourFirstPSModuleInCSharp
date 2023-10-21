using namespace System.Net
#We will fix this to be redistributable later, for now this works with the default dotnet publish
Add-Type -Path (Join-Path $PSScriptRoot 'bin/Debug/netstandard2.0/publish/*.dll')

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

<#
.SYNOPSIS
Test if two IP networks overlap each other
#>
function Test-IPNetworkOverlap {

    #NOTE:Parameters still need fully qualified type names even if you have using namespace at the top, however you can omit System, so System.Net.IPNetwork becomes Net.IPNetwork
    param(
        #The network or networks to compare against -CompareNetwork
        [Parameter(Mandatory, ValueFromPipeline)][Net.IPNetwork]
        $Network,

        #The network to test if the networks overlap
        [Parameter(Position = 0, Mandatory)][Net.IPNetwork]
        $CompareNetwork

    )

    process {
        $Network.Overlap($CompareNetwork)
    }
}

Export-ModuleMember Test-IPNetworkOverlap, Write-PEURandomColorMessage
