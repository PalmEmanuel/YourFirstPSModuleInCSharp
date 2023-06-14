Describe 'Lab 2: Get a random sentence' {
  BeforeAll {
    . $PSScriptRoot/Shared.ps1
    Initialize-TestEnvironment -ProjectName 'Lab.2.RandomSentence'
  }
  Context 'Get-PEURandomSentence' {
    It 'Generates a Random Sentence between 5 and 10 words' {
      $actual = Get-PEURandomSentence
      $actual | Should -Not -BeNullOrEmpty

      $words = ($actual -split ' ').Count
      $words | Should -BeGreaterOrEqual 5
      $words | Should -BeLessOrEqual 10
    }
    It 'Generates a sentence between -Min and -Max' {
      $actual = Get-PEURandomSentence -Min 50 -Max 150
      $actual | Should -Not -BeNullOrEmpty

      $words = ($actual -split ' ').Count
      $words | Should -BeGreaterOrEqual 50
      $words | Should -BeLessOrEqual 150
    }
    It '-Name ends the sentence with ", {Name}"' {
      $name = 'PSConfEUParticipant'
      $actual = Get-PEURandomSentence -Name $name
      $actual | Should -Not -BeNullOrEmpty
      $actual | Should -Match -RegularExpression ", $name`$"
    }
    It 'Names provided via pipeline produce 3 separate sentences ending in the persons name' {
      $name = 'PSConfEUParticipant'
      $actual = $name | Get-PEURandomSentence
      $actual | Should -Not -BeNullOrEmpty
      $actual.Count | Should -BeExactly 3
      ($actual | Select-Object -Unique).Count | Should -BeExactly 3
      $actual | ForEach-Object { $_ | Should -Match -RegularExpression ", $name`$" }
    }
  }
}