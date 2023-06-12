using System.Management.Automation;
using LoremNET;

namespace Lab2.RandomSentence;

[Cmdlet(VerbsCommon.Get, "PEURandomSentence")]
public class RandomSentenceCommand : PSCmdlet
{
    [Parameter(Position = 0)]
    public int Minimum { get; set; } = 5;

    [Parameter(Position = 1)]
    public int Maximum { get; set; } = 10;

    [Parameter(Position = 2, ValueFromPipeline = true)]
    public string Name { get; set; }

    protected override void EndProcessing()
    {
        if (!string.IsNullOrWhiteSpace(Name)) {
            for (int i = 0; i < 3; i++) {
                WriteObject(Lorem.Sentence(Minimum, Maximum).Replace(".", $", {Name}"));
            }
        }
        else
        {
            WriteObject(Lorem.Sentence(Minimum, Maximum));
        }
    }
}
