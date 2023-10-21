namespace PEURandom;
using System.Management.Automation;

using LoremNET;

[Cmdlet(VerbsCommon.Get, $"{Consts.ModulePrefix}Email")]
public class GetPEURandomEmailCmdlet : PSCmdlet
{
    protected override void EndProcessing()
    {
        WriteObject(Lorem.Email());
    }
}
