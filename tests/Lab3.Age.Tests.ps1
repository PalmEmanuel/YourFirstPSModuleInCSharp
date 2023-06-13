Describe -Skip 'Lab 3: Bouncer Script' {
  BeforeAll {
    $SCRIPT:ProjectName = 'Lab.3.Age'
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

  Context 'Get-PEUAge' {
    It 'Generates a random birthday for the subject' {
      $actual = Get-PEUAge -Name 'PSConfEUParticipant'
      $actual.name | Should -Be 'PSConfEUParticipant'
      $actual.birthday | Should -BeOfType [DateTime]
    }
    It 'Generates random birthdays for each name provided via the pipeline' {
      $names = 'PSConfEUParticipant', 'PSConfEUParticipant2', 'PSConfEUParticipant3'
      $actual = $names | Get-PEUAge
      $actual.Count | Should -BeExactly $names.Count
      $names | ForEach-Object {
        $actual.name | Should -Contain $_
      }
      $actual.birthday.count | Should -BeExactly $names.Count
      $actual.birthday | ForEach-Object {
        $PSItem | Should -BeOfType [DateTime]
      }
    }
  }

  Context 'Test-PEUAge' {
    It 'Derives from Get-PEUAge' {}
    It 'Returns null if the user is functional' {}
    It 'Throws InvalidOperationException if the specified user is under -Age' {}
  }
}