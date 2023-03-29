using namespace System.Net
#We will fix this to be redistributable later, for now this works with the default dotnet publish
Add-Type -Path (Join-Path $PSScriptRoot 'bin/Debug/net6.0/publish/*.dll')

function Get-RandomColor {
	return "#$([LoremNET.Lorem]::HexNumber(6))"
}

function Set-RandomPSColors {
	[CmdletBinding()]
	$UnchangeableColors = @('DefaultTokenColor')
	(Get-PSReadLineOption).psobject.properties.name.Where{$_ -like '*Color' -and $_ -notin $UnchangeableColors} |
		ForEach-Object { $Colors = @{} } { $Colors[$($_ -replace 'Color')] = Get-RandomColor } -End { Set-PSReadLineOption -Colors $Colors }
}

Export-ModuleMember Set-RandomPSColors