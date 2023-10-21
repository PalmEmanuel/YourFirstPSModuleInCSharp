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
        Context 'Names Via Pipeline' {
            BeforeAll {
                $name = 'Pester1', 'Pester2', 'Pester3'
                $SCRIPT:actual = $name | Get-PEURandomSentence
            }

            It 'Should output 3 sentences' {
                $actual | Should -Not -BeNullOrEmpty
                $actual.Count | Should -BeExactly 3
            }

            It 'Sentences should not be duplicated' {
        ($actual | Select-Object -Unique).Count | Should -BeExactly 3
            }

            It 'Each sentence ends with the corresponding name provided via the pipeline' {
                # Check that each item output matches the corresponding name.
                #NOTE: This is a bad test if you are attempting to do things in parallel as they will possibly arrive out of order, but it is fine here.
                $i = 0
                foreach ($actualItem in $actual) {
                    $actualItem | Should -BeOfType [String]
                    $nameItem = $name[$i]
                    $actualItem | Should -Match -RegularExpression ", $nameItem`$"
                    $i++
                }
            }
        }
    }
}
