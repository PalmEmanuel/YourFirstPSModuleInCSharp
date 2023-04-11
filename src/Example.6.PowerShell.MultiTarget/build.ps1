param(
	[Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	$Source,

	[ValidateNotNullOrEmpty()]
	$OutDir = $(Join-Path $PSScriptRoot '/out/lib')
)

# (Re-)create output directory for copying files
New-Item -Path $OutDir -ItemType Directory -ErrorAction Ignore

# Copy files from build path to output directory
Get-ChildItem -Path $Source | Copy-Item -Destination $OutDir -Force