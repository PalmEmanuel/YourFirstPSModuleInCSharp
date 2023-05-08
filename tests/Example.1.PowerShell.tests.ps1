$SCRIPT:ProjectPath = Join-Path $PSScriptRoot '..'
Describe 'Example.1.Powershell' {
  BeforeAll {
    dotnet publish $ProjectPath/YourFirstPSModuleInCSharp.sln
  }
  It 'Works' {
  }
}