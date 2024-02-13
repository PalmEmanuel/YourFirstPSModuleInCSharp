using System;
using System.IO;
using System.Management.Automation;

namespace PEURandom;

[Cmdlet(VerbsLifecycle.Assert, "PEUAge")]
[OutputType(typeof(Person))]
public class AssertPEUAgeCmdlet : PSCmdlet
{
    [Parameter(Position = 0, ValueFromPipeline = true)]
    public IPerson Person;

    [Parameter()]
    public int Age = 18;
    
    protected override void ProcessRecord()
    {
        const int daysInAYear = 365;
        var ageSpan = DateTime.Now - Person.BirthDate;
        int personAge = (int)Math.Floor(ageSpan.TotalDays / daysInAYear);
        if (personAge < Age) {
            throw new InvalidDataException($"{Person.Name} is under the age of {Age}");
        }

        WriteObject(Person);
    }
}