Describe 'Lab 3: Bouncer Script' {
    BeforeAll {
        . $PSScriptRoot/Shared.ps1
        Initialize-TestEnvironment -ProjectName 'Lab.3.Bouncer'
    }

    Context 'Get-PEUAge' {
        It 'Generates a random birthday for the subject' {
            $actual = Get-PEUAge -Name 'PSConfEUParticipant'
            $actual.Name | Should -Be 'PSConfEUParticipant'
            $actual.BirthDate | Should -BeOfType [DateTime]
        }
        It 'Generates random BirthDate for each name provided via the pipeline' {
            $names = 'PSConfEUParticipant', 'PSConfEUParticipant2', 'PSConfEUParticipant3'

            $actual = $names | Get-PEUAge
            $actual.Count | Should -BeExactly $names.Count
            $names | ForEach-Object {
                $actual.name | Should -Contain $_
            }
            $actual.BirthDate.count | Should -BeExactly $names.Count
            $actual.BirthDate | ForEach-Object {
                $PSItem | Should -BeOfType [DateTime]
            }
        }
    }

    Context 'Assert-PEUAge' {
        It 'Passes thru the user object if the user is of age' {
            $user = [PEURandom.Person]::new(
                'PSConfEUParticipant',
        (Get-Date).AddYears(-25)
            )

            $actual = $user | Assert-PEUAge -Age 18

            $actual | Should -Be $user
        }
        It 'Throws InvalidOperationException if the specified user is under -Age' {
            $user = [PEURandom.Person]::new(
                'UnderAgePSConfEUParticipant',
        (Get-Date).AddYears(-15)
            )

            $testPeuAgeScript = {
                $user | Assert-PEUAge -Age 18
            }

            $testPeuAgeScript | Should -Throw -ExceptionType ([System.IO.InvalidDataException])
        }
    }
}
