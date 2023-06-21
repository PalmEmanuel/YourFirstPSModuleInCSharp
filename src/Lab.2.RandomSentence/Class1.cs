namespace Lab._2.RandomSentence;
using System.Management.Automation;
using LoremNET;

[Cmdlet(VerbsCommon.Get, "PEURandomSentence")]
public class GetPEURandomSentenceCommand : PSCmdlet
{
    [Parameter()]
    public int Min = 5;

    [Parameter()]
    public int Max = 10;

    [Parameter(ValueFromPipeline = true)]
    public string? Name;

    protected override void ProcessRecord()
    {
        string sentence = Lorem.Sentence(Min, Max);
        if (!string.IsNullOrEmpty(Name))
        {
            sentence = string.Concat(sentence, $", {Name}");
        }
        WriteObject(sentence);
    }

}