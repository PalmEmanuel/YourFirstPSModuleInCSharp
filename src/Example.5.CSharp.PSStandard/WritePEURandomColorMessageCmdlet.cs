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
        // In older versions of PowerShell there is no PSStyle variable
        // ANSI still works (if the terminal supports it), but we have to build the string ourselves
        // https://en.wikipedia.org/wiki/ANSI_escape_code
        string ansiColoredMessage = $"\x1b[38;5;{Lorem.Integer(1, 255)}m{Message} \x1b[0m";
        WriteObject(ansiColoredMessage);
    }
}
