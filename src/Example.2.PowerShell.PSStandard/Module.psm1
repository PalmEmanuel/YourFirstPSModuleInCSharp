using namespace System.Net
#We will fix this to be redistributable later, for now this works with the default dotnet publish
Add-Type -Path (Join-Path $PSScriptRoot 'bin/Debug/netstandard2.0/publish/*.dll')

function Get-RandomColor {
	return "#$([LoremNET.Lorem]::HexNumber(6))"
}

function Set-RandomPSColors {
	[CmdletBinding()]
	$UnchangeableColors = @('DefaultTokenColor')
	(Get-PSReadLineOption).psobject.properties.name.Where{$_ -like '*Color' -and $_ -notin $UnchangeableColors} |
		ForEach-Object { $Colors = @{} } { $Colors[$($_ -replace 'Color')] = Get-RandomColor } -End { Set-PSReadLineOption -Colors $Colors }
}

function Test-IPNetworkOverlap {
	<#
	.SYNOPSIS
	Test if two IP networks overlap each other
	#>

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

Export-ModuleMember Test-IPNetworkOverlap,Set-RandomPSColors