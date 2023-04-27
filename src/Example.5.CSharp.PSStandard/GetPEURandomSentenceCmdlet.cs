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

    protected override void ProcessRecord()
    {
        WriteObject(Lorem.Sentence(Min, Max));
    }
}