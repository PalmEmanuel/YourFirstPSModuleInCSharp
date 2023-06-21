namespace PEURandom;
using System.Management.Automation;
using LoremNET;

[Cmdlet(VerbsCommon.Get, $"{Consts.ModulePrefix}Date")]
public class GetPEURandomDateCmdlet : PSCmdlet
{
    [Parameter()]
    public DateTime NotBefore { get; set; } = DateTime.Parse("1950-01-01");

    [Parameter()]
    public DateTime NotAfter { get; set; } = DateTime.Parse("2150-12-31");

    protected override void EndProcessing()
    {
        WriteObject(Lorem.DateTime(NotBefore, NotAfter));
    }
}