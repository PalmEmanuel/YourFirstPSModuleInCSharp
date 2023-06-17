using System.Management.Automation;
using LoremNET;

namespace PEURandom;

[Cmdlet(VerbsCommon.Get, "PEURandomSentence")]
public class RandomSentenceCommand : PSCmdlet
{
    [Parameter(Position = 0)]
    public int Minimum { get; set; } = 5;

    [Parameter(Position = 1)]
    public int Maximum { get; set; } = 10;

    [Parameter(Position = 2, ValueFromPipeline = true)]
    public string Name { get; set; }

    protected override void ProcessRecord()
    {
        if (!string.IsNullOrWhiteSpace(Name)) {
            WriteObject(Lorem.Sentence(Minimum, Maximum).Replace(".$", "") + $", {Name}");
        }
        else
        {
            WriteObject(Lorem.Sentence(Minimum, Maximum));
        }
    }
}
