# Age Verification "Bouncer" Module

Make a script that will generate random birthdays for a list of names, and then use that information to determine if they are over or under a certain age. The specifications for the commands are describe in the Pester test file, but can be summarized as follows:

## Get-PEUAge

1. You should have a command named `Get-PEUAge` which should accept a `Name` parameter that produces a `Person` object that has `Name` and `BirthDate` properties.
1. The `Name` property should include the name provided via the parameter, and the `BirthDate` property should be a DateTime object indicating the user birthdate.
1. The `Name` property should work on the pipeline, e.g. `'Bob','Steve','Phil' | Get-PEUAge` and should also work positionally

## Assert-PEUAge

1. You should have another command named `Assert-PEUAge` that takes a `Person` as a positional pipeline property and an `[int]` `-Age` parameter that specifies the minimum required age of the person
1. The command should output the Person if they are older than the specified age (taking today's date into account) and write a verbose message explaining why they are older, and throw an `InvalidDataException` exception if they are younger than the age.
