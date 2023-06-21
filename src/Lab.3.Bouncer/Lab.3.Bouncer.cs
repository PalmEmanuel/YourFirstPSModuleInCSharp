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
        Person person = new(name, Lorem.DateTime(1900));
    }
}

[Cmdlet("Assert", $"{Consts.ModulePrefix}Age")]
public class AssertPEURandomAgeCmdlet : PSCmdlet
{
    [Parameter(ValueFromPipeline = true, Mandatory = true, Position = 0)]
    public Person person { get; set; } = null;

    public int Age { get; set; } = 0;
    protected override void ProcessRecord()
    {
        DateTime now = DateTime.Now;
        int age = now.Year - person.BirthDate.Year;
        if (age >= 0)
        {
            writeObject(person);
        }
        else
        {
            throw new InvalidDataException("Age is too low");
        }
    }
}