namespace PEURandom;
using System.Management.Automation;
using LoremNET;

[Cmdlet(VerbsCommon.Get, $"{Consts.ModulePrefix}Age")]
public class GetPEURandomAgeCmdlet : PSCmdlet
{
    [Parameter(ValueFromPipeline = true, Mandatory = true, Position = 0)]
    public string name { get; set; } = "";
    protected override void ProcessRecord()
    {
        Person person = new Person(name, Lorem.DateTime(1900));
        WriteObject(person);
    }
}

[Cmdlet(VerbsLifecycle.Assert, $"{Consts.ModulePrefix}Age")]
public class AssertPEURandomAgeCmdlet : PSCmdlet
{
    [Parameter(ValueFromPipeline = true, Mandatory = true, Position = 0)]
    public Person person { get; set; } = null;

    [Parameter(Mandatory = true, Position = 1)]
    public int Age { get; set; } = 0;
    protected override void ProcessRecord()
    {
        DateTime legalAgebarrier = DateTime.Now.AddYears(-Age);
        DateTime age = person.BirthDate;
        if (age <= legalAgebarrier)
        {
            WriteObject(person);
        }
        else
        {
            throw new InvalidDataException("Age is too low");
        }
    }
}