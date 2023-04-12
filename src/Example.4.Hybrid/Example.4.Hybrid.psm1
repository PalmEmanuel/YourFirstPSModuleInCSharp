Import-Module $PSScriptRoot\bin\Debug\net7.0\PEUCSharp.dll

function Set-PEURandomPSColors {
  [CmdletBinding()]
  $UnchangeableColors = @('DefaultTokenColor')
	(Get-PSReadLineOption).psobject.properties.name.Where{ $_ -like '*Color' -and $_ -notin $UnchangeableColors } |
    ForEach-Object -Begin {
      $Colors = @{}
    } -Process {
      $Colors[$($_ -replace 'Color')] = Get-PEURandomColor
    } -End {
      Set-PSReadLineOption -Colors $Colors
    }
}
