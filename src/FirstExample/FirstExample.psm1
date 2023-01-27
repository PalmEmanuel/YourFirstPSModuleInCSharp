using namespace System.Net
#We will fix this to be redistributable later, for now this works with the default dotnet publish
Add-Type -Path 'bin/Debug/net7.0/publish/*.dll'

function Test-IPNetworkOverlap {
	<#
	.SYNOPSIS
	Test if two IP networks overlap each other
	#>
	param(
		[Parameter(Mandatory)][IPNetwork]$Network,
		[Parameter(Mandatory, ValueFromPipeline)][IPNetwork]$InputObject
	)

	process {
		$InputObject.Overlap($Network)
	}
}

Export-ModuleMember Test-IPNetworkOverlap