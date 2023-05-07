Import-Module "$PSScriptRoot\bin\Debug\net7.0\publish\PEUHybrid.dll"

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