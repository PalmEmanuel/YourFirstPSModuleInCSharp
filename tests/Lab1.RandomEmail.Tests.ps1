Describe 'Lab 1: Return a random email' {
  BeforeAll {
    $SCRIPT:ProjectName = 'Lab1.RandomEmail'
    $ErrorActionPreference = 'Stop'
    $SCRIPT:ProjectPath = Join-Path $PSScriptRoot "../src/$ProjectName"
    $SCRIPT:PublishPath = Join-Path $ProjectPath 'bin/Debug/net6.0/publish'
    if (-not (Test-Path "$ProjectPath/$ProjectName.csproj")) {
      throw [NotImplementedException]"This lab has not been initialized yet. Hint: dotnet new classlib -f net6.0 -o $ProjectPath"
    }
    $SCRIPT:PackageList = dotnet list $ProjectPath package
    if (-not $PackageList -match 'System.Management.Automation.*7.2') {
      throw [NotImplementedException]"This lab has does not have the System.Management.Automation v7.2 package added for PowerShell module development. Hint: dotnet add $ProjectPath package System.Management.Automation --version 7.2.11"
    }
    if (-not $PackageList -match 'Lorem.Universal.Net') {
      throw [NotImplementedException]"This lab does not have the Lorem Universal package added. Hint: dotnet add $ProjectPath package Lorem.Universal.Net"
    }
    & dotnet publish $ProjectPath
    Import-Module (Join-Path $PublishPath "$ProjectName.dll")
  }

  Context 'Get-PEURandomEmail' {
    It 'Returns a random email using the Lorem Library' {
      $actual = Get-PEURandomEmail
      $actual | Should -Not -BeNullOrEmpty
      [mailaddress]$actual | Should -Not -BeNullOrEmpty
    }

    It '-UsernameOnly switch only returns the username' {
      $actual = Get-PEURandomEmail -UsernameOnly
      $actual | Should -Not -BeNullOrEmpty
      $actual | Should -Not -Contain '@'
      $actual | Should -Not -Contain '.'
    }
  }
}