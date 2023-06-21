namespace PEURandom;
using System.Management.Automation;
using LoremNET;

public class Person
{
    public string Name;
    public DateTime BirthDate;

    public Person(string name, DateTime birthdate)
    {
        this.BirthDate = birthdate;
        this.Name = name;
    }
}

[Cmdlet(VerbsCommon.Get, "PEUAge")]
public class GetPEUAgeCommand : PSCmdlet
{
    [Parameter(ValueFromPipeline = true, Mandatory = true)]
    public string Name;

    protected override void ProcessRecord()
    {
        // Keep it reasonable... skip newborns and people older than 100y
        DateTime start = DateTime.Now.AddYears(-100);
        DateTime end = DateTime.Now.AddYears(-1);
        DateTime birthDate = Lorem.DateTime(start, end);
        Person person = new Person(Name, birthDate);
        WriteObject(person);
    }
}

[Cmdlet(VerbsLifecycle.Assert, "PEUAge")]
public class AssertPEUAgeCommand : PSCmdlet
{
    [Parameter(ValueFromPipeline = true, Mandatory = true)]
    public Person InputObject;

    [Parameter(Mandatory = true)]
    public int Age;
    protected override void ProcessRecord()
    {
        DateTime minBday = DateTime.Now.AddYears(-Age);
        if (InputObject.BirthDate < minBday)
        {
            WriteObject(InputObject);
        }
        else
        {
            ThrowTerminatingError(
                new ErrorRecord(
                    new System.IO.InvalidDataException(),
                    "test",
                    ErrorCategory.InvalidData,
                    InputObject
                )
            );
        }
    }
}