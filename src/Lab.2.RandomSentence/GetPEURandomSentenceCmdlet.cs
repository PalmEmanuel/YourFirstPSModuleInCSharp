namespace PEURandom;
using System.Management.Automation;
using System.Net.Mail;
using LoremNET;

[Cmdlet(VerbsCommon.Get, "PEURandomSentence")]
public class GetPEURandomSentenceCmdlet : PSCmdlet
{
    [Parameter(ValueFromPipeline = true)]
    public string Name;

    [Parameter()]
    public int Min = 5;
    [Parameter()]
    public int Max = 10;

    protected override void ProcessRecord()
    {
        var randomSentence = Lorem.Sentence(Min, Max);
        if (Name is not null) {
            randomSentence = randomSentence.Replace(".$", string.Empty) + $", {Name}";
        }
        WriteObject(
            randomSentence
        );
    }
}