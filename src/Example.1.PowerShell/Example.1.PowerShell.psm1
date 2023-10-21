using namespace System.Net
#We will fix this to be redistributable later, for now this works with the default dotnet publish
Add-Type -Path (Join-Path $PSScriptRoot 'bin/Debug/net6.0/publish/*.dll')

function Get-PEURandomColor {
    "#$([LoremNET.Lorem]::HexNumber(6))"
}

function Write-PEURandomColorMessage {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )
    $RandomColor = Get-PEURandomColor
    $AnsiString = $PSStyle.Foreground.FromRgb($RandomColor)
    Write-Output ($AnsiString + $Message + $PSStyle.Reset)
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

Export-ModuleMember -Function Test-IPNetworkOverlap, Write-PEURandomColorMessage
