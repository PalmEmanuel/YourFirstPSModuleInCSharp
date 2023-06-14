namespace PEURandom;
using System.Management.Automation;
using System.Net.Mail;
using LoremNET;

[Cmdlet(VerbsCommon.Get, $"PEURandomEmail")]
public class GetPEURandomEmailCmdlet : PSCmdlet
{
    [Parameter()]
    public SwitchParameter UsernameOnly;

    protected override void EndProcessing()
    {
        MailAddress email = new(Lorem.Email());
        string output = UsernameOnly ? email.User : email.ToString();
        WriteObject(output);
    }
}