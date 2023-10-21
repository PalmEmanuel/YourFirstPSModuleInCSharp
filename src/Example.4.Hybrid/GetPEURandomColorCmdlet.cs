namespace PEURandom;
using System.Management.Automation;

using LoremNET;

[Cmdlet(VerbsCommon.Get, $"{Consts.ModulePrefix}Color")]
public class GetPEURandomColorCmdlet : PSCmdlet
{
    protected override void EndProcessing()
    {
        WriteObject($"#{Lorem.HexNumber(6)}");
    }
}
