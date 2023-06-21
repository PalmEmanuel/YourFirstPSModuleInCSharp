namespace PEURandom;
using System.Management.Automation;
using LoremNET;

[Cmdlet(VerbsCommon.Get, $"{Consts.ModulePrefix}Sentence")]
public class GetPEURandomSentenceCmdlet : PSCmdlet
{
    [Parameter()]
    public int Min { get; set; } = 5;

    [Parameter()]
    public int Max { get; set; } = 10;

    [Parameter(ValueFromPipeline = true)]
    public string name { get; set; } = "";

    protected override void ProcessRecord()
    {
        string sentence = Lorem.Sentence(Min, Max);
        if (name != "")
        {
            sentence = sentence + ", " + name;
        }
        WriteObject(sentence);
    }
}