namespace PEURandom;
using System.Management.Automation;
using LoremNET;
using System.Text.RegularExpressions;

[Cmdlet(VerbsCommon.Get, "PEURandomEmail")]
[OutputType(typeof(string))]
public class GetPEURandomLetterCmdlet : PSCmdlet
{
    [Parameter()]
    public SwitchParameter UsernameOnly;
    protected override void EndProcessing()
    {
        string email = Lorem.Email();
        if (this.UsernameOnly.IsPresent)
        {
            email = Regex.Replace(email, "([^@]*)@.*", "$1");
        }
        WriteObject(email);
    }
}