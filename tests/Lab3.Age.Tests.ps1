Describe -Skip 'Lab 3: Bouncer Script' {
  Context 'Get-PEUAge' {
    It 'Generates a random birthday for the subject' {}
    It 'Generates random birthdays for each name provided via the pipeline' {}
  }

  Context 'Test-PEUAge' {
    It 'Derives from Get-PEUAge' {}
    It 'Returns null if the user is functional' {}
    It 'Throws InvalidOperationException if the specified user is under -Age' {}
  }
}