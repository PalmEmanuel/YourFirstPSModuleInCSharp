param(
	[Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	$Source,

	[ValidateNotNullOrEmpty()]
	$OutDir = $(Join-Path $PSScriptRoot '/out/lib')
)

# Remove output directory with files if it exists
if (Test-Path $OutDir) {
    Remove-Item $OutDir -Recurse -Force -ErrorAction Stop
}
# (Re-)create output directory for copying files
New-Item -Path $OutDir -ItemType Directory -ErrorAction Ignore

# Copy files from build path to output directory
Get-ChildItem -Path $Source | Copy-Item -Destination $OutDir