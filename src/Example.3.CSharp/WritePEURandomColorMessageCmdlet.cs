namespace PEURandom;
using System.Management.Automation;
using LoremNET;

[Cmdlet(VerbsCommunications.Write, $"{Consts.ModulePrefix}ColorMessage")]
public class WritePEURandomColorMessageCmdlet : PSCmdlet
{
  [Parameter(Mandatory = true)]
  [ValidateNotNullOrEmpty]
  public string? Message { get; set; }

    protected override void EndProcessing()
    {
        // It's not as convenient to call other cmdlets in C#, it's better to use methods directly
        string randomColor = Lorem.HexNumber(6);
        int colorNumber = int.Parse(randomColor, System.Globalization.NumberStyles.HexNumber);
        string ansiColorString = PSStyle.Instance.Foreground.FromRgb(colorNumber);
        WriteObject(ansiColorString + Message + PSStyle.Instance.Reset);
    }
}
