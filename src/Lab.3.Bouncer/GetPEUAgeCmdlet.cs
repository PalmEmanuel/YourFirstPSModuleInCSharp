using System.Management.Automation;
using LoremNET;

namespace PEURandom;

[Cmdlet(VerbsCommon.Get, "PEUAge")]
[OutputType(typeof(Person))]
public class GetPEUAgeCmdlet : PSCmdlet
{
    [Parameter(Position = 0, ValueFromPipeline = true, Mandatory = true)]
    public string Name;
    
    protected override void ProcessRecord()
    {
        WriteObject(
            GetPerson()
        );
    }

    Person GetPerson() {
        return new Person(
            Name,
            Lorem.DateTime()
        );
    }
}