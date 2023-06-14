namespace PEURandom;
using System;
using System.Management.Automation;
using LoremNET;

record Person(string Name, DateTime BirthDate);

[Cmdlet(VerbsCommon.Get, "PEUAge")]
[OutputType(typeof(Person))]
public class GetPEURandomSentenceCmdlet : PSCmdlet
{
    [Parameter(ValueFromPipeline = true)]
    public string Name;
    
    protected override void ProcessRecord()
    {
        DateTime birthDate = Lorem.DateTime();

        WriteObject(
            new Person(Name, birthDate)
        );
    }
}