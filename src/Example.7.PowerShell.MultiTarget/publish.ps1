param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    $Source,

    [Parameter(Mandatory)]
    [ValidateSet('net471', 'net6.0')]
    $TargetFramework,

    [ValidateNotNullOrEmpty()]
    $OutDir = $(Join-Path $PSScriptRoot '/out/lib')
)

# Create output directory for copying files
New-Item -Path "$OutDir/$TargetFramework/" -ItemType Directory -ErrorAction Ignore

# Copy files from build path to output directory
Get-ChildItem -Path $Source | Copy-Item -Destination "$OutDir/$TargetFramework/" -Force
Get-ChildItem -Path "$Source/../../../../Example.7.PowerShell.MultiTarget.ps*1" | Copy-Item -Destination $OutDir -Force
