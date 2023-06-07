Describe 'Lab 1: Return a random email' {
  BeforeAll {
    $SCRIPT:ProjectName = 'Lab.1.RandomEmail'
    $ErrorActionPreference = 'Stop'
    $SCRIPT:ProjectPath = Join-Path $PSScriptRoot "../src/$ProjectName"
    $SCRIPT:PublishPath = Join-Path $ProjectPath 'bin/Debug/net6.0/publish'
    if (-not (Test-Path "$ProjectPath/$ProjectName.csproj")) {
      throw [NotImplementedException]"This lab has not been initialized yet. Hint: dotnet new classlib -f net6.0 -o $ProjectPath"
    }
    & dotnet publish $ProjectPath
    Import-Module (Join-Path $PublishPath "$ProjectName.dll")
  }
  # TODO: Test that package was added and that the binary was published to the right location and the binary target has the lorem library with helpful hints.

  Context 'Get-PEURandomEmail' {
    It 'Returns a random email using the Lorem Library' {
      $actual = Get-PEURandomEmail
      $actual | Should -Not -BeNullOrEmpty
      [mailaddress]$actual | Should -Not -BeNullOrEmpty
    }

    It '-UserNameOnly switch only returns the username' {
      $actual = Get-PEURandomEmail -UsernameOnly
      $actual | Should -Not -BeNullOrEmpty
      $actual | Should -Not -Contain '@'
      $actual | Should -Not -Contain '.'
    }
  }
}