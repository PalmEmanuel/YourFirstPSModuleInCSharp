namespace PEURandom;
using System.Management.Automation;
using LoremNET;

[Cmdlet(VerbsCommon.Get, $"{Consts.ModulePrefix}Letter")]
public class GetPEURandomLetterCmdlet : PSCmdlet
{
    protected override void EndProcessing()
    {
        WriteObject(Lorem.Letter());
    }
}