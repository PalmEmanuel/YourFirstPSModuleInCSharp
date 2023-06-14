# Age Verification "Bouncer" Module

Make a script that will generate random birthdays for a list of names, and then use that information to determine if they are over or under a certain age. The specifications for the commands are describe in the Pester test file, but can be summarized as follows:

1. You should have a command named `Get-PEUAge` should accept a `Name` parameter that produces a `Object` (`PSCustomObject` or a custom class) that has `Name` and `BirthDate` properties.
1. The Name property should include the name provided via the parameter, and the `BirthDate` property should be a DateTime object indicating the user birthdate.
1. The Name propery should work on the pipeline, e.g. 'Bob','Steve','Phil' | Get-PEUAge
1. You should have another command named `Assert-PEUAge` that should inherit from Get-PEUAge
1. You should add a `[int]` `-Age` parameter that specifies the minimum required age of the person
1. You should override the `BeginProcessing` block of the inherited cmdlet to implement the new required functionality, where the object will be passed thru if it is valid, and throw an `[InvalidDataException]` exception if it is not.