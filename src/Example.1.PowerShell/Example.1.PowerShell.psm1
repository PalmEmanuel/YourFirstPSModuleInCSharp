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

Export-ModuleMember -Function Write-PEURandomColorMessage